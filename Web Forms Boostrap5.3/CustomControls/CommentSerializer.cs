using System;
using System.ComponentModel;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Forms_Boostrap5._3.CustomControls
{
    /// <summary>
    /// Renderiza un objeto serializado a JSON dentro de un comentario HTML
    /// y expone una API para notificar cambios desde el servidor.
    ///
    /// Uso en .aspx:
    ///   <cc:CommentSerializer ID="csConfig" runat="server" CommentId="config" />
    ///
    /// Uso en code-behind:
    ///   csConfig.SetData(new { tema = "oscuro", idioma = "es" });
    ///   csConfig.Update(new { tema = "claro" }); // merge
    /// </summary>
    [DefaultProperty("CommentId")]
    [ToolboxData("<{0}:CommentSerializer runat=\"server\" />")]
    public class CommentSerializer : CompositeControl
    {
        private Literal _literal;
        private JavaScriptSerializer _serializer;

        // ---------------------------------------------------------------
        // Propiedades públicas
        // ---------------------------------------------------------------

        /// <summary>
        /// Identificador del comentario. Se usa como "#{CommentId}: {json}".
        /// Si no se especifica, se genera un ID basado en ClientID.
        /// </summary>
        [Category("Behavior")]
        [DefaultValue("")]
        [Description("Identificador del comentario HTML. Ej: 'config'.")]
        public string CommentId
        {
            get => (string)(ViewState["CommentId"] ?? string.Empty);
            set => ViewState["CommentId"] = value ?? string.Empty;
        }

        /// <summary>
        /// Si es true, el control se elimina del HTML (no renderiza nada).
        /// Útil para "ocultar" el comentario sin borrar el estado.
        /// </summary>
        [Category("Behavior")]
        [DefaultValue(false)]
        public bool Hidden
        {
            get => (bool)(ViewState["Hidden"] ?? false);
            set => ViewState["Hidden"] = value;
        }

        /// <summary>
        /// Si es true, registra un script de arranque que dispara
        /// un CustomEvent 'commentstore:updated' en window cuando
        /// el comentario se renderiza en el cliente.
        /// </summary>
        [Category("Behavior")]
        [DefaultValue(true)]
        public bool EmitClientEvent
        {
            get => (bool)(ViewState["EmitClientEvent"] ?? true);
            set => ViewState["EmitClientEvent"] = value;
        }

        /// <summary>
        /// Objeto actualmente serializado. Null si no hay datos.
        /// </summary>
        [Browsable(false)]
        public object Data { get; private set; }

        /// <summary>
        /// true si hay datos serializados pendientes de renderizar.
        /// </summary>
        [Browsable(false)]
        public bool HasData => Data != null;

        // ---------------------------------------------------------------
        // Ciclo de vida
        // ---------------------------------------------------------------

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            _serializer = new JavaScriptSerializer
            {
                MaxJsonLength = int.MaxValue
            };

            // Restauramos el objeto desde ViewState entre postbacks
            var raw = ViewState["DataJson"] as string;
            if (!string.IsNullOrEmpty(raw))
            {
                try { Data = _serializer.Deserialize<object>(raw); }
                catch { Data = null; }
            }
        }

        protected override void CreateChildControls()
        {
            Controls.Clear();
            _literal = new Literal { Mode = LiteralMode.PassThrough };
            Controls.Add(_literal);
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            EnsureChildControls();

            if (Hidden || Data == null)
            {
                _literal.Text = string.Empty;
                return;
            }

            string id = ResolveCommentId();
            string json = _serializer.Serialize(Data);
            json = EscapeForHtmlComment(json);

            // El comentario final: <!-- #id: {...} -->
            _literal.Text = $"<!-- #{id}: {json} -->";

            if (EmitClientEvent)
            {
                RegisterClientEvent(id);
            }
        }

        // ---------------------------------------------------------------
        // API pública
        // ---------------------------------------------------------------

        /// <summary>
        /// Establece (reemplaza) el objeto que se va a serializar.
        /// </summary>
        public void SetData(object value)
        {
            Data = value;
            Persist();
        }

        /// <summary>
        /// Notifica un cambio parcial. Hace merge (shallow) con los datos actuales.
        /// Si no había datos previos, se comporta como SetData.
        /// </summary>
        /// <param name="changes">Objeto con las propiedades a actualizar.</param>
        public void Update(object changes)
        {
            if (changes == null) return;
            if (Data == null) { SetData(changes); return; }

            Data = MergeObjects(Data, changes);
            Persist();
        }

        /// <summary>
        /// Elimina los datos. El comentario deja de renderizarse.
        /// </summary>
        public void Clear()
        {
            Data = null;
            ViewState["DataJson"] = null;
        }

        /// <summary>
        /// Devuelve el JSON serializado actual (o null).
        /// </summary>
        public string ToJson()
        {
            return Data == null ? null : _serializer.Serialize(Data);
        }

        // ---------------------------------------------------------------
        // Internos
        // ---------------------------------------------------------------

        private void Persist()
        {
            if (Data == null)
            {
                ViewState["DataJson"] = null;
                return;
            }
            ViewState["DataJson"] = _serializer.Serialize(Data);
        }

        private string ResolveCommentId()
        {
            return string.IsNullOrWhiteSpace(CommentId)
                ? ClientID
                : CommentId.Trim();
        }

        /// <summary>
        /// Escapa "-->" para que no cierre el comentario HTML antes de tiempo.
        /// </summary>
        private static string EscapeForHtmlComment(string json)
        {
            if (string.IsNullOrEmpty(json)) return json;
            return json.Replace("-->", "--\\>")
                       .Replace("--!>", "--!\\>");
        }

        /// <summary>
        /// Merge superficial de dos objetos anónimos / diccionarios.
        /// Convierte ambos a diccionario, aplica cambios y devuelve un diccionario.
        /// </summary>
        private static object MergeObjects(object baseObj, object changes)
        {
            var baseDict = ToDictionary(baseObj);
            var changeDict = ToDictionary(changes);

            if (baseDict == null || changeDict == null) return changes;

            foreach (var kv in changeDict)
                baseDict[kv.Key] = kv.Value;

            return baseDict;
        }

        private static System.Collections.Generic.Dictionary<string, object> ToDictionary(object obj)
        {
            if (obj is System.Collections.Generic.Dictionary<string, object> d) return d;

            // Convertimos vía serializer para soportar objetos anónimos
            var ser = new JavaScriptSerializer();
            var json = ser.Serialize(obj);
            return ser.Deserialize<System.Collections.Generic.Dictionary<string, object>>(json);
        }

        /// <summary>
        /// Registra un script que dispara un CustomEvent en el cliente cuando
        /// el comentario está disponible en el DOM.
        /// </summary>
        private void RegisterClientEvent(string id)
        {
            string script = $@"
            (function() {{
                var id = {_serializer.Serialize(id)};
                // Esperamos a que CommentStore exista (puede cargarse después)
                function emit() {{
                    window.dispatchEvent(new CustomEvent('commentstore:updated', {{
                        detail: {{ id: id }}
                    }}));
                }}
                if (document.readyState === 'loading') {{
                    document.addEventListener('DOMContentLoaded', emit);
                }} else {{
                    emit();
                }}
            }})();";

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                $"cs_{ClientID}",
                script,
                addScriptTags: true);
        }
    }
}
using Newtonsoft.Json;
using System.Data;

namespace System.Web.UI
{
    public static class GridViewExtension
    {
        /// <summary>
        /// Serializa la fila <see cref="DataRowView"/> a tipo <typeparamref name="T"/>
        /// </summary>
        public static string SerializeRow<T>(this object dataItem) where T : new()
        {
            if (dataItem is DataRowView row)
            {
                T obj = new T();

                // Mapear columnas a propiedades usando reflexión
                foreach (DataColumn col in row.DataView.Table.Columns)
                {
                    var property = typeof(T).GetProperty(col.ColumnName);
                    if (property?.CanWrite is true)
                    {
                        object value = row[col.ColumnName];
                        if (value == DBNull.Value)
                            value = null;

                        property.SetValue(obj, value);
                    }
                }

                return JsonConvert.SerializeObject(obj);
            }

            return null;
        }

        /// <summary>
        /// Deserializa el valor <paramref name="json"/> a una instancia del tipo <typeparamref name="T"/>
        /// </summary>
        public static T DeserializeRow<T>(this object json, JsonSerializerSettings settings = null)
        {
            string _json = json?.ToString() ?? null;
            if (string.IsNullOrWhiteSpace(_json))
                return default;

            try
            {
                if (settings == null)
                {
                    settings = new JsonSerializerSettings
                    {
                        MissingMemberHandling = MissingMemberHandling.Ignore,
                        NullValueHandling = NullValueHandling.Ignore,
                        DefaultValueHandling = DefaultValueHandling.Include
                    };
                }

                var datos = JsonConvert.DeserializeObject<T>(_json, settings);
                return datos;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error deserializando: {ex.Message}");
                return default;
            }
        }
    }
}
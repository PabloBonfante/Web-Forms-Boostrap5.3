//using System.Web.UI;

//namespace Web_Forms_Boostrap5._3.Src.Utils
//{
//    public class JSHelper
//    {
//        public static void openModal(Page page, string selector, string selectorFocus = "")
//        {
//            string script = $@"$(document).ready(function() {{
//                                    openModal('{selector}', '{selectorFocus}');
//                             }});";

//            ScriptManager.RegisterStartupScript(page, page.GetType(), "openModal", script, true);
//        }

//        public static void closeModal(Page page, string selector)
//        {
//            string script = $@"$(document).ready(function() {{
//                                    closeModal('{selector}');
//                             }});";

//            ScriptManager.RegisterStartupScript(page, page.GetType(), "closeModal", script, true);
//        }

//        public static void showToasts(Page page, string headerText = "", string bodyText = "", string color = "danger", string icon = "bi bi-exclamation-triangle", bool showHeader = false)
//        {
//            string script = $@"$(document).ready(function() {{
//                                    const showHeader = '{showHeader}' === 'True';
//                                    if (showHeader){{
//                                        createBootstrapToast({{ headerText: '{headerText}', bodyText: '{bodyText}', color: '{color}', icon: '{icon}'}});
//                                        return;
//                                    }}

//                                    createBootstrapToastSimple({{ bodyText: '{bodyText}', color: '{color}', icon: '{icon}'}});
//                             }});";

//            ScriptManager.RegisterStartupScript(page, page.GetType(), "openToast", script, true);
//        }

//        public static void showAlert(Page page, string headerText = "", string bodyText = "", string color = "danger", string icon = "bi bi-exclamation-triangle", int timeout = 500)
//        {
//            string script = $@"$(document).ready(function() {{
//                                createBootstrapAlert({{ headerText: '{headerText}', bodyText: '{bodyText}', color: '{color}', icon: '{icon}', timeout: {timeout}}});
//                             }});";

//            ScriptManager.RegisterStartupScript(page, page.GetType(), "openAlert", script, true);
//        }

//        public static void autoFocus(Page page, string selectorFocus = "")
//        {
//            string script = $@"$(document).ready(function() {{
//                                autoFocus('{selectorFocus}');
//                             }});";

//            ScriptManager.RegisterStartupScript(page, page.GetType(), "autoFocus", script, true);
//        }
//    }
//}


using System;
using System.Text;
using System.Web.UI;

namespace Web_Forms_Boostrap5._3.Src.Utils
{
    public class JSHelper
    {
        private readonly Page _page;
        private readonly StringBuilder _scripts;
        private bool _hasContent;

        private JSHelper(Page page)
        {
            _page = page;
            _scripts = new StringBuilder();
            _hasContent = false;
        }

        public static JSHelper Create(Page page)
        {
            return new JSHelper(page);
        }

        public JSHelper OpenModal(string selector, string selectorFocus = "")
        {
            AppendScript($@"openModal('{selector}', '{selectorFocus}');");
            return this;
        }

        public JSHelper CloseModal(string selector)
        {
            AppendScript($@"closeModal('{selector}');");
            return this;
        }

        public JSHelper ShowToast(string headerText = "", string bodyText = "", string color = "danger", string icon = "bi bi-exclamation-triangle", bool showHeader = false)
        {
            string script = showHeader
                ? $@"createBootstrapToast({{ headerText: '{headerText}', bodyText: '{bodyText}', color: '{color}', icon: '{icon}'}});"
                : $@"createBootstrapToastSimple({{ bodyText: '{bodyText}', color: '{color}', icon: '{icon}'}});";

            AppendScript(script);
            return this;
        }

        public JSHelper ShowAlert(string headerText = "", string bodyText = "", string color = "danger", string icon = "bi bi-exclamation-triangle", int timeout = 5000)
        {
            AppendScript($@"createBootstrapAlert({{ headerText: '{headerText}', bodyText: '{bodyText}', color: '{color}', icon: '{icon}', timeout: {timeout}}});");
            return this;
        }

        public JSHelper AutoFocus(string selectorFocus = "")
        {
            AppendScript($@"autoFocus('{selectorFocus}');");
            return this;
        }

        private void AppendScript(string script)
        {
            if (!string.IsNullOrEmpty(script))
            {
                // Aislar cada script en su propia función anónima para evitar conflictos de variables
                _scripts.AppendLine($"(function() {{ {script} }})();");
                _hasContent = true;
            }
        }

        public void Execute()
        {
            if (!_hasContent) return;

            string finalScript = $@"$(document).ready(function() {{ {_scripts.ToString()} }});";

            ScriptManager.RegisterStartupScript(_page, _page.GetType(), Guid.NewGuid().ToString(), finalScript, true);
        }
    }
}
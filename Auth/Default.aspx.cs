using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Auth
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // El tipo devuelto puede ser modificado a IEnumerable, sin embargo, para ser compatible con la paginación y ordenación de 
        //, se deben agregar los siguientes parametros:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IList<Persona> Unnamed_GetData()
        {
            return new List<Persona>
            {
                new Persona { Id = 1, Nombre = "Ana",   Edad = 25 },
                new Persona { Id = 2, Nombre = "Luis",  Edad = 30 },
                new Persona { Id = 3, Nombre = "Marta", Edad = 28 }
            };
        }
    }

    public class Persona
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int Edad { get; set; }
    }
}
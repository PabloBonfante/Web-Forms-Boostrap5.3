using System;
using System.Web.UI.WebControls;

namespace Web_Forms_Boostrap5._3.Pages
{
    public partial class PiedraPapelTijera : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["Jugador"] = 0;
                ViewState["CPU"] = 0;
                ViewState["Ronda"] = 1;
                lblRonda.Text = "Ronda 1";
            }
        }

        protected void Jugar(object sender, EventArgs e)
        {
            var btn = (Button)sender;
            string jugadaHumano = btn.CommandArgument;

            string[] opciones = { "piedra", "papel", "tijera" };
            string[] emojis = { "🪨", "📄", "✂️" };

            string jugadaCPU = opciones[new Random().Next(opciones.Length)];

            int idxHumano = Array.IndexOf(opciones, jugadaHumano);
            int idxCPU = Array.IndexOf(opciones, jugadaCPU);

            lblEmojiJugador.Text = emojis[idxHumano];
            lblEmojiCPU.Text = emojis[idxCPU];

            int jugador = (int)ViewState["Jugador"];
            int cpu = (int)ViewState["CPU"];
            int ronda = (int)ViewState["Ronda"];

            string mensaje;
            string claseColor;

            if (jugadaHumano == jugadaCPU)
            {
                mensaje = "🤝 ¡Empate!";
                claseColor = "text-warning";
            }
            else if ((jugadaHumano == "piedra" && jugadaCPU == "tijera") ||
                     (jugadaHumano == "papel" && jugadaCPU == "piedra") ||
                     (jugadaHumano == "tijera" && jugadaCPU == "papel"))
            {
                jugador++;
                mensaje = "🎉 ¡Ganaste esta ronda!";
                claseColor = "text-success";
            }
            else
            {
                cpu++;
                mensaje = "😢 Perdiste esta ronda...";
                claseColor = "text-danger";
            }

            ronda++;

            ViewState["Jugador"] = jugador;
            ViewState["CPU"] = cpu;
            ViewState["Ronda"] = ronda;

            lblJugador.Text = jugador.ToString();
            lblCPU.Text = cpu.ToString();
            lblRonda.Text = $"Ronda {ronda}";

            lblMensaje.Text = mensaje;
            lblMensaje.CssClass = $"d-block fs-4 fw-bold mt-3 {claseColor}";

            pnlResultado.Visible = true;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ViewState["Jugador"] = 0;
            ViewState["CPU"] = 0;
            ViewState["Ronda"] = 1;

            lblJugador.Text = "0";
            lblCPU.Text = "0";
            lblRonda.Text = "Ronda 1";
            lblMensaje.Text = "";
            pnlResultado.Visible = false;
        }
    }
}
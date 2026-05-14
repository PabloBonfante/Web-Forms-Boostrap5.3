using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;

namespace Web_Forms_Boostrap5._3.Src.WeatherForecast
{
    public class WeatherForecastService
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        [DataObjectMethod(DataObjectMethodType.Select)]
        public DataTable GetWeatherForecast(bool SimulateDelay = false)
        {
            if(SimulateDelay)
                Thread.Sleep(2000); // Espera 2 segundos para simular trabajo

            // Intentar obtener de caché
            DataTable dt = (DataTable)HttpRuntime.Cache["WeatherForecast"];

            if (dt != null)
                return dt;

            // Si no está en caché, generar datos
            var random = new Random();
            var lista = Enumerable.Range(1, 500).Select(Index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(Index),
                TemperatureC = random.Next(-20, 55),
                Summary = Summaries[random.Next(Summaries.Length)]
            }).ToList();

            dt = ConvertToDataTable(lista);

            UpdateCache(dt);

            return dt;
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public int InsertWeatherForecast(WeatherForecastRequest weatherForecast)
        {
            // Obtener datos actuales
            DataTable dt = GetWeatherForecast();

            // Crear nueva fila
            DataRow newRow = dt.NewRow();
            newRow["Id"] = dt.AsEnumerable().Max(wf => (int)wf["Id"]) + 1;
            newRow["Date"] = weatherForecast.Date;
            newRow["TemperatureC"] = weatherForecast.TemperatureC;
            newRow["TemperatureF"] = 32 + (int)(weatherForecast.TemperatureC / 0.5556);
            newRow["Summary"] = weatherForecast.Summary;

            // Agregar fila al DataTable
            dt.Rows.Add(newRow);

            // Actualizar caché
            UpdateCache(dt);

            return 1;
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public int UpdateWeatherForecast(WeatherForecastRequest weatherForecast, WeatherForecastRequest original_weatherForecast)
        {
            DataTable dt = GetWeatherForecast();

            if (original_weatherForecast.Id >= 0)
            {
                var row = dt.Rows.Cast<DataRow>().FirstOrDefault(r => (int)r["Id"] == original_weatherForecast.Id);
                if (row != null)
                {
                    row["TemperatureC"] = weatherForecast.TemperatureC;
                    row["Summary"] = weatherForecast.Summary;
                    row["Date"] = weatherForecast.Date;
                    UpdateCache(dt);
                    return 1;
                }
            }

            return 0;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public int DeleteWeatherForecast(WeatherForecastRequest weatherForecast)
        {
            DataTable dt = GetWeatherForecast();

            if (weatherForecast.Id >= 0)
            {
                var row = dt.Rows.Cast<DataRow>().FirstOrDefault(r => (int)r["Id"] == weatherForecast.Id);
                if (row != null)
                {
                    dt.Rows.Remove(row);
                    UpdateCache(dt);
                    return 1;
                }
            }

            return -1;
        }

        public int DeleteWeatherForecast(int[] ids)
        {
            if (!ids.Any())
                return -1;

            DataTable dt = GetWeatherForecast();

            int cantDelete = 0;
            foreach (var id in ids)
            {
                var row = dt.Rows.Cast<DataRow>().FirstOrDefault(r => (int)r["Id"] == id);
                if (row != null)
                {
                    dt.Rows.Remove(row);
                    cantDelete++;
                }
            }

            UpdateCache(dt);

            return cantDelete;
        }

        public List<int> GetIdsWeatherForecast()
        {
            DataTable dt = GetWeatherForecast();
            var ids = dt.Rows.Cast<DataRow>().Select(r => (int)r["Id"]).ToList();
            return ids;
        }

        private void UpdateCache(DataTable dt)
        {
            // Actualizar la caché con los nuevos datos
            HttpRuntime.Cache.Insert("WeatherForecast", dt, null,
                DateTime.Now.AddMinutes(30), TimeSpan.Zero);
        }

        public string DownloadWeatherForecast()
        {
            var sb = new StringBuilder();
            var dt = GetWeatherForecast();

            // Encabezados
            sb.AppendLine("Id;Date;TemperatureC;TemperatureF;Summary");

            foreach (DataRow row in dt.Rows)
            {
                sb.AppendFormat("{0};", row["Id"]);
                sb.AppendFormat("{0:yyyy-MM-dd};", row["Date"]);
                sb.AppendFormat("{0:N0} °C;", row["TemperatureC"]);
                sb.AppendFormat("{0:N0} °F;", row["TemperatureF"]);
                sb.AppendFormat("{0};", row["Summary"]);
                sb.AppendLine();
            }

            return sb.ToString();
        }

        private DataTable ConvertToDataTable(List<WeatherForecast> forecasts)
        {
            DataTable dt = new DataTable("WeatherForecast");

            // Definir columnas
            dt.Columns.Add("Id", typeof(int));
            dt.Columns.Add("Date", typeof(DateTime));
            dt.Columns.Add("TemperatureC", typeof(int));
            dt.Columns.Add("TemperatureF", typeof(int));
            dt.Columns.Add("Summary", typeof(string));

            int Id = 0;
            // Agregar filas
            foreach (var item in forecasts)
            {
                DataRow row = dt.NewRow();
                row["Id"] = Id;
                row["Date"] = item.Date;
                row["TemperatureC"] = item.TemperatureC;
                row["TemperatureF"] = item.TemperatureF;
                row["Summary"] = item.Summary;
                dt.Rows.Add(row);
                Id++;
            }

            return dt;
        }
    }
}
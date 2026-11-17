using System;
using System.ComponentModel;

namespace Web_Forms_Boostrap5._3.Src.WeatherForecast
{
    [Serializable]
    public class WeatherForecast
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public int TemperatureC { get; set; }
        public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
        public string Summary { get; set; }
    }

    [Serializable]
    [DataObject]
    public class WeatherForecastRequest
    {
        [DataObjectField(true, true)]
        public int Id { get; set; }

        [DataObjectField(false, true)]
        public DateTime Date { get; set; }

        [DataObjectField(false, true)]
        public int TemperatureC { get; set; }

        [DataObjectField(false, true)]
        public int TemperatureF { get; set; }

        [DataObjectField(false, true)]
        public string Summary { get; set; }
    }
}
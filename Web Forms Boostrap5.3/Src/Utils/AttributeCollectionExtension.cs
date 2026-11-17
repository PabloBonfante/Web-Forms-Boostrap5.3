using System;
using System.Collections.Generic;
using System.Web.UI;

namespace Web_Forms_Boostrap5._3.Src.Utils
{
    public static class AttributeCollectionExtension
    {
        public static T GetValue<T>(this AttributeCollection Attributes, string key, bool ItPosibleNull = false, T defaultValue = default(T))
        {
            if (Attributes[key] != null)
            {
                string valueAttributeString = Attributes[key].ToString();
                try
                {
                    T result = (T)Convert.ChangeType(valueAttributeString, typeof(T));
                    return result;
                }
                catch (InvalidCastException)
                {
                    throw new InvalidCastException($"No se puede convertir el valor: ({valueAttributeString}) del atributo con la clave: ({key}) al tipo: ({typeof(T)}).");
                }
            }
            else if (!ItPosibleNull)
            {
                // Valor de configuración no encontrado
                throw new KeyNotFoundException($"No se encontró la clave: ({key}) de QueryString.");
            }
            else
            {
                //retornar valor por defecto del tipo T que me pasen, o el por defecto del tipo T
                return defaultValue;
            }
        }
    }
}
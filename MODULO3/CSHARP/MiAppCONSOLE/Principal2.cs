using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiAppCONSOLE;

    public class Principal2
    {
    public static void Main() {
        Dictionary<string, int> diccionario1 = new Dictionary<string, int>();
        diccionario1.Add("Lunes", 1);
        diccionario1.Add("Martes", 2);
        diccionario1.Add("Miercoles", 3);
        Console.WriteLine(diccionario1["Martes"]);

        if (diccionario1.ContainsKey("Jueves"))
        {
            Console.WriteLine("SI");
        } else
        {
            Console.WriteLine("NO");
        }

        diccionario1["Martes"] = 5;
        Console.WriteLine(diccionario1["Martes"]);

        diccionario1.Remove("Martes");

        if (diccionario1.ContainsKey("Martes"))
        {
            Console.WriteLine("SI");
        }
        else
        {
            Console.WriteLine("NO");
        }

        
        

        foreach(KeyValuePair<string, int> elemento in diccionario1)
        {
            Console.WriteLine(elemento.Key + "\t" + elemento.Value);
        }
    }
}



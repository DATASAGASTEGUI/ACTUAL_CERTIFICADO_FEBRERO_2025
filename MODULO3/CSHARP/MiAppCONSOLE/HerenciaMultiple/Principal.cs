using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HerenciaMultiple
{
    // Definición de la primera interfaz
    public interface IUno
    {
        void MetodoUno();

    }

    // Definición de la segunda interfaz
    public interface IDos
    {
        void MetodoDos();
    }

    // Clase base
    public class Base
    {
        public void MetodoBase()
        {
            Console.WriteLine("Método de la clase Base");
        }
    }

    // Clase que implementa la primera interfaz
    public class ClaseUno : Base, IUno
    {
        public void MetodoUno()
        {
            Console.WriteLine("Método de la interfaz IUno");
        }
    }

    // Clase que implementa la segunda interfaz
    public class ClaseDos : Base, IDos
    {
        public void MetodoDos()
        {
            Console.WriteLine("Método de la interfaz IDos");
        }
    }

    // Clase que implementa ambas interfaces
    public class ClaseTres : IUno, IDos
    {
        public void MetodoUno()
        {
            Console.WriteLine("Método de la interfaz IUno");
        }

        public void MetodoDos()
        {
            Console.WriteLine("Método de la interfaz IDos");
        }
    }

    class Program
    {
        static void Main1(string[] args)
        {
            // Crear instancias de las clases
            ClaseUno objetoUno = new ClaseUno();
            ClaseDos objetoDos = new ClaseDos();
            ClaseTres objetoTres = new ClaseTres();

            // Llamar a los métodos de cada clase
            objetoUno.MetodoUno();   // Salida: Método de la interfaz IUno
            objetoDos.MetodoDos();   // Salida: Método de la interfaz IDos
            objetoTres.MetodoUno();  // Salida: Método de la interfaz IUno
            objetoTres.MetodoDos();  // Salida: Método de la interfaz IDos

            // Llamar al método de la clase base
            objetoUno.MetodoBase();  // Salida: Método de la clase Base
            objetoDos.MetodoBase();  // Salida: Método de la clase Base
            //objetoTres.MetodoBase(); // Salida: Método de la clase Base
        }
    }
}

/*
    Tipos de datos
*/

using System;

namespace Proyecto;

internal class Program2
{
    private static void Main()
    {
        // DECLARACION DE VARIABLES 1  
        int entero = 10;
        double doble = 10.5;
        char caracter = 'a';
        string cadena = "Hola Mundo";
        bool bandera = true; // false
        DateTime fecha1 = DateTime.Now;
        DateTime fecha2 = new DateTime(2023, 1, 1);
        // DECLARACION DE VARIABLES 2
        object entero1 = 10;
        object doble1 = 10.5;
        object caracter1 = 'a';
        object cadena1 = "Hola Mundo";
        object bandera1 = true; // false
        object fecha11 = DateTime.Now;
        object fecha21 = new DateTime(2023, 1, 1);
        // DECLARACION DE VARIABLES 3
        var entero2 = 10;
        var doble2 = 10.5;
        var caracter2 = 'a';
        var cadena2 = "Hola Mundo";
        var bandera2 = true; // false
        var fecha12 = DateTime.Now;
        var fecha22 = new DateTime(2023, 1, 1);

        entero2 = 20;

        Console.WriteLine("Entero: " + entero2.GetType() + " - " + Type.GetTypeCode(entero2.GetType()));
        //Console.WriteLine("HOLA MUNDO");
    }
}


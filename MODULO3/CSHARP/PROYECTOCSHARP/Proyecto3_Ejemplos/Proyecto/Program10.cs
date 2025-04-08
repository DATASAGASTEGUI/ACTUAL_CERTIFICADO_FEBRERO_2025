/*
    Array 1 dimensión: Vector
    Array 2 dimensiones: Matriz
    Array 3 dimensiones: Cubo
*/

namespace Proyecto; // Package

using System;

internal class Program10
{
    private static void Main()
    {
        {
            // Declaración e inicialización
            int[] vector = { 10, 20, 30, 40, 50 };
            for (int i = 0; i < vector.Length; i++)
            {
                Console.WriteLine($"vector[{i}] = {vector[i]}");
            }
            foreach (int valor in vector)
            {
                Console.WriteLine($"Valor: {valor}");
            }
        }
        {
            // Declaración e inicialización
            int[] vector = new int[] { 10, 20, 30, 40, 50 };
            for (int i = 0; i < vector.Length; i++)
            {
                Console.WriteLine($"vector[{i}] = {vector[i]}");
            }
            foreach (int valor in vector)
            {
                Console.WriteLine($"Valor: {valor}");
            }
        }
        {
            // Declaración
            int[] vector = new int[5];
            // Inicialización
            vector[0] = 5;
            vector[1] = 15;
            vector[2] = 25;
            vector[3] = 35;
            vector[4] = 45;
            //vector[5] = 55;
            vector[3] = 100; // Modificación
                             // Eliminación no existe en los arrays
                             // Añadir elementos no existe en los arrays

            for (int i = 0; i < vector.Length; i++)
            {
                Console.WriteLine($"vector[{i}] = {vector[i]}");
            }
            foreach (int valor in vector)
            {
                Console.WriteLine($"Valor: {valor}");
            }
        }

        {
            object[] vector = new object[5];
            vector[0] = 10;          // int 
            vector[1] = 15.5;       // double
            vector[2] = "Hola";     // string
            vector[3] = 'A';        // char
            vector[4] = true;       // bool
            for (int i = 0; i < vector.Length; i++)
            {
                Console.WriteLine($"vector[{i}] = {vector[i]}");
            }
        }
        {
            Producto[] productos = new Producto[3];
            productos[0] = new Producto(1, "Producto 1", 10.5);
            productos[1] = new Producto(2, "Producto 2", 20.0);

            productos[2] = new Producto();
            productos[2].Id = 3;
            productos[2].Nombre = "Producto 3";
            productos[2].Precio = 30.75;

            foreach (Producto producto in productos)
            {
                Console.WriteLine($"ID: {producto.Id}, Nombre: {producto.Nombre}, Precio: {producto.Precio}");
            }

            foreach (Producto producto in productos)
            {
                Console.WriteLine(producto);
            }
        }

        {
            Alumno[] alumnos = new Alumno[3];
            alumnos[0] = new Alumno("Juan", 20);
            alumnos[1] = new Alumno("Maria", 22);
            alumnos[2] = new Alumno("Pedro", 21);

            foreach (Alumno alumno in alumnos)
            {
                Console.WriteLine(alumno);
            }   
        }

    }
}

class Producto
{
    public int Id { get; set; }
    public string Nombre { get; set; }
    public double Precio { get; set; }

    public Producto()
    {
        Id = 0;
        Nombre = string.Empty; // ""
        Precio = 0.0;
    }
    public Producto(int id, string nombre, double precio)
    {
        Id = id;
        Nombre = nombre;
        Precio = precio;
    }
    
    public override string ToString()
    {
        return $"ID: {Id}, Nombre: {Nombre}, Precio: {Precio}";
    }
}
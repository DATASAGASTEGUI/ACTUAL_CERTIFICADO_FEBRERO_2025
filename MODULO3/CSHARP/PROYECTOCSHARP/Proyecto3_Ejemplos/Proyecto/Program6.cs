namespace Proyecto; // Package

internal class Program6
{
    private static void Main()
    {
        int entero = 11;
        Console.WriteLine("El cuadrado: " + Program5.Cuadrado(entero));
        Program5.Main();

        Program5 objeto = new Program5();
        Console.WriteLine("El cubo: " + objeto.Cubo(entero));

        Metodos metodos = new Metodos();
        Console.WriteLine("El cuadrado: " + Metodos.Cuadrado(entero));
        Console.WriteLine("El cubo: " + metodos.Cubo(entero));
    }
}
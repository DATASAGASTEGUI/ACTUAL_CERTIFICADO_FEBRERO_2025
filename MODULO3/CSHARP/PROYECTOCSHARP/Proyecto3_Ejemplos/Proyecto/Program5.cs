namespace Proyecto; // Package

public class Program5
{
    public static void Main()
    {
        int entero1 = 5;
        Console.WriteLine($"El cuadrado de {entero1} es: {Cuadrado(entero1)}");
    }
    // METODO DE CLASE
    public static int Cuadrado(int numero)
    {
        return numero * numero;
    }

    // METODO DE INSTANCIA(OBJETO   )
    public int Cubo(int numero)
    {
        return numero * numero * numero;
    }
}
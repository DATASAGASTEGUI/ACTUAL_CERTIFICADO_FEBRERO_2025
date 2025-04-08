using System;

namespace Proyecto;

internal class PrincipalArgumentos
{
    private static void Main(string[] args)
    {
        foreach (var arg in args)
        {
            Console.WriteLine(arg);
        }
        Console.ReadKey(true);
    }
}
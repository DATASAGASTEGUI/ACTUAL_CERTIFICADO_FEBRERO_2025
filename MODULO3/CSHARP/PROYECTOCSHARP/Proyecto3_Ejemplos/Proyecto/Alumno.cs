namespace Proyecto;
class Alumno
{
    public string Nombre { get; set; }
    public int Edad { get; set; }

    public Alumno()
    {
        Nombre = string.Empty; // ""
        Edad = 0;
    }
    public Alumno(string nombre, int edad)
    {
        Nombre = nombre;
        Edad = edad;
    }

    public override string ToString()
    {
        return $"Nombre: {Nombre}, Edad: {Edad}";
    }
}
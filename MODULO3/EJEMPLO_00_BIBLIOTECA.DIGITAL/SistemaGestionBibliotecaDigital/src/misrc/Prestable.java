package misrc;

public interface Prestable {
   void prestar(); //libro.prestar()  ---> prestado = true;
   void devolver();//libro.devolver() ---> prestado = false;
   boolean estaPrestado(); //libro.estaPrestado ---> valor de prestado
}

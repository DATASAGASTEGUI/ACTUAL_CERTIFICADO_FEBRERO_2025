package ejemplo12;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

class Cuenta {
    private int saldo = 100;
    private Lock lock = new ReentrantLock();

    public void retirarDinero(String nombre, int cantidad) {
        lock.lock(); // Bloquear acceso a la cuenta
        try {
            if (saldo >= cantidad) {
                System.out.println(nombre + " está retirando " + cantidad + "...");
                try {
                    Thread.sleep(2000); // simula tiempo del retiro
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                saldo -= cantidad;
                System.out.println(nombre + " completó el retiro. Saldo restante: " + saldo);
            } else {
                System.out.println(nombre + " intentó retirar " + cantidad + " pero no hay suficiente saldo.");
            }
        } finally {
            lock.unlock(); // Liberar bloqueo SIEMPRE en finally
        }
    }
}

class Persona extends Thread {
    private Cuenta cuenta;
    private String nombre;

    public Persona(Cuenta cuenta, String nombre) {
        this.cuenta = cuenta;
        this.nombre = nombre;
    }

    @Override
    public void run() {
        cuenta.retirarDinero(nombre, 50);
    }
}

public class Main {
    public static void main(String[] args) {
        Cuenta cuenta = new Cuenta();

        Persona p1 = new Persona(cuenta, "Hilo-1");
        Persona p2 = new Persona(cuenta, "Hilo-2");

        p1.start();
        p2.start();
    }
}

/*
Diferencias con synchronized:

synchronized bloquea automáticamente, mientras que con ReentrantLock debemos bloquear y desbloquear manualmente.

Con lock.unlock() en un bloque finally aseguramos que siempre se libere el candado aunque haya excepciones.

ReentrantLock es más flexible, permite cosas como tryLock() (intentar bloquear sin esperar indefinidamente).
*/
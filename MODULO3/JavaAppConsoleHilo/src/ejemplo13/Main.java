import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.TimeUnit;

class Cuenta {
    private int saldo = 100;
    private Lock lock = new ReentrantLock();

    public void retirarDinero(String nombre, int cantidad) {
        boolean pudoBloquear = false;
        try {
            // intenta bloquear por máximo 1 segundo
            pudoBloquear = lock.tryLock(1, TimeUnit.SECONDS);

            if (pudoBloquear) {
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
            } else {
                System.out.println(nombre + " no pudo acceder a la cuenta (ocupada).");
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            if (pudoBloquear) {
                lock.unlock();
            }
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
Comportamiento esperado:

El primer hilo que entra bloquea la cuenta durante 2 segundos.

El segundo hilo intenta acceder, pero como solo espera 1 segundo, puede fallar
en obtener el bloqueo y muestra el mensaje "no pudo acceder a la cuenta (ocupada)".
*/
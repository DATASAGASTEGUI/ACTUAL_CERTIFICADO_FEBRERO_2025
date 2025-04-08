package ejemplo11;

class Cuenta {
    private int saldo = 100;

    // método sincronizado: solo un hilo puede usarlo a la vez
    public synchronized void retirarDinero(String nombre, int cantidad) {
        if (saldo >= cantidad) {
            System.out.println(nombre + " está retirando " + cantidad + "...");
            try {
                Thread.sleep(2000); // simula el tiempo del retiro
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            saldo -= cantidad;
            System.out.println(nombre + " completó el retiro. Saldo restante: " + saldo);
        } else {
            System.out.println(nombre + " intentó retirar " + cantidad + " pero no hay suficiente saldo.");
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

        // dos hilos que intentan acceder a la misma cuenta
        Persona p1 = new Persona(cuenta, "Hilo-1");
        Persona p2 = new Persona(cuenta, "Hilo-2");

        p1.start();
        p2.start();
    }
}

/*
EXPLICACION

La clase Cuenta tiene un método retirarDinero marcado como synchronized.

Eso significa que si un hilo está ejecutando ese método, el otro queda bloqueado hasta que el primero termine.

Así evitamos que los dos hilos retiren dinero al mismo tiempo causando inconsistencias en el saldo.
*/


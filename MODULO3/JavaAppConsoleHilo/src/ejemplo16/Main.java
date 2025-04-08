import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.TimeUnit;

class Cuenta {
    private int saldo = 150; // saldo inicial
    private Lock lock = new ReentrantLock();

    public void retirarDinero(String nombre, int cantidad, int maxIntentos) {
        boolean pudoBloquear = false;
        int intentos = 0;

        while (intentos < maxIntentos) {
            try {
                intentos++;
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
                    break; // salir del bucle porque ya se procesó
                } else {
                    System.out.println(nombre + " no pudo acceder a la cuenta (ocupada), intento " + intentos);
                }

            } catch (InterruptedException e) {
                e.printStackTrace();
            } finally {
                if (pudoBloquear) {
                    lock.unlock();
                }
            }
        }

        if (!pudoBloquear) {
            System.out.println(nombre + " se rindió después de " + maxIntentos + " intentos.");
        }
    }
}

class Persona extends Thread {
    private Cuenta cuenta;
    private String nombre;
    private int cantidad;

    public Persona(Cuenta cuenta, String nombre, int cantidad) {
        this.cuenta = cuenta;
        this.nombre = nombre;
        this.cantidad = cantidad;
    }

    @Override
    public void run() {
        cuenta.retirarDinero(nombre, cantidad, 3); // máximo 3 intentos
    }
}

public class Main {
    public static void main(String[] args) {
        Cuenta cuenta = new Cuenta();

        // varios hilos intentando retirar dinero
        Persona p1 = new Persona(cuenta, "Hilo-1", 50);
        Persona p2 = new Persona(cuenta, "Hilo-2", 50);
        Persona p3 = new Persona(cuenta, "Hilo-3", 70);
        Persona p4 = new Persona(cuenta, "Hilo-4", 30);
        Persona p5 = new Persona(cuenta, "Hilo-5", 40);

        p1.start();
        p2.start();
        p3.start();
        p4.start();
        p5.start();
    }
}
/*
la versión final y más realista, donde varios hilos (5 personas) compiten por la misma cuenta bancaria, cada uno con un número máximo de intentos para acceder:

Qué pasa en este ejemplo:

Todos los hilos intentan acceder a la misma cuenta.

Cada uno puede intentar máximo 3 veces.

Si la cuenta está ocupada, el hilo espera 1 segundo y reintenta.

Si no lo consigue en 3 intentos, se rinde.

El saldo va disminuyendo con cada retiro exitoso, y algunos hilos pueden encontrarse con saldo insuficiente.


*/

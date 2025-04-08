import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.TimeUnit;
import java.util.Random;

class Cuenta {
    private int saldo = 200; // saldo inicial
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
    private Random random = new Random();

    public Persona(Cuenta cuenta, String nombre) {
        this.cuenta = cuenta;
        this.nombre = nombre;
    }

    @Override
    public void run() {
        for (int i = 1; i <= 3; i++) { // cada persona hace 3 intentos de retiro
            int cantidad = 20 + random.nextInt(50); // retiro aleatorio entre 20 y 70
            cuenta.retirarDinero(nombre, cantidad, 3); // máximo 3 intentos por retiro
            try {
                Thread.sleep(1000); // espera entre retiros
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Cuenta cuenta = new Cuenta();

        // varios hilos intentando retirar dinero varias veces
        Persona p1 = new Persona(cuenta, "Hilo-1");
        Persona p2 = new Persona(cuenta, "Hilo-2");
        Persona p3 = new Persona(cuenta, "Hilo-3");
        Persona p4 = new Persona(cuenta, "Hilo-4");
        Persona p5 = new Persona(cuenta, "Hilo-5");

        p1.start();
        p2.start();
        p3.start();
        p4.start();
        p5.start();
    }
}
/*
Ahora vamos a hacer que cada persona (hilo) intente varios retiros seguidos, como si fueran diferentes movimientos en la misma cuenta bancaria.

Cada persona intentará, por ejemplo, 3 retiros de distintas cantidades.

Qué ocurre en esta versión:

El saldo inicial es 200.

Cada persona (Hilo-1 a Hilo-5) intenta 3 retiros seguidos.

Cada retiro es de una cantidad aleatoria entre 20 y 70.

Cada intento de retiro usa tryLock() con 3 reintentos máximo.

Entre un retiro y otro, el hilo espera 1 segundo para simular tiempo real.

Al final, algunos retiros se completan y otros fallan por saldo insuficiente o porque otro hilo ocupó la cuenta demasiado tiempo.
*/
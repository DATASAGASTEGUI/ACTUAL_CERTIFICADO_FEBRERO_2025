package ejemplo_hilo_1;

public class Main {

    public static void main(String[] args) throws InterruptedException {

        HA1 h1 = new HA1();
        HA2 h2 = new HA2();

        h1.start();
        h2.start();

        h1.join();
        h2.join();
    }

    }



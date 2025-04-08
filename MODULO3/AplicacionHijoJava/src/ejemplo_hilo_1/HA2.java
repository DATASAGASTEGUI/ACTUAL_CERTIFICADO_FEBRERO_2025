package ejemplo_hilo_1;

public class HA2 extends Thread {
    @Override
    public void run() {
        for (int i = 1; i <= 10; i++) {
            System.out.println("Soy A2 y mi mensaje : " + i);
            try {
                Thread.sleep(500); // medio segundo
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

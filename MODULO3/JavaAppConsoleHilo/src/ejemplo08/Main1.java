package ejemplo08;

//SIN JOIN
public class Main1 {

    public static void main(String[] args) {
        Thread t1 = new Thread(() -> {
            System.out.println("Hilo 1 empieza");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
            }
            System.out.println("Hilo 1 termina");
        });

        t1.start();
        System.out.println("Main termina sin esperar al Hilo 1");
    }

}

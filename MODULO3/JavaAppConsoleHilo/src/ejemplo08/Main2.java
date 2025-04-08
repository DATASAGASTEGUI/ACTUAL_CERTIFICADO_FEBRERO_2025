package ejemplo08;

//CON JOIN
public class Main2 {

    public static void main(String[] args) {
        Thread t1 = new Thread(() -> {
            System.out.println("Hilo 1 empieza");
            try {
                Thread.sleep(100000);
            } catch (InterruptedException e) {
            }
            System.out.println("Hilo 1 termina");
        });

        t1.start();
        try {
            t1.join(); // el main espera a que termine t1
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("Main termina después de que acabe Hilo 1");
    }

}

package ejemplo0009;

public class Main {

    public static void main(String[] args) {
        int n1, n2;
        for(int i=1; i<=100; i++) {
            n1 = (int)(Math.random() * 10 + 1); //[1-10]
            n2 = (int)(Math.random() * 10 + 1); //[1-10]
            Suma s = new Suma(n1,n2);
            //System.out.println(s);
            
        }
    }
    
}

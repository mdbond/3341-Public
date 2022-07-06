public class Concurrency {
    public static void main(String[] args) {
        MyObj myObj = new MyObj();
        Thread t1 = new MyThread(myObj);
        Thread t2 = new MyThread(myObj);
        t1.start();
        t2.start();
        try {
            t1.join();
            t2.join();
        } catch (InterruptedException ex) {
            throw new RuntimeException(ex);
        }
        System.out.println("myObj.counter = " + myObj.counter);
    }
}

class MyObj {
    int counter = 0;
}

class MyThread extends Thread {
    final MyObj myObj;
    MyThread(MyObj myObj) { this.myObj = myObj; }
    @Override
    public void run() {
        for (int i = 0; i < 10000; i++) {
            synchronized (myObj) {
                myObj.counter = myObj.counter + 1;
            }
        }
    }
}
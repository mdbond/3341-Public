/* Here's a producer-consumer program that under some conditions -- including on
   stdlinux -- will sometimes observably violate sequential consistency. */
public class PC extends Thread {
    public static void main(String[] args) {
        MyObject myObject = new MyObject();
        Thread t1 = new Producer(myObject);
        Thread t2 = new Consumer(myObject);
        t1.start();
        t2.start();
        try {
            t1.join();
            t2.join();
        } catch (InterruptedException ex) {
            throw new RuntimeException(ex);
        }
    }
}

class MyObject {
    int[] data;
    int pos;
    Object lock;
    MyObject() {
        data = new int[10000000];
        pos = -1;
        lock = new Object();
    }
}

class Producer extends Thread {
    final MyObject myObject;
    public Producer(MyObject myObject) { this.myObject = myObject; }
    public void run() {
        for (int i = 0; i < myObject.data.length; i++) {
            myObject.data[i] = 42;
	        //synchronized (myObject.lock) {
              myObject.pos = i;
            //}
        }
        myObject.pos = myObject.data.length;
        System.out.println("Producer done");
}    }

class Consumer extends Thread {
    final MyObject myObject;
    public Consumer(MyObject myObject) { this.myObject = myObject; }
    public void run() {
        for (int i = 0; i < myObject.data.length; i++) {
            int temp = myObject.data[i]; // encourage compiler to optimize away the later load of myObject.data[i]
            boolean done = false;
            do {
                //synchronized (myObject.lock) {
                    done = (myObject.pos >= i);
                //}
            } while (!done);
            //while (myObject.pos < i) { /* System.out.println("Waiting"); */ }
            int value = myObject.data[i];
            if (value != 42) {
                System.out.println("Yikes: data[" + i + "] = " + value);
                while (true) { /* do nothing */ }
            }
        }
        System.out.println("Consumer done");
    }
}

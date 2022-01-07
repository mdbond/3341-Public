public class MyThread extends Thread {
    final MyObject myObj;
    final int which;
    static final Object otherObject = new Object();
    MyThread(MyObject myObj, int which) {
        this.myObj = myObj;
        this.which = which;
    }
    @Override
    public void run() {
        for (int i = 0; i < 100000; i++) {
            int value;
            if (which == 1) {
                synchronized (myObj) {
                    value = myObj.data;
                    myObj.data = value + 1;
                }
            } else {
                synchronized (myObj) {
                    value = myObj.data;
                    myObj.data = value + 1;
                }
            }
        }
    }

    public static void main(String[] args) throws InterruptedException {
        MyObject myObj = new MyObject();
        MyThread t1 = new MyThread(myObj, 1);
        MyThread t2 = new MyThread(myObj, 2);
        t1.start();
        t2.start();
        t1.join();
        t2.join();
        System.out.println("myObj.data = " + myObj.data);
    }
}

class MyObject {
    int data = 1;
}


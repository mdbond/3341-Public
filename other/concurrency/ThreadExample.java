public class ThreadExample {
	static Object other = new Object();
	public static void main(String[] args) {
		MyObject myObject = new MyObject();
		Thread t1 = new MyThread(myObject, false);
		Thread t2 = new MyThread(myObject, false);
		t1.start();
		t2.start();
		try {
			t1.join();
			t2.join();
		} catch (InterruptedException ex) {
			throw new RuntimeException(ex);
		}
		System.out.println("x = " + myObject.x);
	}
}

class MyObject {
	int x;
	void increment() {
		x++;
	}
}

class MyThread extends Thread {
	final MyObject myObject;
	boolean useSync;
	public MyThread(MyObject myObject, boolean useSync) {
		this.myObject = myObject;
		this.useSync = useSync;
	}
	public void run() {
		for (int i = 0; i < 5000; i++) {
			if (useSync) {
				synchronized (myObject) {
					myObject.increment();
				}
			} else {
				myObject.increment();
			}
		}
	}
}


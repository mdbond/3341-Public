import java.util.Vector;

public class Atom {
	public static void main(String[] args) {
		MySet set = new MySet();
		Thread t1 = new MyThread(set, 1, 10000);
		Thread t2 = new MyThread(set, 1500, 10000); /* Changing these values can lead to some or all executions being serializable */
		t1.start();
		t2.start();
		try {
			t1.join();
			t2.join();
		} catch (InterruptedException ex) {
			throw new RuntimeException(ex);
		}
		System.out.println("Vector size = " + set.vec.size());
	}
}

class MySet {
	// Intended invariant: vec has no duplicates.
	// For that to be true, add's body needs to execute atomically.
	Vector<Integer> vec = new Vector<Integer>();
	void add(int i) {
		if (!vec.contains(i)) {
			vec.add(i);
		}
	}
}


class MyThread extends Thread {
	final MySet set;
	final int minValue;
	final int maxValue;
	public MyThread(MySet set, int minValue, int maxValue) {
	this.set = set;
		this.minValue = minValue;
		this.maxValue = maxValue;
	}

	public void run() {
		for (int i = minValue; i <= maxValue; i++) {
			set.add(i);
		}
	}
}

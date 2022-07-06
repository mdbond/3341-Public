import java.util.Random;

// Step 1: Try with just one thread
// Step 2: Use multiple threads: performance gets worse and result is wrong
// Step 3: Use data race detector
// Step 4: Fix data races with global lock: performance is even worse
// Step 5: Fine-grained locks, but they lead to deadlock
// Step 6: Acquire locks in canonical order

public class Scalability {

	static int NUM_THREADS = 4;

	public static void main(String[] args) {
		Account[] accounts = new Account[5000];
		Random rand = new Random();
		long originalTotalMoney = 0;
		for (int i = 0; i < accounts.length; i++) {
			accounts[i] = new Account(rand.nextInt(1000000));
			originalTotalMoney += accounts[i].money;
		}

		Thread[] threads = new MyThread[NUM_THREADS];
		for (int i = 0; i < NUM_THREADS; i++) {
			threads[i] = new MyThread(accounts);
			threads[i].start();
		}
		try {
			for (int i = 0; i < NUM_THREADS; i++) {
				threads[i].join();
			}
		} catch (InterruptedException ex) {
			throw new RuntimeException(ex);
		}

		long actualTotalMoney = 0;
		for (int i = 0; i < accounts.length; i++) {
			actualTotalMoney += accounts[i].money;
		}
		System.out.println("Original total money: " + originalTotalMoney);
		System.out.println("Actual   total money: " + actualTotalMoney);
	}
}

class Account {
	long money;
	Account(long money) {
		this.money = money;
	}
}

class MyThread extends Thread {

	Account[] accounts;

	public MyThread(Account[] accounts) {
		this.accounts = accounts;
	}
	public void run() {
		Random rand = new Random();
		for (int i = 0; i < 16 * 1000 * 1000 / Scalability.NUM_THREADS; i++) {
			int acct1 = rand.nextInt(accounts.length);
			int acct2 = rand.nextInt(accounts.length);
			
			if (acct1 != acct2) {
	         stealMoney(acct1, acct2);
	      }
		}
   }
   void stealMoney(int acct1, int acct2) {
    if (acct1 < acct2) {
	  synchronized (accounts[acct1]) {
	   synchronized (accounts[acct2]) {
		 accounts[acct1].money += accounts[acct2].money;
		 accounts[acct2].money = 0;
      }
	  }
	 } else {
	  synchronized (accounts[acct2]) {
	   synchronized (accounts[acct1]) {
		 accounts[acct1].money += accounts[acct2].money;
		 accounts[acct2].money = 0;
      }
	  }
    }
	}
}


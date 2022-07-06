class Counter {
    private volatile int value;
    Counter(int value) { this.value = value; }
    void max(Counter other) {
        randomSleep();
        synchronized (other) {
            randomSleep();
            if (other.value > value) {
                randomSleep();
                synchronized (this) {
                    randomSleep();
                    int t = other.value;
                    randomSleep();
                    value = t;
                    randomSleep();
                }
                randomSleep();
            }
            randomSleep();
        }
    }

    static void randomSleep() {
        try {
            Thread.sleep((long)(Math.random() * 10));
        } catch (InterruptedException ex) {
            throw new RuntimeException(ex);
        }
    }
    public static void main(String[] args) {
        Counter c1 = new Counter(4);
        Counter c2 = new Counter(5);
        Counter c3 = new Counter(6);
        Thread t1 = new Thread() {
            public void run() {
                c1.max(c2);
            }
        };
        Thread t2 = new Thread() {
            public void run() {
                c1.max(c3);
            }
        };
        Thread t3 = new Thread() {
            public void run() {
                c2.max(c1);
            }
        };
        t1.start();
        t2.start();
        t3.start();
        try {
            t1.join();
            t2.join();
            t3.join();
        } catch (InterruptedException ex) {
            throw new RuntimeException(ex);
        }
        System.out.println(c1.value);
    }
}

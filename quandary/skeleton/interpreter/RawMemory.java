package interpreter;

import java.util.concurrent.atomic.AtomicLongArray;

class RawMemory {

    static final int BYTES_IN_WORD = 8;

    private final AtomicLongArray memory;
    private final long startAddr;
    private final long endAddr;

    RawMemory(long startAddr, long bytes) {
        assert  bytes % 8 == 0 && bytes / BYTES_IN_WORD <= Integer.MAX_VALUE : "Heap size must be a multiple of 8 bytes and  must not exceed a threshold";
        assert startAddr % 8 == 0 : "Heap start address must be 8-byte aligned";
        assert startAddr > 0 : "Heap start address must be > 0";
        int words = (int) (bytes / BYTES_IN_WORD);
        this.memory = new AtomicLongArray(words);
        this.startAddr = startAddr;
        this.endAddr = startAddr + bytes;
    }

    long getStartAddr() {
        return startAddr;
    }

    long getEndAddr() {
        return endAddr;
    }

    long load(long addr) {
        return memory.get(getIndex(addr));
    }

    void store(long addr, long value) {
        memory.set(getIndex(addr), value);
    }

    boolean atomicCompareAndSet(long addr, long oldValue, long newValue) {
        return memory.compareAndSet(getIndex(addr), oldValue, newValue);
    }

    private int getIndex(long addr) {
        assert addr % 8 == 0 : "Unexpected non-8-byte-aligned access";
        if (addr < startAddr || addr >= endAddr) {
            throw new RuntimeException("Address " + addr + " is out of bounds");
        }
        return (int) ((addr - startAddr) / BYTES_IN_WORD);
    }

}

int main(int arg) {
    return moduloPowerOfTwo(1, arg);
}

int moduloPowerOfTwo(int current, int target) {
    int doubleCurrent = current * 2;
    int diff = target - current;
    if (doubleCurrent > target) {
        return diff;
    }
    return moduloPowerOfTwo(doubleCurrent, target);
}

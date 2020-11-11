Q main (int arg) {
    mutable int i = 1;
    mutable int sum = 0;
    while (i <= arg) {
        sum = sum + i;
        i = i + 1;
    }
    return sum;
}
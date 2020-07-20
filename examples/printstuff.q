mutable Q main(mutable int arg) {
    return printStuff(arg, arg);
}

int printStuff(int value, int digit) {
    print value;
    if (value < 1000000000000000000) {
        int dummy = printStuff(value * 10 + digit, digit);
    }
    print value;
    return 0;
}

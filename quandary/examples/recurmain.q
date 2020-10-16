int main (int arg) {
    if (arg < 10000000000) {
        return main(arg + arg);
    }
    return arg;
}

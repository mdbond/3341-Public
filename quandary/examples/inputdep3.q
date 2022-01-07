int main(int arg) {
    if (arg > 1) {
        return main(arg);
    }
    return arg * arg;
}

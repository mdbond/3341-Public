int main(int arg) {
    return lg(arg);
}

int lg(int n) {
    return lgHelper(n, 2);
}

int lgHelper(int n, int mult) {
    if (n < mult) {
        return 0;
    }
    return 1 + lgHelper(n, mult * 2);
}

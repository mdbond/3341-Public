int main(int arg) {
    int o = openSum(arg);
    int c = doubleClosedSum(arg);
    if (2 * o == c) return o;
    return 0;
}

int openSum(int num) {
    if (num == 0) return 0;
    return num + openSum(num - 1);
}

int doubleClosedSum(int num) {
    return num * (num + 1);
}

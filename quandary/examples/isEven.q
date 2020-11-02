int main (int n) {
    if (n == 0) return 1;
    int temp = n - 1;
    int temp2 = 1 - isOdd(n);
    return temp2;
}

int isOdd(int n) {
    int temp = n - 1;
    if (n == 1) return 1;
    return isEven(temp);
}

int isEven(int n) {
    int temp = main(n);
    if (temp > 1) return isEven(n);
    return temp;
}

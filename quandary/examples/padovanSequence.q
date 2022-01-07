int main(int arg){
    return pad(arg);
}

int pad(int n) {
    if ((n == 0) || (n == 1) || (n==2)) {
        return 1;
    }
    return pad(n-2) + pad(n-3);
} 
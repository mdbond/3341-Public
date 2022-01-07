int main(int arg){
    return NCS(arg);
}

int NCS(int n) {
    if (n == 1 || n == 2) {
        return 1;
    }
    return NCS(NCS(n-1)) + NCS(n - NCS(n-1));
}
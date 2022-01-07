int main(int arg){
    int k = 8;
    return binomial(arg, k);
}

int binomial(int n, int k) {
    if (k>n){
        return 0;
    }
    else if (k == 0 || k == n) {
        return 1;
    }
    return binomial(n-1,k-1) + binomial(n-1,k);
}
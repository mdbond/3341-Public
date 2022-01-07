int main(int arg) {
    return abs(arg);
}

int abs(int n) {
    if (n >= 0)
        if (n > 0)
            return abs(-n + 1) + 1;
        else
            return 0;
    /*else*/
        return abs(-n - 1) + 1;
    
    return 99;
}

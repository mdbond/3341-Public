int main (int arg) {
    {
        int x = 5;
        if (arg == 1) return 2;
    }
    {
        int x = arg;
        return x;
    }
    return 100;
}

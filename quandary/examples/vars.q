int main(int arg) {
    int x = 5;
    int y = x + 5;
    int z = y + 10;
    if (x < y) {
        return z + x;
    }
    return x + y + z;
}

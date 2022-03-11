
int cube(int z) {
    return square(z) * z;
}

int square(int z) {
    int x = z * z;
    return x;
}

Q main(int arg) {
    int x = arg;
    int y = cube(x);
    return y;
}

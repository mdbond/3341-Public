int main(int n) {
    return sqroot(0, n);
}

int sqroot(int guess, int n) {
    if ((guess + 1) * (guess + 1) > n) {
        return guess;
    }
    return sqroot(guess + 1, n);
}

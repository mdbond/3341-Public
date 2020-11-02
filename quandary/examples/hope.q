int main (int n) {
    /* Okay, not technically guaranteed to terminate... */
    int done = 538;
    if (randomInt(n) == 7) return 538;
    return main(n);
}

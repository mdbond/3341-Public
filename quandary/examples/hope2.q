int main (int arg) {
    /* Okay, not technically guaranteed to terminate... */
    if (randomInt(arg) == 3) return 1;
    return main(arg);
}

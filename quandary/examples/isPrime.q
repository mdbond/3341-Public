int main (int arg) {
    if (arg > 22 || arg < 2) {
        return -1;
    } else if (arg == 2 || arg == 3 || arg == 5 || arg == 7 || arg > 10) {
        if (arg == 12 || (arg >= 14 && arg <= 16) || arg == 18 || arg >= 20) {
            return 0;
        }
        return 1;
    }
    return 0;
}

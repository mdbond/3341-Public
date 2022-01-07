int main (int arg){
    if (arg < 2) {
        return 0;
    } else if (arg < 4) {
        return 1;
    } else if (arg < 8) {
        return 2;
    } else if (arg < 16) {
        return 3;
    } else if (arg < 32) {
        return 4;
    } else if (arg < 64) {
        return 5;
    } else if (arg < 128) {
        return 6;
    }
    return 7;
}

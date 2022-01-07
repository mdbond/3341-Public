int main (int arg){
    if (arg < 2)
        return 0;
    if (arg < 4)
        return 1;
    if (arg < 8)
        return 2;
    if (arg < 16)
        return 3;
    if (arg < 32)
        return 4;
    if (arg < 64)
        return 5;
    if (arg < 128)
        return 6;
    return 7;
}

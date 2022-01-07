int main (int arg) {
    {
        if (arg < -5) return -arg;
        else if (arg > 5) return arg * 2;
    }
    return arg;
}

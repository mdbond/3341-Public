int main (int arg){
    int x = randomInt(arg);
    if (x == 0) {
        return main(arg + 1);
    }
    return x - x;
}

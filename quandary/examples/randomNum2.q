int main (int arg){
    return testRandomInt(arg);
}

int testRandomInt(int count) {
    if (count == 0)
        return 0;
    int result = testRandomInt(count - 1);
    int max = randomInt(1000000000000000);
    int value = randomInt(max);
    if (value >= 0 && value < max) {
        return result + 1;
    }
    return result;
}
mutable int main(mutable int x){
    {
        x = x + 3;
        int y = 23;
    }
    Ref y = nil;
    setLeft(y, x);
    return 0;
}

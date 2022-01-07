mutable Q main(mutable int arg){
    Ref x = nil . nil;
    while(arg > 0){
        setRight(x, (Ref)left(x));
        setLeft(x, arg . arg);
        arg = arg - 1;
    }
    return x;
}

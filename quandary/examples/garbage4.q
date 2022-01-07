mutable Q main(mutable int arg){
    Ref x = nil . nil;
    while(arg > 0){
        setRight(x, (Ref)left(x));
        setLeft(x, arg . arg);
        if (arg > 1)
            free (Ref)left(x);
        arg = arg - 1;
    }
    return x;
}

mutable Q main(mutable int arg){
    mutable Ref x = nil;
    mutable Ref y = nil . nil;

    while(arg > 0){
        if (isNil(right(y)) == 0)
            free (Ref)right(y);
        x = (arg .nil) . (arg . nil);
        setRight(y, left(x));
        free (Ref)right(x);
        free x;
        arg = arg - 1;
    }

    return y;
}

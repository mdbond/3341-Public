mutable Q main(int arg) {
    Ref flagAndData = 0 . (0 . 0);
    return [ produce(flagAndData) . consume(flagAndData) ] ;
}

mutable Q produce(Ref flagAndData) {
    setRight(flagAndData, (42 . 42 * 42));
    setLeft(flagAndData, 1);
    return nil;
}

Q consume(Ref flagAndData) {
    if ((int)left(flagAndData) != 0) {
        return right(flagAndData);
    }
    return nil;
}

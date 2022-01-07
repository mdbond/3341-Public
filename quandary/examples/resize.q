Ref main(int arg){
    Ref list = create(10);
    Ref ret = resize(list, arg);
    return ret;
}

Ref create(int len){
    mutable int l = 0;
    mutable Ref list = nil;
    while(l < len){
        list = l . list;
        l = l + 1;
    }
    return list;
}

Ref resize(Ref list, int size){
    if(size == 0) return nil;
    if(isNil(list) == 1)
        return 0 . resize(nil, size - 1);
    return left(list) . resize((Ref) right(list), size - 1);
}

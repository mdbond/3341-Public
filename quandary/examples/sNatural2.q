Q main(int arg) {
    Ref list = create(arg);
    return list;
}

Ref create(int length){
    if(length == 0)
        return nil;
    mutable int len = 0;
    mutable Ref mylist = nil;
    while(len < length){
        mylist = len . mylist;
        len = len + 1;
    }
    return mylist . create(length - 1);
}

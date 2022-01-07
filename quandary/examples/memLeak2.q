mutable Q main(mutable int arg) {
	mutable Ref list = (1. (2. (3. (4. nil))));
    mutable int count = arg;
    while (count > 0) {
        Ref a = 3 . nil;
        Ref b =  4. nil;
        setRight(list, left(a).nil);
        free(a);
        free(b);
        count = count -1;
    }
    return list;
}

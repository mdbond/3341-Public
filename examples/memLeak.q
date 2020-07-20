mutable Q main(mutable int arg) {
	mutable Ref list = (1. (2. (3. (4. nil))));
    setRight(list, nil);
    free list;
    Ref a = 3.nil;
    return a;
}

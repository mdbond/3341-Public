mutable Q main(int arg) {
	if (arg == 0) {
	    return nil;
	  }
	Ref list = orderedList(arg);
	Ref f = flip(list);
	return f;
}

Ref orderedList(int length) {
	if (length == 1)
		return 1.nil;
	return length . orderedList(length - 1);
}

mutable Ref flip(Ref list) {
	Ref ret = right(list) . left(list);
	if (isAtom(left(ret)) == 0)
		setLeft(ret, flip((Ref)left(ret)));
	if (isAtom(right(ret)) == 0)
		setRight(ret, flip((Ref)right(ret)));
	return ret;
}
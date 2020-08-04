mutable Q main(int arg) {
	if (arg == 0) {
	    return nil;
	  }
	Ref original = orderedList(arg);
	Ref copy = copy(original);
	setLeft(copy, 0);
	return original . copy;
}

Ref orderedList(int length) {
	if (length == 1)
		return 1.nil;
	return length . orderedList(length - 1);
}

Ref copy(Ref list) {
	mutable Q leftCopy = left(list);
	if (isAtom(left(list)) == 0)
		leftCopy = copy((Ref)left(list));
	mutable Q rightCopy = right(list);
	if (isAtom(right(list)) == 0)
		rightCopy = copy((Ref)right(list));
	return leftCopy . rightCopy;
}
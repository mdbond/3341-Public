Q main (int arg) {
	Ref list = randomList(arg);
	return length(list);
}

int length(Ref list) {
	if (isNil(list) != 0) return 0;
	return 1 + length((Ref)right(list));
}

Ref randomList(int length) {
	if (length == 0) {
        return nil;
    }
    return randomInt(100000) . randomList(length - 1);
}

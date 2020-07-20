Ref main(mutable int arg) {
	mutable Ref a = 1.2;
	while (arg > 0) {
		arg = arg - 1;
		a = arg . arg+1;
	}
	return a;
}
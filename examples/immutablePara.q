Ref main (int arg) {
	Ref x = 5 . (3.5);
	int y = func(x, x);
	return x;
}

int func(Ref x, mutable Ref y) {
	x = (3.nil);
	y = (nil.3);
	return 2;
}
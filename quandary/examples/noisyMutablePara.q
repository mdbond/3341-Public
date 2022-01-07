mutable Ref main (int arg) {
	Ref x = 5 . (3.5);
	Ref y = func(x, x);
    mutable Ref g = (x . (randomInt(2) . nil));
    int tmp = setRight(g, (12 . (3 . 9)));
    
    int tmp1 = func1(y, g);
	return y;
}

Ref func(mutable Ref x, mutable Ref y) {
	x = x . (3.nil) ;
	y = (nil.y) . (3. nil);
	return y;
}

mutable int func1(mutable Ref x, mutable Ref y) {
    return setLeft(x, y);
}
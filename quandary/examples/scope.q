Q main(int arg) {
	mutable int i = 3 + arg;
	{
		int x = 2 * arg;
		i = x - 6;
	}
	return x * i;
}
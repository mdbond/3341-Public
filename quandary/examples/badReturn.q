Q main(int arg) {
	int i = 4 + (arg * -1);
	return func(i);
}

int func(int i) {
	int x = i + 1;
	Q y = x;
	return y;
}
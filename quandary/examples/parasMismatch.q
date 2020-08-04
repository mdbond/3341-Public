int main(int arg) {
	int x = 2 + arg;
	Q q = 4;
	int a = func(x, x, x) + foo(x);
	int b = func(x, x, q) + foo(x);
	int k = func(x, x *4);
	return func(x, x, x, x);
}

int func(int x, int y, int z) {
	return x + y;
}

int foo() {
	return 2;
}

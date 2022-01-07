int main(int x) { 
	return try(x); /* terminates with very high probability */
}

int try(int n) {
	int value = randomInt(n);
	if (value == 0) {
		return 24;
	}
	return try(value);
}

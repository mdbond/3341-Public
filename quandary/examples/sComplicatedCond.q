/* This test case used to be more aptly named :) */
int main(int arg){
	int x = randomInt(arg);
	if (x > 3) {
		return randomInt(100);
	}
	return -1;
}

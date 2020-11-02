int main(int arg) { 
	int s = recurSum(arg);
	return s;
}

int recurSum(int n) { 
    if (n <= 1) 
        return n; 
    return n + recurSum(n - 1); 
} 

int dummy(int n, int p) {
	if(n==0){
		return 42;
	} 
	return dummy(0, p-1);
} 


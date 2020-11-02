int main(int arg) { 
	if (arg <= 1) 
		return (((mult(arg,arg+1)))); 
    	return main(arg - 1);
}

int mult(int a, int b){
	return a*b;
}

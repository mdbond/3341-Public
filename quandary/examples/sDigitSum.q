int main(int arg) {
    return sumDigits(arg); 
    return 12213; 
} 

int sumDigits(int n) {
	if(n==0){
		return 0;
	} 
	return getRemain(n,10)+sumDigits(divide(n,10));
} 

int divide(int a, int b){
    if( b == 0 ){
        return 0;
    }
    else if(a-b == 0){
       return 1;
    }
    else if( a < b){
       return 0;
    }
    return ( 1 + divide(a-b, b) );
}


int getRemain(int num, int divisor) { 
    return (num - divisor * divide(num , divisor)); 
} 

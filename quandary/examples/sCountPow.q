int main(int arg) { 
	int a = 2;
	int s = countWays(arg, a);
	return s;

	int b = randomInt(100);
	if(b<0)
		return -1;
	return -2;
}

int getRemain(int num, int divisor) { 
    return (num - divisor * divide(num , divisor)); 
} 

int countWays2(int x, int n, int num) { 
    int val = (x - power(num, n)); 
    if (val == 0) 
        return 1; 
    if (val < 0) 
        return 0; 
 
    return countWays2(val, n, num + 1) + 
           countWays2(x, n, num + 1); 
} 


int power(int x, int y) { 
    if (y == 0) 
        return 1; 
    else if (getRemain(y , 2) == 0) 
        return power(x, divide(y , 2)) * power(x, divide(y , 2)); 

    return x * power(x, divide(y , 2)) * power(x, divide(y , 2));  
}

int countWays(int x, int n) { 
    return countWays2(x, n, 1); 
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


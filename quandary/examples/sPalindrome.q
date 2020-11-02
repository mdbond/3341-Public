int main(int arg) { 
	int rev = rev(arg,0);
	if(arg==rev)
		return 1;
	return 0;
}

int getRemain(int num, int divisor) { 
    return (num - divisor * divide(num , divisor)); 
} 


int rev(int n, int temp) { 
    if (n == 0) 
        return temp; 

    int s = (temp * 10) + (((getRemain(n , 10)))); 
  
    return rev(divide(n , 10), s); 
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

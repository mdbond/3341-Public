int main(int arg) { 
	int a = minTiles(arg, arg+1);
	int b = minTiles(arg+1, arg+2);
	int c = minTiles(arg+2, arg+3);
	int d = minTiles(arg+3, arg+4);
	if(( (a+b+c-d)<=(a-b-c) || (a<c) || (a>d) && (!a!=(-arg+b)) ))
		return (((((a)))));
	if(!a<=b && b==c)
		return b;
	else if(((a+arg)-(-d+-c)+((c+-d)+(a-b)-(-arg--arg)+(d*arg))+(b-1)+(-3*-a)) != a && !(!a==b))
		return (d);
	int p = a+b;
	if(a>=(p+a-b-arg+c+d) || (b>(((a---arg))--c+d----p*arg))){
		return p;
	}
	return c;
}

int getRemain(int num, int divisor) { 
    return (num - divisor * divide(num , divisor)); 
} 


int minTiles(int n, int m) {
  if (n == 0 || m == 0) 
    return 0; 

  else if (getRemain(n,2) == 0 && getRemain(m,2) == 0) 
    return minTiles(divide(n,2), divide(m,2)); 
    
  else if (getRemain(n,2) == 0 && getRemain(m,2) == 1) 
    return (n + minTiles(divide(n,2), divide(m,2))); 

  else if (getRemain(n,2) == 1 && getRemain(m,2) == 0) 
    return (m + minTiles(divide(n,2), divide(m,2))); 
  
  return (n + m - 1 + minTiles(divide(n,2), divide(m,2)));  
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

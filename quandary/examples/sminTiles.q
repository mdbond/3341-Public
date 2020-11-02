int main(int arg) { 
	return minTiles(arg, arg+1);
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

int main(int arg) { 
    return findBinary(arg); 
}

int findBinary(int decimal_number) { 
    if (decimal_number == 0)  
        return 0;  
    return (getRemain(decimal_number , 2) + 10 *  
                findBinary(divide(decimal_number , 2))); 
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

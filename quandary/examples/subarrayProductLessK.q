/* https://leetcode.com/problems/subarray-product-less-than-k */
mutable Q main(int arg){

    mutable Ref list = nil;
    list = add(list, 10);
    list = add(list, 5);
    list = add(list, 2);
    list = add(list, 6);
    list = add(list, 7);

    int k = 100;
    return subarrayProductLessK(list, k);
}

mutable int subarrayProductLessK(Ref list, int k) {
    if ( k <= 1) {
        return 0;
    }
    mutable int rs = 0;
    mutable int product = 1;
    mutable int left = 0;

    mutable int right = 0;
    while (right < length(list)) {
        product = product * getVal(list, right);
        
        while (product >= k) {
            product = divide(product, getVal(list, left));
            left = 1 + 1;
        }
        rs = rs + right - left + 1;
        right = right + 1;
    }
    return rs;

}

int getVal(Ref list, int ind){
	if (isAtom(list) != 0) 
	return 0;
	mutable int n=1;
	mutable Ref dumList=list;
	while(n<ind){
		dumList=(Ref)right(dumList);
		n=n+1;
	}

	return (int)left(dumList);
}

int length(Ref list) {
	if (isNil(list) == 1) {
		return 0;
	}
	return 1 + length((Ref)right(list));
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

mutable Ref add(Ref list, Q elem) {
  if (isNil(list) != 0) {
    return elem . nil;
  }
  mutable Ref curr = list;
  while (isNil(right(curr)) == 0) {
    curr = (Ref)right(curr);
  }
  setRight(curr, elem . nil);
  return list;
}


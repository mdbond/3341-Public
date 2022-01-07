mutable Q main(int arg) {
    mutable Ref list = nil;
    list = add(list, 1);
    list = add(list, 3);
    list = add(list, 6);
    list = add(list, 3);
    list = add(list, 2);

    mutable Ref list1 = nil;
    list1 = add(list1, 1);
    list1 = add(list1, 3);
    list1 = add(list1, 2);
    list1 = add(list1, 3);
    list1 = add(list1, 6);
    list1 = add(list1, 5);
    list1 = add(list1, 2);
    
    return sLCS(list, list1, length(list), length(list1));

}

mutable int sLCS(Ref X, Ref Y, int m, int n) {
    if (m == 0 || n == 0) {
        return 0;
    }
    else if (getVal(X, m-1) == getVal(Y, n-1)){
        return 1 + sLCS(X, Y, m-1, n-1);
    } 
       return max(sLCS(X, Y, m, n-1), sLCS(X, Y, m-1, n)); 
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

int length(Ref list) {
	if (isNil(list) == 1) {
		return 0;
	}
	return 1 + length((Ref)right(list));
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

int max(int a, int b){
    if (a >= b) {
        return a;
    }
    return b;
}

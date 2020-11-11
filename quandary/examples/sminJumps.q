mutable Q main(int arg) {
  mutable Ref list = nil;
  list = add(list, 1);
  list = add(list, 3);
  list = add(list, 6);
  list = add(list, 3);
  list = add(list, 2);
  return minJumps(list, arg);
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


int minJumps(Ref list, int n) { 
  
    if (n == 1) 
        return 0; 

    mutable int res = 999999; 
    mutable int i=n-2;
    while(i >= 0) { 
        if (i + 1 + getVal(list,i+1) >= n ) { 
            int sub_res = minJumps(list, i + 1); 
            if (sub_res != 999999){
	    	if(res>sub_res+1)
			res=sub_res+1;
	    }
        } 
	i=i-1;
    } 
  
    return res; 
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

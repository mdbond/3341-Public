mutable Q main(int arg) {
  mutable Ref list = nil;
  list = add(list, 4);
  list = add(list, 3);
  list = add(list, 5);
  list = add(list, 42);
  list = add(list, 11);
  list = add(list, 32);
  list = add(list, 27);
  list = sort(list,length(list));
  return binarySearch(list,arg);
}

int binarySearch(Ref list, int k){	
	mutable int l=1;
	mutable int h=length(list);
	while(l<=h){
		int mid = divide((l+h),2);
		int val = getVal(list,mid);
		if(val==k)
			return 1;
		else if(val<k)
			l=mid+1;
		else
			h=mid-1;
	}
	return 0;
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

int length(Ref c) {
  if (isAtom(c) != 0) return 0;
  return 1 + length((Ref)right(c));
}

mutable Ref replace(Ref list,int val1, int ind1){
	mutable Ref curr = list;
	mutable Ref curr2 = nil;
	mutable Ref curr3 = list;
	mutable int n=1;
	while(n<ind1){
		curr=(Ref)right(curr);
		n=n+1;		
	}
	setLeft(curr,val1);
	
	n=0;
	while(n<ind1-1){
		curr2=add(curr2,(int)left(curr3));
		curr3=(Ref)right(curr3);
		n=n+1;		
	}
	n=0;
	curr3=curr;
	while(n<length(curr)){
		curr2=add(curr2,(int)left(curr3));
		curr3=(Ref)right(curr3);
		n=n+1;		
	}	
	return curr2;
}

mutable Ref sort(Ref list, int n)  {  
    	mutable int i=1;
	mutable Ref curr=list;
    	while(i<=n){
		mutable int j=1;
		while(j<=n-1){
			int val1 = getVal(curr,j);
			int val2 = getVal(curr,j+1);
			if (val1 > val2) {
				curr=replace(curr,val2,j);
				curr=replace(curr,val1,j+1);
				
			}
			j=j+1;
		}
		i=i+1;
	}
	return curr;
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

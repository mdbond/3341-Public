mutable Q main(int arg) {
  mutable Ref list = nil;
  list = add(list, 4);
  list = add(list, 3);
  list = add(list, 5);
  list = add(list, 42);
  list = add(list, 11);
  list = add(list, 32);
  list = add(list, 27);
  list = add(list, 1);
  return replace(list,arg,6);
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

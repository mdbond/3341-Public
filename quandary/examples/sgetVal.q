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

  return getVal(list, arg);

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



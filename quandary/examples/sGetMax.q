mutable Q main(int arg) {
  mutable Ref list = nil;
  list = add(list, 4);
  list = add(list, 3);
  list = add(list, 5);
  list = add(list, 40);
  list = add(list, 11);
  list = add(list, 32);
  list = add(list, 27);
  list = add(list, 1);
  
  return getMax(list);
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

int getMax(Ref list){
	mutable Ref dumList=list;
	int n = length(list);
	mutable int i=1;
	mutable int currmax=0;
	while(i<=n){
		if(currmax<(int)left(dumList))
			currmax=(int)left(dumList);
		dumList=(Ref)right(dumList);
		i=i+1;
	}
return currmax;

}

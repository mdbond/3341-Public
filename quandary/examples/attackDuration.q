mutable Q main(int arg) {
  mutable Ref list = nil;
  list = add(list, 1);
  list = add(list, 3);
  list = add(list, 6);
  list = add(list, 7);
  list = add(list, 9);
  list = add(list, 12);

  return attackDuration(list, 2);
}

mutable Q attackDuration(Ref timeSeries, int dur) {
  mutable int ans = dur * length(timeSeries);
  mutable int idx = 1;
  while (idx < length(timeSeries)) {
    ans = ans - max(0, dur - (getVal(timeSeries, idx) - getVal(timeSeries, idx-1)));
    idx = idx + 1;
  }
  return ans;
  }

int length(Ref list) {
	if (isNil(list) == 1) {
		return 0;
	}
	return 1 + length((Ref)right(list));
}

int max(int a, int b) {
  if (a >= b) {
    return a;
  }
  return b;
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
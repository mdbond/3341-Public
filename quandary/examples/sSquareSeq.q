Q main(int arg) {
  mutable int n = 1;
  mutable Ref list = nil;
  while (n <= arg) {
      int sq = pow(n);
      list = sq . list;
      n = n + 1;
  }

  return list;

}

int pow(int n){
	return n*n;
}

int length(Ref list) {
  if (isAtom(list) != 0) 
	return 0;
  return 1 + length((Ref)right(list));
}


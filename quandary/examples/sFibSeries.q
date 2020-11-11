Q main(int arg) {
  mutable int n = 1;
  mutable Ref list = nil;
  while (n <= arg) {
      int sq = fib(n);
      list = sq . list;
      n = n + 1;
  }
  return list;

}
int length(Ref list) {
  if (isAtom(list) != 0) 
	return 0;
  return 1 + length((Ref)right(list));
}


int fib(int n) {
   if (n <= 1)
   	return n;
   return fib(n-1) + fib(n-2);
}


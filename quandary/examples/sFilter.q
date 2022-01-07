mutable Q main(int arg){
    mutable Ref list = nil;
    list = add(list, 4);
    list = add(list, 3);
    list = add(list, 5);
    list = add(list, 42);
    list = add(list, 11);
    list = add(list, 32);
    list = add(list, 27);
    list = add(list, 1);    
    return filter(list, arg);
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

mutable Ref filter(Ref list, int minval){
    mutable Ref ret = nil;
    mutable Ref curr = list;
    while(isNil(curr) != 1){
        int val = (int) left(curr);
        if(val >= minval)
            ret = add(ret, val);
        curr = (Ref) right(curr);
    }
    return ret;
}

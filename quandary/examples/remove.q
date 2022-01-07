mutable Q main(int arg){
    mutable Ref list = create(20);
    if(arg < 0 || arg >= length(list)) return nil;
    list = remove(list, arg);
    return list;
}

int length(Ref list) {
    if (isNil(list) != 0) return 0;
    return 1 + length((Ref)right(list));
}

Ref create(int len){
    mutable int l = 0;
    mutable Ref list = nil;
    while(l < len){
        list = l . list;
        l = l + 1;
    }
    return list;
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

mutable Ref remove(Ref list, int indx){
    mutable Ref curr = list;
    mutable Ref ret = nil;
    mutable int i = 0;
    int len = length(list);
    while(i < len){
        if(i != indx)
            ret = add(ret, left(curr));
        curr = (Ref) right(curr);
        i = i + 1;
    }

    return ret;
}

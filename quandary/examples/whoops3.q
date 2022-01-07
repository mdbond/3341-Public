mutable Q main(mutable int arg){
    mutable Ref x = nil;
    x = recursive(x, 1005, arg);
    return x;
}

mutable Ref recursive(mutable Ref x, int arg, int freetype){
    if(arg == 0)
        return nil;
    
    x = recursive(x, arg-1, freetype);
    int res = divides(arg, 10);
    if(res == 0){
        if(freetype == 1){
            x = (Ref)freeAll(x);
        }else
            x = nil;
    }
    return x;
}

mutable Q freeAll(Ref node){
    if(isNil(node) == 0 ){
        freeAll((Ref) left(node));
        free node; 
    }
    return nil;
}

int divides(mutable int x, int y) {
  while (x > 0) {
    x = x - y;
  }
  if (x == 0) return 1;
  return 0;
}

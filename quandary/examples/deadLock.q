mutable Q main(int arg) {
    mutable Ref counters1 = 5.2;
    mutable Ref counters2 = 8.3;
    Ref dummy = [addLeft(counters1, counters2) . addLeft(counters2, counters1)];
    return dummy;
}

mutable Ref addLeft(Ref a, Ref b) {
    acq(a);
    int val = (int) left(b);
    if (val >  0) {
        acq(b);
        int tmp = setLeft(a, (int) left(b));
        rel(b);
    }
   
    rel(a);
    return a;
  
}
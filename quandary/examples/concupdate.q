mutable Q main(mutable int arg) {
  mutable Ref data = 3.5;
  mutable Ref data2 = 5. 10;
  Ref dummy = [update(data2, 3) . [ update(data, 3) . update(data2, 2)]]; 
  return dummy;
}

mutable int update(mutable Ref a, int b) {
    acq(a);
    setLeft(a, b);
    rel(a);
    return 1;

}

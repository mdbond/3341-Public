Q main(int arg) {
  Q a = 3;
  Q b = 8 + a * 7;
  if (a < b) {
    Q c = b;
    return c;
  }
  return nil;
}

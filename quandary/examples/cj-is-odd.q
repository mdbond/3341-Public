int main(int arg) {
    return isOdd(arg);
}

int isOdd(int x) {
  if (x == 0) {
    return 0;
  } else if (x == 1) {
    return 1;
  }
  return isOdd(x - 2);
}


int isOdd(int x) {
  if (x == 0) return 0;
  return isEven(x - 1);
}

int main(int arg) {
    return isOdd(arg);
}

int isEven(int x) {
  if (x == 0) return 1;
  return isOdd(x - 1);
}

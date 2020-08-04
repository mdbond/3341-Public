#include <iostream>
using namespace std;

int main() {
  long* p;
  long w;
  long x;

  x = 3;
  w = 8;
  p = &x;

  cout << "&p = " << &p << endl;
  cout << "&w = " << &w << endl; // It's important that &w be evaluated somewhere, so it gets a stack location!
  cout << "&x = " << &x << endl;

  cout << "p = " << p << ", w = " << w << ", x = " << x << endl;

  *p = 4;

  *(p + 1) = 5; // same as *((int*)((void*)p + 8)) = 5;

  cout << "p = " << p << ", w = " << w << ", x = " << x << endl;

  cout << "*p = " << *p << endl;

  return 0;
}

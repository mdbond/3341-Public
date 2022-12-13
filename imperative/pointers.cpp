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

  cout << "BEFORE MODIFICATIONS:      p = " << p << ", w = " << w << ", x = " << x << endl;

  *p = 4;

  cout << "BEFORE FIRST MODIFICATION: p = " << p << ", w = " << w << ", x = " << x << endl;

  *(p - 1) = 5; // same as *((int*)((void*)p - 8)) = 5;

  cout << "AFTER MODIFICATIONS:       p = " << p << ", w = " << w << ", x = " << x << endl;

  cout << "*p = " << *p << endl;

  return 0;

  /*int z[5];
  int* y = z;
  y[2] = 5;
  cout << y[2] << " " << (y+1)[1] << " " << *(y + 2) << endl;
  cout << *(int*)((void*)y + sizeof(int)*2) << endl;*/

}

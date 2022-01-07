/* https://leetcode.com/problems/jump-game-ii/ */

mutable Q main(int arg) {
    mutable Ref list = nil;
    list = add(list, 2);
    list = add(list, 3);
    list = add(list, 1);
    list = add(list, 1);
    list = add(list, 4); 
    list = add(list, 2); 
    list = add(list, 1); 
    list = add(list, 3); 
    list = add(list, 1);
    list = add(list, 1);
    list = add(list, 2);

    return jumpGame(list);

}
mutable int jumpGame(Ref list) {
    if (length(list) == 1) {
        return 0;
    }
    mutable int farthest = getVal(list, 0);
    mutable int count = 0;
    mutable int best_step_reach = farthest;

    mutable int index = 0;
    while (index < length(list)) {
        if (best_step_reach >= (length(list) - 1)) {
            return count;
        }
        if (farthest < index) {
            farthest = best_step_reach;
            count = count + 1;
        }
        int tmp = index + getVal(list, index);
        if(tmp > best_step_reach) {
            best_step_reach = tmp;
        }
        if (best_step_reach >= (length(list) - 1)) {
            if (index == 0) {
                count = count + 1;
            }
            else {
                count = count + 2;
            }
        }
        index = index + 1;
        
    }
    return count;
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

int getVal(Ref list, int ind){
	if (isAtom(list) != 0) 
	return 0;
	mutable int n=1;
	mutable Ref dumList=list;
	while(n<ind){
		dumList=(Ref)right(dumList);
		n=n+1;
	}

	return (int)left(dumList);
}

int length(Ref list) {
	if (isNil(list) == 1) {
		return 0;
	}
	return 1 + length((Ref)right(list));
}

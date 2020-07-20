mutable Q main(int arg) {
    Ref flagAndData = 0 . (0 . 0);
    mutable int count = 0;
    while (1 == 1) {
      Q result = right([ produce(flagAndData) . consume(flagAndData) ]);
      if (isNil(result) == 0) {
        return result;
      }
      count = count + 1;
    }
    return nil;
}

mutable Q produce(Ref flagAndData) {
    setRight(flagAndData, 42 . 42);
    acq(flagAndData);
    setLeft(flagAndData, 1);
    rel(flagAndData);
    return nil;
}

mutable Q consume(Ref flagAndData) {
    acq(flagAndData);
    int flag = (int)left(flagAndData);
    rel(flagAndData);
    if (flag != 0) {
        return right(flagAndData);
    }
    return nil;
}

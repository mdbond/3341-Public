mutable Q main(int arg) {
    mutable Ref val = [ (6 + arg) . (arg - 3) ];
    acq(val);
    val = [ val . val ];
    rel((Ref)left(val));
    return val;
}

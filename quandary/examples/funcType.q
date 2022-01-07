Q main(mutable int x) {
    return foo(x, (x.nil), x, 1);
}

Q foo(int a, Ref b, Q c, int d) {
    return ((a . b).( left( (Ref) c) . d)).nil;
}
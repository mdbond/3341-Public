int plus() { return 1; }
int times() { return 2; }

int main(int arg) {
    Q expr = (plus() . ((times() . (arg . 7)) .
                         (times() . (14 .
                                    (plus() . (17 . 18))
             )          ))         );
    return mycalc(expr);
}

int mycalc(Q expr) {
    if (isAtom(expr) != 0) {
        return (int)expr;
    }
    Ref e = (Ref)expr;
    int op = (int)left(e);
    Q left = left((Ref)right(e));
    Q right = right((Ref)right(e));
    if (op == plus()) {
        return mycalc(left) + mycalc(right);
    }
    if (op == times()) {
        return mycalc(left) * mycalc(right);
    }
    int badValueBecauseUnexpectedOp = (int)(Q)(42 . 42); /* unreachable */
    return badValueBecauseUnexpectedOp;
}

/* Verifies that all types of the stmts can be executed in the else */
int main (int arg){
    int i = ifStmt();
    int j = ifStmt2();
    int k = ifStmt3(3892);
    int l = ifStmt4();
    return i+j+k+l;
}

int ifStmt(){
    if (1 != 1) print 3;
    else return 14 * 4383; /* Return stmt */
    return 0;
}

int ifStmt2(){
    if (6 != 0) print 14 * 4383; 
    else print 5; return 5;  /* Print stmt */
    return 0;
}

int ifStmt3(int y){
    if (y < 0) {       
        int x = y + 10; 
        print 293;
    } else {
        int x = y + 10;  /* Stmt list */
        print 293;
        return y;
    }
    return 0;
}

int ifStmt4(){
    if (1092-212 > 0) print 5;
    else int x = randomInt(10); return 392; /* Assign Stmt */
    return 0;
}
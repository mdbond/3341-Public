/* Verifies that all types of the stmts can be executed in the if */
int main (int arg){
    int i = ifStmt();
    int j = ifStmt2();
    int k = ifStmt3(3892);
    int l = ifStmt4();
    return i+j+k+l;
    
}

int ifStmt(){
    if (1 == 1) return 14 * 4383; /* Return stmt */
    return 91;
}

int ifStmt2(){
    if (6 != 0) print 14 * 4383; /* Print stmt */
    return 0;
}

int ifStmt3(int y){
    if (y > 0) {        /* Stmt list */
        int x = y + 10; 
        print 293;
        return y;
    }
    return 0;
}

int ifStmt4(){
    if (1092-212 > 0) int x = 89232; /* Assign Stmt */
    return 230;
}
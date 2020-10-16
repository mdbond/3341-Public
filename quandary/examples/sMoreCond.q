int main(int arg){

	int a = arg+10;
	int b=5;
	if(a>=b && a==b){
		return a+arg;
	}
	if(a<=b)
		return a;
	else if(a!=0 && b!=5){
		return b;
	}
	if(a==b){
		return a-b;
	}
	else if(a!=b || !(a<b)){
		return b-arg;	
	}
	if(a>b || b<a && a!=b)
		return a-arg;
	else
		return arg;
	return (arg);
}

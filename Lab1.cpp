#include<bits/stdc++.h>
using namespace std;
#define ll int
ll N;
void BitAddition(char A, char B, char CIN, char &Sum, char &COUT) {
    if(A=='0'&&B=='0'&&CIN=='0'){
        Sum='0';
        COUT='0';    
    }else if(A=='0'&&B=='0'&&CIN=='1'){
        Sum='1';
        COUT='0';
    }else if(A=='1'&&B=='0'&&CIN=='0'){
        Sum='1';
        COUT='0';
    }else if(A=='1'&&B=='0'&&CIN=='1'){
        Sum='0';
        COUT='1';
    }else if(A=='0'&&B=='1'&&CIN=='0'){
        Sum='1';
        COUT='0';
    }else if(A=='0'&&B=='1'&&CIN=='1'){
        Sum='0';
        COUT='1';
    }else if(A=='1'&&B=='1'&&CIN=='0'){
        Sum='0';
        COUT='1';
    }else if(A=='1'&&B=='1'&&CIN=='1'){
        Sum='1';
        COUT='1';
    }
}

void NBitAddition(char* A, char *B, char CIN, char* Sum, char &COUT){
    char Summ,COUTT;
    ll i=0;
    while(i<N){
        BitAddition(A[N-i-1],B[N-i-1],CIN, Summ,COUTT);
        Sum[N-i-1]=Summ;
        CIN=COUTT;
        i++;
    }
    COUT=CIN;
    return;
}

void Inverse(char* A, char* B){
    for(ll i=0;i<N;i++){
        if(A[i]=='0'){
            B[i]='1';
        }else if(A[i]=='1'){
            B[i]='0';
        }
    }
}

void TwoSCompliment(char* A, char *B){
    char COUTT,CIN='0';
    char add_one[N+1],C[N+1];
    
    Inverse(A,C);
    for(ll i=0;i<N-1;i++){
        add_one[i]='0';
    }
    add_one[N-1]='1';

    NBitAddition(C,add_one,CIN,B,COUTT);
}

void NBitSubtraction(char* A, char *B, char CIN, char* Sum, char &COUT){
    char C[N+1];
    TwoSCompliment(B,C);
    NBitAddition(A,C,'0',Sum, COUT);
    if(CIN=='1'){
        if(Sum[N-1]=='1'){
            Sum[N-1]='0';
        }else{
            char D[N+1];
            for(ll i=0;i<N-1;i++){
                D[i]='0';
            }
            D[N-1]='1';
            NBitSubtraction(Sum,D,'0',Sum, COUT);
        }    
    }
}


bool isOverflow(char* A, char* B, char* Sum, char COUT, int operation){
    if(operation==0){
        NBitAddition(A,B,'0',Sum,COUT);
		if(A[0]=='1'&&B[0]=='1'&&Sum[0]=='0'){
        	return true;
        }else if(A[0]=='0'&&B[0]=='0'&&Sum[0]=='1'){
            return true;
        }else{
            return false;
    	}
    }else if(operation==1){
    	char C[N+1];
    	TwoSCompliment(B,C);
    	NBitAddition(A,C,'0',Sum,COUT);
        if(A[0]=='1'&&C[0]=='1'&&Sum[0]=='0'){
            return true;
        }else if(A[0]=='0'&&C[0]=='0'&&Sum[0]=='1'){
            return true;
        }else{
            return false;
        }
    }
    return false;
}




int main(){
    cin>>N;
    char a,b,c,sum,bs;
    cin>>a>>b>>c;
    BitAddition(a,b,c,sum,bs);
    cout<<sum<<" "<<bs<<"\n";
    char d[N+1],e[N+1],f[N+1],g[N+1],h[N+1],l[N+1],m[N+1];
    for(ll i=0;i<N;i++){
        cin>>d[i];
    }
    for(ll j=0;j<N;j++){
        cin>>e[j];
    }
    cin>>c;
    NBitAddition(d,e,c,f,bs);
    for(ll k=0;k<N;k++){
        cout<<f[k];
    }
    cout<<" "<<bs<<"\n";
    for(ll i=0;i<N;i++){
        cin>>g[i];
    }
    Inverse(g,h);
    for(ll i=0;i<N;i++){
        cout<<h[i];
    }
    cout<<"\n";
    for(ll i=0;i<N;i++){
        cin>>l[i];
    }
    TwoSCompliment(l,m);
    for(ll i=0;i<N;i++){
        cout<<m[i];
    }
    cout<<"\n";
    char y[N+1],z[N+1],x[N+1];
    char ok='0';
    ll opr;
    for(ll i=0;i<N;i++){
        cin>>y[i];
    }
    for(ll i=0;i<N;i++){
        cin>>z[i];
    }
    cin>>opr;
    if(isOverflow(y,z,x,ok,opr)){
        cout<<'1'<<"\n";
    }else{
        cout<<'0'<<"\n";
    }
    char p[N+1],q[N+1],s[N+1];
    char r,t;
    for(ll i=0;i<N;i++){
        cin>>p[i];
    }
    for(ll i=0;i<N;i++){
        cin>>q[i];
    }
    cin>>r;
    NBitSubtraction(p,q,r,s,t);
    for(ll i=0;i<N;i++){
        cout<<s[i];
    }
    cout<<" "<<t<<"\n";
    
    return 0;
}


pragma circom 2.2.2;

include "circomlib/circuits/switcher.circom";

template Switch() {
    signal input sel;
    signal input L;
    signal input R;
    signal output outL;
    signal output outR;

    signal aux;

    aux <== (R-L)*sel;  
    
    outL <==  aux + L;
    outR <== -aux + R;
}


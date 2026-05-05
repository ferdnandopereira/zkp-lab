pragma circom 2.2.2;

include "circomlib/circuits/comparators.circom";

template Equal() {
    signal input in[2];
    signal output out;

    component isz = IsZero();
    in[1] - in[0] ==> isz.in;
    isz.out ==> out;
}
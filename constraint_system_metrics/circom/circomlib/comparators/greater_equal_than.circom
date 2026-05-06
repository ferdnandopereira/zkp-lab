pragma circom 2.2.2;

include "circomlib/circuits/comparators.circom";

template GreaterEqualThan(n) {
    signal input in[2];
    signal output out;

    component lt = LessThan(n);
    lt.in[0] <== in[1];
    lt.in[1] <== in[0]+1;
    lt.out ==> out;
}
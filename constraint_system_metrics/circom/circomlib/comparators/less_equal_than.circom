pragma circom 2.2.2;

include "circomlib/circuits/comparators.circom";

template LessEqualThan(n) {
    signal input in[2];
    signal output out;

    component lt = LessThan(n);
    lt.in[0] <== in[0];
    lt.in[1] <== in[1]+1;
    lt.out ==> out;
}

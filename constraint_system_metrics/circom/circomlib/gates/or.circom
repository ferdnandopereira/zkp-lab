pragma circom 2.2.2;

include "circomlib/circuits/gates.circom";

template Or() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}
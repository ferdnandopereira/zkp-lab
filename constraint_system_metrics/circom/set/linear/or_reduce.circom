pragma circom 2.2.2;

include "gates/or.circom";

template OrReduce(n) {
    signal input array[n];
    signal output out;

    signal accumulator[n];
    
    accumulator[0] <== array[0];

    component or[n-1];
    for (var i = 1; i < n; i++) {
        or[i-1] = Or();
        or[i-1].a <== accumulator[i-1];
        or[i-1].b <== array[i];
        accumulator[i] <== or[i-1].out;
    }
    out <== accumulator[n-1];
}
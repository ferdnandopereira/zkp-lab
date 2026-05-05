pragma circom 2.2.2;

include "comparators/is_equal.circom";

template MultiEqual(n) {
    signal input in;
    signal input array[n];
    signal output out[n];

    component equals[n];
    for (var i = 0; i < n; i++) {
        equals[i] = Equal();
        equals[i].in[0] <== in;
        equals[i].in[1] <== array[i];
        out[i] <== equals[i].out;
    }
}
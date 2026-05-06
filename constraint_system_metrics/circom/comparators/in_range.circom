pragma circom 2.2.2;

include "utils/nbits.circom";
include "comparators/less_equal_than.circom";
include "comparators/greater_equal_than.circom";

template InRange(min, max) {
    signal input in;
    signal output out;

    var n = numbits(max);

    component isLowerBound = LessEqualThan(n);
    isLowerBound.in[0] <== in;
    isLowerBound.in[1] <== max;

    component isUpperBound = GreaterEqualThan(n);
    isUpperBound.in[0] <== in;
    isUpperBound.in[1] <== min;
    
    out <== isLowerBound.out * isUpperBound.out;
}
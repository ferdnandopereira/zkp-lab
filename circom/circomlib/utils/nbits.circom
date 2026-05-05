pragma circom 2.2.2;

include "circomlib/circuits/binsum.circom";

function numbits(a) {
    var n = 1;
    var r = 0;
    
    while (n-1<a) {
        r++;
        n *= 2;
    }
    return r;
}
pragma circom 2.2.2;

template BinaryCheck(n) {
    signal input array[n];
    signal output out[n];
    
    for (var i = 0; i < n; i++) {
        array[i] * (array[i]-1) === 0;
        out[i] <== array[i];
    }
}
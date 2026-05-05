pragma circom 2.2.2;

include "hash-functions/poseidon.circom";

template Assign() {
    signal input index;
    signal output assignment;

    component hasher = PoseidonHash(1);
    hasher.inputs[0] <== index;
    assignment <== hasher.out;
}

pragma circom 2.2.2;

include "hash-functions/poseidon.circom";

template Commit() {
    signal input secret;
    signal input nullifierSecret;
    signal output commitment;

    component hasher = PoseidonHash(2);
    hasher.inputs[0] <== secret;
    hasher.inputs[1] <== nullifierSecret;
    commitment <== hasher.out;
}
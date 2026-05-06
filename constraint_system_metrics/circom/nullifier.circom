pragma circom 2.2.2;

include "hash_functions/poseidon.circom";

template Nullifier() {
    signal input nullifierSecret;
    signal input salt;
    signal output nullifier;

    component hasher = PoseidonHash(2);
    hasher.inputs[0] <== nullifierSecret;
    hasher.inputs[1] <== salt;
    nullifier <== hasher.out;
}

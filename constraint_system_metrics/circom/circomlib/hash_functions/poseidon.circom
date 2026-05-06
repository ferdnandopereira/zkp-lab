pragma circom 2.2.2;

include "circomlib/circuits/poseidon.circom";

template PoseidonHash(nInputs) {
    signal input inputs[nInputs];
    signal output out;

    component pEx = PoseidonEx(nInputs, 1);
    pEx.initialState <== 0;
    for (var i=0; i<nInputs; i++) {
        pEx.inputs[i] <== inputs[i];
    }
    out <== pEx.out[0];
}


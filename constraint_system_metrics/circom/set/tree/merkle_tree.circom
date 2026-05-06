pragma circom 2.2.2;

include "hash-functions/poseidon.circom";
include "selectors/switcher.circom";

template MerkleTree(depth) {
    signal input commitment;
    signal input siblingNodes[depth];
    signal input nodeSlots[depth];
    signal output rootNode;
    
    signal internalNodes[depth+1];
    
    internalNodes[0] <== commitment;

    component switchers[depth];
    component hashers[depth];
    for (var d = 0; d < depth; d++) {
        switchers[d] = Switch();
        switchers[d].sel <== nodeSlots[d];
        switchers[d].L <== internalNodes[d];
        switchers[d].R <== siblingNodes[d];
        
        hashers[d] = PoseidonHash(2);
        hashers[d].inputs[0] <== switchers[d].outL;
        hashers[d].inputs[1] <== switchers[d].outR;
        internalNodes[d+1] <== hashers[d].out;
    }    
    rootNode <== internalNodes[depth];
}
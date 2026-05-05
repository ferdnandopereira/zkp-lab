pragma circom 2.2.2;

include "commit.circom";
include "nullifier.circom";
include "assign.circom";
include "comparators/in_range.circom";
include "gates/binary_check.circom";
include "set/tree/merkle_tree.circom";

template AnonymousCredential(depth, min, max) {
    assert(depth > 0);
    assert(min <= max);

    signal input secret;
    signal input nullifierSecret;
    signal input nullifierSalt;
    signal input nullifier;
    signal input siblingNodes[depth];
    signal input nodeSlots[depth];
    signal input merkleRoot;
    signal input index;
    signal output assignment;
    
    component seed = Commit();
    seed.secret <== secret;
    seed.nullifierSecret <== nullifierSecret;

    component isInRange = InRange(min, max);
    isInRange.in <== index;

    component binCheck = BinaryCheck(depth);
    binCheck.array <== nodeSlots;

    component ticket = Nullifier();
    ticket.nullifierSecret <== nullifierSecret;
    ticket.salt <== nullifierSalt;
    
    component tree = MerkleTree(depth);
    tree.commitment <== seed.commitment;
    tree.nodeSlots <== binCheck.out;
    tree.siblingNodes <== siblingNodes;

    isInRange.out === 1;
    ticket.nullifier === nullifier;
    tree.rootNode === merkleRoot;

    component entry = Assign();
    entry.index <== index;
    assignment <== entry.assignment;
}

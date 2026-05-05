pragma circom 2.2.2;

include "commit.circom";
include "nullifier.circom";
include "assign.circom";
include "comparators/in_range.circom";
include "set/linear/multi_equal.circom";
include "set/linear/or_reduce.circom";

template AnonymousCredential(n, min, max) {
    assert(n > 0);
    assert(min <= max);

    signal input secret;
    signal input nullifierSecret;
    signal input nullifierSalt; 
    signal input nullifier;
    signal input identities[n]; 
    signal input index; 
    signal output assignment;

    component seed = Commit();
    seed.secret <== secret;
    seed.nullifierSecret <== nullifierSecret;

    component isInRange = InRange(min, max);
    isInRange.in <== index;

    component ticket = Nullifier();
    ticket.nullifierSecret <== nullifierSecret;
    ticket.salt <== nullifierSalt;

    component isEqual = MultiEqual(n);
    isEqual.in <== seed.commitment;
    isEqual.array <== identities;

    component or = OrReduce(n);
    or.array <== isEqual.out;
    
    isInRange.out === 1;
    or.out === 1;
    ticket.nullifier === nullifier;
    
    component entry = Assign();
    entry.index <== index;
    assignment <== entry.assignment;
}

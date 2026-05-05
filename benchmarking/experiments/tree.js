export const tree = {
    name: 'tree',
    circuit: 'circom/set/tree/anonymous_credential.circom',
    inputs: [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024],
    
    parameter(n) {    
        const depth = Math.log2(n);
        if (depth % 1 !== 0) {
            throw new Error(
                `invalid input: n=${n} must be a power of 2 for merkle tree construction`
            ); 
        }
        return [depth, 1, 5];
    },
    
    metrics({ n, r1cs }) {
        const constraints = r1cs.constraints.length;
        const nvars = r1cs.nVars;
        return {
            n,
            constraints,
            nvars,
            density: constraints / nvars,
            perElement: constraints / n,
        };
    }
};

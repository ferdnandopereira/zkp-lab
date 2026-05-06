export const linear = {
    name: 'linear',
    circuit: 'circom/set/linear/anonymous_credential.circom',
    inputs: [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024],

    parameter(n) {
        return [n, 1, 5];
    },

    metrics({ n, r1cs }) {
        const constraints = r1cs.constraints.length;
        const nvars = r1cs.nVars;
        return {
            n,
            constraints,
            nvars,
            density: constraints / nvars,
            perElement: constraints / n
        };
    }
};
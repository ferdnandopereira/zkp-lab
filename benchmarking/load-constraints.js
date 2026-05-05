export async function loadConstraints(tester) {
    try {
        await tester.loadConstraints();
        return {
            constraints: tester.constraints,
            nVars: tester.nVars
        };
    } catch (e) {
        throw new Error(
            'failed to load constraints', {cause: e}
        );
    }
}
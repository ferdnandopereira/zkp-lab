import wasm_tester from "circom_tester/wasm/tester.js";

export async function buildTester(filePath, options)  {
    try {
        return await wasm_tester(filePath, {
            wasm: options.wasm, 
            templateName: options.templateName,
            templateParams: options.templateParams,
            O: options.O,
            verbose: options.verbose,
            inspect: options.inspect,
            include: options.include
        });        
    } catch (e) {
        throw new Error('failed to build tester', {cause: e});
    }
}
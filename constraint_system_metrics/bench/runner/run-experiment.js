import path from 'path';
import { buildTester } from '../build-tester.js';
import { loadConstraints } from '../load-constraints.js';
import { Console } from '../utils/Console.js';


export async function runExperiment(experiment) {
    
    for (const n of experiment.inputs) {

        const params = experiment.parameter(n);
        
        const tester = await buildTester(path.join(process.cwd(), experiment.circuit), {
            wasm: true,
            templateName: 'AnonymousCredential',
            templateParams: params,
            O: 0,
            verbose: false,
            inspect: false,
            include: [
                path.join(process.cwd(), 'node_modules'),
                path.join(process.cwd(), 'circom', 'circomlib'),
                path.join(process.cwd(), 'circom')
            ]
        });
        
        const r1cs = await loadConstraints(tester);

        const metrics = experiment.metrics({ n, r1cs });
        
        Console.log('metrics', {
            experiment: experiment.name,
            scaleFactor: metrics.n,
            structural: {
                constraints: metrics.constraints,
                nvars: metrics.nvars
            }, 
            relational: { 
                constraintDensity: metrics.density,
                constraintsPerElement: metrics.perElement
            }
        });
    };
}
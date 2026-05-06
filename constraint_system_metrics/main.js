import { runExperiment } from './bench/runner/run-experiment.js';
import { tree } from './bench/experiments/tree.js';
import { linear } from './bench/experiments/linear.js';

async function main() {
    await runExperiment(tree);
    await runExperiment(linear)
}
  
main().catch((e) => {
    console.error('execution failed:', e);
})
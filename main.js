import { runExperiment } from './benchmarking/runner/runExperiment.js';
import { tree } from './benchmarking/experiments/tree.js';
import { linear } from './benchmarking/experiments/linear.js';

async function main() {
    await runExperiment(tree);
    await runExperiment(linear)
}
  
main().catch((e) => {
    console.error('execution failed:', e);
})
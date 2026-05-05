export const Console = {
    log: (...args) => {
        console.log(...args);
    },
    error: (...args) => {
        console.error(...args);
    },
    emptyLine: (count = 1) => {
        for (let i = 0; i < count; i++) {
            console.log();
        }
    }
}; 
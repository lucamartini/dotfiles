const fs = require('fs');
const process = require('process');
const readline = require('readline');
const { exec } = require("child_process");

const cwd = process.cwd();

async function processLineByLine() {
  const fileStream = fs.createReadStream('./cloneRepos.txt');

  const rl = readline.createInterface({
    input: fileStream,
    crlfDelay: Infinity
  });

  for await (const line of rl) {
    exec(line, (error, stdout, stderr) => {
      if (error) {
          console.log(`${projectDir} error: ${error.message}`);
          return;
      }
      if (stderr) {
          console.log(`stderr: ${stderr}`);
          return;
      }
    });
  }
}

processLineByLine();
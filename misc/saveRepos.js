const fs = require('fs');
const process = require('process');
const readline = require('readline');
const { exec } = require("child_process");

const cwd = process.cwd();
const cloneRepo = 'cloneRepo.sh';
try {
  fs.unlinkSync(cloneRepo)
} catch (err) {}

async function processLineByLine() {
  const fileStream = fs.createReadStream('./nwg.code-workspace');

  const rl = readline.createInterface({
    input: fileStream,
    crlfDelay: Infinity
  });

  for await (const line of rl) {
    if (line.includes('"path"')) {
      const split = line.split('"');
      const projectDir = split[3];
      process.chdir(cwd);
      process.chdir(projectDir);
      exec('git config --get remote.origin.url', (error, stdout, stderr) => {
        if (error) {
            console.log(`${projectDir} error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.log(`stderr: ${stderr}`);
            return;
        }
        process.chdir(cwd);
        fs.appendFileSync(cloneRepo, `git clone ${stdout.slice(0, -1)} ${projectDir}\n`);
      });
    }
  }
}

processLineByLine();
import subprocess
from pathlib import Path

home = Path.home()
Brewfile = open(home / ".Brewfile", "r")

cmd_str = "HOMEBREW_NO_AUTO_UPDATE=1 brew bundle dump --file=-"
dump = subprocess.run(cmd_str, shell=True, capture_output=True)
lineIterator = iter(dump.stdout.splitlines())

missingBrews = []
for l in lineIterator:
    line=l.decode() # b"" -> ""
    found = False
    for brew in Brewfile:
        brewLine = brew[:-1] # \n
        if (line == brewLine):
            found = True
            break
    Brewfile.seek(0)
    if (not found):
        missingBrews.append(line)
Brewfile.close()

for l in missingBrews:
    print(l)

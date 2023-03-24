"""Module printing missing bundles from the global .Brewfile"""
import subprocess
from pathlib import Path


def main():
    """the main function to print the missing bundles
    from the global .Brewfile"""
    home = Path.home()
    brew_file = open(home / ".Brewfile", "r", encoding="UTF-8")

    current_brews_command = (
        "HOMEBREW_NO_AUTO_UPDATE=1 brew bundle dump --file=-"
    )
    dump = subprocess.run(
        current_brews_command,
        shell=True,
        capture_output=True,
        check=True,
    )
    line_iterator = iter(dump.stdout.splitlines())

    missing_brews = []
    for the_line in line_iterator:
        line = the_line.decode()  # b"" -> ""
        found = False
        for brew in brew_file:
            brew_line = brew[:-1]  # \n
            if line == brew_line:
                found = True
                break
        brew_file.seek(0)
        if not found:
            missing_brews.append(line)
    brew_file.close()

    for the_line in missing_brews:
        print(the_line)


if __name__ == "__main__":
    main()

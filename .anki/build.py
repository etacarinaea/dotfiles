#!/bin/python
import sys
from pathlib import Path
from shutil import copy, rmtree

buildPath = Path("./build")
if len(sys.argv) > 1 and sys.argv[1] == "clean" and buildPath.is_dir():
    print("Removing", str(buildPath))
    rmtree(buildPath)
    sys.exit()

buildPath.mkdir(exist_ok=True)
markedjs = Path("./cards/markedjs").open("r").read()
style = Path("./cards/style.css")
cards = Path("./cards")
for folder in cards.iterdir():
    if folder.is_dir():
        subfolder = buildPath / folder.relative_to(cards)
        subfolder.mkdir(exist_ok=True)
        copy(str(style), str(subfolder))
        for original in folder.iterdir():
            dest = buildPath / original.relative_to(cards)
            copy(str(original), str(dest))
            if original.suffix == ".html":
                with dest.open("a") as f:
                    f.write(markedjs)

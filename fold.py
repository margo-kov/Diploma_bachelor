#!/usr/bin/env python3

import pathlib
import os
import sys
import argparse
from typing import List


def fold(
    line: str,
    size: int = 120,
    breaks: List[str] = ["\t", " ", "\n"],
    comment: List[str] = ["\\", "%"],
    nocomment=False,
) -> str:
    if not line.lstrip() or line.lstrip()[0] in comment:
        return line

    if nocomment:
        comment = []

    acc = ""
    rv = []
    time_for_break = False
    for c in line:
        acc += c
        if len(acc) >= size:
            if c in breaks:
                rv.append(acc)
                acc = ""

    if acc:
        rv.append(acc)
    return "\n".join(rv)


def main(args: List[str]) -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("-w", "--size", type=int, default=120, help="Line length")
    parser.add_argument(
        "-nc", action="store_true", help="Whether to ignore all comments or commands"
    )
    parser.add_argument("input", help="Input file", default=sys.stdin)
    args = parser.parse_args(args)

    with open(args.input, "r") as fin:
        for line in fin:
            print(fold(line, size=args.size, nocomment=args.nc), end="")


if __name__ == "__main__":
    main(sys.argv[1:])

#!/bin/sh

git submodule foreach '
  b=$(git config -f "$toplevel/.gitmodules" submodule.$name.branch || echo main);
  git fetch origin "$b";
  git checkout -B "$b" --track "origin/$b" || git checkout "$b";
'

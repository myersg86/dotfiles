#!/bin/bash
set -ex
git init &&
git add --a &&
git commit -m "$1" &&
git push origin master

#!/bin/bash

git reset --hard $(git log --grep="initial commit" --format=%H -n 1)

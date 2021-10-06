#!/bin/bash

branch_name="b_"$RANDOM
git checkout -b $branch_name
git add *
git commit -m $branch_name
git push --set-upstream origin $branch_name

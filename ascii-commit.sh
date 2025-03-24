#!/bin/bash

pattern_file="pic.txt"

if [ ! -d ".git" ]; then
    echo "Not a git repository"
    exit 1
fi

if [ ! -f "$pattern_file" ]; then
    echo "Pattern file not found"
    exit 1
fi

start_date=$(date -d "last sunday -51 weeks" +%Y-%m-%d)

mapfile -t lines < "$pattern_file"

echo "Rendering commit pattern:"
for line in "${lines[@]}"; do
    echo "$line" | sed 's/#/█/g; s/ / /g'
done
echo "Commits will be applied now..."

for row in {0..6}; do
  for col in {0..51}; do
    char="${lines[$row]:$col:1}"
    if [ "$char" == "#" ]; then
      commit_date=$(date -d "$start_date +$col weeks +$row days" +%Y-%m-%d)
      commit_density=10
      for i in $(seq 1 $commit_density); do
        echo "$commit_date - commit $i" > fake.txt
        git add fake.txt
        GIT_AUTHOR_DATE="$commit_date 12:00:00" \
        GIT_COMMITTER_DATE="$commit_date 12:00:00" \
        git commit -m "Fake commit on $commit_date"
      done
    fi
  done
done

rm fake.txt
echo "Done"
 

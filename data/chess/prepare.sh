#!/bin/bash
# fetch a small amount of training data from lichess and clean it up

# !apt install zstd
curl -r 0-100000000 https://database.lichess.org/standard/lichess_db_standard_rated_2023-03.pgn.zst --output raw.pgn.zst
unzstd raw.pgn.zst --stdout > all.txt
# !cat all.txt | sed '$ d' | grep -E "^1. " | sed 's/{[^}]*}//g' | sed -r 's/[0-9]+[.]+ //g' | sed 's/  / /g' > input.txt
cat all.txt | sed '$ d' | grep -E "^1. " | sed 's/{[^}]*}//g' | sed -r 's/[0-9]+[.][.][.] //g' | sed 's/  / /g' > input.txt
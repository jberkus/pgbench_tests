
pgbench -s 100 -T 900 -c 16 -j 4 -P -r \
 -f update.bench@1 -f read_branch.bench@3 -f read_account.bench@6 benchdb

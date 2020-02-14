This set of pgbench scripts is designed to do a more realistic "web" workload, one where single-row reads are 90% of traffic.  As such, we have two bench scripts that do single-row reads, one against Accounts and one against Branches.  It preserves the standard update transaction of the TPCB base.

An example of how to use it would be:

```
pgbench -s 100 -T 900 -c 16 -j 4 -P 30 -r \
 -f update.bench@1 -f read_branch.bench@3 -f read_account.bench@6 benchdb
```

If you want something closer to the 70/30 transaction split that gets used in a lot of storage benchmarks, it would be:

```
pgbench -s 100 -T 900 -c 16 -j 4 -P 30 -r \
 -f update.bench@3 -f read_branch.bench@2 -f read_account.bench@5 benchdb
```

This is a 70/30 *statement* split, since the update transaction has 3 update statements in it:

```
pgbench -s 100 -T 900 -c 16 -j 4 -P 30 -r \
 -f update.bench@1 -f read_branch.bench@2 -f read_account.bench@5 benchdb
```

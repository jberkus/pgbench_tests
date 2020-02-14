This script set is for running a more "mixed workload," but still based on the four-table TPCB base.  It includes both read-only transactions that read a single account or single branch line, as well as two reports:

* branch_report: imitates a financial reconciliation report, "comparing" bbalance, abalance and tbalance numbers.
* history_report: summarizes transaction history for the last minute of activity, with random filters.

Note that both of these "report" queries can be expected to get slower as the database grows, particularly the history report.  For that reason, it is critical that you either re-initialize between runs, or track the number of runs in a row you have.

I also recommend initializing the database with foreign keys for this workload.

Before running this workload, you need to do two extra steps.

1. You need to run a regular pgbench for 30 seconds in order to create the pgbench_history table.
2. You need to create the indexes in the indexes.sql file:

```
pgbench -T 30 -c 1 benchdb
psql -f indexes.sql benchdb
```

Then you can run the workload, for example:

```
pgbench -s 100 -T 900 -c 16 -j 4 -P 30 -r \
 -f update.bench@1 -f read_branch.bench@2 -f read_account.bench@5 \
 -f branch_report.bench@1 -f history_report.bench@1 benchdb
```

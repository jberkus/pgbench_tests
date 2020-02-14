CREATE INDEX IF NOT EXISTS pgbench_teller_bid on pgbench_tellers(bid);
CREATE INDEX IF NOT EXISTS pgbench_account_bid on pgbench_accounts(bid);
CREATE INDEX IF NOT EXISTS pgbench_history_bid on pgbench_history(bid);
CREATE INDEX IF NOT EXISTS pgbench_history_tid on pgbench_history(tid);

# Post-show timing report

Server prompt: `post_show_timing_report` (optional `rundown_id`). Timing reports need the Studio plan.

```text
Write a post-show timing report for my last show in runofsho.
1. Find it with list_events (ask me if unsure) and call get_timing_report. If it has service times, also compare services.
2. Report: rows on time, over and under; total drift; how late the show ended; the three biggest overruns; rows that did not run.
3. Look for patterns, then suggest the length to plan next time for each row that ran long.
4. If I want the changes, duplicate the rundown first and preview them with edit_rows. Apply nothing until I confirm.
Keep it short enough to paste into a debrief email.
```

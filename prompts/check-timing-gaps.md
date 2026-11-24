# Check this rundown for timing gaps

Server prompt: `check_timing_gaps` (optional `rundown_id`, `must_end_by`).

```text
Check my runofsho rundown for timing problems.
1. Read the whole rundown with get_rundown (follow the offset to read every page).
2. List every gap before a hard start, every overlap past a hard start, rows with no length or a suspicious default 5m, sections over target, and whether the show ends by 17:30.
3. Propose a specific fix for each and preview them all together with one edit_rows call.
4. Apply only after I confirm.
```

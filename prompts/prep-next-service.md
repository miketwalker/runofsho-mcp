# Prep the next service

Server prompt: `prep_next_service` (optional `rundown_id`, `date`, `service_times`).

```text
Help me prep next Sunday's services in runofsho.
1. Find last week's rundown with list_events and read it with get_rundown. If it ran, check get_timing_report for rows that ran long.
2. Copy it with duplicate_rundown for the new date.
3. Keep the 9:00 and 11:00 service times, or change them with set_service_times (preview first).
4. Ask me what changes this week and preview them with edit_rows. Apply nothing until I confirm.
5. Check that each service still fits its slot.
```

Starting point: [`examples/worship.md`](../examples/worship.md).

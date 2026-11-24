# Conference morning session

A conference main stage from doors at 08:30 to lunch at 12:30, in one room. It has one deliberate 10-minute gap before the 11:00 lightning talks, so the timing check has something to find.

Create the event with `create_event` starting at 08:30, then import: pass the table below to `import_rundown` as `rows` (works on every plan, including Free with its 10 rows per rundown), or paste [`conference.csv`](conference.csv) as `content` with `mapping: {"Hard start": "start"}` (spreadsheet import needs Pro or higher). Rows with a hard start begin at that fixed time; the rest follow from the lengths above them.

| # | Title | Duration | Speaker | Notes | Hard start |
|---|---|---|---|---|---|
| 1 | Doors and walk-in | 30m |  | Walk-in playlist. Holding slide and sponsor loop. | 08:30 |
| 2 | Welcome and housekeeping | 5m | Host | Exits, Wi-Fi, schedule, app. | 09:00 |
| 3 | Opening keynote | 35m | Keynote speaker | Confidence monitor: slides and timer. Amber 2:00, red 0:30. |  |
| 4 | Keynote Q&A | 10m | Keynote speaker, Host | Can drop to 5:00 if over. |  |
| 5 | Panel discussion | 40m | Moderator and 3 panelists | Four chairs and a low table. Lav 5 to 8. |  |
| 6 | Coffee break | 20m |  | Back in seats at 11:00. Sponsor loop with countdown. |  |
| 7 | Lightning talks | 25m | Speakers A, B and C | Three talks of 7 minutes, 2 minutes changeover. | 11:00 |
| 8 | Closing keynote | 45m | Closing speaker |  |  |
| 9 | Thanks, prize draw and close | 20m | Host | Thank sponsors and crew, prize draw, lunch directions. |  |
| 10 | Lunch | 1h |  | Room turns over for the afternoon. | 12:30 |

After importing, ask the assistant to "check this rundown for timing gaps".

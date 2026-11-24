# Sunday worship service

A 70-minute Sunday service. Duplicate it and use set_service_times for the 9:00 and 11:00 services.

Create the event with `create_event` starting at 09:00, then import: pass the table below to `import_rundown` as `rows` (works on every plan, including Free with its 10 rows per rundown), or paste [`worship.csv`](worship.csv) as `content` with `mapping: {"Hard start": "start"}` (spreadsheet import needs Pro or higher). Rows with a hard start begin at that fixed time; the rest follow from the lengths above them.

| # | Title | Duration | Speaker | Notes | Hard start |
|---|---|---|---|---|---|
| 1 | Pre-service countdown | 5m |  | Countdown video on all screens. |  |
| 2 | Welcome and call to worship | 3m | Host pastor |  |  |
| 3 | Worship set (3 songs) | 15m | Worship team | Lyrics on main screens, chord charts on stage display. |  |
| 4 | Announcements | 4m | Host pastor | Slides: youth retreat and volunteer sign-up. |  |
| 5 | Offering | 4m |  | Offering song under the prayer. |  |
| 6 | Scripture reading | 2m | Reader | Scripture on screen, reader on HH2. |  |
| 7 | Sermon | 30m | Lead pastor | Confidence monitor: notes and timer. Amber 5:00. |  |
| 8 | Response song | 5m | Worship team |  |  |
| 9 | Benediction and dismissal | 2m | Lead pastor | Walk-out playlist after the amen. |  |

After importing, ask the assistant to "check this rundown for timing gaps".

# Live broadcast half hour

A 30-minute live show from 19:00 with commercial breaks and a hard off-air time of 19:30.

Create the event with `create_event` starting at 18:58, then import: pass the table below to `import_rundown` as `rows` (works on every plan, including Free with its 10 rows per rundown), or paste [`broadcast.csv`](broadcast.csv) as `content` with `mapping: {"Hard start": "start"}` (spreadsheet import needs Pro or higher). Rows with a hard start begin at that fixed time; the rest follow from the lengths above them.

| # | Title | Duration | Speaker | Notes | Hard start |
|---|---|---|---|---|---|
| 1 | Pre-show countdown | 2m |  | Countdown clock on program. Talent in positions at 1:00. | 18:58 |
| 2 | Cold open | 1m30s | Anchor | Teaser VT under VO. | 19:00 |
| 3 | Titles | 30s |  | Title sequence with stinger. |  |
| 4 | Top story | 6m | Anchor and reporter | Live hit from the field. Backup VT ready. |  |
| 5 | Interview | 6m30s | Anchor and guest | Two-shot then singles. Lower thirds on guest. |  |
| 6 | Commercial break 1 | 3m |  | Hard return. |  |
| 7 | Feature package | 5m30s |  | Roll VT3. Anchor tag after. |  |
| 8 | Weather | 3m | Meteorologist | Chroma wall. |  |
| 9 | Commercial break 2 | 2m |  |  |  |
| 10 | Close and credits | 2m | Anchor | Off air at 19:30:00. | 19:28 |

After importing, ask the assistant to "check this rundown for timing gaps".

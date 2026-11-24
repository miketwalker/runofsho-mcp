# Webinar (1 hour)

A one-presenter webinar from 14:00 with a demo, two polls and Q&A.

Create the event with `create_event` starting at 13:55, then import: pass the table below to `import_rundown` as `rows` (works on every plan, including Free with its 10 rows per rundown), or paste [`webinar.csv`](webinar.csv) as `content` with `mapping: {"Hard start": "start"}` (spreadsheet import needs Pro or higher). Rows with a hard start begin at that fixed time; the rest follow from the lengths above them.

| # | Title | Duration | Speaker | Notes | Hard start |
|---|---|---|---|---|---|
| 1 | Lobby and holding slide | 5m |  | Music bed. Chat open. Producer posts housekeeping in chat. | 13:55 |
| 2 | Welcome and agenda | 3m | Host | Poll 1: where are you joining from. | 14:00 |
| 3 | Presentation part 1 | 15m | Presenter | Screen share. Producer watches the Q&A queue. |  |
| 4 | Live demo | 10m | Presenter | Backup recording ready if the demo fails. |  |
| 5 | Presentation part 2 | 10m | Presenter |  |  |
| 6 | Poll 2 | 2m | Host | Launch poll; read the results aloud. |  |
| 7 | Audience Q&A | 12m | Host, Presenter | Host picks questions from the queue. |  |
| 8 | Wrap-up and next steps | 3m | Host | Survey link in chat, recording follow-up. |  |

After importing, ask the assistant to "check this rundown for timing gaps".

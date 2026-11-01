# Self-study notes and checkpoints

Use the [start guide](00_START_HERE.md) and full Word handouts for explanations.
Run PowerShell commands one at a time; stop on errors rather than treating a
later command as proof the earlier one passed.

## Before starting

Extract the ZIP. Replace the path below with your actual extracted pack:

```powershell
Set-Location -LiteralPath "C:\YOUR-ATTENDEE-PACK"
Get-Location
Test-Path ".\Labs\LbsDocumentTracker\SampleData\cases.json"
dotnet --list-sdks
```

Expect `True` and a .NET 10 SDK for local developer exercises. Portal/CSV-only
participants do not need .NET. Run `code --version`, `az version` and
`func --version` only when your route requires those tools.

Open [the assigned-resource sheet](04_ASSIGNED_RESOURCES.csv). Placeholders are
not working resource names. Confirm your approved account, target and permissions.
Reader visibility alone is not SQL, Blob, query or messaging data access.

## Day 1 - separate components

1. **Orientation:** use [Day 1 order](<Day 1/00_DAY_1_ORDER.docx>) and the first
   two parts of the Function handout. Select the assigned tenant/subscription.
2. **SQL:** use the [SQL handout](<Day 1/Basic_Lab_01_Azure_SQL_Portal_And_VS_Code.docx>)
   and [scripts](Labs/PortalAndVsCodeBasics/Samples/Sql). Run the connection query
   in portal and Microsoft MSSQL in VS Code. Expect the assigned database, not
   `master`. On a read-only route, use only the table/columns approved by the owner.
   `VsCodeItems_assigned` is a placeholder. On an approved write route, replace
   `VsCodeItems_ab01` everywhere with your unique table name before using scripts
   02 and 03. Compare rows/schema from fresh executions in both clients.
3. **Blob:** follow [the Blob handout](<Day 1/Basic_Lab_02_Blob_Storage_Portal_And_VS_Code.docx>).
   Use the [two text samples](Labs/PortalAndVsCodeBasics/Samples/Storage) and your
   private assigned container. Complete portal-to-terminal and terminal-to-portal
   transfer checks. Compare each original/download SHA256 pair using
   `Get-FileHash -Algorithm SHA256`. Matching names alone do not prove content.
4. **Function:** follow [the core Function steps](Labs/VsCodePublishBasics/README.md).
   Expect the exact four-field fictional JSON. Local success does not prove cloud
   publishing or cloud-key enforcement. The shared cloud route is test-only.
5. **Logs:** follow [the Logs handout](<Day 1/Basic_Lab_03_Log_Analytics_Portal_And_VS_Code.docx>).
   Use the same query and Workspace ID in portal and terminal. Run from
   `Labs\PortalAndVsCodeBasics`:

```powershell
.\Samples\Logs\Invoke-LabQuery.ps1 -WorkspaceId "YOUR-WORKSPACE-ID"
```

Expected: exactly three rows ordered by reference, with `Completed`,
`Needs review`, `Received` respectively. These are synthetic rows, not collected
Function telemetry. Workspace ID is the workspace GUID, not Subscription ID.

## Day 2 - cost and operations

Follow [Day 2 order](<Day 2/00_DAY_2_ORDER.docx>), not the file numbering.

1. **Cost, 10:00:** [cost handout](<Day 2/06_Cost_Management_Portal_Lab.docx>).
   Compare equal seven-day periods, group by service and explain a change, an
   optimisation and its risk. Use [fictional costs](Labs/Day2Operations/fictional-costs.csv)
   when live billing is unavailable. These are invented GBP values, not Azure
   pricing. Budget design is required; creating a real budget is not.
2. **Application Insights, 11:30:** [telemetry handout](<Day 2/02_Application_Insights_Portal_Lab.docx>).
   Record scope/time/source; inspect requests, failures and dependencies only in
   an authorised, instrumented app. Otherwise label your work prepared/offline.
3. **KQL, 13:30:** [KQL handout](<Day 2/03_KQL_Beginner_Hands_On.docx>).
   Choose one query mode in [Day2Operations](Labs/Day2Operations/README.md).
   Run files 01, 02 and 03 separately. Prepared data: five requests, two failures
   and two dependencies over 1000 ms. Include 28 October 2026 10:00-10:05 UTC in
   the time window. Live counts vary; offline CSV review is not query execution.
4. **Service Bus, 15:00:** [queue handout](<Day 2/01_Service_Bus_Portal_Lab.docx>).
   Use an assigned isolated queue with no competing consumer. Send one fictional
   message, note its MessageId, peek, then receive/settle only your own message.
   Sending is not proof of completed business processing.
5. **Local tracker, 15:35:** [tracker handout](<Day 2/LBS_Document_Tracker_Setup_And_Testing.docx>).
   From the pack root, run the checks:

```powershell
dotnet run --project ".\Labs\LbsDocumentTracker\Checks\LbsDocumentTracker.Checks.csproj" -- "$PWD\Labs\LbsDocumentTracker\SampleData"
```

Expect 20 PASS lines and exit code 0. Check `$LASTEXITCODE` immediately afterward.
The checks cover the ten samples plus boundary/worker behaviour; they do not
connect to Azure. Then start the website:

```powershell
Set-Location ".\Labs\LbsDocumentTracker"
$env:ASPNETCORE_ENVIRONMENT = 'Development'
$env:DOTNET_ENVIRONMENT = 'Development'
dotnet run --urls "http://127.0.0.1:5193"
```

Open `http://127.0.0.1:5193`. Upload each `.txt` using the matching form reference
from [cases.json](Labs/LbsDocumentTracker/SampleData/cases.json).
Samples 01, 05 and 06 should be Completed; the other seven should be Needs review.
Use text files only, maximum 32 KiB. From another terminal:

```powershell
curl.exe --noproxy "*" --fail http://127.0.0.1:5193/healthz
curl.exe --noproxy "*" --fail http://127.0.0.1:5193/readyz
```

Expect `{"status":"ok"}` and `{"status":"ready","mode":"local-memory"}`.
The app has no sign-in; keep it on loopback. Restarting clears all records.
Press Ctrl+C in its terminal when finished.

6. **Incident, 16:20:** [team exercise](<Day 2/04_Incident_And_Cost_Team_Exercise.docx>).
   Solo study: write the same investigation as a short individual report.
   Identify an observation, a hypothesis and the next safe read-only check.
   Correlation alone is not proof of root cause. Do not inject a live fault.

## Troubleshooting and completion

| Symptom | Action |
| --- | --- |
| Missing file | Extract the whole pack; check your current folder and path |
| `net10.0` unsupported | Install the approved .NET 10 SDK, not just runtime |
| NuGet restore denied | Keep the exact error; ask IT about approved feed/proxy/certificates |
| Local Function storage error | Start Azurite; copy the example settings only if no local settings exist |
| Port occupied | Use another approved loopback port consistently; do not kill another person's process |
| Azure denied/empty results | Verify tenant, scope, network and data access with the owner |
| No live telemetry/cost access | Use labelled prepared/offline data; keep live step Blocked |

Do not disable TLS, widen firewalls/roles, publish over a shared Function or
delete shared resources to make a checkpoint pass. Record your own evidence in
[the checklist](03_MY_LAB_EVIDENCE.csv). Never include secrets or real data.

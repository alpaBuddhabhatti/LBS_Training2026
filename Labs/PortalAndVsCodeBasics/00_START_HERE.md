# Individual component exercises

The supplied [SQL scripts](Samples/Sql) include comments explaining connection
checks, repeat runs, batch boundaries and row-scoped updates.
The [KQL query](Samples/Logs/01-fictional-status.kql) and
[PowerShell runner](Samples/Logs/Invoke-LabQuery.ps1) explain synthetic data,
CLI authentication and exact result checks. Keep the query and its companion
request JSON in sync when editing, including comments. Blob commands are
explained in the [Storage guide](02_Blob_Storage_Portal_And_VS_Code.md);
the sample text files are data, not executable scripts.

Use the [illustrated Day 1 quick reference](<../../Day 1/Day_1_Illustrated_Quick_Reference.md>)
alongside the full Markdown handouts. It includes tested commands, diagrams,
expected results, troubleshooting and the final evidence checklist.

Start with [Day 1 order](../../Day%201/00_DAY_1_ORDER.md), then the
[detailed learning route](../../Day%201/Basic_Lab_00_START_HERE.md).

Use the full Markdown handouts in `Day 1`; this folder contains their executable
samples, not a second or competing timetable.

1. Orientation: [Function guide](../../Day%201/Basic_Lab_VS_Code_Azure_Function_And_Dummy_Tracker.md), Parts 1-2 only.
2. [SQL](../../Day%201/Basic_Lab_01_Azure_SQL_Portal_And_VS_Code.md).
3. [Blob Storage](../../Day%201/Basic_Lab_02_Blob_Storage_Portal_And_VS_Code.md).
4. Function guide, Part 3 for local execution, Part 5 for approved cloud testing and Part 8 for evidence/cleanup. No publishing on the core route.
5. [Logs/KQL](../../Day%201/Basic_Lab_03_Log_Analytics_Portal_And_VS_Code.md).
The optional dummy UI is not supplied. Use the separate Day 2 tracker guide for local upload practice.

Open the relevant project folder in VS Code before running its commands.
Use fictional data, approved targets and your assigned table/container suffix.
Do not treat an unexecuted check as passed. Ask the instructor about blocked
access; do not broaden network rules or permissions yourself.

For remaining services and the realistic local scenario, follow
[Day 2 order](../../Day%202/00_DAY_2_ORDER.md).


---

## Day 1 tested walkthrough - attendee support

Updated 28 October 2026.

### 1. Follow the course route; these are separate exercises

![day1 route](<../../Day 1/Diagrams/day1-route.png>)

Use fictional training data only. Orientation, SQL, Blob Storage, the HTTP Function and Logs/KQL are independent checkpoints. They do not form a connected document-processing application. The Day 2 tracker is local-only.

### Find the correct folder without losing your chat

Use the supplied attendee-pack location, not a path copied from the instructor's laptop. SQL, Blob and Logs use Labs\PortalAndVsCodeBasics; the Function uses Labs\VsCodePublishBasics\HelloAzureFunction. Quote paths containing spaces. In an existing terminal, Set-Location changes the terminal folder only. It does not change Explorer's workspace.

```powershell
Set-Location "C:\YOUR-ATTENDEE-PACK\Labs\PortalAndVsCodeBasics"
Get-Location
Test-Path .\Samples\Logs\01-fictional-status.kql
```

Replace C:\YOUR-ATTENDEE-PACK before running. Test-Path should be True. File > Open Folder may change the window's workspace; code --new-window opens another window and the earlier chat may remain in the original one. Use chat history or the original window to return; do not repeat completed cloud changes just because a new conversation appeared.

### Sign-in and permissions are separate

Portal sign-in, VS Code Azure Resources, MSSQL and Azure CLI have separate sign-in contexts. Confirm the approved tenant, subscription and target. Azure Reader shows resources but does not automatically grant SQL queries, Blob transfers, Function key access or publishing rights.

```powershell
az account show --query "{name:name,id:id,tenant:tenantId}" -o table
```

If CLI sign-in is missing, use az login with your approved account. Do not paste tokens, passwords, keys, connection strings or key-bearing URLs into chat or evidence. Never broaden network or role permissions to work around an unexplained error.

### 6. Finish safely and record your own evidence

Record Passed, Blocked or Not run separately for each item: resource discovery; SQL portal/MSSQL connection and reads; approved own-table writes and portal recheck, if assigned; Blob transfer and hashes in both directions; local Function build/invocation; approved cloud keyed response and keyless rejection; portal/terminal KQL match. Record publishing as Not run on the core route.

Capture the target, time, command and expected/actual non-secret output. An instructor screenshot is an example, not your pass. SQL rows and schema do not prove which tool wrote them. A green deployment is not an invocation. A reported key rotation is not independent proof the exposed key was invalidated.

Record your own results. Prior instructor rehearsal results do not count as your evidence.

Stop your own local Function with Ctrl+C. Close Azurite only if you started it and no other work needs it. Disconnect the SQL client and sign out on shared machines. Local shutdown does not stop cloud billing. Do not delete shared resources or restore network/role changes without owner approval; temporary permission cleanup requires checking dependencies and verifying the narrower approved access first.

Day 1 is complete when required checks have your evidence or explicit approved exceptions. Record blocked steps honestly before continuing to Day 2.

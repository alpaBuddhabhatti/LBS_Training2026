# Core exercise - standalone HTTP Function

Use [Day 1 order](<../../Day 1/00_DAY_1_ORDER.docx>) and the
[Function handout](<../../Day 1/Basic_Lab_VS_Code_Azure_Function_And_Dummy_Tracker.docx>).
Parts 1-2 are orientation; Parts 3 and 5 cover local execution and approved cloud
testing. Skip publishing and dummy-website extensions in this core pack.

## Prerequisites

.NET 10 SDK, a .NET-10-compatible Functions Core Tools v4, Azurite and approved
Microsoft VS Code extensions. Build/restore needs access to approved NuGet feeds.
Cloud testing separately requires an assigned endpoint and privately handled key.

## Run locally

Open [HelloAzureFunction](HelloAzureFunction) in VS Code. In PowerShell:

```powershell
dotnet --list-sdks
func --version
if (-not (Test-Path '.\local.settings.json')) {
    Copy-Item '.\local.settings.example.json' '.\local.settings.json'
}
dotnet build
```

Stop on a nonzero build exit code. The example uses local Azurite, not a cloud
storage key. Do not overwrite or share real local settings.

Start Azurite using Ctrl+Shift+P > Azurite: Start. In terminal 1:

```powershell
func start --port 7071
```

Wait for the host to list `ApplicationStatus: [GET]`. In terminal 2:

```powershell
curl.exe --noproxy "*" --fail --max-time 20 http://127.0.0.1:7071/api/ApplicationStatus
```

Expected:

```json
{"reference":"LBS-DEMO-1001","status":"Received","fictionalData":true,"message":"Hello from the VS Code publishing exercise."}
```

This is a fixed sample response, not a SQL/Blob/Service Bus integration.

## Cloud test-only checkpoint

Use only the organiser-approved Function App containing `ApplicationStatus`.
Do not publish to it. In Get Function URL select **default (Function key)**,
not either Host key option. Copy the full URL directly into your browser,
not chat or evidence. Expect the same JSON.

In another tab remove `?code=` and everything after it. Expect HTTP 401.
Local Core Tools does not normally enforce keys, so a local keyless response
does not replace this cloud check. If blocked by policy, record the actual
result and ask the owner; do not bypass restrictions.

## Finish

Press Ctrl+C in terminal 1 and wait for the PowerShell prompt. This stops your
local host, not the cloud app. Stop only the Azurite instance you started when
no other exercise needs it. Record your own evidence, excluding keys and URLs
containing keys. Continue to the
[Logs exercise](../PortalAndVsCodeBasics/03_Log_Analytics_Portal_And_VS_Code.md).

The Day 2 tracker is a separate [local project](../LbsDocumentTracker).

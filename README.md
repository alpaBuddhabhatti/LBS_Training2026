# LBS Azure corporate training - attendee pack

Start with [00_START_HERE.md](00_START_HERE.md).

This repository contains the core two-day corporate training materials:

- **Presentations:** Day 1 and Day 2, PowerPoint and PDF.
- **Handouts:** step-by-step lab instructions, Word and PDF.
- **[Attendee notes](01_ATTENDEE_NOTES.md):** commands, expected results and recovery.
- **[Lab code](Labs):** independent component exercises and a local document tracker.
- **Sample data:** fictional documents, SQL, KQL and operational CSVs.
- **[Evidence checklist](03_MY_LAB_EVIDENCE.csv):** record your own results.

## Download or clone

Select **Code > Download ZIP**, then extract the entire archive before use.
Alternatively:

```powershell
git clone https://github.com/alpaBuddhabhatti/LBS_Training2026.git
Set-Location .\LBS_Training2026
```

Keep `Day 1`, `Day 2` and `Labs` together. Open one project folder at a time in
VS Code; the repository root is not one combined application.

## Preparation and course order

1. Read the [prerequisites](02_Pre_Course_Setup_And_Prerequisites_Guide.md).
2. Obtain approved targets/access using the [resource template](04_ASSIGNED_RESOURCES.csv).
   Read the [firewall, trusted-services and IAM notes](05_NETWORK_FIREWALL_AND_ACCESS_NOTES.md)
   before the Azure exercises; configuration changes require owner approval.
3. Follow [Day 1 order](<Day 1/00_DAY_1_ORDER.pdf>), then
   [Day 2 order](<Day 2/00_DAY_2_ORDER.pdf>).
4. Record Passed, Blocked or Not run; identify live, prepared or offline work.

Azure exercises require separately assigned resources, data permissions and an
approved network path. Repository access does not provide Azure access.
The local tracker runs without Azure, uses memory only and must not be published.

## Verification and boundaries

The supplied Function and tracker build with .NET 10. The tracker checks produce
20 PASS lines; all ten fictional documents have been tested through HTTP uploads.
See [attendee notes](01_ATTENDEE_NOTES.md) for reproducible commands.
Function host invocation and live Azure checks remain environment-dependent;
compilation is not evidence that these ran.

This core pack excludes optional provisioning, publishing, AI and the advanced
Azure-backed tracker. Use fictional data only. Do not commit credentials, real
local settings, completed resource sheets or sensitive evidence. Keep your
completed worksheets outside the repository, or use the ignored
`*.completed.csv` filenames listed in [.gitignore](.gitignore).

# LBS Azure training - core attendee pack

This is the **core attendee edition** of the two-day corporate training.
Use the complete ZIP supplied by the organiser, download the
[GitHub repository](https://github.com/alpaBuddhabhatti/LBS_Training2026), or clone it.
Extract any ZIP to a writable local folder before use. Keep `Day 1`, `Day 2` and `Labs`
together so links work. Do not run projects from ZIP preview or mix editions.

## What is included

| Material | Location | Use |
| --- | --- | --- |
| Preparation | [Prerequisites](02_Pre_Course_Setup_And_Prerequisites_Guide.md) | Install only the tools for your route |
| Timetable | [Two-day timetable](00_Two_Day_Timetable.md) | Both days: 09:45-17:30 |
| Day 1 presentation | [PowerPoint](<Day 1/LBS_Azure_Day_1_Attendee.pptx>) | Concepts and component demonstrations |
| Day 1 handouts | [Day 1 order](<Day 1/00_DAY_1_ORDER.md>) | Orientation, SQL, Blob, Function, Logs |
| Day 2 presentation | [PowerPoint](<Day 2/LBS_Azure_Day_2_Core.pptx>) | Core agenda, matching the handouts |
| Day 2 handouts | [Day 2 order](<Day 2/00_DAY_2_ORDER.md>) | Costs, telemetry, KQL, queue, local tracker, incident |
| Self-study notes | [Attendee notes](01_ATTENDEE_NOTES.md) | Commands, expected results and recovery |
| Progress record | [Evidence checklist](03_MY_LAB_EVIDENCE.csv) | Record your own Passed / Blocked / Not run results |
| Assigned resources | [Resource sheet](04_ASSIGNED_RESOURCES.csv) | Organiser supplies approved targets and access privately |
| Access and networking | [Firewall, trusted services and IAM](05_NETWORK_FIREWALL_AND_ACCESS_NOTES.md) | Client IPs, SQL Azure-services exception, Storage bypass and scoped data permissions |

All attendee guides are Markdown files. Open them in any text editor or in VS Code.

## Start in this order

1. Read the prerequisites before the course; allow 60-90 minutes plus IT approval.
2. Obtain your assigned tenant/subscription, database, container, workspace, Function
   endpoint and isolated queue from the organiser. The resource sheet contains
   placeholders, not a working Azure environment. Never put keys in that sheet.
3. Use your actual extracted folder wherever a handout shows a placeholder path.
4. Follow Day 1 in order, then Day 2. Open one project folder at a time in VS Code.
5. Record your own results, including the route and non-secret evidence.
6. Stop your local processes when finished. Do not delete shared Azure resources.

## Source code and data

- [PortalAndVsCodeBasics](Labs/PortalAndVsCodeBasics): SQL scripts, Blob text files,
  synthetic KQL and the remote query runner.
- [HelloAzureFunction](Labs/VsCodePublishBasics/HelloAzureFunction): standalone
  HTTP Function; see [core Function instructions](Labs/VsCodePublishBasics/README.md).
- [Day2Operations](Labs/Day2Operations): fictional request/dependency/cost CSVs;
  prepared, workspace and Application Insights KQL variants.
- [LbsDocumentTracker](Labs/LbsDocumentTracker): local-only website, ten fictional
  text documents, expected outcomes and executable checks.

The projects are independent exercises, **not one connected Azure application**.
The tracker uses memory, loses records on restart and must not be published.
The Function returns a fixed fictional response, not a database lookup.

## Routes and limits

- **Full developer:** VS Code, .NET 10 SDK, the listed extensions, Azure CLI,
  compatible Functions Core Tools v4 and Azurite, plus approved Azure access.
- **Portal-only:** use authorised portal steps; record local/terminal work Not run.
- **Prepared/offline:** use the Day 2 data when live access is unavailable.
  Prepared KQL still needs an authorised KQL editor. CSV review is not KQL execution.

No Azure provisioning or publishing is required for the core route. Cloud labs
need organiser-prepared resources, appropriate data access and an approved network
path. ZIP access alone does not provide these.

Optional resource creation, App Service/local SQL, the dummy website, identity,
networking, AI and the advanced Azure-backed tracker are intentionally excluded.
Some retained handouts/slides describe optional ideas for context; skip those
extensions. They are not missing core prerequisites.

Use fictional data only. Keep credentials, Function-key URLs, real documents,
account details and connection strings out of shared notes, screenshots and Git.

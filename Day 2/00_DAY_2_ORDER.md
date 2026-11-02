CORE ATTENDEE EDITION: Start with 00_START_HERE.md at the pack root. Only the core two-day route is supplied. Optional publishing, dummy website, resource creation, identity/networking and advanced Azure tracker extensions mentioned below are not assigned or included. Use your own extracted path where a command shows C:\YOUR-ATTENDEE-PACK. Do not copy instructor settings.

Day 2 - cost, observability and realistic operations

LBS \| Attendee edition \| Fictional data only \| Updated 28 October 2026

# Before you start

Expected duration: 09:45-17:30

Prerequisites: Day 1 component concepts; whole attendee pack kept together.

Required permissions: Assigned read scopes for costs and telemetry; data roles only for the queue exercise.

Resources created: None required on the core route.

Cost considerations: Reuse existing approved resources. New budgets/alerts, instrumentation and deployments are optional approved extensions.

Safety: Use the assigned tenant, subscription and resource only. Do not change shared networking, roles, tiers or deployment settings. No real documents, secrets or keyed URLs in evidence.

# Today's priorities

Cost Management and Application Insights/KQL are mandatory core activities. Service Bus is a shorter standalone exercise.

Use live data only when prepared and authorised. Otherwise use the supplied fictional dataset and label the result prepared or offline. A fallback is not a passed live-cloud test.

| Start | Finish | Activity | Minutes |
|----|----|----|----|
| 09:45 | 10:00 | Welcome, recap and portal orientation | 15 |
| 10:00 | 11:15 | Mandatory Cost Management investigation | 75 |
| 11:15 | 11:30 | Break | 15 |
| 11:30 | 12:45 | Application Insights: requests, failures and dependencies | 75 |
| 12:45 | 13:30 | Lunch | 45 |
| 13:30 | 14:45 | KQL: first rows, failures, slow dependency and correlation | 75 |
| 14:45 | 15:00 | Break | 15 |
| 15:00 | 15:35 | Service Bus Explorer: standalone send, peek and receive | 35 |
| 15:35 | 16:20 | Local document tracker: realistic outcomes | 45 |
| 16:20 | 17:00 | Team incident and cost trade-off exercise | 40 |
| 17:00 | 17:30 | Knowledge check, evidence, cleanup and close | 30 |

# Open these guides in this order

1\. 06_Cost_Management_Portal_Lab.md (mandatory, 10:00).

2\. 02_Application_Insights_Portal_Lab.md (11:30), then 03_KQL_Beginner_Hands_On.md (13:30).

3\. 01_Service_Bus_Portal_Lab.md (15:00): only the assigned standalone Explorer steps.

4\. LBS_Document_Tracker_Setup_And_Testing.md (15:35): local-only, fictional data.

5\. 04_Incident_And_Cost_Team_Exercise.md (16:20).

Supporting files: Labs\Day2Operations relative to the attendee-pack root. It contains CSVs and three query modes.

Optional identity and networking handouts are not included in this core pack. CI/CD, ARM/Bicep and automation are awareness-only unless a separate tested runbook is supplied; they are not extra core labs.

Optional portal resource-creation guides are not included in this core pack. Existing resources are the default; do not create duplicates.

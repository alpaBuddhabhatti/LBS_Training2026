CORE ATTENDEE EDITION: Start with 00_START_HERE.md at the pack root. Only the core two-day route is supplied. Optional publishing, dummy website, resource creation, identity/networking and advanced Azure tracker extensions mentioned below are not assigned or included. Use your own extracted path where a command shows C:\YOUR-ATTENDEE-PACK. Do not copy instructor settings.

Team exercise - failed submission and rising monitoring cost

LBS \| Attendee edition \| Fictional data only \| Updated 28 October 2026

# Before you start

Expected duration: 40 minutes: 16:20-17:00

Prerequisites: Cost and KQL blocks complete; fictional CSV/query pack or approved live evidence; pairs or groups.

Required permissions: No extra rights for prepared/offline route. Live evidence needs the previously approved scopes.

Resources created: None; the exercise is investigation and a decision proposal, not a production fix.

Cost considerations: Fictional cost figures are not prices. Proposals must protect useful diagnostics, security and availability.

Safety: Use the assigned tenant, subscription and resource only. Do not change shared networking, roles, tiers or deployment settings. No real documents, secrets or keyed URLs in evidence.

# Your scenario

A fictional team receives a report of a slow/failed document submission. The current equal-period cost is higher. Use only the supplied fictional datasets unless your tutor has explicitly assigned approved live evidence.

Cost and telemetry files are teaching evidence, not proof that the local tracker emitted the events. A higher monitoring amount and a failed request do not automatically share one cause.

# Work in pairs

1\. Minutes 0-5: agree mode, UTC window, source and roles: investigator and reviewer. Read the user symptom.

Expected result: A scoped question, not an unbounded search.

2\. Minutes 5-15: inspect failed requests and the slow-dependency result. Pick one operation and record the request/dependency timeline.

Expected result: An observed symptom with correlation and a separate hypothesis; no unsupported root-cause claim.

3\. Minutes 15-25: compare the two cost periods by service. Propose a read-only check of the largest change.

Expected result: Correct totals/delta and one testable explanation; no assumption that turning monitoring off is safe.

4\. Minutes 25-35: write an incident note and optimisation proposal. State owner, risk, approval and how recovery or savings would be verified.

Expected result: Actionable next steps without fault injection, a destructive cleanup or a fabricated verified fix.

5\. Minutes 35-40: give a two-minute handover. Reviewer challenges one assumption and asks what evidence is still missing.

Expected result: A defensible conclusion and an honest limitation.

| Handover field | Your observation |
|----|----|
| Mode / app / time range / source |  |
| Symptom and observed rows |  |
| OperationId and durations |  |
| Hypothesis vs established fact |  |
| Cost periods, totals, delta and main contributor |  |
| Next safe check / owner / approval |  |
| Optimisation / risk / verify recovery and cost separately |  |

# Knowledge check - before and after

Before: can a successful request still be slow? Can we infer cause from two graphs changing together?

After: explain your conclusion, strongest evidence, one alternative explanation and the next non-destructive check.

# Cleanup

No resources were created. Keep redacted notes; leave shared services, budgets and telemetry unchanged.

# Your evidence

| Record                                       | Your result |
|----------------------------------------------|-------------|
| Mode: live / prepared query / offline review |             |
| Scope, time range and source                 |             |
| Expected / actual result                     |             |
| Passed / Blocked / Not run and why           |             |
| Cost/security trade-off                      |             |
| Follow-up owner / cleanup                    |             |

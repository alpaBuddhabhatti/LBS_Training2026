CORE ATTENDEE EDITION: Start with 00_START_HERE.md at the pack root. Only the core two-day route is supplied. Optional publishing, dummy website, resource creation, identity/networking and advanced Azure tracker extensions mentioned below are not assigned or included. Use your own extracted path where a command shows C:\YOUR-ATTENDEE-PACK. Do not copy instructor settings.

Mandatory cost lab - why has the bill increased?

LBS \| Attendee edition \| Fictional data only \| Updated 28 October 2026

# Before you start

Expected duration: 75 minutes: 10:00-11:15

Prerequisites: Portal access; assigned cost scope; Labs\Day2Operations\fictional-costs.csv available as fallback.

Required permissions: Read access to the authorised Cost Management scope; Cost Management Reader where applicable. Billing visibility depends on the agreement and administrator settings. Budget writes need separate approval.

Resources created: None. Budget design is required; creating a real budget is an optional authorised extension.

Cost considerations: Cost Analysis views do not create compute. Data can be delayed. No exact current service price is asserted; fictional GBP data is not pricing.

Safety: Use the assigned tenant, subscription and resource only. Do not change shared networking, roles, tiers or deployment settings. No real documents, secrets or keyed URLs in evidence.

# What, why and scenario

A fictional operations team reports that spending increased while application traffic appeared stable. Your task is to explain the change before suggesting a safe optimisation.

Cost Analysis reports available cost data. Pricing Calculator estimates a proposed design. A forecast is a prediction, not a final invoice. Actual and amortised cost views answer different questions; record which you use and keep it consistent.

Time split: explain 10 minutes; tutor demo 15; independent practice 30; compare 10; budget/cleanup decision 10.

# Portal navigation and expected results

1\. Search the portal for Cost Management + Billing. Open Cost Management, select Scope and the assigned subscription or supported resource-group scope. Do not switch to a personal subscription to bypass a restriction.

Expected result: The authorised scope is visible. If unavailable, record live access Blocked and select the prepared route.

2\. Open Cost analysis. If a list of views appears, choose Services or a customisable view. If the chart opens directly, use its scope/date controls. Read the currency, period and cost metric before interpreting a number.

Expected result: You can state the scope, currency, dates and Actual/Amortised metric; a blank view is not proof of zero cost.

3\. Choose two comparable completed periods, such as equal seven-day windows. Group by Service name; then inspect Resource or Resource group as available. Keep filters and cost metric consistent. Record totals for each period.

Expected result: A comparable breakdown, not a mixture of current partial month and a full prior month.

4\. Identify the largest absolute increase and drill into its resources. Note possible usage drivers; do not assume a service name proves the cause.

Expected result: One evidence-based change and a hypothesis requiring further read-only checks.

5\. If approved cost data is unavailable or not safe to share, open fictional-costs.csv in a spreadsheet or read-only CSV viewer. Sum Cost separately for each Period and group by Service. Label every figure FICTIONAL.

Expected result: A completed prepared exercise; live cost visibility remains Blocked/Not run. Amounts are invented, not Azure rates.

6\. Write one optimisation proposal including evidence, expected saving mechanism, availability/security risk, owner and a verification step. Do not resize, stop or delete anything.

Expected result: A defensible proposal rather than an unapproved production change.

# Mandatory budget decision; optional creation

Draft a monthly budget at the appropriate scope with an approved amount, currency, period, owner and notification recipients. For a fictional design example, use GBP 300 with actual-cost notifications at 50%, 80% and 100%; these are invented exercise values, not an LBS spending limit.

Portal route where supported: Cost Management \> Budgets \> Add. Review scope, reset period, dates, amount and notification conditions. Stop before Create unless the owner explicitly approves a lab budget and recipients. Notification features depend on scope/agreement.

Budget alerts do not automatically stop spending and can arrive after cost data updates. A design or preview is not a created budget. A notification test, if available, is not evidence that a real threshold was crossed.

# Troubleshooting - symptom, checks and safe recovery

| Symptom | Exact checks / recovery |
|----|----|
| Access denied / no eligible scope | Verify tenant, subscription and cost visibility with the billing administrator. Request the approved read scope; do not request Owner. Use the fictional CSV. |
| New resource absent / zero or empty view | Confirm period, filters and billing data freshness; allow the documented data delay. Do not generate expensive usage to make a chart appear. |
| Totals disagree | Compare scope, currency, equal dates, Actual vs Amortised and filters. Do not mix periods or quotes with actuals. |
| Budget option missing | Check supported scope/offer and permissions with the owner. Submit the written design; mark creation Not run. |

# Knowledge check - before and after

Before: how does a calculator estimate differ from a bill? What might keep charging when an app is stopped?

After: which service changed most, and what extra evidence would establish why? Does a budget guarantee spending stops?

# Cleanup

No resource deletion is required. Retain only authorised redacted evidence.

Delete only your explicitly approved temporary budget after agreement with its owner; never remove an organisational budget.

Identify plans, storage, monitoring, messaging and networking separately in a cleanup proposal. Deleting one resource is not proof every related charge stops.

# Your evidence

| Record                                       | Your result |
|----------------------------------------------|-------------|
| Mode: live / prepared query / offline review |             |
| Scope, time range and source                 |             |
| Expected / actual result                     |             |
| Passed / Blocked / Not run and why           |             |
| Cost/security trade-off                      |             |
| Follow-up owner / cleanup                    |             |

# Official reference

https://learn.microsoft.com/azure/cost-management-billing/costs/quick-acm-cost-analysis

# Corporate attendee notes - networking, firewall and IAM

Read this before connecting to SQL, Blob Storage, Functions, Service Bus or Logs.
These notes explain the settings; they do not authorise changing shared resources.
Exact resource names and current environment details are held in the instructor's
private inventory. Do not copy personal/client IP addresses into this public repo.

## 1. Three different checks

| Check | Question | Example |
| --- | --- | --- |
| Network | Can this client reach the service? | Approved public IP, VPN/private endpoint and DNS |
| Authentication | Which identity is connecting? | Approved Microsoft Entra account or managed identity |
| Authorisation | What can that identity do? | SQL SELECT, Blob data role or Service Bus sender/receiver |

A permitted IP does not grant data access. A valid identity does not bypass a
firewall. Azure Reader/Contributor does not automatically grant the data access
required by these exercises. The portal, VS Code, MSSQL and Azure CLI can use
different sign-in contexts.

## 2. Azure SQL: client IP and firewall rules

Owner/authorised administrator preparation:

1. Open the **SQL logical server**, not only the database, then **Networking**.
2. Record the approved public/private endpoint route and current public network
   access setting. Do not enable a public endpoint if the assigned route is private.
3. If an approved public route is required, use the client's **public outbound
   IPv4 address** shown by the approved portal/IT process. Do not use the laptop's
   private `192.168.x.x`/`10.x.x.x` address or `127.0.0.1`.
4. With explicit approval, add one named rule with start IP = end IP = that exact
   approved public IPv4 address, then Save. A shared corporate NAT address can
   represent multiple people; a single-address rule is not individual identity.
5. Corporate VPN, proxy or network changes can change the observed public IP.
   Record the actual route/time privately; do not keep adding ranges blindly.
6. Connect using approved authentication to the assigned application database,
   not `master`. Confirm the database and login with the supplied connection query.
7. Record successful query evidence separately from firewall configuration.

Do not open `0.0.0.0` to `255.255.255.255`, disable TLS validation, or select a
different subscription to work around an access error. Private endpoints require
the approved network route and working private DNS; public firewall rules alone
do not establish that route. SQL connection-policy/network requirements must be
checked with IT, not replaced by a blanket firewall exception.

### "Allow Azure services and resources to access this server"

- In SQL server Networking, this creates a special rule with start and end IP
  **`0.0.0.0`**. That is a SQL-specific Azure-services exception, not the
  attendee's IP address and not a normal all-internet IP range.
- The exception is broad: it permits connection attempts from Azure resources
  beyond your own subscription. SQL authentication and database permissions
  still apply. It is not "trust only my Function App".
- Do not enable it as a default fix. Only the owner may approve its temporary
  use, risk, expiry and recovery plan for the training environment.
- An enabled exception can make a connection succeed without proving that the
  narrower individual outbound-IP rules are sufficient.
- Removing it can break a working workload. Do not disable it during the session
  without owner approval and evidence that the narrower/private route works.

### Hosted Functions connecting to SQL

The attendee laptop's IP and the Function worker's outbound IP are different.
An inbound Function access rule does not configure outbound SQL access.
Dynamic workers can use changing outbound addresses; copied historical IP lists
are not a stable production-egress design. The owner must validate the current
hosting plan's supported private-network/stable-egress options and the actual
connection path. Never claim that assigning a managed identity fixes networking.

## 3. Storage: network access and trusted-service exception

Open the assigned **Storage account > Networking** and inspect:

- Public network access and whether all networks or selected networks are allowed.
- IP/network rules, virtual-network rules and private endpoint/DNS arrangements.
- **Allow Azure services on the trusted services list to access this storage
  account** (portal wording can vary).
- HTTPS/TLS requirements and whether anonymous Blob public access is allowed.

Storage's trusted-service exception is **not the SQL `0.0.0.0` exception**.
It covers supported trusted Azure services/scenarios; it does not mean every
Azure app or arbitrary Function can bypass the firewall. Authentication and
appropriate data permissions remain necessary.

When the storage default network action is Allow, access is not limited to
selected networks by the firewall. A trusted-service bypass flag should not be
presented as proof of a restricted network design. A private Blob container and
disabled anonymous public access do not themselves disable public networking.

For the attendee route, prefer the assigned scoped Entra data role rather than
account keys or SAS. Shared Key being enabled is not an instruction to retrieve
or distribute keys. If blocked, ask the owner to check network and data access
separately. Do not change networking or authentication settings on an account
used by Function host/deployment storage.

## 4. IAM and data permissions

An authorised role administrator uses **Access control (IAM) > Check access** on
the exact resource/scope. Check inherited assignments as well as direct ones.
Attendees must not assign themselves roles, request Owner as a shortcut, or
remove another workload's role assignment.

| Exercise/workload | Owner prepares and verifies |
| --- | --- |
| Resource discovery | Approved management visibility at the assigned scope |
| SQL read route | Approved SQL authentication, network access and database SELECT |
| SQL write route | Only the explicitly assigned disposable table/schema permissions |
| Blob transfers | Usually Storage Blob Data Contributor at the approved container scope for writes; narrower read access for read-only work |
| Service Bus send | Azure Service Bus Data Sender on the assigned isolated queue |
| Service Bus receive/settle | Azure Service Bus Data Receiver on the assigned isolated queue |
| Workspace queries | Approved Log Analytics query role/scope, such as Log Analytics Reader, subject to table/resource restrictions |
| Application Insights | Approved monitoring/query access at the relevant resource/workspace scope |
| Cost investigation | Authorised Cost Management visibility appropriate to the agreement/scope |
| Function invocation | Endpoint-specific authentication/key permission; separate from deployment authority |

Azure SQL database permissions are **not granted by resource-group Contributor**.
An authorised SQL Entra administrator must configure the contained database user
and required GRANTs for the actual identity. The runtime should not receive
`db_owner` merely to make a connection work. Inspect actual grants; an IAM list
does not prove SQL table access.

For managed identities, confirm **Function App > Identity > System assigned**,
then verify the correct identity's roles and SQL user without sharing object IDs
or credentials in evidence. Enabling an identity does not assign permissions.
Queue-scoped sender/receiver assignments do not restrict access if the same
identity also has broader namespace-scoped data roles. Role propagation can take
time; reconnect and recheck rather than adding progressively broader roles.

## 5. Function, Service Bus and monitoring settings

- **Function App > Networking / Access restrictions:** these govern inbound
  reachability and are separate from trigger/function authorisation. An Allow all
  network rule is not authentication. Never publish over a shared Function App.
- Before the cloud HTTP checkpoint, confirm that **ApplicationStatus is actually
  deployed** on the approved target. If the assigned shared app contains only a
  timer/Service Bus tracker, run the HTTP example locally and record the cloud
  HTTP checkpoint Blocked / Not run until a separate compatible target is supplied.
- **Service Bus > Networking:** inspect public access, network rules and any
  trusted-service exception supported by the tier. It is a different setting
  from SQL and Storage; data roles are still required.
- Do not use a tracker-processing queue for the standalone send/receive lab if
  a live consumer can receive messages. Request an isolated queue.
- **Application Insights > linked workspace:** the workspace can be in another
  resource group. Verify the actual link, query scope and table names.
- Workspace ID, workspace name and Azure resource ID are different values.
  Do not retrieve shared keys to run the supplied Entra-authenticated query.
- A configured link does not prove that recent telemetry exists. Record the
  actual query result, time window and access mode.

## 6. Record evidence and clean up safely

Record target, route, time, expected/actual result and any owner-approved exception.
Keep exact public client IPs, identity details and populated inventory sheets in
the approved private location. Never capture passwords, tokens, Function-key URLs,
connection strings or real document content.

For a blocked connection, identify the layer: DNS/route/firewall, authentication,
or authorisation. Preserve the non-secret error and ask the responsible owner.
Do not treat a successful resource Overview or an administrator's connection as
proof that an attendee can execute the lab.

At the end, the owner reviews temporary firewall rules and roles against actual
dependencies and verifies the intended narrower access. Attendees stop only their
own local processes. Do not delete shared resources, purge queues, remove host
storage access or disable trusted-service exceptions without an approved plan.

## Microsoft references

- [Azure SQL IP firewall rules](https://learn.microsoft.com/azure/azure-sql/database/firewall-configure?view=azuresql)
- [Storage trusted Azure services](https://learn.microsoft.com/azure/storage/common/storage-network-security-trusted-azure-services)
- [Assign Blob data access roles](https://learn.microsoft.com/azure/storage/blobs/assign-azure-role-data-access)
- [Service Bus Entra authentication and roles](https://learn.microsoft.com/azure/service-bus-messaging/authenticate-application)

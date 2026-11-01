-- Read-only. Replace the table placeholder with the owner's approved table.
-- Confirm the actual columns before executing the final SELECT.
SELECT DB_NAME() AS DatabaseName,
       SUSER_SNAME() AS LoginName,
       SYSUTCDATETIME() AS CheckedAtUtc;

SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = N'dbo'
  AND TABLE_NAME = N'VsCodeItems_assigned'
ORDER BY ORDINAL_POSITION;

SELECT Id, Name, Status
FROM dbo.VsCodeItems_assigned
ORDER BY Id;

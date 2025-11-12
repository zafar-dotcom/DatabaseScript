SELECT COUNT(*) FROM v$session WHERE username = 'CSGDEV';
SELECT
    s.sid,
    s.serial#,
    s.username,
    s.status,
    s.osuser,
    s.program,
    s.machine,
    s.logon_time,
    s.last_call_et,
    s.event
FROM
    v$session s
WHERE
    s.username = 'CSGDEV'
ORDER BY
    s.status DESC, s.logon_time DESC;
    
    
    
    
    -- Sessions open for longer than 5 minutes:
    
    SELECT sid, serial#, username, status, last_call_et
FROM v$session
WHERE username = 'CSGDEV'
AND last_call_et > 300; -- 5 minutes



--. Use Oracle query to monitor sessions

SELECT username, status, osuser, machine, program, module, sql_id, sql_text
FROM v$session s
JOIN v$sql q ON s.sql_id = q.sql_id
WHERE s.username = 'CSGDEV';


SELECT s.sid, s.serial#, s.username, s.machine, s.program
FROM v$session s
JOIN v$locked_object lo ON s.sid = lo.session_id;

ALTER SYSTEM KILL SESSION '292,52852' IMMEDIATE;

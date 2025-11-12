CREATE OR REPLACE PROCEDURE RBAC_SP (
    p_role_id       IN NUMBER,
    p_result_cursor OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN p_result_cursor FOR
    SELECT * 
    FROM (
        SELECT MODULE_CODE, MODULE_DESCRIPTION, MODULE_PRIORITY, MODULE_ICON, MODULE_PARENT, 
               TRN_ID, TRN_DESCRIPTION, MENU_LABEL, MENU_URL, TRN_PRIORITY, OPR_ID, MIN(ALLOWED) AS ALLOWED
        FROM (
            -- First part: Permissions based on ROLE and allowed operations
            SELECT 
                UR.ROLE_ID,
                UR.ROLE_DESCRIPTION,
                T.TRN_ID,
                M.MODULE_CODE,
                M.DISPLAY_LABEL AS MODULE_DESCRIPTION,
                M.PRIORITY_LEVEL AS MODULE_PRIORITY,
                M.ICON_CLASS AS MODULE_ICON,
                NVL(M.PARENT, 0) AS MODULE_PARENT,
                T.DESCRIPTION AS TRN_DESCRIPTION,
                T.MENU_LABEL,
                T.MENU_URL,
                T.PRIORITY_LEVEL AS TRN_PRIORITY,
                TOP.OPR_ID,
                O.OPR_DESCRIPTION,
                O.OPR_SHORT_DESC,
                DECODE(RD.OPR_ID, NULL, 0, 1) AS ALLOWED
            FROM 
                USER_ROLE UR
                LEFT JOIN ROLE_DETAIL RD ON UR.ROLE_ID = RD.ROLE_ID
                JOIN TRN_MODULE TM ON RD.TRN_ID = TM.TRN_ID
                JOIN TRN_CODE T ON T.TRN_ID = TM.TRN_ID
                JOIN MODULE M ON M.MODULE_CODE = TM.MODULE_CODE
                JOIN TRN_OPERATIONS TOP ON T.TRN_ID = TOP.TRN_ID
                JOIN OPERATION O ON TOP.OPR_ID = O.OPR_ID
            WHERE UR.ROLE_ID = p_role_id
              
            UNION ALL

            -- Second part: Default to allow all operations if not in ROLE_DETAIL
            SELECT 
                UR.ROLE_ID,
                UR.ROLE_DESCRIPTION,
                T.TRN_ID,
                M.MODULE_CODE,
                M.DISPLAY_LABEL AS MODULE_DESCRIPTION,
                M.PRIORITY_LEVEL AS MODULE_PRIORITY,
                M.ICON_CLASS AS MODULE_ICON,
                NVL(M.PARENT, 0) AS MODULE_PARENT,
                T.DESCRIPTION AS TRN_DESCRIPTION,
                T.MENU_LABEL,
                T.MENU_URL,
                T.PRIORITY_LEVEL AS TRN_PRIORITY,
                TOP.OPR_ID,
                O.OPR_DESCRIPTION,
                O.OPR_SHORT_DESC,
                1 AS ALLOWED -- Allow operations by default
            FROM 
                USER_ROLE UR
                JOIN ROLE_DETAIL RD ON UR.ROLE_ID = RD.ROLE_ID
                JOIN TRN_MODULE TM ON RD.TRN_ID = TM.TRN_ID
                JOIN TRN_CODE T ON T.TRN_ID = TM.TRN_ID
                JOIN MODULE M ON M.MODULE_CODE = TM.MODULE_CODE
                JOIN TRN_OPERATIONS TOP ON T.TRN_ID = TOP.TRN_ID
                JOIN OPERATION O ON TOP.OPR_ID = O.OPR_ID
            WHERE UR.ROLE_ID = p_role_id
        ) operations
        GROUP BY MODULE_CODE, MODULE_DESCRIPTION, MODULE_PRIORITY, MODULE_ICON, MODULE_PARENT, 
                 TRN_ID, TRN_DESCRIPTION, MENU_LABEL, MENU_URL, TRN_PRIORITY, OPR_ID
    ) finalResult
    WHERE ALLOWED = 1 
    ORDER BY TRN_ID;
END;
/

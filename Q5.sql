
SELECT 
    send_date           "Report Date",
    EXTRACT(MONTH FROM send_date) "Month of the Report",
    cli.firstname
    || ' '
    || cli.middlename
    || ' '
    || cli.lastname "Client Full Name",
    cli.cc_id         "CC Id",
    acc.account_id    "Account Number",
    acc.description   "Account Description",
    mov.currency      "Currency",
    mov.credit        "Total Credit Movements",
    mov.debit         "Total Debit Movements",
    mov.total         "Total Movements"
FROM
    client_data    cli
    INNER JOIN account_data   acc ON cli.client_id = acc.client_id
    INNER JOIN (
        SELECT
            account_id,
            send_date,
            (
                SELECT
                    COUNT(*)
                FROM
                    movements mm
                WHERE
                    mm.account_id = mov_month.account_id
                    AND mm.mov_type = 'C'
                    AND  to_date(mm.send_date, 'YYYY-MM-DD') = :data
            ) credit,
            (
                SELECT
                    COUNT(*)
                FROM
                    movements mm
                WHERE
                    mm.account_id = mov_month.account_id
                    AND mm.mov_type = 'D'
                    AND  to_date(mm.send_date, 'YYYY-MM-DD') = :data
            ) debit,
            (
                SELECT
                    COUNT(*)
                FROM
                    movements mm
                WHERE
                    mm.account_id = mov_month.account_id
                    AND  to_date(mm.send_date, 'YYYY-MM-DD') = :data
            ) total,
            currency
        FROM
            movements mov_month
        WHERE
            to_date(mm.send_date, 'YYYY-MM-DD') = :data
    ) mov ON acc.account_id = mov.account_id
	where NVL((SELECT SUBSTR (MESSAGE, 7,1) 
	FROM LOG_VALIDATION LV 
	WHERE LV.LOG_ID = (
	select max(L.LOG_ID)
	from LOG_VALIDATION L
	where L.Client_ID = cli.client_id 
	and L.Message like 'VALID %'
	AND L.InputDate < :data)), CLI.VALID) = 1
	AND 
	NVL((SELECT SUBSTR (MESSAGE, 7,1) 
	FROM LOG_VALIDATION LV 
	WHERE LV.LOG_ID = (
	select max(L.LOG_ID)
	from LOG_VALIDATION L
	where L.Conta_ID = ACC.ACCOUNT_ID 
	and L.Message like 'VALID %'
	AND L.InputDate < :data)), ACC.VALID) = 1
	
    order by cli.client_id ASC, 
    acc.ACCOUNT_ID ASC ,
    mov.currency ASC,
    mov.total DESC;
	
	
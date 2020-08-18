
SELECT 
    sysdate           "Report Date",
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
                    AND EXTRACT(MONTH FROM mm.send_date) = :mes
            ) credit,
            (
                SELECT
                    COUNT(*)
                FROM
                    movements mm
                WHERE
                    mm.account_id = mov_month.account_id
                    AND mm.mov_type = 'D'
                    AND EXTRACT(MONTH FROM mm.send_date) = :mes
            ) debit,
            (
                SELECT
                    COUNT(*)
                FROM
                    movements mm
                WHERE
                    mm.account_id = mov_month.account_id
                    AND EXTRACT(MONTH FROM mm.send_date) = :mes
            ) total,
            currency
        FROM
            movements mov_month
        WHERE
            EXTRACT(MONTH FROM mov_month.send_date) = :mes
    ) mov ON acc.account_id = mov.account_id
    order by cli.client_id, 
    acc.ACCOUNT_ID,
    mov.currency,
    mov.total
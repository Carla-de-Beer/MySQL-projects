-- views
CREATE OR REPLACE VIEW my_view AS
    SELECT 
        *
    FROM
        employees;

SELECT 
    *
FROM
    my_view;

drop view my_view;
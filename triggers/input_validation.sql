USE bank_simulator;

DROP TABLE IF EXISTS account;

CREATE TABLE account (acct_num INT, amount DECIMAL(10,2));

delimiter //
CREATE TRIGGER upd_check BEFORE INSERT ON account
       FOR EACH ROW
       BEGIN
           IF NEW.amount < 0 THEN
               SET NEW.amount = 0;
           END IF;
       END;//
delimiter ;

INSERT INTO account VALUES(137,14.98),(141,1937.50),(97,-100.00);
 
SELECT 
    *
FROM
    account;
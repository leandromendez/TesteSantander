CREATE TABLE MOVEMENTS_LOAD 
(LINE VARCHAR2(2000));


CREATE OR REPLACE TRIGGER UPDATE_MOVEMENTS 
BEFORE INSERT ON MOVEMENTS 
FOR EACH ROW
DECLARE 
msg VARCHAR2(2000);

BEGIN 
	IF :NEW.MOV_TYPE  = 'C' and :NEW.MOV_TYPE > (
	(select sum(amount)
		from MOVEMENTS
		where account_id = :new.account_id
		and MOV_TYPE = 'C')  - 
		(select sum(amount)
		from MOVEMENTS
		where account_id = :new.account_id
		and MOV_TYPE = 'D') 
	)
		EXCEPTION 'Operation not permited';
	END IF;
END;
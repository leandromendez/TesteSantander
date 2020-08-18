
CREATE OR REPLACE TRIGGER UPDATE_ACCOUNT_DATA
BEFORE UPDATE ON ACCOUNT_DATA
FOR EACH ROW
DECLARE 
OLDINFORMATION VARCHAR2(2000);

BEGIN 
	IF :NEW.ACCOUNT_ID <> :OLD.ACCOUNT_ID THEN
		OLDINFORMATION:= 'ACCOUNT_ID '||:OLD.ACCOUNT_ID;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
	IF :NEW.CLIENT_ID  <> :OLD.CLIENT_ID THEN
		OLDINFORMATION:= 'CLIENT_ID '||:OLD.CLIENT_ID;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
	IF :NEW.ACC_TYPE  <> :OLD.ACC_TYPE THEN
		OLDINFORMATION:= 'ACC_TYPE '||:OLD.ACC_TYPE;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
	IF :NEW.DESCRIPTION  <> :OLD.DESCRIPTION THEN
		OLDINFORMATION:= 'DESCRIPTION '||:OLD.DESCRIPTION;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
	IF :NEW.STARTDATE  <> :OLD.STARTDATE THEN
		OLDINFORMATION:= 'STARTDATE '||:OLD.STARTDATE;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
	IF :NEW.ENDDATE  <> :OLD.ENDDATE THEN
		OLDINFORMATION:= 'ENDDATE '||:OLD.ENDDATE;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
	IF :NEW.COMMENTS  <> :OLD.COMMENTS THEN
		OLDINFORMATION:= 'COMMENTS '||:OLD.COMMENTS;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
	IF :NEW.VALID  <> :OLD.VALID THEN
		OLDINFORMATION:= 'VALID '||:OLD.VALID;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
	IF :NEW.INPUTDATE  <> :OLD.INPUTDATE THEN
		OLDINFORMATION:= 'INPUTDATE '||:OLD.INPUTDATE;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
	IF :NEW.INPUTUSER  <> :OLD.INPUTUSER THEN
		OLDINFORMATION:= 'INPUTUSER '||:OLD.INPUTUSER;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
	IF :NEW.LASTMAINTDATE  <> :OLD.LASTMAINTDATE THEN
		OLDINFORMATION:= 'LASTMAINTDATE '||:OLD.LASTMAINTDATE;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
	IF :NEW.LASTMAINTUSER  <> :OLD.LASTMAINTUSER THEN
		OLDINFORMATION:= 'LASTMAINTUSER '||:OLD.LASTMAINTUSER;
		INSERT INTO LOG_VALIDATION (LOG_ID, CLIENT_ID, CONTA_ID, MESSAGE, INPUTDATE, INPUTUSER)
		VALUES (SQ_LOG_VALIDATION.NEXTVAL, NULL, :NEW.ACCOUNT_ID, 'OLD VALUES:'||OLDINFORMATION, SYSDATE, USER);
	END IF;
END;
 
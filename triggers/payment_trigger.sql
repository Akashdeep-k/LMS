create or replace trigger payment_trigger  
before 
insert 
on payment  
for each row  
declare 
    payer Customer%rowtype; 
	prevRowCnt NUMBER; 
begin 
    select * into payer from customer where id = :NEW.customer; 
	select count(*) into prevRowCnt from payment where transaction_id = :NEW.transaction_id; 
	if prevRowCnt>0 then 
        raise_application_error(-20300, 'Duplicate ID not allowed!'); 
	end if; 
	update Customer set balance=payer.balance+:NEW.amount where id=payer.id; 
	dbms_output.put_line('Payment of '||:NEW.amount||' successful!');
exception  
    WHEN NO_DATA_FOUND THEN  
        RAISE_APPLICATION_ERROR(-20001, 'Invalid customer id');  
end; 
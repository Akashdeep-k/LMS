create or replace trigger customer_trigger  
before 
insert 
on customer 
for each row  
declare 
	prev_row_cnt NUMBER; 
begin 
	select count(*) into prev_row_cnt from customer where id = :NEW.id; 
	if prev_row_cnt>0 then 
        raise_application_error(-20300, 'Duplicate ID not allowed!'); 
	end if; 
end; 
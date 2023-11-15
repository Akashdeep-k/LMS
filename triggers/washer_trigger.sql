create or replace trigger washer_trigger  
before 
insert 
on washer  
for each row  
declare 
	prev_row_cnt NUMBER; 
begin 
	select count(*) into prev_row_cnt from washer where id = :NEW.id; 
	if prev_row_cnt>0 then 
        raise_application_error(-20300, 'Duplicate ID not allowed!'); 
	end if; 
end; 
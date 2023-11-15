create or replace trigger complaint_trigger  
before 
insert 
on complaint  
for each row  
declare 
    cloth_id Cloth.id%type; 
	prev_row_cnt NUMBER; 
begin 
    select id into cloth_id from Cloth where id = :NEW.cloth; 
	select count(*) into prev_row_cnt from complaint where id = :NEW.id; 
	if prev_row_cnt>0 then 
        raise_application_error(-20300, 'Duplicate ID not allowed!'); 
	end if; 
exception  
    WHEN NO_DATA_FOUND THEN  
        RAISE_APPLICATION_ERROR(-20001, 'Invalid cloth id');  
end; 
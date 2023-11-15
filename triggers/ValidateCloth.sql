create or replace trigger ValidateCloth 
before 
insert 
on Cloth 
for each row 
declare 
	prevClothCnt number; 
	custCnt number; 
	washerAvlRow Washer%rowtype; 
	cursor washerCursor is select * from Washer where capacity>0 and type=:NEW.service_type order by id; 
begin 
	select count(*) into prevClothCnt from Cloth where id=:NEW.id; 
	if prevClothCnt>0 then 
		raise_application_error(-20300, 'Duplicate ID not allowed!'); 
	end if; 
	select count(*) into custCnt from Customer where id=:NEW.customer; 
	if custCnt!=1 then 
		raise_application_error(-20001, 'Invalid Customer ID!'); 
	end if; 
	if :NEW.washer is NULL then 
		open washerCursor; 
		fetch washerCursor into washerAvlRow; 
		if washerCursor%notfound then 
			dbms_output.put_line('No washer Available, so adding cloth to waiting list.'); 
			:NEW.status := 'waiting'; 
		else 
			:NEW.washer := washerAvlRow.id; 
			update washer set capacity=washerAvlRow.capacity-1 where id=washerAvlRow.id; 
			:NEW.status := 'processing'; 
		end if; 
		close washerCursor; 
	end if; 
end; 
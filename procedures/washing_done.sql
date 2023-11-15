create or replace procedure washingDone(clothId Cloth.id%type) as  
	cursor clothCursor(service_type Cloth.service_type%type) is select id from Cloth where service_type=service_type and washer is NULL order by id;  
	washedCloth Cloth%rowtype;  
	waitingClothId Cloth.id%type;  
	washerCap Washer.capacity%type;  
	not_washing EXCEPTION;  
begin  
    select * into washedCloth from Cloth where id=clothId;  
	if washedCloth.status!='processing' then  
        RAISE not_washing;  
	end if;  
	update Cloth set status='ready' where id=clothId;  
	open clothCursor(washedCloth.service_type);  
	fetch clothCursor into waitingClothId;  
	if clothCursor%notfound then  
		select capacity into washerCap from Washer where id=washedCloth.washer;  
        update Washer set capacity=washerCap+1 where id=washedCloth.washer;  
		commit;  
	else  
		update Cloth set washer=washedCloth.washer, status='processing' where id=waitingClothId;  
	end if;  
    close clothCursor;  
exception  
    when no_data_found then  
    	dbms_output.put_line('Invalid Cloth ID!');  
	when not_washing then  
        dbms_output.put_line('Invalid Cloth ID!');  
end; 
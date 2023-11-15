CREATE OR REPLACE FUNCTION no_of_clothes_in_washer(p_washer_id IN NUMBER) 
RETURN NUMBER 
IS 
    total_clothes NUMBER; 
BEGIN 
    SELECT COUNT(*) INTO total_clothes 
    FROM cloth 
    WHERE washer = p_washer_id and status='processing'; 
 
    RETURN total_clothes; 
END;  
 
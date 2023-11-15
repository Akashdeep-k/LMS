CREATE OR REPLACE FUNCTION get_clothes_count_processing(p_customer_id IN NUMBER) 
RETURN NUMBER 
IS 
    v_clothes_count NUMBER; 
BEGIN 
    SELECT COUNT(*) INTO v_clothes_count 
    FROM cloth 
    WHERE customer = p_customer_id 
    AND status = 'processing'; 
 
    RETURN v_clothes_count; 
END;
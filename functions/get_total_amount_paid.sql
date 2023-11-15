CREATE OR REPLACE FUNCTION get_total_amount_paid(p_customer_id IN NUMBER)  
RETURN NUMBER  
IS  
    v_total_amount NUMBER;  
BEGIN  
    SELECT SUM(amount) INTO v_total_amount  
    FROM payment  
    WHERE customer = p_customer_id;  
  
    RETURN v_total_amount;  
END; 
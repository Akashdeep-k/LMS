CREATE OR REPLACE PROCEDURE customer_collected_items (cust_id IN NUMBER) 
IS 
    v_amount_to_pay NUMBER; 
BEGIN 
    v_amount_to_pay := get_bill_of_user(cust_id); 
    UPDATE customer SET balance = balance - v_amount_to_pay WHERE id = cust_id; 
    UPDATE cloth SET status = 'over' WHERE customer = cust_id AND status = 'ready'; 
    COMMIT; 
    DBMS_OUTPUT.PUT_LINE('Status of clothes set to "over" for customer ' || cust_id); 
 
    COMMIT; 
    DBMS_OUTPUT.PUT_LINE('Amount ' || v_amount_to_pay || ' deducted from customer ' || cust_id || '''s balance.'); 
END; 
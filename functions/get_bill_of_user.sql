CREATE OR REPLACE FUNCTION get_bill_of_user (cust_id IN NUMBER)  
RETURN NUMBER  
IS  
    total_bill NUMBER := 0;  
BEGIN  
    SELECT SUM(  
        CASE service_type  
            WHEN 'wash' THEN 10  
            WHEN 'dry clean' THEN 15  
            WHEN 'iron' THEN 5  
            WHEN 'wash and iron' THEN 13  
            ELSE 0  
        END  
    ) INTO total_bill  
    FROM cloth 
    WHERE id = cust_id;  
      
    RETURN total_bill;  
END; 
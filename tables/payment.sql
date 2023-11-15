CREATE TABLE payment ( 
    transaction_mode VARCHAR2(20) NOT NULL, 
    transaction_id NUMBER PRIMARY KEY NOT NULL, 
    amount NUMBER NOT NULL, 
    customer NOT NULL, 
    FOREIGN KEY (customer) references Customer on delete cascade 
)
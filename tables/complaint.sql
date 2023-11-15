CREATE TABLE complaint ( 
    id NUMBER PRIMARY KEY NOT NULL, 
    description VARCHAR2(500) NOT NULL, 
    cloth NOT NULL, 
    FOREIGN KEY (cloth) references Cloth on delete cascade 
)
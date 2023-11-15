create table Defect ( 
    cloth references Cloth NOT NULL, 
    description varchar2(500) NOT NULL, 
    primary key (cloth, description) 
)
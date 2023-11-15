create table Cloth ( 
    id number NOT NULL PRIMARY KEY, 
    description varchar2(500) NOT NULL, 
    service_type varchar2(100) NOT null, 
    status varchar2(100) NOT NULL, 
    customer NOT NULL, 
    washer references Washer NULL, 
    FOREIGN KEY (customer) references Customer on delete cascade 
)
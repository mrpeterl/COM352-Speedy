DROP DATABASE IF EXISTS Speedy;
CREATE DATABASE Speedy;
USE Speedy;

CREATE TABLE CUSTOMER (
    CustomerId INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    CustomerName varchar(50) NOT NULL,
    CustomerAddress varchar(100) NOT NULL,
    ContactNumber varchar(13) NOT NULL
);

CREATE TABLE CENTRE_TYPE (
    CentreTypeId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CentreType VARCHAR(20)
);

CREATE TABLE DELIVERY_TYPE (
    DeliveryTypeId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    DeliveryType VARCHAR(20)
);

CREATE TABLE RETAIL_CENTRE (
    CentreId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CentreType INT,
    CentreAddress VARCHAR(100),
    FOREIGN KEY (CentreType) REFERENCES CENTRE_TYPE(CentreTypeId)
);

CREATE TABLE TRANSPORTATION_EVENT (
    ScheduleNumber INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TransportationType INT,
    DeliveryRoute VARCHAR(100),
    FOREIGN KEY (TransportationType) REFERENCES DELIVERY_TYPE(DeliveryTypeId)
);

CREATE TABLE DELIVERY_ITEM (
    ItemNumber INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ItemWeight INT,
    Dimensions VARCHAR(11),
    InsuranceAmount DECIMAL(11, 2),
    DestinationAddress VARCHAR(100),
    DeliveryDate DATE,
    CustomerId INT,
    SourceId INT,
    ScheduleNumber INT,
    FOREIGN KEY (CustomerId) REFERENCES CUSTOMER(CustomerId),
    FOREIGN KEY(SourceId) REFERENCES RETAIL_CENTRE(CentreId),
    FOREIGN KEY(ScheduleNumber) REFERENCES TRANSPORTATION_EVENT(ScheduleNumber)
);

INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Karl Jablonski', '70 Crown Street London', '077 0508 5498');
INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Lewis Charlton', '5 Great Western Road London', '078 0968 3845');
INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Laura Ingram', '9 Princes Street London', '078 4580 2478');
INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Jonathan Frost', '29 Frog Street London', '078 4580 2324');

INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Harvey Short', '31 Crown Street Belfast', '070 8295 7435');
INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Peter Dinklage', '21 Roughly Terrace Belfast', '070 8851 2378');
INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Barry Bingham', '90 Donegal Road Belfast', '070 8851 2328');
INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Eric Stansted', '12 Queens Road Belfast', '070 8851 2456');

INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Ruby Heath', '88 Cefn Road New York', '070 6654 2234');
INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Gary German', '97 Town Lane New York', '070 6654 1234');
INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Barry Baldstein', '32 South Western Terrace New York', '070 6654 5432');
INSERT INTO CUSTOMER (CustomerName, CustomerAddress, ContactNumber) VALUES ('Kareth Konstantine', '22 South Crescent New York', '070 6654 2018');

INSERT INTO CENTRE_TYPE(CentreTypeId, CentreType) VALUES (1, 'Store');
INSERT INTO CENTRE_TYPE(CentreTypeId, CentreType) VALUES (2, 'Depot');
INSERT INTO CENTRE_TYPE(CentreTypeId, CentreType) VALUES (3, 'Postbox');
INSERT INTO CENTRE_TYPE(CentreTypeId, CentreType) VALUES (4, 'Post Office');

INSERT INTO DELIVERY_TYPE(DeliveryTypeId, DeliveryType) VALUES (1, 'Segway');
INSERT INTO DELIVERY_TYPE(DeliveryTypeId, DeliveryType) VALUES (2, 'Drone');
INSERT INTO DELIVERY_TYPE(DeliveryTypeId, DeliveryType) VALUES (3, 'Pigeon');
INSERT INTO DELIVERY_TYPE(DeliveryTypeId, DeliveryType) VALUES (4, 'Truck');
INSERT INTO DELIVERY_TYPE(DeliveryTypeId, DeliveryType) VALUES (5, 'Plane');
INSERT INTO DELIVERY_TYPE(DeliveryTypeId, DeliveryType) VALUES (6, 'Boat');

INSERT INTO RETAIL_CENTRE(CentreType, CentreAddress) VALUES (2, 'Belfast');
INSERT INTO RETAIL_CENTRE(CentreType, CentreAddress) VALUES (1, 'London');
INSERT INTO RETAIL_CENTRE(CentreType, CentreAddress) VALUES (4, 'New York');
INSERT INTO RETAIL_CENTRE(CentreType, CentreAddress) VALUES (2, 'New York');
INSERT INTO RETAIL_CENTRE(CentreId, CentreType, CentreAddress) VALUES (1025, 3, 'Liverpool');

INSERT INTO TRANSPORTATION_EVENT(TransportationType, DeliveryRoute) VALUES (6, 'Liverpool to London');	
INSERT INTO TRANSPORTATION_EVENT(TransportationType, DeliveryRoute) VALUES (2, 'Liverpool to London');	
INSERT INTO TRANSPORTATION_EVENT(TransportationType, DeliveryRoute) VALUES (5, 'Liverpool to London');
INSERT INTO TRANSPORTATION_EVENT(TransportationType, DeliveryRoute) VALUES (6, 'London to Belfast');	
INSERT INTO TRANSPORTATION_EVENT(TransportationType, DeliveryRoute) VALUES (1, 'New York to Belfast');	
INSERT INTO TRANSPORTATION_EVENT(TransportationType, DeliveryRoute) VALUES (4, 'Belfast to New York');	

INSERT INTO DELIVERY_ITEM(ItemWeight, Dimensions, InsuranceAmount, DestinationAddress, DeliveryDate, CustomerId, SourceId, ScheduleNumber)
VALUES (3, '2x2x4', 1000.0, 'London', '2020-04-01', 1, 1025, 1);

INSERT INTO DELIVERY_ITEM(ItemWeight, Dimensions, InsuranceAmount, DestinationAddress, DeliveryDate, CustomerId, SourceId, ScheduleNumber)
VALUES (5, '4x9x2', 15000.0, 'London', '2020-04-01', 1, 1025, 2);

INSERT INTO DELIVERY_ITEM(ItemWeight, Dimensions, InsuranceAmount, DestinationAddress, DeliveryDate, CustomerId, SourceId, ScheduleNumber)
VALUES (4, '9x9x2', 17000.0, 'London', '2020-04-01', 1, 1025, 3);

INSERT INTO DELIVERY_ITEM(ItemWeight, Dimensions, InsuranceAmount, DestinationAddress, DeliveryDate, CustomerId, SourceId, ScheduleNumber)
VALUES (8, '2x2x4', 19000.0, 'Belfast', '2020-04-01', 5, 3, 1);

INSERT INTO DELIVERY_ITEM(ItemWeight, Dimensions, InsuranceAmount, DestinationAddress, DeliveryDate, CustomerId, SourceId, ScheduleNumber)
VALUES (30, '2x2x4', 21000.0, 'Belfast', '2020-04-01', 5, 4, 1);

INSERT INTO DELIVERY_ITEM(ItemWeight, Dimensions, InsuranceAmount, DestinationAddress, DeliveryDate, CustomerId, SourceId, ScheduleNumber)
VALUES (45, '2x2x4', 21000.0, 'New York', '2020-04-01', 9, 3, 1);

INSERT INTO DELIVERY_ITEM(ItemWeight, Dimensions, InsuranceAmount, DestinationAddress, DeliveryDate, CustomerId, SourceId, ScheduleNumber)
VALUES (37, '2x2x4', 19000.0, 'New York', '2020-04-01', 11, 4, 1);

INSERT INTO DELIVERY_ITEM(ItemWeight, Dimensions, InsuranceAmount, DestinationAddress, DeliveryDate, CustomerId, SourceId, ScheduleNumber)
VALUES (35, '2x2x4', 7500.0, 'New York', '2020-04-01', 12, 3, 1);

INSERT INTO DELIVERY_ITEM(ItemWeight, Dimensions, InsuranceAmount, DestinationAddress, DeliveryDate, CustomerId, SourceId, ScheduleNumber)
VALUES (1, '2x2x4', 4000.0, 'New York', '2020-04-01', 10, 4, 1);

INSERT INTO DELIVERY_ITEM(ItemWeight, Dimensions, InsuranceAmount, DestinationAddress, DeliveryDate, CustomerId, SourceId, ScheduleNumber)
VALUES (1, '2x2x4', 10000.0, 'New York', '2020-04-01', 9, 3, 1);

INSERT INTO DELIVERY_ITEM(ItemNumber, ItemWeight, Dimensions, InsuranceAmount, DestinationAddress, DeliveryDate, SourceId, CentreId, ScheduleNumber)
VALUES (90876442, 7, '2x2x4', 6000.0, 'New York', '2020-04-01', 11, 4, 1);

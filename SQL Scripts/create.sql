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
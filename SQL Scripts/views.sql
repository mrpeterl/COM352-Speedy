-- Customer View

-- Create the view in the specified schema
CREATE VIEW Speedy.CustomerView
AS
    SELECT TRANSPORTATION_EVENT.DeliveryRoute
    FROM Speedy.TRANSPORTATION_EVENT
    JOIN Speedy.DELIVERY_ITEM ON Speedy.DELIVERY_ITEM.ScheduleNumber = Speedy.TRANSPORTATION_EVENT.ScheduleNumber
    JOIN Speedy.CUSTOMER ON Speedy.CUSTOMER.CustomerId = Speedy.DELIVERY_ITEM.CustomerId
    WHERE Speedy.CUSTOMER.CustomerId = '1';

CREATE VIEW Speedy.RetailIncoming
AS
    SELECT * 
    FROM Speedy.DELIVERY_ITEM 
    JOIN Speedy.RETAIL_CENTRE ON Speedy.RETAIL_CENTRE.CentreAddress = Speedy.DELIVERY_ITEM.DestinationAddress
    WHERE Speedy.DELIVERY_ITEM.DestinationAddress = '2'
    AND Speedy.DELIVERY_ITEM.DeliveryDate = DATE_ADD(CURDATE(), INTERVAL 1 DAY);

CREATE VIEW Speedy.RetailOutgoing
AS
    SELECT *
    FROM Speedy.DELIVERY_ITEM
    JOIN Speedy.RETAIL_CENTRE ON Speedy.RETAIL_CENTRE.CentreAddress = Speedy.DELIVERY_ITEM.SourceId
    WHERE Speedy.RETAIL_CENTRE.CentreId = '1'
    AND Speedy.DELIVERY_ITEM.DeliveryDate = NOW();

-- CREATE TABLE DELIVERY_ITEM (
--     ItemNumber INT NOT NULL IDENTITY PRIMARY KEY,
--     ItemWeight INT,
--     Dimensions VARCHAR(11),
--     InsuranceAmount DECIMAL(11, 2),
--     DestinationAddress VARCHAR(100),
--     DeliveryDate DATE,
--     CustomerId INT,
--     CentreId INT,
--     ScheduleNumber INT,
--     FOREIGN KEY (CustomerId) REFERENCES CUSTOMER(CustomerId),
--     FOREIGN KEY(CentreId) REFERENCES CENTRE(CentreId),
--     FOREIGN KEY(ScheduleNumber) REFERENCES TRANSPORTATION_EVENT(ScheduleNumber)
-- );

-- CREATE TABLE TRANSPORTATION_EVENT (
--     ScheduleNumber INT NOT NULL IDENTITY PRIMARY KEY,
--     TransportationType INT,
--     DeliveryRoute VARCHAR(100),
--     FOREIGN KEY (TransportationType) REFERENCES DELIVERY_TYPE(DeliveryTypeId)
-- );
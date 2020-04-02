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
    WHERE Speedy.DELIVERY_ITEM.DestinationAddress = 'New York'
    AND Speedy.DELIVERY_ITEM.DeliveryDate = DATE_ADD(CURDATE(), INTERVAL 1 DAY);

CREATE VIEW Speedy.RetailOutgoing
AS
    SELECT *
    FROM Speedy.DELIVERY_ITEM
    WHERE Speedy.DELIVERY_ITEM.SourceId = '3'
    AND Speedy.DELIVERY_ITEM.DeliveryDate = DATE_ADD(CURDATE(), INTERVAL 1 DAY);

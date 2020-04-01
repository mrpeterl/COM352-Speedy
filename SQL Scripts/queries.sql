-- Query 1
SELECT *
FROM DELIVERY_ITEM
WHERE InsuranceAmount > 5000
AND InsuranceAmount < 20000
AND DestinationAddress = 'New York';

-- Query 2

SELECT TRANSPORTATION_EVENT.DeliveryRoute
FROM DELIVERY_ITEM
JOIN TRANSPORTATION_EVENT
ON TRANSPORTATION_EVENT.ScheduleNumber = DELIVERY_ITEM.ScheduleNumber
WHERE DELIVERY_ITEM.ItemNumber = '90876442';

-- Query to allow retail centres to delay the arrival of items to their centre if overloaded

UPDATE DELIVERY_ITEM
SET DeliveryDate = DATE_ADD(CURDATE(), INTERVAL 1 DAY)
WHERE DeliveryDate = CURDATE()
AND SourceId = 1;
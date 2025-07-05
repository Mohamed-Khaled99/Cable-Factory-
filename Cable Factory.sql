CREATE VIEW Production_Quality AS

SELECT 
    dt.[Date],
    dt.[Month],
    dt.[Weekday],
    p.Batch_ID,
    p.Produced_Length,
    p.Scrap_Generated,
    p.Operator,
    d.Product_Type,
    m.Machine_Name,
    m.Department,
    q.Result,
    q.Defect_Type,
    q.Inspector_Name
FROM Fact_Production p
LEFT JOIN Date dt ON p.Date_ID = dt.Date_ID
LEFT JOIN Product d ON p.Product_ID = d.Product_ID
LEFT JOIN Machine m ON p.Machine_ID = m.Machine_ID
LEFT JOIN Fact_Quality_Inspection q ON p.Batch_ID = q.Batch_ID AND p.Date_ID = q.Date_ID;


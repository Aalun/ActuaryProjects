CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    RiskCategory VARCHAR(10)
);

CREATE TABLE Claims (
    ClaimID INT PRIMARY KEY,
    CustomerID INT,
    ClaimAmount DECIMAL(10,2),
    ClaimDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, Name, Age, RiskCategory)
VALUES
(1, 'John Smith', 45, 'Medium'),
(2, 'Sarah Lee', 32, 'Low'),
(3, 'Mike Johnson', 57, 'High'),
(4, 'Jane Doe', 28, 'Low');

INSERT INTO Claims (ClaimID, CustomerID, ClaimAmount, ClaimDate)
VALUES
(101, 1, 4000.00, '2024-06-01'),
(102, 1, 1500.00, '2024-07-15'),
(103, 2, 800.00, '2024-06-22'),
(104, 3, 12000.00, '2024-08-10'),
(105, 4, 600.00, '2024-09-12');

SELECT * FROM customers
  
SELECT * FROM claims

SELECT c.Name, SUM(cl.ClaimAmount) AS TotalClaims
FROM Customers c
JOIN Claims cl ON c.CustomerID = cl.CustomerID
GROUP BY c.Name;

SELECT c.RiskCategory, AVG(cl.ClaimAmount) AS AvgClaim
FROM Customers c
JOIN Claims cl ON c.CustomerID = cl.CustomerID
GROUP BY c.RiskCategory;

SELECT c.RiskCategory, AVG(cl.ClaimAmount) AS AvgClaim
FROM Customers c
JOIN Claims cl ON c.CustomerID = cl.CustomerID
GROUP BY c.RiskCategory;

SELECT c.Name, cl.ClaimAmount
FROM Customers c
JOIN Claims cl ON c.CustomerID = cl.CustomerID
WHERE c.Age > 40 AND cl.ClaimAmount > 3000;

SELECT * FROM Claims
ORDER BY ClaimAmount DESC
LIMIT 1;

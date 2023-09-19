-- Q1: List the properties for Rent and state how many?

SELECT *
FROM property_for_rent;

SELECT COUNT(Pno) AS 'no_properties'
FROM property_for_rent;

SELECT Type, AVG(Rent) AS Avg_Rent 
FROM property_for_rent
WHERE Type = 'Flat'
GROUP BY Type;

-- Q2: List the Branches and state how many?

SELECT *
FROM branch;

SELECT Count(Bno) AS no_branches
FROM branch;

-- Q3: List all information about the Staff?

SELECT *
FROM staff;

-- Q4a: List the Staff working at branch No. B5?

SELECT *
FROM staff
WHERE Bno = 'B5';

-- Q4b: Then for B5 and B3 together

SELECT *
FROM staff
WHERE Bno IN ('B5', 'B3');

-- Q5: List the Staff No, the names, addresses and Telephone Numbers for all staff members?

SELECT Sno, Fname, Address, TelNo
FROM staff;

-- Q6: Produce the following from the Estate Agency database:

SELECT Sno, CONCAT(Fname, ' ', Lname) AS Name, Position
FROM staff
WHERE Sno IN ('SL21', 'SG5')
ORDER BY Name;

-- Q7: List each Staff No, Staff name (first and surname), tel no & branch no in ascending order of name?

SELECT Sno, CONCAT(Fname, ' ', Lname) AS Name, TelNo, Bno
FROM staff
ORDER BY Name ASC;

-- Q8: Show the staff number of the person that is responsible for property PA14.

SELECT Sno, Pno
FROM property_for_rent
WHERE Pno = 'PA14';

-- Q9: Find Owners that live in Aberdeen?

SELECT *
FROM owner
WHERE Address LIKE '%Aberdeen%';

-- Q10: Find Owners whose first names begin with the letter ‘C’:

SELECT *
FROM owner
WHERE Fname LIKE 'C%';

-- Q11: Show the following for all properties:

SELECT Pno, Street, Rooms, Rent, Ono, Sno
FROM property_for_rent;

-- Q12: Then for property No: PG4.

SELECT Pno, Street, Rooms, Rent, Ono, Sno
FROM property_for_rent
WHERE Pno = 'PG4';

-- Q13: Or for owner No: CO46.

SELECT Pno, Street, Rooms, Rent, Ono, Sno
FROM property_for_rent
WHERE Pno = 'PG4'
OR Ono = 'CO46';

-- Q14: For properties that the rent is greater than 400.

SELECT Pno, Street, Rooms, Rent, Ono, Sno
FROM property_for_rent
WHERE Rent > 400 AND Rent < 470;

-- Q15: For properties that the rent is between 355 and 470.

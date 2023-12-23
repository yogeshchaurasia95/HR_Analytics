USE HR_ANALYTICS;

#1 Average Attrition rate for all Departments
SELECT DEPARTMENT,
SUM(CASE WHEN ATTRITION = "YES" THEN 1 ELSE 0 END) * 100 / COUNT(*) AS ATTRITION 
FROM HR_1
GROUP BY DEPARTMENT;


#2 Average Hourly rate of Male Research Scientist

SELECT avg(HourlyRate) AS AVG_HR_RATE 
FROM HR_1 
WHERE GENDER = "MALE" 
AND JOBROLE = "RESEARCH SCIENTIST";


#3 Attrition rate Vs Monthly income stats

SELECT Attrition, COUNT(*) AS ATTRITION_COUNT, SUM(MonthlyIncome) AS MONTHLY_INCOME
FROM HR_1 
JOIN HR_2 
ON HR_1.EmployeeNumber = hr_2.EmployeeID
WHERE ATTRITION = "YES"
GROUP BY ATTRITION;


#4 Average working years for each Department

SELECT DEPARTMENT, avg(TotalWorkingYears) AS AVG_WORKING_YEARS
FROM HR_1
JOIN HR_2 
ON HR_1.EmployeeNumber = hr_2.EmployeeID
GROUP BY DEPARTMENT;


#5 Job Role Vs Work life balance

SELECT JobRole, SUM(WorkLifeBalance) AS WORKLIFE_BALANCE
FROM HR_1
JOIN HR_2
ON HR_1.EmployeeNumber = hr_2.EmployeeID
GROUP BY JOBROLE;


#6 Attrition rate Vs Year since last promotion relation

SELECT ATTRITION, COUNT(*) AS ATTRITION_COUNT, SUM(YearsSinceLastPromotion) AS LAST_PROMOTION
FROM HR_1 
JOIN HR_2 
ON HR_1.EmployeeNumber = hr_2.EmployeeID
WHERE ATTRITION = "YES"
GROUP BY ATTRITION; 


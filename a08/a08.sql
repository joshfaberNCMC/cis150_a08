--Problem 3

SELECT * 
FROM jobs
WHERE jobTitle
LIKE '%software%' 
OR jobTitle
Like '%developer%'
OR jobTitle
LIKE '%programm%';

--Problem 4

SELECT *
FROM jobs
WHERE jobTitle
LIKE '%net%'
AND jobTitle
LIKE '%engineer%';

--Problem 5

SELECT *
FROM jobs
WHERE salaryFrom > 100000
AND salaryTo < 150000;

--Problem 6

SELECT *
FROM jobs
WHERE jobTitle
LIKE '%attorney%'
OR jobTitle
LIKE '%lawyer%';

--Problem 7

CREATE VIEW allData AS
SELECT jobs.jobID, jobs.agencyID, agencies.agencyTitle, jobs.jobTitle, jobs.salaryFrom, jobs.salaryTo, (jobs.salaryFROM + jobs.salaryTO) / 2 as salaryAvg
FROM jobs
JOIN agencies ON jobs.agencyID = agencies.agencyID
GROUP BY jobs.jobID
ORDER BY jobs.jobID ASC;

--Problem 8

CREATE TRIGGER aftInsert
AFTER INSERT 
ON jobs
BEGIN
INSERT INTO agencies (agencyID, agencyTitle)
VALUES (NULL, 'AGENCY NAME REQUIRED');
END

--Problem 9

WITH avgCTE AS
(SELECT salaryFrom, salaryTo, (salaryFrom + salaryTO) / 2 
AS salaryAvg 
FROM jobs)
SELECT jobs.jobID, jobs.agencyID, jobs.jobTitle, jobs.salaryFrom, jobs.salaryTo, avgCTE.salaryAvg
FROM jobs
JOIN avgCTE
ON jobs.salaryFrom = avgCTE.salaryFrom
AND jobs.salaryTo = avgCTE.salaryTo
GROUP BY jobs.jobID
ORDER BY avgCTE.salaryAvg ASC;
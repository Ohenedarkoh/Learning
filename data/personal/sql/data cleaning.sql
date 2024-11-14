-- query from the database
SELECT *
FROM layoffs;


-- create a table to copy data from the raw table into the created table
CREATE TABLE layoffs_staging
LIKE layoffs;


-- select the new table 
SELECT *
FROM layoffs_staging;


-- insert data into layoffs_staging from the layoffs 
INSERT layoffs_staging
SELECT *
FROM layoffs;

-- remove duplicates in the rows. if row numbers are two or more then there are duplicates
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,industry,total_laid_off,
percentage_laid_off,`date`) AS row_num
FROM layoffs_staging;


-- remove duplicates
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;
 
 
 
SELECT * 
FROM layoffs_staging
WHERE company= 'Casper';


WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,
location,industry,total_laid_off,
percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging
)
DELETE
FROM duplicate_cte
WHERE row_num > 1;



CREATE TABLE `layoffs_staging3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT * 
FROM layoffs_staging3
WHERE row_num > 1; 

INSERT INTO  layoffs_staging3
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,
location,industry,total_laid_off,
percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging;



DELETE
FROM layoffs_staging3
WHERE row_num > 1; 

SELECT * 
FROM layoffs_staging3;


-- standardize the dataset. Finding issues and fixing them.
-- trim the company column
SELECT company,TRIM(company)
FROM layoffs_staging3;

-- update the layoffs_staging3 by equating trim(company) to company column
UPDATE layoffs_staging3
SET company = TRIM(company);


-- replacing crypto
SELECT *
FROM layoffs_staging3
WHERE industry  LIKE 'Crypto%';

UPDATE layoffs_staging3
SET industry= 'Crypto'
WHERE industry LIKE ' Crypto&';

SELECT DISTINCT country, TRIM(Trailing '.' FROM country)
FROM layoffs_staging3
ORDER BY 1;

UPDATE layoffs_staging3
SET country= TRIM(Trailing '.' FROM country)
WHERE country LIKE 'United States%';


SELECT `date`
FROM layoffs_staging3;


UPDATE layoffs_staging3
SET `date`= STR_TO_DATE(`date`,'%m/%d/%Y');


ALTER TABLE layoffs_staging3
MODIFY COLUMN `date` DATE;


SELECT *
FROM layoffs_staging3
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

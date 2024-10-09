use  world_layoffs;
select count(*)from  layoffs;
drop table    layoffs_stagging;


-- creating stagging table from existing one ---
create table  layoffs_stagging like  layoffs;
select * from layoffs_stagging;
insert   layoffs_stagging  select * from layoffs;
select count(*) from layoffs_stagging;

-- checking for duplicate values--

 with duplictae_values AS  
(
select * , 
Row_number() over ( PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_count
 from layoffs_stagging) 
 select * from duplictae_values where row_count>1;
 
 CREATE TABLE `layoffs_stagging_2`(
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
 `row_count` int
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs_stagging_2 select * , 
Row_number() over ( PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_count
 from layoffs_stagging;
 
 -- deleting duplicate rows--
delete  from layoffs_stagging_2 where row_count >1;
select * from layoffs_stagging_2;

-- Standardising data--
select trim(company) from layoffs_stagging_2;
update layoffs_stagging_2  set company=trim(company);
select * from layoffs_stagging_2;
-- changing date format --
select date , str_to_date(`date`,'%m/%d/%Y') from layoffs_stagging_2;
update layoffs_stagging_2  set `date`=str_to_date(`date`,'%m/%d/%Y');

select date from layoffs_stagging_2;

ALTER TABLE layoffs_stagging_2 modify `date` date;

select * from layoffs_stagging_2   where industry like 'crypto%' order by 1;
update layoffs_stagging_2 set industry ='crypto' where industry like 'crypto%';
-- industry--
select *   from layoffs_stagging_2  where industry is NULL  or industry ='';

select *   from layoffs_stagging_2 where company='Airbnb';
update layoffs_stagging_2 set industry=null where industry is NULL  or industry ='';

Select t1. industry ,t2.industry from  layoffs_stagging_2 t1 join layoffs_stagging_2 t2  
on t1.company=t2.company 
AND t1.location=t2.location 
 where t1.industry is null ANd t2.industry is not null ;
 -- updating the industry value --
 update layoffs_stagging_2 t1 join layoffs_stagging_2 t2
 on t1.company=t2.company 
   set t1.industry=t2.industry  where t1.industry is null ANd t2.industry is not null ;

-- Deleting rows and column --

select * from layoffs_stagging_2 where total_laid_off is null and percentage_laid_off is null;
delete from layoffs_stagging_2 where total_laid_off is null and percentage_laid_off is null;

Alter  table layoffs_stagging_2 drop column row_count;

select * from layoffs_stagging_2;
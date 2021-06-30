# Module_Seven_Pewlett_Hackard_Analysis

## Project Overview
Pewlett Hackard requested an analysis of their employees to prepare them for the “silver tsunami” as many current employees reach retirement age. They requested the following data:

1. Determine the number of retiring employees per title.
2. Identify the employees who are elgible to participate in a mentorship program.

## Resources
- Data Source: Data folder
- Software: pgAdmin, PostgreSQL, Visual Studio Code

## Results
1. The number of retiring employees per title.
    - To determine the retiring employees per title, a query was written and executed to create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955.![retirement_titles.csv](https://github.com/LLeyva-bot/Pewlett_Hackard_Analysis/blob/main/Data/retirement_titles.csv). The Retirement Titles table includes 133,776 retiring employees and their title. However, there are duplicate entries for some employees because they have switched titles over the years.
    - To remove the duplicate entries, a new query was written and executed to create a Unique Titles table. The *DISTINCT ON()* SQL statement was used to remove these duplicates and keep only the most recent title of each employee. ![unique_titles.csv](https://github.com/LLeyva-bot/Pewlett_Hackard_Analysis/blob/main/Data/unique_titles.csv).The Unique Titles table displays 90,398 retiring employees and their title. 
    - Lastly,a query was written and executed to create a Retiring Ttiles table to retrieve the number of employees by their most recent job title who are about to retire.![retiring_titles.csv](https://github.com/LLeyva-bot/Pewlett_Hackard_Analysis/blob/main/Data/retiring_titles.csv).
        - Title = Senior Engineer -> 29,414 retiring employees
        - Title = Senior Staff -> 28,254 retiring employees
        - Title = Engineer -> 14,222 retiring employees
        - Title = Staff -> 12,243 retiring employees
        - Title = Technique Leader -> 4,502 retiring employees
        - Title = Assistant Engineer -> 1,761 retiring employees
        - Title = Manager -> 2 retiring employees
2. The employees who are elgible to participate in a mentorship program.
    - A query was written and executed to create a Mentorship Elgibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965. ![mentorship_elgibility.csv](https://github.com/LLeyva-bot/Pewlett_Hackard_Analysis/blob/main/Data/mentorship_eligibility.csv).  The Mentorship Elgibility table shows 1,549 employees are elgible to participate in a mentorship program.

## Summary
Using 65 as the starting age for retirement, the analysis confirms the "silver tsunami." Out of 300,024 employees, Pewlett Hackard has 90,398 employees in retirement age. They are in danger of losing 30% of their workforce. The largest employee loss will be in senior positions. Senior Engineer and Senior Staff employees make up 64% of the employees in retirement age. To prepare for turnover, Pewlett Hackard employees become eligible for the mentorship program at age 55. This year 1,549 employees will be eligible to particiapte but this will only cover 2% of the employee loss they will soon experience.
To better understand how prepared Pewlett Hackard is for the "silver tsunami", the mentorship_elgibility query was adjusted to determine the current employees who were born between January 1, 1964 and December 31, 1964(employees eligible to participate last year) and the current employees who were born between January 1, 1966 and December 31, 1966 (employees who will be elgible to participate next year). Last year 18,356 employees were eligible for the mentorship program. Yet, next year there will not be any employees eligible for the mentorship program. Based on the analysis, Pewlett Packard must make immediate changes to increase experienced personel to prepare for the current and future "silver tsunami."



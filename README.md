# Pewlett-Hackard-Analysis

## Objective:
The Objective of this analysis was two-fold.  First we analyzed our data to determine the number of employees ready for retirment sorted by their title.  Secondly, we generated a list of employees that would be eligible for the new mentorship program.  In order to conduct our analysis, we utilized data from the following sources: departments.csv, dept_emp.csv, titles.csv, salaries.csv, dept_manage.csv, and employees.csv.  Postgres was used to manipulate the data.

## Results:
The following are the major oints from this analysis:
    * Approximately 30% of the company's employees are expected to retire in the near future creating a massive employee gap.
    * From the employees nearing retirement, approximately 70% of them are in senior or leadership roles.  These roles require more extensive training and will be harder to fill.
    * The hardest hit departments are Development and Production, seen [here](https://github.com/kowiak89/Pewlett-Hackard-Analysis/blob/main/Table_Images/retirement_dept_count.png), accounting for approximatley 24% of all retiring employees.
    * The number of eployees eligible for the mentorship program (about 1500) may not be sufficient to help train the 90,000 roles that may soon be available.

## Summary:
Based on our analysis, there are 90,398 employees set to retire in the near future.  This comprises about 30% of all the employees at the company.  To account for this 'silver tsunami', a major hiring plan will need to be implemented and quickly.  The emplyees ready for retirment also represent more leadership roles in the company and thus require more training to fill the vacancy.  A mentorship program would greatly benefit the incoming new hires so long as there is a sufficient number of mentors available.  We found there are 1,549 employees eligible for the mentorship program.  Given that mentorship works best with a small new hire to mentor ratio, it is reasonable to conclude that there are not enough mentors to train the new generation of employees.

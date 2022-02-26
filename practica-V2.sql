SELECT e.first_name, e.last_name, h.start_date, e.salary, d.department_name, j.job_title
FROM employees e, departments d, jobs j, job_history h
WHERE e.department_id = d.department_id
AND e.employee_id = h.employee_id
AND e.job_id = j.job_id
AND salary >= 4500
AND salary < 15000;

SELECT e.employee_id, e.first_name, e.last_name, r.country_name, j.job_title
FROM employees e, countries r, jobs j
WHERE j.job_title = 'Accountant'
AND e.job_id = j.job_id

SELECT e.employee_id, e.first_name, e.last_name, l.city
FROM employees e, locations l
WHERE l.city = 'United States' 
OR l.city = 'Mexico City';

SELECT e.employee_id, e.first_name, e.last_name, r.country_name, d.department_name
FROM employees e, countries r, departments d
WHERE r.country_name = 'Unite Kingdom'
AND d.department_name = 'Sales';

SELECT e.first_name, e.last_name, r.region_name, e.salary, j.job_title,
TRUNC(SAL.AVG_SAL, 2)
FROM employees e, regions r, jobs j, 
	(SELECT job_id, AVG(salary) AVG_SAL
	FROM employees 
	GROUP BY job_id) SAL
WHERE e.job_id = j.job_id
AND SAL.job_id = e.job_id
AND e.salary < SAL.AVG_SAL
AND r.region_name = 'Americas';

SELECT n.country_name, r.region_name, COUNT(*)
FROM regions r, countries n, employees e
WHERE r.region_id = n.region_id
GROUP BY n.country_name, r.region_name
HAVING COUNT(*)>3;

SELECT e.first_name, e.last_name, j.job_title, h.start_date, h.end_date
FROM employees e, job_history h, jobs j
WHERE h.job_id = j.job_id
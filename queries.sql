
--------------------------------- Join With Two Tables-------------------------------------------------------------------
---Lists name,department and agi of employees where employees department id is equal to departments department id.
select employee_name, employee_surname, department_name
from employee , department
where employee.departmentid = department.department_id ;

---The same Query With Natural Join Keyword.
select employee_name, employee_surname, department_name
from department natural join employee 
where employee.departmentid = department.department_id ;


---Lists name surname and address of all employees.
select employee_name , employee_surname , address_text
from employee, address 
where address.user_id = employee.id ;
--------------------------------------------------------------------------------------------------------------------------


--------------------------------- Join With Three Tables-------------------------------------------------------------------
---Lists names surname shift no and department name of all employees.
select employee_name , employee_surname , shift_no, department_name
from employee, shift, department 
where shift.emp_id = employee.id and employee.departmentid = department.department_id ;

---The same Query With Natural Join Keyword.
select employee_name , employee_surname , shift_no, department_name
from employee natural join shift natural join department 
where shift.emp_id = employee.id and employee.departmentid = department.department_id ;
---------------------------------------------------------------------------------------------------------------------------

---------------------------------Full Outer Join-------------------------------------------------------------------

---Lists name,department and agi of employees where employees department id is equal to departments department id.
select employee_name, department_name,agi
from employee e
full outer join department d on e.departmentid = d.department_id;

---The Same Query with not using Full Outer Join Keyword.      
select employee_name, employee_surname, department_name,agi
from employee , department
where employee.departmentid = department.department_id ;
---------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------SUBQUERIES--------------------------------------------------------------

---Lists all employees with their name, salary and department id where their salary is bigger than the average salary. (MULTIPLE ROWS SUBQUERY)
select employee_name, total_salary, department_id
from employee , department 
where  employee.departmentid = department.department_id and total_salary >
(select AVG(total_salary)
from employee, department
where employee.departmentid = department.department_id);



---Lists all employees in the AR-GE department. (SCALAR SUBQUERY)
select id, employee_name, employee_surname, department_id, department_name
from employee, department
where department_name='AR-GE' and employee.departmentid = department.department_id ;


---Find the average employees’ salaries of those departments where the total salary is greater than 5500 TL. (FROM SUBQUERY)
select departmentid, total_salary
from ( select departmentid, avg (total_salary) 
from employee
group by departmentid) 
as department_average(departmentid,total_salary)
where total_salary > 5500
order by departmentid asc;

---------------------------------------------------------------------------------------------------------------------------





-----------------------KEYWORDS--------------------------------------------------------------------------------------------
--- Lists all employees whose salary is bigger than 5000.
select employee_name,employee_salary,total_salary 
from employee 
where employee_salary > 5000;

--- Lists people that whose leave reason is Work Accident and has no agi at the same time.
select id,employee_name,employee_surname , leave_reason 
from employee, leaves
where leaves.employee_id=employee.id and leave_reason = 'Work Accident' and agi_type ='-' ; 

---Lists all employees whose salary is greater and equal to 4500 or gender is male.
select employee_name, employee_surname , employee_salary 
from employee
where employee_gender = 'M' or employee_salary>=4500;

---Lists all different address texts.
select distinct address_text
from address;

---Finds all employees who have a child.
select *
from employee 
where exists ( select *
               from child 
               where employee.id = child.personal_id );
              
 ---Lists all employees who do not have a device.
select *
from employee
where not exists (select * 
                  from device 
                   where employee.id = device.employee_id  );

---Lists all projects that their starting date is between years 2015 and 2021              
select project_name,starting_date , due_date 
from project
where starting_date between '2015/01/01' and '2021/01/01';

---Lists total salary of all departments.
select department_name, sum(total_salary) as total_expensive
from department, employee
where employee.departmentid = department.department_id 
group by department_name ;

---Lists maximum salary in each department.
select department_name , max(total_salary) as max_salary
from employee, department 
where employee.departmentid = department.department_id 
group by department_name ;

---Lists minimum salary in each department.
select department_name , min(total_salary) as min_salary
from employee, department 
where employee.departmentid = department.department_id 
group by department_name ;


                                   
---Lists all name of employees except from employees that names Çiðdem and Mustafa.                                                                 
select distinct employee_name
from employee
where employee_name not in('Çiðdem','Mustafa');


---Lists all districts of employees whose district is Çankaya except from employees who have user id 2 and 8.
select district,address_id ,user_id 
from address, employee
where district in('Çankaya') and user_id not in (2,8) and address.user_id = employee.id;



---Lists all employees whose is married and who do not have agi_type at the same time.
(select employee_name, employee_surname from employee where marriage_status='yes')
intersect 
(select employee_name, employee_surname from employee where agi_type = '-');



---Lists all names of employees whose leave reason is COVID19 but not Maternity.
(select employee_id,employee_name,employee_surname,leave_reason from leaves,employee where leave_reason = 'COVID19' and leaves.employee_id=employee.id)
except
(select employee_id, leave_reason, employee_name,employee_surname from leaves,employee where leave_reason='Maternity' and leaves.employee_id=employee.id);



---Lists all employees whose department id is 100 and 200.
(select id, employee_name, employee_surname,department_name from employee, department where employee.departmentid = department.department_id and departmentid = 100)
union
(select id, employee_name, employee_surname, department_name from employee, department where employee.departmentid = department.department_id and departmentid = 200);





---Lists all employees whose salary is null.

select *
from employee
where marriage_status is null;


---Lists all employees whose salary is bigger than employees in Information Technologies department which has department id 100.
select employee_name, total_salary 
from employee
where total_salary > all (select total_salary
from employee
where departmentid = 100);  

---Lists at least one employee whose salary is bigger than employees in Security department which has department id 400.
select employee_name,total_salary 
from employee
where total_salary > some (select total_salary
from employee
where departmentid=400);


---Lists all employees in the AR-GE department whose name starts with M and ends with a.
select employee_name, employee_surname ,department_name
from employee, department
where department_name='AR-GE' and employee.departmentid = department.department_id and employee_name like 'M%a';

---Lists all employees in the Security department with uppercase name.
select upper(employee_name) as Upper_Case_EmployeeName, upper(employee_surname) as Upper_Case_EmployeeSurname ,department_name
from employee, department
where department_name = 'Security' and employee.departmentid = department.department_id;

---Lists all devices that employees use which has a name HP.
select device_name, id
from device, employee
where device_name like '%HP%' and device.employee_id = employee.id ;


---Lists all employees with their salaries in ascending order.
select employee_name, employee_surname ,employee_salary 
from employee 
order by employee_salary asc;

---Lists all project names in descending due date order.
select project_name,due_date 
from project
order by due_date desc ;

---Counts all number of employees whose id is bigger than 3 with respect to their districts.
select count(user_id), district   
FROM address 
GROUP by district HAVING COUNT(user_id) > 3;

---Lists all childs with his birth date name and parent id whose name is starting with F.
select child_birthdate, personal_id, child_name , child_surname 
from child
where child_name like 'F%';

---Computes average salary of the employees who has ID between 20 and 23, including 20 and 23 with AGI.
select avg(total_salary) 
from employee
where id  between 20 and 23;



---Lists all employees with their age.
SELECT employee_name , date_part('year',age(birth_date)) as age,
* FROM employee;


---Special Query 1
-- Lists all the employees in managerial status who has maternity leaves between years 2018 and 2020.
select employee_name, employee_surname, date_part('year',age(birth_date)) as age, department_name, leave_reason,status ,start_date as maternity_starting_date              
from employee, department, leaves
where start_date between '2018/01/01'and'2020/01/01' and leave_reason='Maternity' and status='Manager'
and employee.departmentid = department.department_id and leaves.employee_id = employee.id ;


---Special Query 2
--- married childless male also working in information technologies.
select  employee_name , employee_surname , department_name, employee_salary , agi as agi_fees, total_salary
from employee, department 
where employee_gender ='M' and department_name='Information Technologies' and employee.departmentid = department.department_id 
and marriage_status='yes' and agi_type='-';

--- a married man who has a child, working at information technologies.
select  employee_name , employee_surname , department_name, employee_salary , agi as agi_fees, total_salary
from employee, department 
where employee_gender ='M' and department_name='Information Technologies' and employee.departmentid = department.department_id 
and marriage_status='yes' and agi_type='One Child';

--- a married man who has two children, working at information technologies.
select  employee_name , employee_surname , department_name, employee_salary , agi as agi_fees, total_salary
from employee, department 
where employee_gender ='M' and department_name='Information Technologies' and employee.departmentid = department.department_id 
and marriage_status='yes' and agi_type='Two Children';

---single, childless and working at information technologies.
select  employee_name , employee_surname , department_name, employee_salary , agi as agi_fees, total_salary 
from employee, department 
where employee_gender ='M' and department_name='Information Technologies'  and employee.departmentid = department.department_id 
and marriage_status='no' and agi_type='-';


















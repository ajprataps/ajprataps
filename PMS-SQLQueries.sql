#PMS - SQL Questions:
#1. Software Engineers address and Type of employement who have earned a bonus of more than Rs. 100?
select e.address Address, e.postal_code PostalCode, e.type_of_employment TypeOfEmployment 
from pmsdb.employee e, pmsdb.compensation c
where e.employee_id = c.employee_id
and e.designation = 'Software Engineer'
and c.bonus >= 100;

#2. How many employees took medical leaves in 2020?
select count(employee_id) EmployeesOnMedicalLeaves
from pmsdb.leave_taken
where leave_id=1
and year(to_date) = '2020'
and year(from_date) = '2020';

#3. Details of the employees working in HR department?
select *
from pmsdb.employee e, pmsdb.department d
where e.department_id = d.department_id
and d.department_name='Human Resource';

#4. Name the employees who pays income tax and do not apply for travel allowances?
select e.employee_name EmployeeName
from pmsdb.employee e
where employee_id=(select e.employee_id
                    from pmsdb.deductions d, pmsdb.allowances a
                    where e.employee_id=a.employee_id 
                    and e.employee_id=d.employee_id 
                    and income_tax!=0 
                    and travel_allowance=0);

#5. Average net income received by a research department employees?
select avg(net_income) TotalNetIncome
from pmsdb.employee e, pmsdb.salary s
where e.employee_id=s.employee_id 
and department_id=2;

#6. Total number of employees in each department
select d.department_name, count(d.department_id) TotalNoOfEmployeeInEachDepartment
from pmsdb.employee e, pmsdb.department d
where e.department_id = d.department_id
group by d.department_id;
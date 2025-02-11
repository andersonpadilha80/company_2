-- Número de empregados por departamento e localidade
CREATE VIEW emp_dept_location AS
SELECT d.Dnumber, dl.Dlocation, COUNT(e.Ssn) AS num_employees
FROM department d
JOIN dept_locations dl ON d.Dnumber = dl.Dnumber
JOIN employee e ON e.Dno = d.Dnumber
GROUP BY d.Dnumber, dl.Dlocation;


-- Lista de departamentos e seus gerentes
CREATE VIEW dept_managers AS
SELECT d.Dname, e.Fname, e.Lname, e.Ssn
FROM department d
JOIN employee e ON d.Mgr_ssn = e.Ssn;


-- Projetos com maior número de empregados (ordenados de forma decrescente)
CREATE VIEW projects_with_employees AS
SELECT p.Pname, p.Pnumber, p.Plocation, p.Dnum, COUNT(w.Essn) AS num_employees
FROM project p
JOIN works_on w ON p.Pnumber = w.Pno
GROUP BY p.Pname, p.Pnumber, p.Plocation, p.Dnum
ORDER BY num_employees DESC;


-- Quais empregados possuem dependentes e se são gerentes
CREATE VIEW emp_with_dependents_and_managers AS
SELECT e.Fname, e.Lname, e.Ssn, COUNT(dep.Dependent_name) AS num_dependents,
       CASE 
           WHEN e.Ssn = d.Mgr_ssn THEN 'Yes'
           ELSE 'No'
       END AS Is_Manager
FROM employee e
LEFT JOIN dependent dep ON e.Ssn = dep.Essn
LEFT JOIN department d ON e.Ssn = d.Mgr_ssn
GROUP BY e.Ssn;




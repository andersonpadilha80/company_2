-- Criação de índices para otimizar as consultas
-- Índices criados com base nas queries solicitadas

-- Qual o departamento com maior número de funcionários?
SELECT Dno, COUNT(*) AS total_funcionarios
FROM employee
GROUP BY Dno
ORDER BY total_funcionarios DESC
LIMIT 1;

-- Índice para otimizar a consulta acima
CREATE INDEX idx_employee_dno ON employee(Dno);

-- Motivo: 
-- Esse índice melhora a performance da contagem de funcionários por departamento, pois evita uma varredura completa da tabela (Full Table Scan).
-- A busca por Dno (departamento) será mais rápida.



-- Quais são os departamentos por cidade?
SELECT d.Dname, dl.Dlocation
FROM department d
JOIN dept_locations dl ON d.Dnumber = dl.Dnumber
ORDER BY dl.Dlocation;

-- Índices para otimizar a consulta acima
CREATE INDEX idx_department_dnumber ON department(Dnumber);
CREATE INDEX idx_dept_locations_dnumber ON dept_locations(Dnumber);
CREATE INDEX idx_dept_locations_dlocation ON dept_locations(Dlocation);

-- Motivo: 
-- idx_department_dnumber e idx_dept_locations_dnumber otimizam o JOIN entre department e dept_locations.
-- idx_dept_locations_dlocation acelera a ordenação por cidade (ORDER BY dl.Dlocation).



-- Relação de empregados por departamento
SELECT e.Fname, e.Lname, d.Dname
FROM employee e
JOIN department d ON e.Dno = d.Dnumber
ORDER BY d.Dname;

-- Índices para otimizar a consulta acima
CREATE INDEX idx_employee_dno ON employee(Dno); -- Já criado anteriormente
CREATE INDEX idx_department_dnumber ON department(Dnumber); -- Já criado anteriormente
CREATE INDEX idx_department_dname ON department(Dname);

-- Motivo: 
-- idx_employee_dno otimiza a junção entre employee e department.
-- idx_department_dnumber acelera a correspondência entre tabelas.
-- idx_department_dname melhora a ordenação por nome do departamento (ORDER BY Dname).

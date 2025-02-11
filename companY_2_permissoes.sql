-- Criação do usuário "gerente"
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senha_segura';

-- Atribuição de permissões sobre as views
GRANT SELECT ON emp_dept_location TO 'gerente'@'localhost';
GRANT SELECT ON dept_managers TO 'gerente'@'localhost';
GRANT SELECT ON projects_with_employees TO 'gerente'@'localhost';
GRANT SELECT ON project_dept_managers TO 'gerente'@'localhost';
GRANT SELECT ON emp_with_dependents_and_managers TO 'gerente'@'localhost';

-- Atribuindo permissões de acesso aos dados de employee e department
GRANT SELECT ON employee TO 'gerente'@'localhost';
GRANT SELECT ON department TO 'gerente'@'localhost';

-- Rejeitar acesso ao conteúdo de empregados com gerentes
DENY SELECT ON department TO 'gerente'@'localhost'; 


-- Teste de Permissões
-- Conecte-se com o usuário "gerente" e teste o acesso a uma view, por exemplo:
-- Acessar a view dos departamentos e seus gerentes
SELECT * FROM dept_managers;


-- Teste também uma tentativa de acesso direto à tabela department:
-- Tentativa de acessar diretamente a tabela department
SELECT * FROM department;


# 📌 README - Modelagem de Banco de Dados

## 📖 Visão Geral
Este projeto contém a modelagem de um banco de dados relacional para a gestão de funcionários, departamentos e projetos dentro de uma organização. O banco de dados inclui tabelas para armazenar informações sobre funcionários, departamentos, localizações, projetos, atribuições de trabalho e dependentes.

---

## 🗂️ Estrutura do Banco de Dados

### 🔹 1. `employee` (Funcionários)
Armazena informações dos funcionários da organização.
- **`Ssn`** *(CHAR(9))* - 🔑 Chave primária, identificador único do funcionário.
- **`Fname`, `Minit`, `Lname`** - Nome do funcionário.
- **`Bdate`** - Data de nascimento.
- **`Address`** - Endereço residencial.
- **`Sex`** - Gênero do funcionário.
- **`Salary`** - Salário do funcionário.
- **`Super_ssn`** - 🔗 Chave estrangeira referenciando outro funcionário como supervisor.
- **`Dnumber`** - 🔗 Chave estrangeira referenciando o departamento ao qual pertence.

### 🔹 2. `department` (Departamentos)
Armazena informações dos departamentos da empresa.
- **`Dnumber`** *(INT)* - 🔑 Chave primária.
- **`Dname`** - Nome do departamento *(único)*.
- **`Mgr_ssn`** - 🔗 Chave estrangeira referenciando o gerente do departamento.
- **`Mgr_start_date`** - Data de início da gerência.

### 🔹 3. `dept_locations` (Localizações dos Departamentos)
Armazena os locais onde os departamentos operam.
- **`Dnumber`** - 🔗 Chave estrangeira referenciando um departamento.
- **`Dlocation`** - Localização específica.

### 🔹 4. `project` (Projetos)
Armazena informações sobre os projetos da empresa.
- **`Pnumber`** *(INT)* - 🔑 Chave primária.
- **`Pname`** - Nome do projeto *(único)*.
- **`Plocation`** - Localização do projeto.
- **`Dnumber`** - 🔗 Chave estrangeira referenciando o departamento responsável pelo projeto.

### 🔹 5. `works_on` (Trabalha em)
Relaciona funcionários aos projetos nos quais estão trabalhando.
- **`Essn`** - 🔗 Chave estrangeira referenciando um funcionário.
- **`Pnumber`** - 🔗 Chave estrangeira referenciando um projeto.
- **`Hours`** - Quantidade de horas trabalhadas no projeto.

### 🔹 6. `dependent` (Dependentes)
Armazena informações sobre os dependentes dos funcionários.
- **`Essn`** - 🔗 Chave estrangeira referenciando um funcionário.
- **`Dependent_name`** - Nome do dependente.
- **`Sex`** - Gênero do dependente.
- **`Bdate`** - Data de nascimento.
- **`Relationship`** - Relação com o funcionário *(filho, cônjuge, etc.)*.

---

## ✅ Regras de Integridade e Relacionamentos
✔️ Cada funcionário pertence a um **departamento**.  
✔️ Cada departamento pode ter **múltiplos locais de operação**.  
✔️ Cada funcionário pode trabalhar em **múltiplos projetos**, e cada projeto pode ter **múltiplos funcionários**.  
✔️ Cada projeto está associado a um **único departamento**.  
✔️ Cada funcionário pode ter **dependentes**.  
✔️ `ON DELETE CASCADE` foi aplicado para evitar registros órfãos nas tabelas dependentes.  
✔️ `ON DELETE SET NULL` foi aplicado para gerentes e supervisores, evitando inconsistências.

---

## 📊 Dados de Exemplo
📌 O script já inclui um conjunto de **dados iniciais** para facilitar a utilização e testes do banco de dados. Os dados adicionados incluem:
- Funcionários com informações pessoais e salários.
- Dependentes associados a funcionários.
- Departamentos com seus respectivos gerentes.
- Localizações de departamentos.
- Projetos vinculados a departamentos.
- Relações de funcionários trabalhando em projetos com carga horária definida.

---

## 🚀 Índices Criados
Para otimizar as consultas, foram criados os seguintes índices:

🔹 **`idx_employee_dno`** *(employee.Dno)*  
   - ✅ Otimiza a contagem de funcionários por departamento.  
   - ✅ Melhora a performance de junções entre `employee` e `department`.  

🔹 **`idx_department_dnumber`** *(department.Dnumber)*  
   - ✅ Facilita a junção entre `department` e `dept_locations`.  
   - ✅ Melhora a performance de consultas relacionadas a departamentos.  

🔹 **`idx_dept_locations_dnumber`** *(dept_locations.Dnumber)*  
   - ✅ Acelera a correspondência entre `department` e `dept_locations`.  

🔹 **`idx_dept_locations_dlocation`** *(dept_locations.Dlocation)*  
   - ✅ Melhora a ordenação por cidade *(ORDER BY dl.Dlocation)*.  

🔹 **`idx_department_dname`** *(department.Dname)*  
   - ✅ Acelera a ordenação por nome do departamento *(ORDER BY d.Dname)*.

Esses índices ajudam a reduzir o tempo de execução das consultas e melhoram a escalabilidade do banco de dados.

---

## 🛠️ Views Criadas

As seguintes **views** foram criadas para facilitar o acesso aos dados de forma personalizada e otimizada:

### 🔹 1. **`emp_dept_location`** - Número de empregados por departamento e localidade  
Exibe o número de empregados por departamento e localidade. Esta view é útil para analisar a distribuição de funcionários em diferentes locais e departamentos da organização.

### 🔹 2. **`dept_managers`** - Lista de departamentos e seus gerentes  
Exibe os departamentos e seus respectivos gerentes. Permite visualizar quais funcionários são responsáveis pela gestão de cada departamento.

### 🔹 3. **`projects_with_employees`** - Projetos com maior número de empregados (ordenados de forma decrescente)  
Exibe os projetos e o número de empregados que trabalham neles, ordenados de forma decrescente com base no número de empregados. Ideal para identificar os projetos com maior equipe.

### 🔹 4. **`project_dept_managers`** - Lista de projetos, departamentos e gerentes  
Exibe os projetos, o departamento responsável e o gerente desse departamento. Fornece uma visão clara da relação entre projetos e suas respectivas equipes de gestão.

### 🔹 5. **`emp_with_dependents_and_managers`** - Empregados com dependentes e se são gerentes  
Exibe os empregados, o número de dependentes e se são gerentes de departamento. Essa view ajuda a identificar quais funcionários têm dependentes e ocupam posições de liderança.

---

## 🔧 Procedures para Manipulação de Dados
Foram criadas **procedures** para facilitar a manipulação dos dados, incluindo operações de **SELECT, INSERT, UPDATE e DELETE**.

Duas versões do script foram desenvolvidas:  
1️⃣ **Procedures para Banco de Dados da Universidade**  
2️⃣ **Procedures para Banco de Dados do E-commerce**

Cada procedure possui uma variável de controle que define a operação desejada:  
- **1 → SELECT**  
- **2 → INSERT**  
- **3 → UPDATE**  
- **4 → DELETE**

Essas procedures garantem que as operações de manipulação sejam realizadas de forma segura e eficiente, reduzindo a redundância de código e melhorando a manutenção do banco de dados.

---

## 🌟 Melhorias Futuras
🔹 Implementar tabelas adicionais para **benefícios** e **cargos dos funcionários**.  
🔹 Criar **stored procedures** para operações comuns, como **promoção de funcionários**.  
🔹 Adicionar **constraints** e **triggers** para maior controle dos dados.

---

## 👨‍💻 Autor
Este banco de dados foi modelado para fins **acadêmicos e profissionais**, seguindo boas práticas de **modelagem relacional**. 💡📊

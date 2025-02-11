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

## 🔧 Como Utilizar
1️⃣ Execute o script SQL para **criar o banco de dados e as tabelas**.
2️⃣ O script já contém **dados pré-carregados**. Caso queira adicionar mais informações, utilize comandos `INSERT INTO` conforme necessário.
3️⃣ Utilize **consultas SQL** para gerenciar os dados conforme necessário.

---

## 🌟 Melhorias Futuras
🔹 Implementar tabelas adicionais para **benefícios** e **cargos dos funcionários**.
🔹 Criar **stored procedures** para operações comuns, como **promoção de funcionários**.
🔹 Adicionar **constraints** e **triggers** para maior controle dos dados.

---

## 👨‍💻 Autor
Este banco de dados foi modelado para fins **acadêmicos e profissionais**, seguindo boas práticas de **modelagem relacional**. 💡📊


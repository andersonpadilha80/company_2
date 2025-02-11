-- Trigger de Remoção de Clientes (Antes de Excluir)
--Quando um cliente exclui sua conta, queremos garantir que as informações sejam arquivadas em uma tabela de histórico antes de serem removidas. Isso preserva os dados em caso de exclusão, sem que os dados sejam perdidos permanentemente.
DELIMITER $$

CREATE TRIGGER before_client_delete
BEFORE DELETE ON clients
FOR EACH ROW
BEGIN
    -- Inserir informações do cliente na tabela de histórico antes da exclusão
    INSERT INTO client_history (client_id, client_type, client_address, deleted_at)
    VALUES (OLD.client_id, OLD.client_type, OLD.client_address, NOW());

    -- Inserir dados específicos de PF ou PJ na tabela de histórico
    IF OLD.client_type = 'PF' THEN
        INSERT INTO client_history_pf (client_pf_id, client_first_name, client_last_name, client_cpf, client_date_of_birth, deleted_at)
        VALUES (OLD.client_id, OLD.client_first_name, OLD.client_last_name, OLD.client_cpf, OLD.client_date_of_birth, NOW());
    ELSE
        INSERT INTO client_history_pj (client_pj_id, client_social_name, client_cnpj, deleted_at)
        VALUES (OLD.client_id, OLD.client_social_name, OLD.client_cnpj, NOW());
    END IF;
END $$

DELIMITER ;

-- Explicação:
-- A trigger before_client_delete garante que antes de excluir qualquer cliente da tabela clients, os dados são movidos para tabelas de histórico (client_history, client_history_pf, client_history_pj), garantindo que as informações não sejam perdidas.




-- Trigger de Atualização de Colaboradores (Antes de Atualizar Salário)
-- Quando o salário de um colaborador é atualizado, vamos salvar o histórico anterior do salário na tabela salary_history para manter o histórico de salários anteriores dos colaboradores.

DELIMITER $$

CREATE TRIGGER before_update_salary
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    -- Verificar se o salário está sendo alterado
    IF OLD.salary <> NEW.salary THEN
        -- Inserir o salário antigo na tabela de histórico
        INSERT INTO salary_history (employee_id, old_salary, new_salary, changed_at)
        VALUES (OLD.employee_id, OLD.salary, NEW.salary, NOW());
    END IF;
END $$

DELIMITER ;

-- Explicação:
-- A trigger before_update_salary é ativada antes de atualizar os dados da tabela employees. Se o salário do colaborador for alterado, o valor antigo e o novo são armazenados na tabela salary_history.




-- Trigger de Atualização para Colaboradores
-- Além da atualização do salário, podemos criar uma trigger que armazene todas as alterações nos dados de colaboradores, como mudanças no cargo ou status.

DELIMITER $$

CREATE TRIGGER before_employee_update
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    -- Registrar alterações nos dados do colaborador, como cargo ou status
    IF OLD.position <> NEW.position OR OLD.status <> NEW.status THEN
        INSERT INTO employee_history (employee_id, old_position, new_position, old_status, new_status, updated_at)
        VALUES (OLD.employee_id, OLD.position, NEW.position, OLD.status, NEW.status, NOW());
    END IF;
END $$

DELIMITER ;

-- Explicação:
-- A trigger before_employee_update armazena as alterações nos cargos e status dos colaboradores na tabela employee_history antes que os dados sejam atualizados na tabela employees.

-- Observações:
-- Histórico de Clientes e Colaboradores: A ideia de arquivar informações antes de uma exclusão ou atualização é importante para o histórico dos dados e permite auditoria ou recuperação de dados.
-- Tabela de Histórico: Você precisará criar as tabelas client_history, client_history_pf, client_history_pj, salary_history e employee_history para que as triggers funcionem corretamente.
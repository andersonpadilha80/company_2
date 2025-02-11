-- Banco de Dados: Universidade
USE universidade;

DELIMITER //
CREATE PROCEDURE sp_manipular_departamentos(
    IN acao INT,
    IN p_departamento_id INT,
    IN p_nome VARCHAR(100),
    IN p_localizacao VARCHAR(100)
)
BEGIN
    IF acao = 1 THEN
        -- Selecionar departamento
        SELECT * FROM departamentos WHERE departamento_id = p_departamento_id;
    ELSEIF acao = 2 THEN
        -- Inserir departamento
        INSERT INTO departamentos (nome, localizacao) VALUES (p_nome, p_localizacao);
    ELSEIF acao = 3 THEN
        -- Atualizar departamento
        UPDATE departamentos SET nome = p_nome, localizacao = p_localizacao WHERE departamento_id = p_departamento_id;
    ELSEIF acao = 4 THEN
        -- Remover departamento
        DELETE FROM departamentos WHERE departamento_id = p_departamento_id;
    END IF;
END //
DELIMITER ;

-- Chamada da procedure (Exemplo: Inserindo um departamento)
CALL sp_manipular_departamentos(2, NULL, 'Engenharia', 'Bloco B');


-- Banco de Dados: E-commerce
USE ecommerce;

DELIMITER //
CREATE PROCEDURE sp_manipular_clientes(
    IN acao INT,
    IN p_client_id INT,
    IN p_client_type ENUM('PF', 'PJ'),
    IN p_client_address VARCHAR(100),
    IN p_client_name VARCHAR(100),
    IN p_client_document CHAR(14)
)
BEGIN
    IF acao = 1 THEN
        -- Selecionar cliente
        SELECT * FROM clients WHERE client_id = p_client_id;
    ELSEIF acao = 2 THEN
        -- Inserir cliente
        INSERT INTO clients (client_type, client_address) VALUES (p_client_type, p_client_address);
        
        IF p_client_type = 'PF' THEN
            INSERT INTO clients_pf (client_pf_id, client_first_name, client_cpf) 
            VALUES (LAST_INSERT_ID(), p_client_name, p_client_document);
        ELSE
            INSERT INTO clients_pj (client_pj_id, client_social_name, client_cnpj) 
            VALUES (LAST_INSERT_ID(), p_client_name, p_client_document);
        END IF;
    ELSEIF acao = 3 THEN
        -- Atualizar cliente
        UPDATE clients SET client_address = p_client_address WHERE client_id = p_client_id;
    ELSEIF acao = 4 THEN
        -- Remover cliente
        DELETE FROM clients WHERE client_id = p_client_id;
    END IF;
END //
DELIMITER ;

-- Chamada da procedure (Exemplo: Inserindo um cliente PF)
CALL sp_manipular_clientes(2, NULL, 'PF', 'Rua A, 123', 'João Silva', '12345678901');

-- transação simples sem procedure 

SET autocommit = 0;
START TRANSACTION;

-- Exemplo de inserção
INSERT INTO clients (Fname, minit, Lname, CPF, Andress)
VALUES ('Joao','A','Pereira','99988877766','Rua Central 10');

-- Exemplo de atualização
UPDATE produto
SET Valor = '199.90'
WHERE idproduto = 2;

-- Exemplo de verificação
SELECT * FROM clients;
SELECT * FROM produto;

-- Confirma ou desfaz
COMMIT;
-- ROLLBACK;


-- transação simples com procedure 


DELIMITER $$

CREATE PROCEDURE sp_transacao_pedido()
BEGIN
    DECLARE erro INT DEFAULT 0;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET erro = 1;

    START TRANSACTION;

    SAVEPOINT etapa1;

    INSERT INTO Orders (idOrderClients, OrderStatus, OrderDescription, sendValue, paymentCash)
    VALUES (1, 'confirmado', 'Pedido teste', 10, false);

    IF erro = 1 THEN
        ROLLBACK TO etapa1;
    END IF;

    SAVEPOINT etapa2;

    UPDATE produto
    SET Valor = '59.90'
    WHERE idproduto = 3;

    IF erro = 1 THEN
        ROLLBACK TO etapa2;
    END IF;

    COMMIT;
END $$

DELIMITER ;


SHOW PROCEDURE STATUS WHERE Db = 'ecommerce';

CALL sp_transacao_pedido();

SELECT * FROM Orders;
SELECT * FROM produto;















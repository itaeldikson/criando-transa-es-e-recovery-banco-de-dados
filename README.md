# criando-transa-es-e-recovery-banco-de-dados
transações e recovery banco de dados com my sql e my sql shell

🛒 Sobre o Projeto
Este repositório contém o desenvolvimento do desafio de Banco de Dados dividido em três partes:

Transações sem procedure

Transações com procedure e tratamento de erro

Backup e Recovery utilizando mysqldump

O objetivo é demonstrar domínio sobre transações, controle de commit/rollback, uso de procedures com SAVEPOINT e execução de backups completos no MySQL.

🟦 PARTE 1 – TRANSAÇÕES
🎯 Objetivo
Nesta etapa, o objetivo é trabalhar com transações para executar modificações na base de dados.
Antes de iniciar, é necessário desabilitar o autocommit, pois caso contrário cada instrução SQL seria confirmada automaticamente.

🔹 Descrição
A transação da Parte 1 é executada sem procedures, utilizando apenas:

SET autocommit = 0

START TRANSACTION

comandos de consulta e modificação

COMMIT ou ROLLBACK

O foco é demonstrar como manipular dados de forma segura dentro de uma transação manual.

🔹 Código (CODE 1)
O arquivo correspondente contém:

desativação do autocommit

início da transação

statements de inserção, atualização ou exclusão

verificação dos dados

commit ou rollback conforme necessário

🟦 PARTE 2 – TRANSAÇÃO COM PROCEDURE
🎯 Objetivo
Criar uma procedure que execute uma transação com:

verificação de erro

uso de SAVEPOINT

ROLLBACK parcial ou total

tratamento de exceções

🔹 Descrição
Nesta etapa, a transação é encapsulada dentro de uma procedure, permitindo:

controle mais avançado

rollback seletivo

detecção de falhas

execução automatizada

🔹 Código (CODE 2 / CODE 3)
O arquivo correspondente contém:

criação da procedure

declaração de variáveis de erro

handlers para exceções

savepoints

rollback parcial

commit final

🟦 PARTE 3 – BACKUP E RECOVERY
🎯 Objetivo
Realizar o backup e recovery do banco de dados ecommerce utilizando o utilitário mysqldump.

Além disso, gerar:

backup simples

backup completo com procedures, eventos e triggers

backup de diferentes bancos

envio dos arquivos ao GitHub

🔹 Backup simples do banco ecommerce
bash
mysqldump -u root -p ecommerce > ecommerce_backup.sql
🔹 Backup completo (procedures, eventos, triggers)
bash
mysqldump -u root -p --routines --events --triggers ecommerce > ecommerce_full_backup.sql
🔹 Backup de todos os bancos
bash
mysqldump -u root -p --all-databases --routines --events --triggers > full_backup.sql

🔄 Recovery (Restauração)
Restaurar o banco ecommerce:
bash
mysql -u root -p ecommerce < ecommerce_backup.sql
Restaurar o backup completo:
bash
mysql -u root -p ecommerce < ecommerce_full_backup.sql
Restaurar todos os bancos:
bash
mysql -u root -p < full_backup.sql

📁 Arquivos incluídos no repositório
CODE1.sql – Transações sem procedure

CODE2.sql – Transações com procedure

CODE3.sql – Procedure com SAVEPOINT e rollback

ecommerce_backup.sql – Backup simples

ecommerce_full_backup.sql – Backup completo

full_backup.sql – Backup de todos os bancos

README.md – Documentação do projeto

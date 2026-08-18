DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE clients (
    idcliente INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(50),
    minit CHAR(1),
    Lname VARCHAR(50),
    CPF VARCHAR(20),
    Andress VARCHAR(100)
);

INSERT INTO clients (Fname, minit, Lname, CPF, Andress) VALUES
('Maria','F','Silva', '12377678', 'Rua S Prata 29'),
('Marta','S','Nogueira', '12348879', 'Rua G Santo 13'),
('Marcia','R','Santos', '12348666', 'Rua D Santos 54'),
('Marciano','S','Junior', '12542586', 'Rua Navarro 90'),
('Macio','F','Junior', '12545797', 'Rua M Silva 230'),
('Matheus','T','Roberto', '13541407', 'Rua D Silva 52');

CREATE TABLE produto (
    idproduto INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50),
    Classificacao_kids BOOLEAN,
    Categoria VARCHAR(50),
    Avaliacao DECIMAL(3,1),
    size VARCHAR(20),
    Valor DECIMAL(10,2)
);

INSERT INTO produto (Pname, Classificacao_kids, Categoria, Avaliacao, size, Valor) VALUES
('Camiseta', 1, 'vestimenta', 4.5, 'M', 14.99),
('Tênis', 0, 'vestimenta', 4.8, '42', 199.90),
('Boneca', 1, 'brinquedo', 4.2, 'Unico', 29.50),
('Mochila', 0, 'vestimenta', 4.7, 'G', 49.99),
('Casaco P', 1, 'vestimenta', 4.9, 'P', 39.90),
('Carro RC', 1, 'brinquedo', 4.3, 'Unico', 24.99);

CREATE TABLE payments (
    id_payment INT PRIMARY KEY,
    idclient INT,
    typepayment VARCHAR(20),
    limitAvailable DECIMAL(10,2),
    FOREIGN KEY (idclient) REFERENCES clients(idcliente)
);

INSERT INTO payments (idclient, id_payment, typepayment, limitAvailable) VALUES
(1, 101, 'boleto', 500.00),
(2, 102, 'cartao', 1200.50),
(3, 103, 'doiscartoes', 800.00),
(4, 104, 'cartao', 300.00),
(5, 105, 'boleto', 150.00),
(6, 106, 'doiscartoes', 950.75);

CREATE TABLE Orders (
    idOrders INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClients INT,
    OrderStatus VARCHAR(30),
    OrderDescription VARCHAR(100),
    sendValue DECIMAL(10,2),
    paymentCash BOOLEAN,
    FOREIGN KEY (idOrderClients) REFERENCES clients(idcliente)
);

INSERT INTO Orders (idOrderClients, OrderStatus, OrderDescription, sendValue, paymentCash) VALUES
(1, 'confirmado', 'Compra de roupas infantis', 10, false),
(2, 'em processamento', 'Pedido de brinquedos educativos', 12.5, true),
(3, 'cancelado', 'Cancelamento por falta de estoque', 10, false),
(4, 'confirmado', 'Compra de calçados esportivos', 15, false),
(5, 'em processamento', 'Pedido de acessórios diversos', 10, true),
(6, 'confirmado', 'Compra de eletrônicos pequenos', 20, false);

CREATE TABLE ProductStorage (
    idProductStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(50),
    quantity INT
);

INSERT INTO ProductStorage (storageLocation, quantity) VALUES
('Armazém Central - A1', 120),
('Armazém Norte - B3', 80),
('Depósito Sul - C2', 45),
('Centro Logístico - D4', 200),
('Armazém Oeste - E1', 60),
('Depósito Leste - F5', 150);

CREATE TABLE Supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(50),
    CNPJ VARCHAR(20),
    contact VARCHAR(20)
);

INSERT INTO Supplier (SocialName, CNPJ, contact) VALUES
('Mega Distribuidora LTDA', '12.345.678/0001', '912345678'),
('Fornecedora Alpha SA', '98.765.432/0001', '987654321'),
('Comercial Beta ME', '11.222.333/0001', '911223344'),
('Importadora Global', '55.666.777/0001', '956667778'),
('Distribuidora KidsWorld', '44.555.666/0001', '945556667'),
('Suprimentos MaxPower', '22.333.444/0001', '923334445');

CREATE TABLE seller (
    idseller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(50),
    AbstName VARCHAR(50),
    CNPJ VARCHAR(20),
    CPF VARCHAR(20),
    location VARCHAR(50),
    contact VARCHAR(20)
);

INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, location, contact) VALUES
('Vendas Express LTDA', 'VExpress', '12.111.222/0001', '123456789', 'Lisboa - Centro', '912345678'),
('Comércio Rápido SA', 'CRápido', '98.222.333/0001', '987654321', 'Lisboa - Norte', '987654321'),
('Loja KidsPoint', 'KidsP', '11.444.555/0001', '111222333', 'Porto - Centro', '911223344'),
('Mercado Urbano', 'MUrbano', '55.777.888/0001', '444555666', 'Coimbra - Sul', '956667778'),
('Fashion Store', 'FStore', '44.999.000/0001', '777888999', 'Braga - Oeste', '945556667'),
('TechSeller', 'TSeller', '22.555.666/0001', '222333444', 'Faro - Leste', '923334445');

CREATE TABLE productSeller (
    idpseller INT,
    idProdut INT,
    produtQuantity INT,
    PRIMARY KEY (idpseller, idProdut),
    FOREIGN KEY (idpseller) REFERENCES seller(idseller),
    FOREIGN KEY (idProdut) REFERENCES produto(idproduto)
);

INSERT INTO productSeller (idpseller, idProdut, produtQuantity) VALUES
(1, 1, 10),
(2, 2, 5),
(3, 3, 20),
(4, 4, 7),
(5, 5, 15),
(6, 6, 12);

CREATE TABLE productOrder (
    idPOproduct INT,
    idPOorder INT,
    poQuantity INT,
    poStatus VARCHAR(20),
    PRIMARY KEY (idPOproduct, idPOorder),
    FOREIGN KEY (idPOproduct) REFERENCES produto(idproduto),
    FOREIGN KEY (idPOorder) REFERENCES Orders(idOrders)
);

INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
(1, 1, 2, 'Disponivel'),
(2, 2, 1, 'Disponivel'),
(3, 3, 4, 'Sem estoque'),
(4, 4, 1, 'Disponivel'),
(5, 5, 3, 'Disponivel'),
(6, 6, 2, 'Sem estoque');

CREATE TABLE storageLocation (
    idLproduct INT,
    idlstorage INT,
    location VARCHAR(50),
    PRIMARY KEY (idLproduct, idlstorage),
    FOREIGN KEY (idLproduct) REFERENCES produto(idproduto),
    FOREIGN KEY (idlstorage) REFERENCES ProductStorage(idProductStorage)
);

INSERT INTO storageLocation (idLproduct, idlstorage, location) VALUES
(1, 1, 'Prateleira A1'),
(2, 2, 'Prateleira B3'),
(3, 3, 'Prateleira C2'),
(4, 4, 'Prateleira D4'),
(5, 5, 'Prateleira E1'),
(6, 6, 'Prateleira F5');





































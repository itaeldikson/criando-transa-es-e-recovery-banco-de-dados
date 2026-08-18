-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) DEFAULT NULL,
  `minit` char(1) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `CPF` varchar(20) DEFAULT NULL,
  `Andress` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Maria','F','Silva','12377678','Rua S Prata 29'),(2,'Marta','S','Nogueira','12348879','Rua G Santo 13'),(3,'Marcia','R','Santos','12348666','Rua D Santos 54'),(4,'Marciano','S','Junior','12542586','Rua Navarro 90'),(5,'Macio','F','Junior','12545797','Rua M Silva 230'),(6,'Matheus','T','Roberto','13541407','Rua D Silva 52'),(7,'Joao','A','Pereira','99988877766','Rua Central 10');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrders` int NOT NULL AUTO_INCREMENT,
  `idOrderClients` int DEFAULT NULL,
  `OrderStatus` varchar(30) DEFAULT NULL,
  `OrderDescription` varchar(100) DEFAULT NULL,
  `sendValue` decimal(10,2) DEFAULT NULL,
  `paymentCash` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idOrders`),
  KEY `idOrderClients` (`idOrderClients`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`idOrderClients`) REFERENCES `clients` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'confirmado','Compra de roupas infantis',10.00,0),(2,2,'em processamento','Pedido de brinquedos educativos',12.50,1),(3,3,'cancelado','Cancelamento por falta de estoque',10.00,0),(4,4,'confirmado','Compra de calçados esportivos',15.00,0),(5,5,'em processamento','Pedido de acessórios diversos',10.00,1),(6,6,'confirmado','Compra de eletrônicos pequenos',20.00,0),(7,1,'confirmado','Pedido teste',10.00,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id_payment` int NOT NULL,
  `idclient` int DEFAULT NULL,
  `typepayment` varchar(20) DEFAULT NULL,
  `limitAvailable` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `idclient` (`idclient`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`idclient`) REFERENCES `clients` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (101,1,'boleto',500.00),(102,2,'cartao',1200.50),(103,3,'doiscartoes',800.00),(104,4,'cartao',300.00),(105,5,'boleto',150.00),(106,6,'doiscartoes',950.75);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productorder`
--

DROP TABLE IF EXISTS `productorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productorder` (
  `idPOproduct` int NOT NULL,
  `idPOorder` int NOT NULL,
  `poQuantity` int DEFAULT NULL,
  `poStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idPOproduct`,`idPOorder`),
  KEY `idPOorder` (`idPOorder`),
  CONSTRAINT `productorder_ibfk_1` FOREIGN KEY (`idPOproduct`) REFERENCES `produto` (`idproduto`),
  CONSTRAINT `productorder_ibfk_2` FOREIGN KEY (`idPOorder`) REFERENCES `orders` (`idOrders`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productorder`
--

LOCK TABLES `productorder` WRITE;
/*!40000 ALTER TABLE `productorder` DISABLE KEYS */;
INSERT INTO `productorder` VALUES (1,1,2,'Disponivel'),(2,2,1,'Disponivel'),(3,3,4,'Sem estoque'),(4,4,1,'Disponivel'),(5,5,3,'Disponivel'),(6,6,2,'Sem estoque');
/*!40000 ALTER TABLE `productorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productseller`
--

DROP TABLE IF EXISTS `productseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productseller` (
  `idpseller` int NOT NULL,
  `idProdut` int NOT NULL,
  `produtQuantity` int DEFAULT NULL,
  PRIMARY KEY (`idpseller`,`idProdut`),
  KEY `idProdut` (`idProdut`),
  CONSTRAINT `productseller_ibfk_1` FOREIGN KEY (`idpseller`) REFERENCES `seller` (`idseller`),
  CONSTRAINT `productseller_ibfk_2` FOREIGN KEY (`idProdut`) REFERENCES `produto` (`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productseller`
--

LOCK TABLES `productseller` WRITE;
/*!40000 ALTER TABLE `productseller` DISABLE KEYS */;
INSERT INTO `productseller` VALUES (1,1,10),(2,2,5),(3,3,20),(4,4,7),(5,5,15),(6,6,12);
/*!40000 ALTER TABLE `productseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productstorage`
--

DROP TABLE IF EXISTS `productstorage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productstorage` (
  `idProductStorage` int NOT NULL AUTO_INCREMENT,
  `storageLocation` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`idProductStorage`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstorage`
--

LOCK TABLES `productstorage` WRITE;
/*!40000 ALTER TABLE `productstorage` DISABLE KEYS */;
INSERT INTO `productstorage` VALUES (1,'Armazém Central - A1',120),(2,'Armazém Norte - B3',80),(3,'Depósito Sul - C2',45),(4,'Centro Logístico - D4',200),(5,'Armazém Oeste - E1',60),(6,'Depósito Leste - F5',150);
/*!40000 ALTER TABLE `productstorage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idproduto` int NOT NULL AUTO_INCREMENT,
  `Pname` varchar(50) DEFAULT NULL,
  `Classificacao_kids` tinyint(1) DEFAULT NULL,
  `Categoria` varchar(50) DEFAULT NULL,
  `Avaliacao` decimal(3,1) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `Valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idproduto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Camiseta',1,'vestimenta',4.5,'M',14.99),(2,'Tênis',0,'vestimenta',4.8,'42',199.90),(3,'Boneca',1,'brinquedo',4.2,'Unico',59.90),(4,'Mochila',0,'vestimenta',4.7,'G',49.99),(5,'Casaco P',1,'vestimenta',4.9,'P',39.90),(6,'Carro RC',1,'brinquedo',4.3,'Unico',24.99);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `idseller` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(50) DEFAULT NULL,
  `AbstName` varchar(50) DEFAULT NULL,
  `CNPJ` varchar(20) DEFAULT NULL,
  `CPF` varchar(20) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idseller`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Vendas Express LTDA','VExpress','12.111.222/0001','123456789','Lisboa - Centro','912345678'),(2,'Comércio Rápido SA','CRápido','98.222.333/0001','987654321','Lisboa - Norte','987654321'),(3,'Loja KidsPoint','KidsP','11.444.555/0001','111222333','Porto - Centro','911223344'),(4,'Mercado Urbano','MUrbano','55.777.888/0001','444555666','Coimbra - Sul','956667778'),(5,'Fashion Store','FStore','44.999.000/0001','777888999','Braga - Oeste','945556667'),(6,'TechSeller','TSeller','22.555.666/0001','222333444','Faro - Leste','923334445');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storagelocation`
--

DROP TABLE IF EXISTS `storagelocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storagelocation` (
  `idLproduct` int NOT NULL,
  `idlstorage` int NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idLproduct`,`idlstorage`),
  KEY `idlstorage` (`idlstorage`),
  CONSTRAINT `storagelocation_ibfk_1` FOREIGN KEY (`idLproduct`) REFERENCES `produto` (`idproduto`),
  CONSTRAINT `storagelocation_ibfk_2` FOREIGN KEY (`idlstorage`) REFERENCES `productstorage` (`idProductStorage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storagelocation`
--

LOCK TABLES `storagelocation` WRITE;
/*!40000 ALTER TABLE `storagelocation` DISABLE KEYS */;
INSERT INTO `storagelocation` VALUES (1,1,'Prateleira A1'),(2,2,'Prateleira B3'),(3,3,'Prateleira C2'),(4,4,'Prateleira D4'),(5,5,'Prateleira E1'),(6,6,'Prateleira F5');
/*!40000 ALTER TABLE `storagelocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int NOT NULL AUTO_INCREMENT,
  `SocialName` varchar(50) DEFAULT NULL,
  `CNPJ` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idSupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Mega Distribuidora LTDA','12.345.678/0001','912345678'),(2,'Fornecedora Alpha SA','98.765.432/0001','987654321'),(3,'Comercial Beta ME','11.222.333/0001','911223344'),(4,'Importadora Global','55.666.777/0001','956667778'),(5,'Distribuidora KidsWorld','44.555.666/0001','945556667'),(6,'Suprimentos MaxPower','22.333.444/0001','923334445');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-18 14:38:10

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Jul-2023 às 04:04
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bookgear`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(11) NOT NULL,
  `nome` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_morte` date DEFAULT NULL,
  `telefone` int(11) NOT NULL,
  `image_url` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`id_autor`, `nome`, `data_nascimento`, `data_morte`, `telefone`, `image_url`) VALUES
(1, 'Halli Petkovic', '1944-07-25', '1997-02-06', 2147463147, ''),
(2, 'Hildegaard Bodemeaid', '1979-12-13', NULL, 2147483647, ''),
(3, 'Koenraad Bullivent', '1984-09-19', NULL, 2147481892, ''),
(4, 'Erny Angrock', '1985-02-12', NULL, 2142783247, ''),
(5, 'Natalina Favill', '1977-08-19', '2002-12-29', 1932923539, ''),
(6, 'Caren Leyes', '1965-08-27', NULL, 2147458447, ''),
(7, 'Feliza Antat', '1967-04-03', NULL, 1442822868, ''),
(8, 'Janot Simants', '2000-05-12', NULL, 2145283647, ''),
(9, 'Rudie O\'Halligan', '1993-08-15', NULL, 2147483612, ''),
(10, 'Shayne Stansall', '1939-04-25', '2005-11-17', 1271963237, ''),
(11, 'Karl Marx', '1818-05-05', '1883-03-14', 2312313, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdH31sjyesHEfDsYcWixcojXwvYx0pyozAEQ&usqp=CAU'),
(12, 'Moisés', '1371-06-12', '1271-04-29', 2345678, 'https://cdn.pixabay.com/photo/2022/12/27/13/12/moises-7680928_640.jpg'),
(13, 'H. P. Lovecraft', '1890-08-20', '1937-03-15', 65465432, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/H._P._Lovecraft%2C_June_1934.jpg/250px-H._P._Lovecraft%2C_June_1934.jpg'),
(14, 'Tazercraft', '2011-07-12', NULL, 164816649, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7xGoUBDVx4dAwO2VgSuXxVpzFmMd4El325g&usqp=CAU');

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE `caixa` (
  `id_caixa` int(11) NOT NULL,
  `id_tipocaixa` int(11) NOT NULL,
  `id_tema` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `caixa`
--

INSERT INTO `caixa` (`id_caixa`, `id_tipocaixa`, `id_tema`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 10),
(4, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa_tipo`
--

CREATE TABLE `caixa_tipo` (
  `id_caixatipo` int(11) NOT NULL,
  `descricao` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tamanho` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `estoque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `caixa_tipo`
--

INSERT INTO `caixa_tipo` (`id_caixatipo`, `descricao`, `valor`, `tamanho`, `estoque`) VALUES
(1, 'Caixa pequena para até 4 livros', '16.00', 'P', 123),
(2, 'Caixa média para até 8 livros', '25.00', 'M', 57),
(3, 'Caixa grande para até 15 livros', '35.00', 'G', 48);

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_carrinho` int(11) NOT NULL,
  `fk_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`id_carrinho`, `fk_cliente`) VALUES
(2, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(80) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `senha` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `endereco` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `imagem` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `cpf` varchar(14) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `email`, `senha`, `endereco`, `imagem`, `cpf`) VALUES
(1, 'Hillard', 'hfeasby0@google.nl', '5xC6i0Zlxe', '0 Merry Place', '', NULL),
(2, 'Madelle', 'mbark1@arstechnica.com', 'bN2Pe64RvIo', '9 Scoville Court', '', NULL),
(3, 'Sybilla', 'sstoakley2@house.gov', 'Uhe2zjGi', '430 Hermina Alley', '', NULL),
(4, 'Dionne', 'dtarrier3@adobe.com', 'YOHMLq8p', '415 Lakeland Pass', '', NULL),
(5, 'Mitchell', 'mvasnev4@yahoo.com', 'leiSLcaw', '7 Dorton Way', '', NULL),
(6, 'Gerardo', 'gblofeld5@theatlantic.com', 'bzI7ImzL', '59365 Prairie Rose Road', '', NULL),
(7, 'Byram', 'bseth6@jugem.jp', 'jk1VPDEo', '87 4th Crossing', '', NULL),
(8, 'Ebba', 'etreske7@instagram.com', '48yZffyOr8', '037 Kingsford Crossing', '', NULL),
(9, 'Emelia', 'eroz8@wiley.com', 'gxrYWOiGnz', '260 Sachtjen Lane', '', NULL),
(10, 'Juliet', 'jbrimble9@cdbaby.com', 'WlGKM4YS', '29 Stuart Hill', '', NULL),
(41, 'adadaa', 'teste@dada.com', 'banana01', 'algum lugar', NULL, NULL),
(43, 'ayoba', 'ayoba@email.com', 'ayobamanus', 'casa ayobabro', NULL, NULL),
(44, 'Henrique', 'pizza@potato', '1111111111', 'Rua massa', 'https://lh3.googleusercontent.com/a-/AD_cMMQHBTXSg1HZjmCH7K27bxgXN9xQaqij14xlrUmhXOkT2iQ=s240-p-k-rw-no', NULL),
(45, 'timão', 'hakunamatata@gmail.com', 'aaaaaaaaaa', 'Selva africana', NULL, NULL),
(46, 'timão', 'a@b', 'a', 'aaaaaaaaaaa', NULL, NULL),
(47, 'guigamesbr1', 'mandeubom@YES', 'seraqvaidar', 'onde sera?', NULL, NULL);

--
-- Acionadores `cliente`
--
DELIMITER $$
CREATE TRIGGER `delete_log` AFTER DELETE ON `cliente` FOR EACH ROW INSERT INTO log (action, id_cliente) VALUES('delete', id_cliente)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_log` AFTER INSERT ON `cliente` FOR EACH ROW INSERT INTO log (action, id_cliente)
  VALUES('insert', NEW.id_cliente)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_log` AFTER UPDATE ON `cliente` FOR EACH ROW INSERT INTO log (action, id_cliente) VALUES('update', NEW.id_cliente)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `tipo_pagamento` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `valor_total` int(11) NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `datahora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

CREATE TABLE `editora` (
  `id_editora` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `telefone` int(11) NOT NULL,
  `image_url` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`id_editora`, `nome`, `telefone`, `image_url`) VALUES
(1, 'Bode LLC', 994354522, ''),
(2, 'Kuhic', 995458464, ''),
(3, 'Considine Inc', 999599298, ''),
(4, 'Heaney Inc', 998989847, ''),
(5, 'Beier, Bashirian and Parker', 227287287, ''),
(6, 'Mitchell\'s Books', 989585291, ''),
(7, 'Treutel Adventure Stories', 949299296, ''),
(8, 'Bechtelar and Sons', 212845968, ''),
(9, 'Conroy Fantasy', 414717878, ''),
(10, 'Goyette', 511387374, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_de_desejos`
--

CREATE TABLE `lista_de_desejos` (
  `id_lista_desejos` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `id_livro` int(11) NOT NULL,
  `fk_autor` int(11) NOT NULL,
  `fk_editora` int(11) NOT NULL,
  `Preco` decimal(10,2) NOT NULL,
  `Nome` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `Estoque` int(11) NOT NULL,
  `id_tema` int(11) NOT NULL,
  `image_url` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`id_livro`, `fk_autor`, `fk_editora`, `Preco`, `Nome`, `Estoque`, `id_tema`, `image_url`) VALUES
(1, 7, 9, '23.72', 'Pearls and Pigs (Helmiä ja sikoja)', 444, 1, ''),
(2, 1, 2, '79.35', 'Highwaymen', 428, 5, ''),
(3, 4, 8, '21.41', 'Cirque du Soleil: Dralion', 881, 8, ''),
(4, 6, 5, '21.71', 'Dead Man\'s Letters (Pisma myortvogo cheloveka)', 461, 10, ''),
(5, 2, 3, '12.21', 'Cosmos', 497, 10, ''),
(6, 3, 9, '29.99', 'Where the Heart Is', 6, 4, ''),
(7, 10, 5, '43.24', 'Home', 521, 6, ''),
(8, 9, 9, '83.49', 'Eddie Izzard: Force Majeure Live', 600, 7, ''),
(9, 3, 7, '49.42', 'Major Movie Star', 512, 1, ''),
(10, 9, 10, '95.01', 'Master of Ballantrae, The', 47, 9, ''),
(13, 11, 6, '123.99', 'O Manifesto Comunista', 69, 3, 'https://static21.minhalojanouol.com.br/anitagaribaldi/produto/multifotos/hd/20200711114128_2853997147_DZ.jpg'),
(14, 12, 1, '70.00', 'A Bíblia Sagrada ', 65, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlFDX05_YledaveaYEZdBLso18fNIo0KB9pg&usqp=CAU'),
(15, 13, 8, '66.66', 'Tales of Horro', 213, 5, 'https://www.knihydobrovsky.cz/thumbs/book-detail/mod_eshop/produkty/371659968/6.jpg'),
(16, 14, 6, '31.99', 'Herobrine : A lenda', 42, 8, 'https://m.media-amazon.com/images/I/814YwXI7YML._AC_UF1000,1000_QL80_.jpg');

--
-- Acionadores `livro`
--
DELIMITER $$
CREATE TRIGGER `change_log_delete` AFTER DELETE ON `livro` FOR EACH ROW INSERT INTO log (action, id_livro, qtde_nova)
 VALUES('delete', id_livro, OLD.Estoque)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `change_log_insert` AFTER INSERT ON `livro` FOR EACH ROW INSERT INTO log (action, id_livro, qtde_nova)
  VALUES('insert', NEW.id_livro, NEW.Estoque)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `change_log_update` AFTER UPDATE ON `livro` FOR EACH ROW INSERT INTO log (action, id_livro, qtde_nova,qtde_original)
  VALUES('update', NEW.id_livro, NEW.Estoque,OLD.Estoque)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros_caixa`
--

CREATE TABLE `livros_caixa` (
  `id_livros_caixa` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `id_caixa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `livros_caixa`
--

INSERT INTO `livros_caixa` (`id_livros_caixa`, `id_livro`, `id_caixa`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 7, 4),
(6, 6, 4),
(7, 3, 2),
(8, 5, 3),
(9, 7, 3),
(10, 6, 3),
(11, 2, 3),
(12, 10, 3),
(13, 4, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_autor` int(11) DEFAULT NULL,
  `id_caixa` int(11) DEFAULT NULL,
  `id_livro` int(11) DEFAULT NULL,
  `id_editora` int(11) DEFAULT NULL,
  `action` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `qtde_original` int(11) DEFAULT NULL,
  `qtde_nova` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `log`
--

INSERT INTO `log` (`id_log`, `id_cliente`, `id_autor`, `id_caixa`, `id_livro`, `id_editora`, `action`, `qtde_original`, `qtde_nova`) VALUES
(1, 43, NULL, NULL, NULL, NULL, 'insert', NULL, NULL),
(2, NULL, NULL, NULL, 2, NULL, 'update', 429, 428),
(3, NULL, NULL, NULL, 13, NULL, 'insert', NULL, 69),
(4, NULL, NULL, NULL, 14, NULL, 'insert', NULL, 65),
(5, NULL, NULL, NULL, 15, NULL, 'insert', NULL, 213),
(6, NULL, NULL, NULL, 15, NULL, 'update', 213, 213),
(7, NULL, NULL, NULL, 16, NULL, 'insert', NULL, 42),
(8, 44, NULL, NULL, NULL, NULL, 'insert', NULL, NULL),
(9, 45, NULL, NULL, NULL, NULL, 'insert', NULL, NULL),
(10, 46, NULL, NULL, NULL, NULL, 'insert', NULL, NULL),
(11, 47, NULL, NULL, NULL, NULL, 'insert', NULL, NULL),
(12, 44, NULL, NULL, NULL, NULL, 'update', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `id_caixa` int(11) DEFAULT NULL,
  `id_livro` int(11) DEFAULT NULL,
  `qtde_livro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `id_caixa`, `id_livro`, `qtde_livro`) VALUES
(1, 3, 5, 1),
(2, 4, 3, 1),
(3, 1, 9, 0),
(4, NULL, 4, 0),
(5, NULL, 3, 0),
(6, NULL, 10, 0),
(7, 2, NULL, 0),
(8, 1, NULL, 0),
(9, 2, 9, 0),
(10, NULL, 5, 0),
(11, 2, 2, 0);

--
-- Acionadores `produto`
--
DELIMITER $$
CREATE TRIGGER `atualizar_estoque` BEFORE INSERT ON `produto` FOR EACH ROW BEGIN
	UPDATE livro SET Estoque = Estoque - NEW.qtde_livro WHERE id_livro = NEW.id_livro; 
    IF (SELECT COUNT(*) FROM produto WHERE id_caixa = NEW.id_caixa) = 0 THEN
        IF NEW.id_caixa IS NOT NULL THEN
            UPDATE caixa_tipo
            SET estoque = estoque - 1
            WHERE id_caixa = NEW.id_caixa;
        END IF;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deleta_venda` AFTER DELETE ON `produto` FOR EACH ROW UPDATE livro
SET Estoque = Estoque + 1
WHERE id_livro = OLD.id_livro
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_compra`
--

CREATE TABLE `produtos_compra` (
  `id_produtos_compra` int(11) NOT NULL,
  `id_produtos` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_carrinho`
--

CREATE TABLE `produto_carrinho` (
  `id_produto_carrinho` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_carrinho` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tema`
--

CREATE TABLE `tema` (
  `id_tema` int(11) NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `tema`
--

INSERT INTO `tema` (`id_tema`, `nome`) VALUES
(1, 'Acao'),
(2, 'Aventura'),
(3, 'Clássicos'),
(4, 'Drama'),
(5, 'Fantasia'),
(6, 'Ficcao cientifica'),
(7, 'Infantil'),
(8, 'Jogos'),
(9, 'Suspense'),
(10, 'Terror'),
(11, 'Padrão');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Índices para tabela `caixa`
--
ALTER TABLE `caixa`
  ADD PRIMARY KEY (`id_caixa`),
  ADD KEY `caixa_ibfk_2` (`id_tipocaixa`),
  ADD KEY `id_tema` (`id_tema`);

--
-- Índices para tabela `caixa_tipo`
--
ALTER TABLE `caixa_tipo`
  ADD PRIMARY KEY (`id_caixatipo`);

--
-- Índices para tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id_carrinho`),
  ADD KEY `fk_cliente2` (`fk_cliente`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices para tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`id_editora`);

--
-- Índices para tabela `lista_de_desejos`
--
ALTER TABLE `lista_de_desejos`
  ADD PRIMARY KEY (`id_lista_desejos`),
  ADD KEY `id_cliente2` (`id_cliente`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices para tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `fk_autor` (`fk_autor`),
  ADD KEY `fk_editora` (`fk_editora`),
  ADD KEY `id_tema` (`id_tema`);

--
-- Índices para tabela `livros_caixa`
--
ALTER TABLE `livros_caixa`
  ADD PRIMARY KEY (`id_livros_caixa`),
  ADD KEY `id_livro` (`id_livro`),
  ADD KEY `id_caixa` (`id_caixa`);

--
-- Índices para tabela `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_autor` (`id_autor`),
  ADD KEY `id_editora` (`id_editora`),
  ADD KEY `clientes` (`id_cliente`),
  ADD KEY `livros` (`id_livro`),
  ADD KEY `caixas` (`id_caixa`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `fk_livro` (`id_livro`),
  ADD KEY `fk_caixa` (`id_caixa`);

--
-- Índices para tabela `produtos_compra`
--
ALTER TABLE `produtos_compra`
  ADD PRIMARY KEY (`id_produtos_compra`),
  ADD KEY `fk_produto` (`id_produtos`),
  ADD KEY `fk_compra` (`id_compra`);

--
-- Índices para tabela `produto_carrinho`
--
ALTER TABLE `produto_carrinho`
  ADD PRIMARY KEY (`id_produto_carrinho`),
  ADD KEY `id_produto2` (`id_produto`),
  ADD KEY `id_carrinho` (`id_carrinho`);

--
-- Índices para tabela `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`id_tema`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `caixa`
--
ALTER TABLE `caixa`
  MODIFY `id_caixa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `caixa_tipo`
--
ALTER TABLE `caixa_tipo`
  MODIFY `id_caixatipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_carrinho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `editora`
--
ALTER TABLE `editora`
  MODIFY `id_editora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `lista_de_desejos`
--
ALTER TABLE `lista_de_desejos`
  MODIFY `id_lista_desejos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `livros_caixa`
--
ALTER TABLE `livros_caixa`
  MODIFY `id_livros_caixa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `produtos_compra`
--
ALTER TABLE `produtos_compra`
  MODIFY `id_produtos_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_carrinho`
--
ALTER TABLE `produto_carrinho`
  MODIFY `id_produto_carrinho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tema`
--
ALTER TABLE `tema`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `caixa`
--
ALTER TABLE `caixa`
  ADD CONSTRAINT `caixa_ibfk_2` FOREIGN KEY (`id_tipocaixa`) REFERENCES `caixa_tipo` (`id_caixatipo`),
  ADD CONSTRAINT `caixa_ibfk_3` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`);

--
-- Limitadores para a tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limitadores para a tabela `lista_de_desejos`
--
ALTER TABLE `lista_de_desejos`
  ADD CONSTRAINT `id_cliente2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `id_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);

--
-- Limitadores para a tabela `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `fk_autor` FOREIGN KEY (`fk_autor`) REFERENCES `autor` (`id_autor`),
  ADD CONSTRAINT `fk_editora` FOREIGN KEY (`fk_editora`) REFERENCES `editora` (`id_editora`),
  ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`);

--
-- Limitadores para a tabela `livros_caixa`
--
ALTER TABLE `livros_caixa`
  ADD CONSTRAINT `id_caixa` FOREIGN KEY (`id_caixa`) REFERENCES `caixa` (`id_caixa`),
  ADD CONSTRAINT `id_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`);

--
-- Limitadores para a tabela `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `caixas` FOREIGN KEY (`id_caixa`) REFERENCES `caixa_tipo` (`id_caixatipo`),
  ADD CONSTRAINT `clientes` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `id_autor` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`),
  ADD CONSTRAINT `id_editora` FOREIGN KEY (`id_editora`) REFERENCES `editora` (`id_editora`),
  ADD CONSTRAINT `livros` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_caixa` FOREIGN KEY (`id_caixa`) REFERENCES `caixa` (`id_caixa`),
  ADD CONSTRAINT `fk_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`);

--
-- Limitadores para a tabela `produtos_compra`
--
ALTER TABLE `produtos_compra`
  ADD CONSTRAINT `fk_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  ADD CONSTRAINT `fk_produto` FOREIGN KEY (`id_produtos`) REFERENCES `produto` (`id_produto`);

--
-- Limitadores para a tabela `produto_carrinho`
--
ALTER TABLE `produto_carrinho`
  ADD CONSTRAINT `id_carrinho` FOREIGN KEY (`id_carrinho`) REFERENCES `carrinho` (`id_carrinho`),
  ADD CONSTRAINT `id_produto2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

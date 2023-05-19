-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Maio-2023 às 14:31
-- Versão do servidor: 8.0.21
-- versão do PHP: 8.1.2

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
  `id_autor` int NOT NULL,
  `nome` varchar(80) NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_morte` date DEFAULT NULL,
  `telefone` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE `caixa` (
  `id_caixa` int NOT NULL,
  `descricao` varchar(160) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `fk_tema` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_carrinho` int NOT NULL,
  `fk_cliente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nome` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `endereco` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `id_compra` int NOT NULL,
  `tipo_pagamento` varchar(100) NOT NULL,
  `valor_total` int NOT NULL,
  `status` varchar(100) NOT NULL,
  `id_cliente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

CREATE TABLE `editora` (
  `id_editora` int NOT NULL,
  `nome` int NOT NULL,
  `telefone` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_de_desejos`
--

CREATE TABLE `lista_de_desejos` (
  `id_lista_desejos` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_produto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `id_livro` int NOT NULL,
  `fk_autor` int NOT NULL,
  `fk_editora` int NOT NULL,
  `Preco` decimal(10,2) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Genero` varchar(80) NOT NULL,
  `Estoque` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros_caixa`
--

CREATE TABLE `livros_caixa` (
  `id_livros_caixa` int NOT NULL,
  `id_livro` int NOT NULL,
  `id_caixa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int NOT NULL,
  `id_caixa` int NOT NULL,
  `id_livro` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_compra`
--

CREATE TABLE `produtos_compra` (
  `id_produtos_compra` int NOT NULL,
  `id_produtos` int NOT NULL,
  `id_compra` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_carrinho`
--

CREATE TABLE `produto_carrinho` (
  `id_produto_carrinho` int NOT NULL,
  `id_produto` int NOT NULL,
  `id_carrrinho` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tema`
--

CREATE TABLE `tema` (
  `id_tema` int NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cor` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  ADD KEY `fk_tema` (`fk_tema`);

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
  ADD KEY `fk_editora` (`fk_editora`);

--
-- Índices para tabela `livros_caixa`
--
ALTER TABLE `livros_caixa`
  ADD PRIMARY KEY (`id_livros_caixa`),
  ADD KEY `id_livro` (`id_livro`),
  ADD KEY `id_caixa` (`id_caixa`);

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
  ADD KEY `id_carrinho` (`id_carrrinho`);

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
  MODIFY `id_autor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `caixa`
--
ALTER TABLE `caixa`
  MODIFY `id_caixa` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_carrinho` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `editora`
--
ALTER TABLE `editora`
  MODIFY `id_editora` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lista_de_desejos`
--
ALTER TABLE `lista_de_desejos`
  MODIFY `id_lista_desejos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `id_livro` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `livros_caixa`
--
ALTER TABLE `livros_caixa`
  MODIFY `id_livros_caixa` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos_compra`
--
ALTER TABLE `produtos_compra`
  MODIFY `id_produtos_compra` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto_carrinho`
--
ALTER TABLE `produto_carrinho`
  MODIFY `id_produto_carrinho` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tema`
--
ALTER TABLE `tema`
  MODIFY `id_tema` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `caixa`
--
ALTER TABLE `caixa`
  ADD CONSTRAINT `fk_tema` FOREIGN KEY (`fk_tema`) REFERENCES `tema` (`id_tema`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `fk_cliente2` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `lista_de_desejos`
--
ALTER TABLE `lista_de_desejos`
  ADD CONSTRAINT `id_cliente2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `fk_autor` FOREIGN KEY (`fk_autor`) REFERENCES `autor` (`id_autor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_editora` FOREIGN KEY (`fk_editora`) REFERENCES `editora` (`id_editora`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `livros_caixa`
--
ALTER TABLE `livros_caixa`
  ADD CONSTRAINT `id_caixa` FOREIGN KEY (`id_caixa`) REFERENCES `caixa` (`id_caixa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_caixa` FOREIGN KEY (`id_caixa`) REFERENCES `caixa` (`id_caixa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `produtos_compra`
--
ALTER TABLE `produtos_compra`
  ADD CONSTRAINT `fk_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_produto` FOREIGN KEY (`id_produtos`) REFERENCES `produto` (`id_produto`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `produto_carrinho`
--
ALTER TABLE `produto_carrinho`
  ADD CONSTRAINT `id_carrinho` FOREIGN KEY (`id_carrrinho`) REFERENCES `carrinho` (`id_carrinho`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_produto2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/05/2024 às 23:27
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `almoxarife`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `centro_de_custos`
--

CREATE TABLE `centro_de_custos` (
  `ID_SETOR` int(11) NOT NULL,
  `desc_setor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `f_id_material` int(11) NOT NULL,
  `qtd_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `ID_FORNECEDOR` int(11) NOT NULL,
  `nome_fornecedor` varchar(100) NOT NULL,
  `cnpj_fornecedor` int(11) NOT NULL,
  `cidade_fornecedor` varchar(60) NOT NULL,
  `contato_fornecedor` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `materiais`
--

CREATE TABLE `materiais` (
  `ID_MATERIAL` int(11) NOT NULL,
  `desc_material` varchar(100) NOT NULL,
  `Segmento` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `nota_fiscal`
--

CREATE TABLE `nota_fiscal` (
  `ID_NF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `requisicao`
--

CREATE TABLE `requisicao` (
  `ID_REQUISICAO` int(11) NOT NULL,
  `data_requisicao` int(11) NOT NULL,
  `id_setor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_entrada`
--

CREATE TABLE `tb_entrada` (
  `f_tb_nf` int(11) NOT NULL,
  `f_tb_material` int(11) NOT NULL,
  `f_tb_requisicao` int(11) NOT NULL,
  `f_tb_fornecedor` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `centro_de_custos`
--
ALTER TABLE `centro_de_custos`
  ADD PRIMARY KEY (`ID_SETOR`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD KEY `f_id_material` (`f_id_material`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`ID_FORNECEDOR`),
  ADD UNIQUE KEY `CNPJ` (`cnpj_fornecedor`);

--
-- Índices de tabela `materiais`
--
ALTER TABLE `materiais`
  ADD PRIMARY KEY (`ID_MATERIAL`);

--
-- Índices de tabela `nota_fiscal`
--
ALTER TABLE `nota_fiscal`
  ADD PRIMARY KEY (`ID_NF`);

--
-- Índices de tabela `requisicao`
--
ALTER TABLE `requisicao`
  ADD PRIMARY KEY (`ID_REQUISICAO`),
  ADD KEY `id_setor` (`id_setor`);

--
-- Índices de tabela `tb_entrada`
--
ALTER TABLE `tb_entrada`
  ADD KEY `f_tb_nf` (`f_tb_nf`),
  ADD KEY `f_tb_material` (`f_tb_material`),
  ADD KEY `f_tb_requisicao` (`f_tb_requisicao`),
  ADD KEY `f_tb_fornecedor` (`f_tb_fornecedor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `centro_de_custos`
--
ALTER TABLE `centro_de_custos`
  MODIFY `ID_SETOR` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `ID_FORNECEDOR` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `nota_fiscal`
--
ALTER TABLE `nota_fiscal`
  MODIFY `ID_NF` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `requisicao`
--
ALTER TABLE `requisicao`
  MODIFY `ID_REQUISICAO` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`f_id_material`) REFERENCES `materiais` (`ID_MATERIAL`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `requisicao`
--
ALTER TABLE `requisicao`
  ADD CONSTRAINT `requisicao_ibfk_1` FOREIGN KEY (`id_setor`) REFERENCES `centro_de_custos` (`ID_SETOR`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_entrada`
--
ALTER TABLE `tb_entrada`
  ADD CONSTRAINT `tb_entrada_ibfk_1` FOREIGN KEY (`f_tb_nf`) REFERENCES `nota_fiscal` (`ID_NF`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_entrada_ibfk_2` FOREIGN KEY (`f_tb_material`) REFERENCES `materiais` (`ID_MATERIAL`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_entrada_ibfk_3` FOREIGN KEY (`f_tb_requisicao`) REFERENCES `requisicao` (`ID_REQUISICAO`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_entrada_ibfk_4` FOREIGN KEY (`f_tb_fornecedor`) REFERENCES `fornecedor` (`ID_FORNECEDOR`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

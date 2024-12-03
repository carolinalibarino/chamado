-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Nov-2024 às 16:36
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `suporte`
--
CREATE DATABASE IF NOT EXISTS `suporte` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `suporte`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `chamado`
--

CREATE TABLE `chamado` (
  `id` int(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `sala` varchar(255) NOT NULL,
  `computador` varchar(20) NOT NULL,
  `tecnico` varchar(255) NOT NULL,
  `descricao` varchar(1000) NOT NULL,
  `status` varchar(255) NOT NULL,
  `foto` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_chamado`
--

CREATE TABLE `log_chamado` (
  `id` int(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `sala` varchar(255) NOT NULL,
  `computador` varchar(20) NOT NULL,
  `tecnico` varchar(255) NOT NULL,
  `descricao` varchar(1000) NOT NULL,
  `status` varchar(255) NOT NULL,
  `foto` mediumblob DEFAULT NULL,
  `mudanca` varchar(255) NOT NULL,
  `crud` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_perfil`
--

CREATE TABLE `log_perfil` (
  `suporte` varchar(255) DEFAULT NULL,
  `padrao` varchar(255) DEFAULT NULL,
  `secretaria` varchar(255) DEFAULT NULL,
  `adm` varchar(255) DEFAULT NULL,
  `mudanca` varchar(255) NOT NULL,
  `crud` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_usuario`
--

CREATE TABLE `log_usuario` (
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id` int(255) NOT NULL,
  `mudanca` varchar(255) NOT NULL,
  `crud` varchar(10) NOT NULL,
  `data_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `adm` varchar(255) DEFAULT NULL,
  `suporte` varchar(255) DEFAULT NULL,
  `padrao` varchar(255) DEFAULT NULL,
  `secretaria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `telefone` int(11) DEFAULT NULL,
  `perfil` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `chamado`
--
ALTER TABLE `chamado`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `log_chamado`
--
ALTER TABLE `log_chamado`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `log_usuario`
--
ALTER TABLE `log_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

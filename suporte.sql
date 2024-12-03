-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/12/2024 às 19:16
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

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
-- Estrutura para tabela `chamado`
--

CREATE TABLE `chamado` (
  `id_chamado` int(255) NOT NULL,
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
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `admistracao` varchar(20) NOT NULL,
  `informatica` varchar(20) NOT NULL,
  `quimica` varchar(20) NOT NULL,
  `logista` varchar(20) NOT NULL,
  `recursos_humanos` varchar(20) NOT NULL,
  `contabilidade` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `informativos`
--

CREATE TABLE `informativos` (
  `id_usuario` int(15) NOT NULL,
  `data` datetime NOT NULL,
  `informacao` mediumtext NOT NULL,
  `orientacao` mediumtext NOT NULL,
  `id_informativos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_chamado`
--

CREATE TABLE `log_chamado` (
  `id_chamado` int(255) NOT NULL,
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
-- Estrutura para tabela `log_informativos`
--

CREATE TABLE `log_informativos` (
  `id_usuario` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `informacao` mediumtext NOT NULL,
  `orientacao` mediumtext NOT NULL,
  `mudanca` varchar(255) NOT NULL,
  `CRUD` varchar(12) NOT NULL,
  `data_hora` datetime NOT NULL,
  `id_informativos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_reserva`
--

CREATE TABLE `log_reserva` (
  `id_reserva` int(11) NOT NULL,
  `nome_event` varchar(50) NOT NULL,
  `curso` varchar(25) NOT NULL,
  `turma` varchar(10) NOT NULL,
  `local` varchar(255) NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  `equipamentos` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `objetivo` mediumtext NOT NULL,
  `mudanca` mediumtext NOT NULL,
  `crud` varchar(12) NOT NULL,
  `data_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_usuario`
--

CREATE TABLE `log_usuario` (
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id_usuario` int(255) NOT NULL,
  `mudanca` varchar(255) NOT NULL,
  `crud` varchar(10) NOT NULL,
  `data_hora` datetime NOT NULL,
  `validacaoCadastro` varchar(255) NOT NULL,
  `statusAtividade` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `nome_event` varchar(50) NOT NULL,
  `curso` varchar(25) NOT NULL,
  `turmas` varchar(10) NOT NULL,
  `local` varchar(255) NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  `equipamentos` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `objetivo` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `1A` int(15) NOT NULL,
  `2A` int(15) NOT NULL,
  `3A` int(15) NOT NULL,
  `1B` int(15) NOT NULL,
  `2B` int(15) NOT NULL,
  `3B` int(15) NOT NULL,
  `1C` int(15) NOT NULL,
  `2C` int(15) NOT NULL,
  `3C` int(15) NOT NULL,
  `1F` int(15) NOT NULL,
  `2F` int(15) NOT NULL,
  `3F` int(15) NOT NULL,
  `1I` int(15) NOT NULL,
  `2I` int(15) NOT NULL,
  `3I` int(15) NOT NULL,
  `1G` int(15) NOT NULL,
  `2G` int(15) NOT NULL,
  `1H` int(15) NOT NULL,
  `2H` int(15) NOT NULL,
  `3H` int(15) NOT NULL,
  `1D` int(15) NOT NULL,
  `2D` int(15) NOT NULL,
  `3D` int(15) NOT NULL,
  `1K` int(15) NOT NULL,
  `2K` int(15) NOT NULL,
  `3K` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `validacaoCadastro` varchar(255) NOT NULL,
  `statusAtividade` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `chamado`
--
ALTER TABLE `chamado`
  ADD PRIMARY KEY (`id_chamado`);

--
-- Índices de tabela `informativos`
--
ALTER TABLE `informativos`
  ADD PRIMARY KEY (`id_informativos`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `log_chamado`
--
ALTER TABLE `log_chamado`
  ADD PRIMARY KEY (`id_chamado`);

--
-- Índices de tabela `log_informativos`
--
ALTER TABLE `log_informativos`
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_informativo` (`id_informativos`);

--
-- Índices de tabela `log_reserva`
--
ALTER TABLE `log_reserva`
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Índices de tabela `log_usuario`
--
ALTER TABLE `log_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `chamado`
--
ALTER TABLE `chamado`
  MODIFY `id_chamado` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `informativos`
--
ALTER TABLE `informativos`
  MODIFY `id_informativos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `informativos`
--
ALTER TABLE `informativos`
  ADD CONSTRAINT `informativos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Restrições para tabelas `log_chamado`
--
ALTER TABLE `log_chamado`
  ADD CONSTRAINT `log_chamado_ibfk_1` FOREIGN KEY (`id_chamado`) REFERENCES `chamado` (`id_chamado`);

--
-- Restrições para tabelas `log_informativos`
--
ALTER TABLE `log_informativos`
  ADD CONSTRAINT `log_informativos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `log_informativos_ibfk_2` FOREIGN KEY (`id_informativos`) REFERENCES `informativos` (`id_informativos`);

--
-- Restrições para tabelas `log_reserva`
--
ALTER TABLE `log_reserva`
  ADD CONSTRAINT `log_reserva_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`);

--
-- Restrições para tabelas `log_usuario`
--
ALTER TABLE `log_usuario`
  ADD CONSTRAINT `log_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

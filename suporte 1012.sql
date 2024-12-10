-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 10-Dez-2024 às 14:45
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.0.26

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

DROP TABLE IF EXISTS `chamado`;
CREATE TABLE IF NOT EXISTS `chamado` (
  `id_chamado` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `sala` varchar(255) NOT NULL,
  `computador` varchar(20) NOT NULL,
  `tecnico` varchar(255) NOT NULL,
  `descricao` varchar(1000) NOT NULL,
  `status` varchar(255) NOT NULL,
  `foto` mediumblob,
  PRIMARY KEY (`id_chamado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `admistracao` varchar(20) NOT NULL,
  `informatica` varchar(20) NOT NULL,
  `quimica` varchar(20) NOT NULL,
  `logista` varchar(20) NOT NULL,
  `recursos_humanos` varchar(20) NOT NULL,
  `contabilidade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagens`
--

DROP TABLE IF EXISTS `imagens`;
CREATE TABLE IF NOT EXISTS `imagens` (
  `id_imagens` int NOT NULL AUTO_INCREMENT,
  `imagem` varchar(255) NOT NULL,
  `descricao` tinytext NOT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_imagens`),
  KEY `fk_id_usuario` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `informativos`
--

DROP TABLE IF EXISTS `informativos`;
CREATE TABLE IF NOT EXISTS `informativos` (
  `id_usuario` int NOT NULL,
  `data` datetime NOT NULL,
  `informacao` mediumtext NOT NULL,
  `orientacao` mediumtext NOT NULL,
  `id_informativos` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_informativos`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_chamado`
--

DROP TABLE IF EXISTS `log_chamado`;
CREATE TABLE IF NOT EXISTS `log_chamado` (
  `id_chamado` int NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `sala` varchar(255) NOT NULL,
  `computador` varchar(20) NOT NULL,
  `tecnico` varchar(255) NOT NULL,
  `descricao` varchar(1000) NOT NULL,
  `status` varchar(255) NOT NULL,
  `foto` mediumblob,
  `mudanca` varchar(255) NOT NULL,
  `crud` varchar(10) NOT NULL,
  PRIMARY KEY (`id_chamado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_informativos`
--

DROP TABLE IF EXISTS `log_informativos`;
CREATE TABLE IF NOT EXISTS `log_informativos` (
  `id_usuario` int NOT NULL,
  `data` datetime NOT NULL,
  `informacao` mediumtext NOT NULL,
  `orientacao` mediumtext NOT NULL,
  `mudanca` varchar(255) NOT NULL,
  `CRUD` varchar(12) NOT NULL,
  `data_hora` datetime NOT NULL,
  `id_informativos` int DEFAULT NULL,
  KEY `id_usuario` (`id_usuario`),
  KEY `id_informativo` (`id_informativos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_interacoes`
--

DROP TABLE IF EXISTS `log_interacoes`;
CREATE TABLE IF NOT EXISTS `log_interacoes` (
  `id_log_interacoes` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `comentarios` mediumtext NOT NULL,
  `data_hora` datetime NOT NULL,
  PRIMARY KEY (`id_log_interacoes`),
  KEY `fk_id_usuario` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_reserva`
--

DROP TABLE IF EXISTS `log_reserva`;
CREATE TABLE IF NOT EXISTS `log_reserva` (
  `id_reserva` int NOT NULL,
  `nome_event` varchar(50) NOT NULL,
  `curso` varchar(25) NOT NULL,
  `turma` varchar(10) NOT NULL,
  `local` varchar(255) NOT NULL,
  `tipo_usuario` int NOT NULL,
  `equipamentos` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `objetivo` mediumtext NOT NULL,
  `mudanca` mediumtext NOT NULL,
  `crud` varchar(12) NOT NULL,
  `data_hora` datetime NOT NULL,
  KEY `id_reserva` (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_usuario`
--

DROP TABLE IF EXISTS `log_usuario`;
CREATE TABLE IF NOT EXISTS `log_usuario` (
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `id_usuario` int NOT NULL,
  `mudanca` varchar(255) NOT NULL,
  `crud` varchar(10) NOT NULL,
  `data_hora` datetime NOT NULL,
  `validacaoCadastro` varchar(255) NOT NULL,
  `statusAtividade` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `nome_event` varchar(50) NOT NULL,
  `curso` varchar(25) NOT NULL,
  `turmas` varchar(10) NOT NULL,
  `local` varchar(255) NOT NULL,
  `tipo_usuario` int NOT NULL,
  `equipamentos` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `objetivo` mediumtext NOT NULL,
  PRIMARY KEY (`id_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turmas`
--

DROP TABLE IF EXISTS `turmas`;
CREATE TABLE IF NOT EXISTS `turmas` (
  `1A` int NOT NULL,
  `2A` int NOT NULL,
  `3A` int NOT NULL,
  `1B` int NOT NULL,
  `2B` int NOT NULL,
  `3B` int NOT NULL,
  `1C` int NOT NULL,
  `2C` int NOT NULL,
  `3C` int NOT NULL,
  `1F` int NOT NULL,
  `2F` int NOT NULL,
  `3F` int NOT NULL,
  `1I` int NOT NULL,
  `2I` int NOT NULL,
  `3I` int NOT NULL,
  `1G` int NOT NULL,
  `2G` int NOT NULL,
  `1H` int NOT NULL,
  `2H` int NOT NULL,
  `3H` int NOT NULL,
  `1D` int NOT NULL,
  `2D` int NOT NULL,
  `3D` int NOT NULL,
  `1K` int NOT NULL,
  `2K` int NOT NULL,
  `3K` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `validacaoCadastro` varchar(255) NOT NULL,
  `statusAtividade` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `informativos`
--
ALTER TABLE `informativos`
  ADD CONSTRAINT `informativos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `log_chamado`
--
ALTER TABLE `log_chamado`
  ADD CONSTRAINT `log_chamado_ibfk_1` FOREIGN KEY (`id_chamado`) REFERENCES `chamado` (`id_chamado`);

--
-- Limitadores para a tabela `log_informativos`
--
ALTER TABLE `log_informativos`
  ADD CONSTRAINT `log_informativos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `log_informativos_ibfk_2` FOREIGN KEY (`id_informativos`) REFERENCES `informativos` (`id_informativos`);

--
-- Limitadores para a tabela `log_reserva`
--
ALTER TABLE `log_reserva`
  ADD CONSTRAINT `log_reserva_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`);

--
-- Limitadores para a tabela `log_usuario`
--
ALTER TABLE `log_usuario`
  ADD CONSTRAINT `log_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

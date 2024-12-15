-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 15-Dez-2024 às 00:47
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
  `id_cursos` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cursos`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`id_cursos`, `nome`) VALUES
(1, 'Administração'),
(2, 'Química'),
(3, 'Informática'),
(4, 'Contabilidade'),
(5, 'Logística'),
(6, 'Recursos Humanos');

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
-- Estrutura da tabela `log_perfil`
--

DROP TABLE IF EXISTS `log_perfil`;
CREATE TABLE IF NOT EXISTS `log_perfil` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(12) NOT NULL,
  `mudanca` varchar(12) NOT NULL,
  `crud` varchar(12) NOT NULL,
  PRIMARY KEY (`id_perfil`)
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
-- Estrutura da tabela `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('adm','suporte','padrao','secretaria') NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `tipo`) VALUES
(1, 'adm'),
(2, 'suporte'),
(3, 'padrao'),
(4, 'secretaria');

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
  `id_turma` int NOT NULL AUTO_INCREMENT,
  `nome_turma` varchar(10) NOT NULL,
  PRIMARY KEY (`id_turma`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `turmas`
--

INSERT INTO `turmas` (`id_turma`, `nome_turma`) VALUES
(1, '1A'),
(2, '2A'),
(3, '3A'),
(4, '1B'),
(5, '2B'),
(6, '3B'),
(7, '1C'),
(8, '2C'),
(9, '3C'),
(10, '1F'),
(11, '2F'),
(12, '3F'),
(13, '1I'),
(14, '2I'),
(15, '3I'),
(16, '1G'),
(17, '2G'),
(18, '1H'),
(19, '2H');

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
  `id_perfil` int DEFAULT NULL,
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

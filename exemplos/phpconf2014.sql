-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 06/12/2014 às 00:18
-- Versão do servidor: 5.5.40-0ubuntu0.14.04.1
-- Versão do PHP: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `phpconf2014`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `participantes`
--

CREATE TABLE IF NOT EXISTS `participantes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `codigo_regiao` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Fazendo dump de dados para tabela `participantes`
--

INSERT INTO `participantes` (`codigo`, `nome`, `codigo_regiao`) VALUES
(1, 'bilbo', 5),
(2, 'frodo bolseiro', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `regioes`
--

CREATE TABLE IF NOT EXISTS `regioes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Fazendo dump de dados para tabela `regioes`
--

INSERT INTO `regioes` (`codigo`, `nome`) VALUES
(1, 'nordeste'),
(2, 'sudeste aureo'),
(3, 'sul sudoeste'),
(4, 'norte'),
(5, 'centro-oeste');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

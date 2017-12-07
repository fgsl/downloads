-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Jun 21, 2011 as 10:31 AM
-- Versão do Servidor: 5.1.41
-- Versão do PHP: 5.3.2-1ubuntu4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `tudodb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos`
--

CREATE TABLE IF NOT EXISTS `acessos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recurso` varchar(80) NOT NULL,
  `privilegio` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `acessos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `acessos_papel`
--

CREATE TABLE IF NOT EXISTS `acessos_papel` (
  `id` int(11) NOT NULL,
  `id_papel` int(11) NOT NULL,
  `id_acesso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_acesso` (`id_acesso`),
  KEY `id_papel` (`id_papel`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acessos_papel`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `email` varchar(80) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `estoques`
--

CREATE TABLE IF NOT EXISTS `estoques` (
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `maximo` int(11) DEFAULT NULL,
  `minimo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estoques`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE IF NOT EXISTS `funcionarios` (
  `matricula` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `apelido` varchar(80) NOT NULL,
  `senha` varchar(80) NOT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `matricula` (`matricula`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `funcionarios`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

CREATE TABLE IF NOT EXISTS `itens` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `preco` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_produto` (`id_produto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `itens`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacoes`
--

CREATE TABLE IF NOT EXISTS `movimentacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  `tipo` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produto` (`id_produto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `movimentacoes`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `papeis`
--

CREATE TABLE IF NOT EXISTS `papeis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `papeis`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `papeis_funcionario`
--

CREATE TABLE IF NOT EXISTS `papeis_funcionario` (
  `id` int(11) NOT NULL,
  `id_papel` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_funcionario` (`id_funcionario`),
  KEY `id_papel` (`id_papel`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `papeis_funcionario`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` smallint(6) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cpf` (`cpf`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedidos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `preco` double DEFAULT NULL,
  `id_promocao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `produtos`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `promocoes`
--

CREATE TABLE IF NOT EXISTS `promocoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `operador` char(1) NOT NULL,
  `fator` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `promocoes`
--


-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Nov-2023 às 20:59
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdgp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atrativos`
--

CREATE TABLE `atrativos` (
  `id_atrativo` int(11) NOT NULL,
  `nome_atrativo` varchar(45) NOT NULL,
  `lat_atrativo` varchar(45) NOT NULL,
  `long_atrativo` varchar(45) NOT NULL,
  `desc_atrativo` text DEFAULT NULL,
  `image_atrativo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `coins`
--

CREATE TABLE `coins` (
  `id_coin` int(11) NOT NULL,
  `nome_coin` varchar(45) NOT NULL,
  `value_coin` float NOT NULL,
  `image_coin` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupons`
--

CREATE TABLE `cupons` (
  `id_cupom` int(11) NOT NULL,
  `codigo_cupom` varchar(22) NOT NULL,
  `nome_cupom` varchar(45) NOT NULL,
  `validade_cupom` date NOT NULL,
  `valor_cupom` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cupons`
--

INSERT INTO `cupons` (`id_cupom`, `codigo_cupom`, `nome_cupom`, `validade_cupom`, `valor_cupom`) VALUES
(3, 'Desconto', 'REGENTE ATUALIZADO', '0000-00-00', 500),
(4, 'BATATA', 'LEO', '2023-11-24', 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `descontos`
--

CREATE TABLE `descontos` (
  `id_desconto` int(11) NOT NULL,
  `valor_desconto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `descontos`
--

INSERT INTO `descontos` (`id_desconto`, `valor_desconto`) VALUES
(1, 30),
(2, 45);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gamers`
--

CREATE TABLE `gamers` (
  `id_gamers` int(11) NOT NULL,
  `nome_gamer` varchar(45) NOT NULL,
  `senha_gamer` varchar(32) NOT NULL,
  `email_gamer` varchar(60) NOT NULL,
  `dtnasc_gamer` date NOT NULL,
  `personagens_id_personagem` int(11) NOT NULL,
  `coins_id_coin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_acessos`
--

CREATE TABLE `log_acessos` (
  `id_log_acesso` int(11) NOT NULL,
  `ultimo_acesso` date NOT NULL,
  `qtd_acesso` int(11) NOT NULL,
  `status_acesso` varchar(45) NOT NULL,
  `gamers_id_gamers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `missoes`
--

CREATE TABLE `missoes` (
  `id_missao` int(11) NOT NULL,
  `nome_missao` varchar(45) NOT NULL,
  `desc_missao` text DEFAULT NULL,
  `recompensa_missao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `missoes`
--

INSERT INTO `missoes` (`id_missao`, `nome_missao`, `desc_missao`, `recompensa_missao`) VALUES
(1, 'Caminhada Natalina150', 'Ande 5 km a noite no dia 25 de dezembro e ganhe  150 coins', 150),
(2, 'Hora Extra', 'Caminhe no mínimo 30 minutos todo dia com seu personagem e junte 25 moedas a mais todo dia', 25);

-- --------------------------------------------------------

--
-- Estrutura da tabela `missoes_has_personagens`
--

CREATE TABLE `missoes_has_personagens` (
  `missoes_id_missao` int(11) NOT NULL,
  `personagens_id_personagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `missoes_has_personagens`
--

INSERT INTO `missoes_has_personagens` (`missoes_id_missao`, `personagens_id_personagem`) VALUES
(1, 2),
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `personagens`
--

CREATE TABLE `personagens` (
  `id_personagem` int(11) NOT NULL,
  `nome_personagem` varchar(45) NOT NULL,
  `genero_personagem` enum('M','F') NOT NULL,
  `tipo_personagem` enum('Humano','Mago','Coruja') NOT NULL DEFAULT 'Humano',
  `totalcoin_personagem` decimal(10,0) NOT NULL,
  `start_latitude_personagem` varchar(30) NOT NULL DEFAULT '33.7367518947601',
  `start_longitude_personagem` varchar(30) NOT NULL DEFAULT '132.48511964017715',
  `skins_id_skin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `personagens`
--

INSERT INTO `personagens` (`id_personagem`, `nome_personagem`, `genero_personagem`, `tipo_personagem`, `totalcoin_personagem`, `start_latitude_personagem`, `start_longitude_personagem`, `skins_id_skin`) VALUES
(1, 'nileo', 'M', 'Humano', '2500', '33.7367518947601', '132.48511964017715', 2),
(2, 'Leonilos', 'M', 'Mago', '1250', '33.7367518947601', '132.48511964017715', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `promocoes`
--

CREATE TABLE `promocoes` (
  `id_promocao` int(11) NOT NULL,
  `nome_promocao` varchar(45) NOT NULL,
  `dt_start_promocao` date NOT NULL,
  `dt_end_promocao` date NOT NULL,
  `descr_promocao` text NOT NULL,
  `ativa_promocao` enum('0','1') NOT NULL DEFAULT '0',
  `descontos_id_desconto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `promocoes`
--

INSERT INTO `promocoes` (`id_promocao`, `nome_promocao`, `dt_start_promocao`, `dt_end_promocao`, `descr_promocao`, `ativa_promocao`, `descontos_id_desconto`) VALUES
(1, 'Nilão', '2023-09-06', '2023-10-01', 'Descrição aqui ó ', '0', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `skins`
--

CREATE TABLE `skins` (
  `id_skin` int(11) NOT NULL,
  `categoria_skin` enum('Acessório','Chapéu','Conjunto','Manto','Mochila') NOT NULL,
  `nome_skin` varchar(45) NOT NULL,
  `descr_skin` text NOT NULL,
  `genero_skin` enum('Masculino','Feminino') NOT NULL,
  `valor_skin` float NOT NULL,
  `raridade_skin` enum('Comum','Rara','Épica','Lendário') NOT NULL,
  `foto1_skin` varchar(200) NOT NULL,
  `foto2_skin` varchar(200) DEFAULT NULL,
  `promocoes_id_promocao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `skins`
--

INSERT INTO `skins` (`id_skin`, `categoria_skin`, `nome_skin`, `descr_skin`, `genero_skin`, `valor_skin`, `raridade_skin`, `foto1_skin`, `foto2_skin`, `promocoes_id_promocao`) VALUES
(2, 'Acessório', 'Budega', 'Azul Frufru', '', 50.99, '', 'null', 'null', 1),
(3, 'Chapéu', 'Geovana', 'Chapéu de Palha', 'Feminino', 10, 'Comum', 'qualquercoisa.png', '', 1),
(4, 'Acessório', 'Chapeu', 'Bababbabababa', 'Masculino', 100, 'Lendário', '', '', 1),
(5, 'Mochila', 'Mochila', 'Mochila mochila backpack do gta', 'Masculino', 250, 'Lendário', 'Ativo 2.png', 'Ativo-9.png', 1),
(6, 'Mochila', 'Mochila BBB', 'Mochila mochila backpack do gta', 'Masculino', 250, 'Lendário', 'Ativo 2.png', 'Ativo-9.png', 1),
(7, 'Mochila', 'Mochila BBB', 'Mochila mochila backpack do gta', 'Masculino', 250, 'Lendário', 'Ativo 2.png', 'Ativo-9.png', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id_venda` int(11) NOT NULL,
  `hora_venda` time NOT NULL,
  `dia_venda` date NOT NULL,
  `skins_id_skin` int(11) DEFAULT NULL,
  `cupons_id_cupon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id_venda`, `hora_venda`, `dia_venda`, `skins_id_skin`, `cupons_id_cupon`) VALUES
(1, '13:10:14', '2023-11-10', 2, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atrativos`
--
ALTER TABLE `atrativos`
  ADD PRIMARY KEY (`id_atrativo`);

--
-- Índices para tabela `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id_coin`);

--
-- Índices para tabela `cupons`
--
ALTER TABLE `cupons`
  ADD PRIMARY KEY (`id_cupom`);

--
-- Índices para tabela `descontos`
--
ALTER TABLE `descontos`
  ADD PRIMARY KEY (`id_desconto`);

--
-- Índices para tabela `gamers`
--
ALTER TABLE `gamers`
  ADD PRIMARY KEY (`id_gamers`),
  ADD KEY `fk_gamers_personagens_idx` (`personagens_id_personagem`),
  ADD KEY `fk_gamers_coins1_idx` (`coins_id_coin`);

--
-- Índices para tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  ADD PRIMARY KEY (`id_log_acesso`),
  ADD KEY `fk_log_acessos_gamers1_idx` (`gamers_id_gamers`);

--
-- Índices para tabela `missoes`
--
ALTER TABLE `missoes`
  ADD PRIMARY KEY (`id_missao`);

--
-- Índices para tabela `missoes_has_personagens`
--
ALTER TABLE `missoes_has_personagens`
  ADD PRIMARY KEY (`missoes_id_missao`,`personagens_id_personagem`),
  ADD KEY `fk_missoes_has_personagens_personagens1_idx` (`personagens_id_personagem`),
  ADD KEY `fk_missoes_has_personagens_missoes1_idx` (`missoes_id_missao`);

--
-- Índices para tabela `personagens`
--
ALTER TABLE `personagens`
  ADD PRIMARY KEY (`id_personagem`),
  ADD KEY `fk_personagens_skins1_idx` (`skins_id_skin`);

--
-- Índices para tabela `promocoes`
--
ALTER TABLE `promocoes`
  ADD PRIMARY KEY (`id_promocao`),
  ADD KEY `fk_promocoes_descontos1_idx` (`descontos_id_desconto`);

--
-- Índices para tabela `skins`
--
ALTER TABLE `skins`
  ADD PRIMARY KEY (`id_skin`),
  ADD KEY `fk_skins_promocoes1_idx` (`promocoes_id_promocao`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `fk_vendas_skins_idx` (`skins_id_skin`),
  ADD KEY `fk_vendas_cupons1_idx` (`cupons_id_cupon`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atrativos`
--
ALTER TABLE `atrativos`
  MODIFY `id_atrativo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `coins`
--
ALTER TABLE `coins`
  MODIFY `id_coin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cupons`
--
ALTER TABLE `cupons`
  MODIFY `id_cupom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `descontos`
--
ALTER TABLE `descontos`
  MODIFY `id_desconto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `gamers`
--
ALTER TABLE `gamers`
  MODIFY `id_gamers` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  MODIFY `id_log_acesso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `missoes`
--
ALTER TABLE `missoes`
  MODIFY `id_missao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `personagens`
--
ALTER TABLE `personagens`
  MODIFY `id_personagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `promocoes`
--
ALTER TABLE `promocoes`
  MODIFY `id_promocao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `skins`
--
ALTER TABLE `skins`
  MODIFY `id_skin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `gamers`
--
ALTER TABLE `gamers`
  ADD CONSTRAINT `fk_gamers_coins1` FOREIGN KEY (`coins_id_coin`) REFERENCES `coins` (`id_coin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gamers_personagens` FOREIGN KEY (`personagens_id_personagem`) REFERENCES `personagens` (`id_personagem`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `log_acessos`
--
ALTER TABLE `log_acessos`
  ADD CONSTRAINT `fk_log_acessos_gamers1` FOREIGN KEY (`gamers_id_gamers`) REFERENCES `gamers` (`id_gamers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `missoes_has_personagens`
--
ALTER TABLE `missoes_has_personagens`
  ADD CONSTRAINT `fk_missoes_has_personagens_missoes1` FOREIGN KEY (`missoes_id_missao`) REFERENCES `missoes` (`id_missao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_missoes_has_personagens_personagens1` FOREIGN KEY (`personagens_id_personagem`) REFERENCES `personagens` (`id_personagem`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `personagens`
--
ALTER TABLE `personagens`
  ADD CONSTRAINT `fk_personagens_skins1` FOREIGN KEY (`skins_id_skin`) REFERENCES `skins` (`id_skin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `promocoes`
--
ALTER TABLE `promocoes`
  ADD CONSTRAINT `fk_promocoes_descontos1` FOREIGN KEY (`descontos_id_desconto`) REFERENCES `descontos` (`id_desconto`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Limitadores para a tabela `skins`
--
ALTER TABLE `skins`
  ADD CONSTRAINT `fk_skins_promocoes1` FOREIGN KEY (`promocoes_id_promocao`) REFERENCES `promocoes` (`id_promocao`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk_vendas_cupons1` FOREIGN KEY (`cupons_id_cupon`) REFERENCES `cupons` (`id_cupom`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendas_skins` FOREIGN KEY (`skins_id_skin`) REFERENCES `skins` (`id_skin`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

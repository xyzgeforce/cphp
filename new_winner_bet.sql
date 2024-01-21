-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Jan-2024 às 20:34
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `new_winner@bet`
--
CREATE DATABASE IF NOT EXISTS `new_winner@bet` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `new_winner@bet`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `email` text NOT NULL,
  `contato` text DEFAULT NULL,
  `senha` text NOT NULL,
  `nivel` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `token_recover` text DEFAULT NULL,
  `avatar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `admin_users`
--

INSERT INTO `admin_users` (`id`, `nome`, `email`, `contato`, `senha`, `nivel`, `status`, `token_recover`, `avatar`) VALUES
(1, 'Jefferson', 'jefersonlopes1601@gmail.com', '', '$2y$10$k5.tnAsJLNJ9dmxDptt5TuDDEIfG5N8zaFtCVLZqzsDOek4KvVV8m', 1, 1, NULL, 'avatar-131677188367.png'),
(8, 'Wilson Cristiano', 'suporte@wilson.cristiano', '', '$2y$10$k5.tnAsJLNJ9dmxDptt5TuDDEIfG5N8zaFtCVLZqzsDOek4KvVV8m', 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `afiliados_config`
--

CREATE TABLE `afiliados_config` (
  `id` int(11) NOT NULL,
  `cpaLvl1` decimal(10,2) DEFAULT NULL,
  `cpaLvl2` decimal(10,2) DEFAULT NULL,
  `cpaLvl3` decimal(10,2) DEFAULT NULL,
  `chanceCpa` decimal(5,2) DEFAULT NULL,
  `revShareFalso` decimal(5,2) DEFAULT NULL,
  `revShareLvl1` decimal(5,2) DEFAULT NULL,
  `revShareLvl2` decimal(5,2) DEFAULT NULL,
  `revShareLvl3` decimal(5,2) DEFAULT NULL,
  `minDepForCpa` decimal(10,2) DEFAULT NULL,
  `minResgate` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `afiliados_config`
--

INSERT INTO `afiliados_config` (`id`, `cpaLvl1`, `cpaLvl2`, `cpaLvl3`, `chanceCpa`, `revShareFalso`, `revShareLvl1`, `revShareLvl2`, `revShareLvl3`, `minDepForCpa`, `minResgate`) VALUES
(1, '25.00', '5.00', '2.00', '0.00', '0.00', '1.00', '0.75', '0.25', '50.00', '50.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `img` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `banner`
--

INSERT INTO `banner` (`id`, `titulo`, `criado_em`, `img`, `status`) VALUES
(37, 'mxvbet', '2023-12-17 03:53:52', 'slider-162443934455.png', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `nome_site` text DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `telegram` text DEFAULT NULL,
  `instagram` text DEFAULT NULL,
  `whatsapp` text DEFAULT NULL,
  `suporte` text DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `sublogo` text DEFAULT NULL,
  `facebook` text DEFAULT NULL,
  `rodapelogo` text DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `googleAnalytics` text DEFAULT NULL,
  `minplay` int(11) DEFAULT NULL,
  `minsaque` double DEFAULT NULL,
  `mindep` int(11) NOT NULL DEFAULT 1,
  `cor_padrao` varchar(45) NOT NULL,
  `custom_css` longtext NOT NULL,
  `texto` varchar(45) NOT NULL,
  `img_seo` text DEFAULT NULL,
  `keyword` text DEFAULT NULL,
  `status_topheader` int(11) NOT NULL DEFAULT 0,
  `cor_topheader` varchar(48) DEFAULT '#ed1c24'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `config`
--

INSERT INTO `config` (`id`, `nome`, `nome_site`, `descricao`, `logo`, `telegram`, `instagram`, `whatsapp`, `suporte`, `email`, `sublogo`, `facebook`, `rodapelogo`, `favicon`, `googleAnalytics`, `minplay`, `minsaque`, `mindep`, `cor_padrao`, `custom_css`, `texto`, `img_seo`, `keyword`, `status_topheader`, `cor_topheader`) VALUES
(1, 'Winner Bet - Sua plataforma favorita!', 'Winner Bet - A melhor plataforma de cassino!', 'Winner Bet - Não fique de fora, aproveite essa oportunidade de lucrar muito com os principais jogos do momento!', '123026227528.png', '', '', '', NULL, '', '', '', NULL, '247756639346.png', '', 1, 30, 10, '#0003c6', '', '', '87496845996.jpg', 'cassino,afiliados,pix,slots', 1, '#0003c6');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupom`
--

CREATE TABLE `cupom` (
  `id` int(11) NOT NULL,
  `nome` text NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1 COMMENT '1: recarga / 2:saldo',
  `valor` int(11) NOT NULL,
  `qtd` int(11) NOT NULL DEFAULT 0,
  `qtd_insert` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupom_usados`
--

CREATE TABLE `cupom_usados` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_cupom` int(11) NOT NULL,
  `valor` int(11) NOT NULL DEFAULT 0,
  `data_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `double`
--

CREATE TABLE `double` (
  `id` int(11) NOT NULL,
  `winner_color` varchar(255) DEFAULT NULL,
  `winner_number` int(11) NOT NULL DEFAULT 0,
  `pot` double(10,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0,
  `hash` varchar(255) DEFAULT NULL,
  `profit` varchar(255) DEFAULT NULL,
  `ranked` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `double`
--

INSERT INTO `double` (`id`, `winner_color`, `winner_number`, `pot`, `status`, `hash`, `profit`, `ranked`, `updated_at`, `created_at`) VALUES
(1, NULL, 0, 1.00, 1, 'f42b867443b3e4c901512c678e132731', NULL, 0, '2023-10-10 09:23:49', '2023-10-09 16:31:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ezzebank`
--

CREATE TABLE `ezzebank` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `client_id` text DEFAULT NULL,
  `client_secret` text DEFAULT NULL,
  `atualizado` varchar(45) DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `ezzebank`
--

INSERT INTO `ezzebank` (`id`, `url`, `client_id`, `client_secret`, `atualizado`, `ativo`) VALUES
(0, '', '', '', NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `financeiro`
--

CREATE TABLE `financeiro` (
  `id` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT NULL,
  `saldo_afiliados` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `financeiro`
--

INSERT INTO `financeiro` (`id`, `usuario`, `saldo`, `bonus`, `saldo_afiliados`) VALUES
(835, 835, '100.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fiverscan`
--

CREATE TABLE `fiverscan` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `agent_code` text DEFAULT NULL,
  `agent_token` text DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `fiverscan`
--

INSERT INTO `fiverscan` (`id`, `url`, `agent_code`, `agent_token`, `ativo`) VALUES
(1, 'https://api.fiverscan.com', '', '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `game_code` text NOT NULL,
  `game_name` text NOT NULL,
  `banner` text NOT NULL,
  `status` int(11) NOT NULL,
  `provider` text DEFAULT NULL,
  `popular` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `games`
--

INSERT INTO `games` (`id`, `game_code`, `game_name`, `banner`, `status`, `provider`, `popular`) VALUES
(2691, '67', 'Golden eggs', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/67_EN.png', 1, 'CQ9', 0),
(2692, '161', 'Hercules', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/161_EN.png', 1, 'CQ9', 0),
(2693, '16', 'Super 5', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/16_EN.png', 1, 'CQ9', 0),
(2694, '72', 'Happy Rich Year', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/72_EN.png', 1, 'CQ9', 0),
(2695, '1', 'Fruit King', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/1_EN.png', 1, 'CQ9', 0),
(2696, '163', 'Neja Advent', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/163_EN.png', 1, 'CQ9', 0),
(2697, '26', '777', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/26_EN.png', 1, 'CQ9', 0),
(2698, '50', 'Good fortune', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/50_EN.png', 1, 'CQ9', 0),
(2699, '31', 'God of war', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/31_EN.png', 1, 'CQ9', 0),
(2700, '64', 'Zeus', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/64_EN.png', 1, 'CQ9', 0),
(2701, '69', 'Pasaycen', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/69_EN.png', 1, 'CQ9', 0),
(2702, '89', 'Thor', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/89_EN.png', 1, 'CQ9', 0),
(2703, '46', 'Wolf moon', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/46_EN.png', 1, 'CQ9', 0),
(2704, '139', 'Fire chibi', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/139_EN.png', 1, 'CQ9', 0),
(2705, '15', 'Gu Gu Gu', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/15_EN.png', 1, 'CQ9', 0),
(2706, '140', 'Fire Chibi 2', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/140_EN.png', 1, 'CQ9', 0),
(2707, '8', 'So Sweet', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/8_EN.png', 1, 'CQ9', 0),
(2708, '147', 'Flower fortune', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/147_EN.png', 1, 'CQ9', 0),
(2709, '113', 'Flying Kai Shen', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/113_EN.png', 1, 'CQ9', 0),
(2710, '58', 'Gu Gu Gu 2', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/58_EN.png', 1, 'CQ9', 0),
(2711, '128', 'Wheel money', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/128_EN.png', 1, 'CQ9', 0),
(2712, '5', 'Mr Rich', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/5_EN.png', 1, 'CQ9', 0),
(2713, '180', 'Gu Gu Gu 3', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/9835.png', 1, 'CQ9', 0),
(2714, '118', 'SkullSkull', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/118_EN.png', 1, 'CQ9', 0),
(2715, '148', 'Fortune totem', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/148_EN.png', 1, 'CQ9', 0),
(2716, '144', 'Diamond treasure', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/144_EN.png', 1, 'CQ9', 0),
(2717, '19', 'Hot spin', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/19_EN.png', 1, 'CQ9', 0),
(2718, '112', 'Pyramid radar', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/112_EN.png', 1, 'CQ9', 0),
(2719, '160', 'Pa Kai Shen2', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/160_EN.png', 1, 'CQ9', 0),
(2720, '132', 'Miou', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/132_EN.png', 1, 'CQ9', 0),
(2721, '47', 'Pharaoh gold', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/47_EN.png', 1, 'CQ9', 0),
(2722, '13', 'Sakura legend', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/13_EN.png', 1, 'CQ9', 0),
(2723, '34', 'Gopher\'s War', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/34_EN.png', 1, 'CQ9', 0),
(2724, '59', 'Summer mood', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/59_EN.png', 1, 'CQ9', 0),
(2725, '76', 'Won won won', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/76_EN.png', 1, 'CQ9', 0),
(2726, '95', 'Football boots', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/95_EN.png', 1, 'CQ9', 0),
(2727, '57', 'The Beast War', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/57_EN.png', 1, 'CQ9', 0),
(2728, '17', 'Great lion', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/17_EN.png', 1, 'CQ9', 0),
(2729, '20', '888', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/20_EN.png', 1, 'CQ9', 0),
(2730, '182', 'Thor 2', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/10044.png', 1, 'CQ9', 0),
(2731, '66', 'Fire 777', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/66_EN.png', 1, 'CQ9', 0),
(2732, '2', 'God of Chess', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/2_EN.png', 1, 'CQ9', 0),
(2733, '21', 'Big wolf', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/21_EN.png', 1, 'CQ9', 0),
(2734, '197', 'Dragon\'s Treasure', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11502.png', 1, 'CQ9', 0),
(2735, '208', 'Money tree', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11593.png', 1, 'CQ9', 0),
(2736, '212', 'Burning Si-Yow', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11805.png', 1, 'CQ9', 0),
(2737, '214', 'Ninja raccoon', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/11806.png', 1, 'CQ9', 0),
(2738, '218', 'Dollar night', 'https://resource.fdsigaming.com/thumbnail/slot/cq/en/12141.png', 1, 'CQ9', 0),
(2739, '01rb77cq1gtenhmo', 'Auto-Roulette VIP', 'https://evolution.bet4wins.net/assets/banner/auto_roulette_vip.webp', 1, 'EVOLUTION', 0),
(2740, 'qgqrucipvltnvnvq', 'Speed Baccarat W', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratw.webp', 1, 'EVOLUTION', 0),
(2741, 'DragonTiger00001', 'Dragon Tiger', 'https://evolution.bet4wins.net/assets/banner/dragon_tiger.webp', 1, 'EVOLUTION', 0),
(2742, 'NoCommBac0000001', 'No Commission Baccarat', 'https://evolution.bet4wins.net/assets/banner/super_six.webp', 1, 'EVOLUTION', 0),
(2743, 'PTBaccarat000001', 'Prosperity Tree Baccarat', 'https://evolution.bet4wins.net/assets/banner/ProsperityTreeBaccarat.webp', 1, 'EVOLUTION', 0),
(2744, 'LightningTable01', 'Lightning Roulette', 'https://mxvbet.xyz/uploads/game-236561573144.webp', 1, 'EVOLUTION', 0),
(2745, 'ndgvz5mlhfuaad6e', 'Speed Baccarat D', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratd.webp', 1, 'EVOLUTION', 0),
(2746, 'obj64qcnqfunjelj', 'Speed Baccarat J', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratj.webp', 1, 'EVOLUTION', 0),
(2747, 'qgqrv4asvltnvuty', 'Speed Baccarat X', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratx.webp', 1, 'EVOLUTION', 0),
(2748, '48z5pjps3ntvqc1b', 'Auto-Roulette', 'https://evolution.bet4wins.net/assets/banner/auto_la_partage.webp', 1, 'EVOLUTION', 0),
(2749, 'RedDoorRoulette1', 'Red Door Roulette', 'https://evolution.bet4wins.net/assets/banner/RedDoorRoulette.webp', 1, 'EVOLUTION', 0),
(2750, 'nmwde3fd7hvqhq43', 'Speed Baccarat F', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratf.webp', 1, 'EVOLUTION', 0),
(2751, 'ocye2ju2bsoyq6vv', 'Speed Baccarat K', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratk.webp', 1, 'EVOLUTION', 0),
(2752, 'ovu5eja74ccmyoiq', 'Speed Baccarat N', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratn.webp', 1, 'EVOLUTION', 0),
(2753, 'EmperorSB0000001', 'Emperor Sic Bo', 'https://evolution.bet4wins.net/assets/banner/EmperorSicBo.webp', 1, 'EVOLUTION', 0),
(2754, 'CrazyTime0000002', 'Crazy Time A', 'https://evolution.bet4wins.net/assets/banner/crazytimea.webp', 1, 'EVOLUTION', 0),
(2755, 'SBCTable00000001', 'Side Bet City', 'https://evolution.bet4wins.net/assets/banner/sidebetcity.webp', 1, 'EVOLUTION', 0),
(2756, 'nmwdzhbg7hvqh6a7', 'Speed Baccarat G', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratg.webp', 1, 'EVOLUTION', 0),
(2757, 'AmericanTable001', 'American Roulette', 'https://evolution.bet4wins.net/assets/banner/americanroulette.webp', 1, 'EVOLUTION', 0),
(2758, 'pv5q45yjhasyt46y', 'Emperor Roulette', 'https://evolution.bet4wins.net/assets/banner/EmperorRoulette.webp', 1, 'EVOLUTION', 0),
(2759, 'ndgv45bghfuaaebf', 'Speed Baccarat E', 'https://evolution.bet4wins.net/assets/banner/speed_baccarate.webp', 1, 'EVOLUTION', 0),
(2760, '7x0b1tgh7agmf6hv', 'Immersive Roulette', 'https://evolution.bet4wins.net/assets/banner/immersive_roulette.webp', 1, 'EVOLUTION', 0),
(2761, 'ovu5h6b3ujb4y53w', 'No Commission Speed Baccarat C', 'https://evolution.bet4wins.net/assets/banner/nocomm_speed_baccaratc.webp', 1, 'EVOLUTION', 0),
(2762, 'qsf63ownyvbqnz33', 'Speed Baccarat Z', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratz.webp', 1, 'EVOLUTION', 0),
(2763, 'ndgvwvgthfuaad3q', 'Speed Baccarat C', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratc.webp', 1, 'EVOLUTION', 0),
(2764, 'qgqrhfvsvltnueqf', 'Speed Baccarat U', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratu.webp', 1, 'EVOLUTION', 0),
(2765, 'CSPTable00000001', 'Caribbean Stud Poker', 'https://evolution.bet4wins.net/assets/banner/stud_poker.webp', 1, 'EVOLUTION', 0),
(2766, 'n4jwxsz2x4tqitvx', 'Japanese Roulette', 'https://evolution.bet4wins.net/assets/banner/japanese_roulette.webp', 1, 'EVOLUTION', 0),
(2767, 'f1f4rm9xgh4j3u2z', 'Auto-Roulette La Partage', 'https://evolution.bet4wins.net/assets/banner/auto_roulette.webp', 1, 'EVOLUTION', 0),
(2768, 'leqhceumaq6qfoug', 'Speed Baccarat A', 'https://evolution.bet4wins.net/assets/banner/speed_baccarata.webp', 1, 'EVOLUTION', 0),
(2769, 'puu47n7mic3rfd7y', 'Emperor Dragon Tiger', 'https://evolution.bet4wins.net/assets/banner/EmperorDragonTiger.webp', 1, 'EVOLUTION', 0),
(2770, 'qgonc7t4ucdiel4o', 'Speed Baccarat T', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratt.webp', 1, 'EVOLUTION', 0),
(2771, 'ETHTable00000001', 'Extreme Texas Hold\'em', 'https://evolution.bet4wins.net/assets/banner/extreme_texas_holdem.webp', 1, 'EVOLUTION', 0),
(2772, 'q6ardco6opnfwes4', 'Emperor Speed Baccarat D', 'https://evolution.bet4wins.net/assets/banner/EmperorSpeedBaccaratD.webp', 1, 'EVOLUTION', 0),
(2773, '7nyiaws9tgqrzaz3', 'Football Studio Roulette', 'https://evolution.bet4wins.net/assets/banner/FootballStudioRoulette.webp', 1, 'EVOLUTION', 0),
(2774, 'ndgvs3tqhfuaadyg', 'Baccarat C', 'https://evolution.bet4wins.net/assets/banner/baccarat_c.webp', 1, 'EVOLUTION', 0),
(2775, 'pwsaqk24fcz5qpcr', 'Emperor Speed Baccarat C', 'https://evolution.bet4wins.net/assets/banner/EmperorSpeedBaccaratC.webp', 1, 'EVOLUTION', 0),
(2776, 'lkcbrbdckjxajdol', 'Speed Roulette', 'https://evolution.bet4wins.net/assets/banner/speed_roulette.webp', 1, 'EVOLUTION', 0),
(2777, 'o4kymodby2fa2c7g', 'Speed Baccarat S', 'https://evolution.bet4wins.net/assets/banner/speed_baccarats.webp', 1, 'EVOLUTION', 0),
(2778, 'nxpkul2hgclallno', 'Speed Baccarat I', 'https://evolution.bet4wins.net/assets/banner/speed_baccarati.webp', 1, 'EVOLUTION', 0),
(2779, 'CrazyTime0000001', 'Crazy Time', 'https://evolution.bet4wins.net/assets/banner/crazytime.webp', 1, 'EVOLUTION', 0),
(2780, 'vctlz20yfnmp1ylr', 'Roulette', 'https://evolution.bet4wins.net/assets/banner/roulette.webp', 1, 'EVOLUTION', 0),
(2781, 'zixzea8nrf1675oh', 'Baccarat Squeeze', 'https://evolution.bet4wins.net/assets/banner/baccarat_squeeze.webp', 1, 'EVOLUTION', 0),
(2782, 'teenpattitable01', 'Teen Patti', 'https://evolution.bet4wins.net/assets/banner/TeenPatti.webp', 1, 'EVOLUTION', 0),
(2783, 'peekbaccarat0001', 'Peek Baccarat', 'https://evolution.bet4wins.net/assets/banner/PeekBaccarat.webp', 1, 'EVOLUTION', 0),
(2784, 'o4kyj7tgpwqqy4m4', 'Speed Baccarat Q', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratq.webp', 1, 'EVOLUTION', 0),
(2785, 'FunkyTime0000001', 'Funky Time', 'https://evolution.bet4wins.net/assets/banner/FunkyTime.webp', 1, 'EVOLUTION', 0),
(2786, 'o4kylkahpwqqy57w', 'Speed Baccarat R', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratr.webp', 1, 'EVOLUTION', 0),
(2787, 'XxxtremeLigh0001', 'XXXtreme Lightning Roulette', 'https://evolution.bet4wins.net/assets/banner/XXXTremeLightningRoulette.webp', 1, 'EVOLUTION', 0),
(2788, 'AndarBahar000001', 'Super Andar Bahar', 'https://evolution.bet4wins.net/assets/banner/SuperAndarBahar.webp', 1, 'EVOLUTION', 0),
(2789, 'ndgv76kehfuaaeec', 'No Commission Speed Baccarat A', 'https://evolution.bet4wins.net/assets/banner/nocomm_speed_baccarat.webp', 1, 'EVOLUTION', 0),
(2790, '60i0lcfx5wkkv3sy', 'Baccarat B', 'https://evolution.bet4wins.net/assets/banner/baccarat_b.webp', 1, 'EVOLUTION', 0),
(2791, 'ocye5hmxbsoyrcii', 'No Commission Speed Baccarat B', 'https://evolution.bet4wins.net/assets/banner/nocomm_speed_baccaratb.webp', 1, 'EVOLUTION', 0),
(2792, 'rep5kwmdnyjmasxi', 'Speed Baccarat 11', 'https://evolution.bet4wins.net/assets/banner/SpeedBaccarat11.webp', 1, 'EVOLUTION', 0),
(2793, 'rep5m2cdnyjmazzo', 'Speed Baccarat 12', 'https://evolution.bet4wins.net/assets/banner/SpeedBaccarat12.webp', 1, 'EVOLUTION', 0),
(2794, 'BonsaiBacc000002', 'Bonsai Speed Baccarat B', 'https://evolution.bet4wins.net/assets/banner/BonsaiSpeedBaccaratB.webp', 1, 'EVOLUTION', 0),
(2795, 'DoubleBallRou001', 'Double Ball Roulette', 'https://evolution.bet4wins.net/assets/banner/double_ball.webp', 1, 'EVOLUTION', 0),
(2796, 'qsf7alptyvbqohva', 'Speed Baccarat 2', 'https://evolution.bet4wins.net/assets/banner/speed_baccarat_2.webp', 1, 'EVOLUTION', 0),
(2797, 'lv2kzclunt2qnxo5', 'Speed Baccarat B', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratb.webp', 1, 'EVOLUTION', 0),
(2798, 'HoldemTable00001', 'Casino Hold\'em', 'https://evolution.bet4wins.net/assets/banner/casino_holdem.webp', 1, 'EVOLUTION', 0),
(2799, 'puu43e6c5uvrfikr', 'Emperor Speed Baccarat B', 'https://evolution.bet4wins.net/assets/banner/EmperorSpeedBaccaratB.webp', 1, 'EVOLUTION', 0),
(2800, 'wzg6kdkad1oe7m5k', 'French Roulette Gold', 'https://evolution.bet4wins.net/assets/banner/french_roulette_gold.webp', 1, 'EVOLUTION', 0),
(2801, 'ovu5cwp54ccmymck', 'Speed Baccarat L', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratl.webp', 1, 'EVOLUTION', 0),
(2802, 'FanTan0000000001', 'Fan Tan', 'https://evolution.bet4wins.net/assets/banner/fan_tan.webp', 1, 'EVOLUTION', 0),
(2803, 'BonsaiBacc000003', 'Bonsai Speed Baccarat C', 'https://evolution.bet4wins.net/assets/banner/BonsaiSpeedBaccaratC.webp', 1, 'EVOLUTION', 0),
(2804, 'ovu5dsly4ccmynil', 'Speed Baccarat M', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratm.webp', 1, 'EVOLUTION', 0),
(2805, 'oytmvb9m1zysmc44', 'Baccarat A', 'https://evolution.bet4wins.net/assets/banner/baccarat_a.webp', 1, 'EVOLUTION', 0),
(2806, 'LightningBac0001', 'Lightning Baccarat', 'https://mxvbet.xyz/uploads/game-204534194788.jpg', 1, 'EVOLUTION', 0),
(2807, 'qsf7bpfvyvbqolwp', 'Speed Baccarat 3', 'https://evolution.bet4wins.net/assets/banner/speed_baccarat_3.webp', 1, 'EVOLUTION', 0),
(2808, 'TopDice000000001', 'Football Studio Dice', 'https://evolution.bet4wins.net/assets/banner/FootballStudioDice.webp', 1, 'EVOLUTION', 0),
(2809, 'k2oswnib7jjaaznw', 'Baccarat Control Squeeze', 'https://evolution.bet4wins.net/assets/banner/baccarat_controlled.webp', 1, 'EVOLUTION', 0),
(2810, 'qsf65xtoyvbqoaop', 'Speed Baccarat 1', 'https://evolution.bet4wins.net/assets/banner/speed_baccarat_1.webp', 1, 'EVOLUTION', 0),
(2811, 'ovu5fzje4ccmyqnr', 'Speed Baccarat P', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratp.webp', 1, 'EVOLUTION', 0),
(2812, 'qgqrrnuqvltnvejx', 'Speed Baccarat V', 'https://evolution.bet4wins.net/assets/banner/speed_baccaratv.webp', 1, 'EVOLUTION', 0),
(2813, 'TRPTable00000001', 'Triple Card Poker', 'https://evolution.bet4wins.net/assets/banner/triple_card.webp', 1, 'EVOLUTION', 0),
(2814, 'wzg6kdkad1oe7m5k', 'VIP Roulette', 'https://evolution.bet4wins.net/assets/banner/vip_roulette.webp', 1, 'EVOLUTION', 0),
(2815, 'rfbo6mhpdgyqbpay', 'Emperor Bac Bo', 'https://evolution.bet4wins.net/assets/banner/EmperorBacBo.webp', 1, 'EVOLUTION', 0),
(2816, 'TopCard000000001', 'Football Studio', 'https://evolution.bet4wins.net/assets/banner/top_card.webp', 1, 'EVOLUTION', 0),
(2817, 'SuperSicBo000001', 'Super Sic Bo', 'https://evolution.bet4wins.net/assets/banner/super_sicbo.webp', 1, 'EVOLUTION', 0),
(2818, 'ovu5fbxm4ccmypmb', 'Speed Baccarat O', 'https://evolution.bet4wins.net/assets/banner/speed_baccarato.webp', 1, 'EVOLUTION', 0),
(2819, 'nxpj4wumgclak2lx', 'Speed Baccarat H', 'https://evolution.bet4wins.net/assets/banner/speed_baccarath.webp', 1, 'EVOLUTION', 0),
(2820, 'EmperorSB0000002', 'Emperor Sic Bo A', 'https://evolution.bet4wins.net/assets/banner/EmperorSicBoA.webp', 1, 'EVOLUTION', 0),
(2821, 'XXXtremeLB000001', 'XXXtreme Lightning Baccarat', 'https://evolution.bet4wins.net/assets/banner/XXXtremeLightningBaccarat.webp', 1, 'EVOLUTION', 0),
(2822, 'GoldVaultRo00001', 'Gold Vault Roulette', 'https://evolution.bet4wins.net/assets/banner/GoldVaultRoulette.webp', 1, 'EVOLUTION', 0),
(2823, 'MOWDream00000001', 'Dream Catcher', 'https://evolution.bet4wins.net/assets/banner/dream_catcher.webp', 1, 'EVOLUTION', 0),
(2824, 'SpeedAutoRo00001', 'Speed Auto Roulette', 'https://evolution.bet4wins.net/assets/banner/speed_auto_roulette.webp', 1, 'EVOLUTION', 0),
(2825, 'puu4yfymic3reudn', 'Emperor Speed Baccarat A', 'https://evolution.bet4wins.net/assets/banner/EmperorSpeedBaccaratA.webp', 1, 'EVOLUTION', 0),
(2826, 'BacBo00000000001', 'Bac Bo', 'https://evolution.bet4wins.net/assets/banner/BacBo.webp', 1, 'EVOLUTION', 0),
(2827, 'BonsaiBacc000001', 'Bonsai Speed Baccarat A', 'https://evolution.bet4wins.net/assets/banner/BonsaiSpeedBaccaratA.webp', 1, 'EVOLUTION', 0),
(2828, 'LightningDice001', 'Lightning Dice', 'https://mxvbet.xyz/uploads/game-88310560421.jpg', 1, 'EVOLUTION', 0),
(2829, '100', 'Baccarat', 'https://ezugi.bet4wins.net/assets/banner/BaccaratLobby.webp', 1, 'EZUGI', 0),
(2830, '102', 'Fortune Baccarat', 'https://ezugi.bet4wins.net/assets/banner/SpeedFortuneBaccarat.webp', 1, 'EZUGI', 0),
(2831, '105', 'Speed Fortune Baccarat', 'https://ezugi.bet4wins.net/assets/banner/SpeedFortuneBaccarat.webp', 1, 'EZUGI', 0),
(2832, '106', 'VIP Fortune Baccarat', 'https://ezugi.bet4wins.net/assets/banner/VIPFortuneBaccarat.webp', 1, 'EZUGI', 0),
(2833, '107', 'Italian Baccarat', 'https://ezugi.bet4wins.net/assets/banner/ItalianBaccarat.webp', 1, 'EZUGI', 0),
(2834, '120', 'Knockout Baccarat', 'https://ezugi.bet4wins.net/assets/banner/GoldenBaccaratKnockOut.webp', 1, 'EZUGI', 0),
(2835, '130', 'Super 6 Baccarat', 'https://ezugi.bet4wins.net/assets/banner/GoldenBaccaratSuperSix.webp', 1, 'EZUGI', 0),
(2836, '150', 'Dragon Tiger', 'https://ezugi.bet4wins.net/assets/banner/DragonTiger.webp', 1, 'EZUGI', 0),
(2837, '170', 'No Commission Baccarat', 'https://ezugi.bet4wins.net/assets/banner/NoCommissionBaccarat.webp', 1, 'EZUGI', 0),
(2838, '171', 'VIP No Commission Speed Cricket Baccarat', 'https://ezugi.bet4wins.net/assets/banner/VIPNoCommissionSpeedCricketBaccarat.webp', 1, 'EZUGI', 0),
(2839, '1000', 'Italian Roulette', 'https://ezugi.bet4wins.net/assets/banner/RouletteGold2.webp', 1, 'EZUGI', 0),
(2840, '5001', 'Auto Roulette', 'https://ezugi.bet4wins.net/assets/banner/AutomaticRoulette1.webp', 1, 'EZUGI', 0),
(2841, '32100', 'Casino Marina Baccarat 1', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaBaccarat1.webp', 1, 'EZUGI', 0),
(2842, '32101', 'Casino Marina Baccarat 2', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaBaccarat2.webp', 1, 'EZUGI', 0),
(2843, '32102', 'Casino Marina Baccarat 3', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaBaccarat3.webp', 1, 'EZUGI', 0),
(2844, '32103', 'Casino Marina Baccarat 4', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaBaccarat4.webp', 1, 'EZUGI', 0),
(2845, '43100', 'Fiesta Baccarat', 'https://ezugi.bet4wins.net/assets/banner/FiestaBaccarat.webp', 1, 'EZUGI', 0),
(2846, '221000', 'Speed Roulette', 'https://ezugi.bet4wins.net/assets/banner/SpeedRoulette.webp', 1, 'EZUGI', 0),
(2847, '221002', 'Speed Auto Roulette', 'https://ezugi.bet4wins.net/assets/banner/SpeedAutoRoulette.webp', 1, 'EZUGI', 0),
(2848, '221003', 'Diamond Roulette', 'https://ezugi.bet4wins.net/assets/banner/DiamondRoulette.webp', 1, 'EZUGI', 0),
(2849, '221004', 'Prestige Auto Roulette', 'https://ezugi.bet4wins.net/assets/banner/AutomaticRoulette1.webp', 1, 'EZUGI', 0),
(2850, '221005', 'Namaste Roulette', 'https://ezugi.bet4wins.net/assets/banner/NamasteRoulette.webp', 1, 'EZUGI', 0),
(2851, '224100', 'Ultimate Sic Bo', 'https://ezugi.bet4wins.net/assets/banner/UltimateSicBo.webp', 1, 'EZUGI', 0),
(2852, '228000', 'Andar Bahar', 'https://ezugi.bet4wins.net/assets/banner/AndarBahar.webp', 1, 'EZUGI', 0),
(2853, '228001', 'Lucky 7', 'https://ezugi.bet4wins.net/assets/banner/Lucky7.webp', 1, 'EZUGI', 0),
(2854, '228100', 'Ultimate Andar Bahar', 'https://ezugi.bet4wins.net/assets/banner/UltimateAndarBahar.webp', 1, 'EZUGI', 0),
(2855, '321000', 'Casino Marina Roulette 1', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaRoulette1.webp', 1, 'EZUGI', 0),
(2856, '321001', 'Casino Marina Roulette 2', 'https://ezugi.bet4wins.net/assets/banner/CasinoMarinaRoulette2.webp', 1, 'EZUGI', 0),
(2857, '411000', 'Spanish Roulette', 'https://ezugi.bet4wins.net/assets/banner/CumbiaRuleta1.webp', 1, 'EZUGI', 0),
(2858, '431000', 'Ruleta del Sol', 'https://ezugi.bet4wins.net/assets/banner/RuletadelSol.webp', 1, 'EZUGI', 0),
(2859, '431001', 'Fiesta Roulette', 'https://ezugi.bet4wins.net/assets/banner/FiestaRoulette.webp', 1, 'EZUGI', 0),
(2860, '481001', 'EZ Dealer Roulette Thai', 'https://ezugi.bet4wins.net/assets/banner/EZDealerRoulette.webp', 1, 'EZUGI', 0),
(2861, '481002', 'EZ Dealer Roulette Japanese', 'https://ezugi.bet4wins.net/assets/banner/EZDealerRouletteJapanese.webp', 1, 'EZUGI', 0),
(2862, '481003', 'EZ Dealer Roulette Mandarin', 'https://ezugi.bet4wins.net/assets/banner/EZDealerRouletteMandarin.webp', 1, 'EZUGI', 0),
(2863, '501000', 'Turkish Roulette', 'https://ezugi.bet4wins.net/assets/banner/TurkishRoulette.webp', 1, 'EZUGI', 0),
(2864, '601000', 'Russian Roulette', 'https://ezugi.bet4wins.net/assets/banner/RouletteGold3.webp', 1, 'EZUGI', 0),
(2865, '611000', 'Portomaso Roulette 2', 'https://ezugi.bet4wins.net/assets/banner/PortomasoCasinoRoulette.webp', 1, 'EZUGI', 0),
(2866, '611001', 'Oracle Real Roulette', 'https://ezugi.bet4wins.net/assets/banner/OracleCasinoRoulette.webp', 1, 'EZUGI', 0),
(2867, '611003', 'Oracle 360 Roulette', 'https://ezugi.bet4wins.net/assets/banner/OracleCasinoRoulette360.webp', 1, 'EZUGI', 0),
(2868, 'vs5ultrab', 'Ultra Burn', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5ultrab.png', 1, 'REELKINGDOM', 0),
(2869, 'vs5ultra', 'Ultra Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5ultra.png', 1, 'REELKINGDOM', 0),
(2870, 'vs10returndead', 'Return of the Dead', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10returndead.png', 1, 'REELKINGDOM', 0),
(2871, 'vs10bbbonanza', 'Big Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bbbonanza.png', 1, 'REELKINGDOM', 0),
(2872, 'vs20hburnhs', 'Hot to Burn Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20hburnhs.png', 1, 'REELKINGDOM', 0),
(2873, 'vswayslight', 'Lucky Lightning', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayslight.png', 1, 'REELKINGDOM', 0),
(2874, 'vs12bbb', 'Bigger Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs12bbb.png', 1, 'REELKINGDOM', 0),
(2875, 'vs10floatdrg', 'Floating Dragon', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10floatdrg.png', 1, 'REELKINGDOM', 0),
(2876, 'vs1024temuj', 'Temujin Treasures', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1024temuj.png', 1, 'REELKINGDOM', 0),
(2877, 'vs10bxmasbnza', 'Christmas Big Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bxmasbnza.png', 1, 'REELKINGDOM', 0),
(2878, 'vswaysbbb', 'Big Bass Bonanza Megaways™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysbbb.png', 1, 'REELKINGDOM', 0),
(2879, 'vs40bigjuan', 'Big Juan', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40bigjuan.png', 1, 'REELKINGDOM', 0),
(2880, 'vs10starpirate', 'Star Pirates Code', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10starpirate.png', 1, 'REELKINGDOM', 0),
(2881, 'vs5hotburn', 'Hot to burn', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5hotburn.png', 1, 'REELKINGDOM', 0),
(2882, 'vs25bkofkngdm', 'Book of Kingdoms', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25bkofkngdm.png', 1, 'REELKINGDOM', 0),
(2883, 'vs10eyestorm', 'Eye of the Storm', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10eyestorm.png', 1, 'REELKINGDOM', 0),
(2884, 'vs10amm', 'The Amazing Money Machine', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10amm.png', 1, 'REELKINGDOM', 0),
(2885, 'vs10luckcharm', 'Lucky Grace And Charm', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10luckcharm.png', 1, 'REELKINGDOM', 0),
(2886, 'vs25goldparty', 'Gold Party®', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25goldparty.png', 1, 'REELKINGDOM', 0),
(2887, 'vs20rockvegas', 'Rock Vegas Mega Hold & Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20rockvegas.png', 1, 'REELKINGDOM', 0),
(2888, 'vs10tictac', 'Tic Tac Take', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10tictac.png', 1, 'REELKINGDOM', 0),
(2889, 'vs243queenie', 'Queenie', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243queenie.png', 1, 'REELKINGDOM', 0),
(2890, 'vs10spiritadv', 'Spirit of Adventure', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10spiritadv.png', 1, 'REELKINGDOM', 0),
(2891, 'vs5littlegem', 'Little Gem Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5littlegem.png', 1, 'REELKINGDOM', 0),
(2892, 'piggy-gold', 'Piggy Gold', 'https://mxvbet.xyz/uploads/game-140473189254.png', 1, 'PGSOFT', 1),
(2893, 'ganesha-gold', 'Ganesha Gold', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11337.png', 1, 'PGSOFT', 0),
(2894, 'jungle-delight', 'Jungle Delight', 'https://mxvbet.xyz/uploads/game-195055689218.jpg', 1, 'PGSOFT', 1),
(2895, 'double-fortune', 'Double Fortune', 'https://mxvbet.xyz/uploads/game-130071787445.jpg', 1, 'PGSOFT', 1),
(2896, 'the-great-icescape', 'The Great Icescape', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11343.png', 1, 'PGSOFT', 0),
(2897, 'captains-bounty', 'Captain\'s Bounty', 'https://mxvbet.xyz/uploads/game-108436035039.png', 1, 'PGSOFT', 1),
(2898, 'leprechaun-riches', 'Leprechaun Riches', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11347.png', 1, 'PGSOFT', 0),
(2899, 'mahjong-ways', 'Mahjong Ways', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11352.png', 1, 'PGSOFT', 0),
(2900, 'fortune-mouse', 'Fortune Mouse', 'https://mxvbet.xyz/uploads/game-198877809095.png', 1, 'PGSOFT', 1),
(2901, 'gem-saviour-conquest', 'Gem Saviour Conquest', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11356.png', 1, 'PGSOFT', 0),
(2902, 'candy-burst', 'Candy Burst', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11359.png', 1, 'PGSOFT', 0),
(2903, 'bikini-paradise', 'Bikini Paradise', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11360.png', 1, 'PGSOFT', 0),
(2904, 'mahjong-ways2', 'Mahjong Ways 2', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11361.png', 1, 'PGSOFT', 0),
(2905, 'egypts-book-mystery', 'Egypt\'s Book of Mystery', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11362.png', 1, 'PGSOFT', 0),
(2906, 'ganesha-fortune', 'Ganesha Fortune', 'https://mxvbet.xyz/uploads/game-234953428826.jpg', 1, 'PGSOFT', 1),
(2907, 'phoenix-rises', 'Phoenix Rises', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11365.png', 1, 'PGSOFT', 0),
(2908, 'wild-fireworks', 'Wild Fireworks', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11369.png', 1, 'PGSOFT', 0),
(2909, 'genies-wishes', 'Genie\'s 3 Wishes', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11371.png', 1, 'PGSOFT', 0),
(2910, 'treasures-aztec', 'Treasures of Aztec', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11372.png', 1, 'PGSOFT', 0),
(2911, 'queen-bounty', 'Queen of Bounty', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11610.jpg', 1, 'PGSOFT', 0),
(2912, 'jewels-prosper', 'Jewels of Prosperity', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11611.jpg', 1, 'PGSOFT', 0),
(2913, 'galactic-gems', 'Galactic Gems', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11614.png', 1, 'PGSOFT', 0),
(2914, 'gdn-ice-fire', 'Guardians of Ice and Fire', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11615.png', 1, 'PGSOFT', 0),
(2915, 'fortune-ox', 'Fortune Ox', 'https://mxvbet.xyz/uploads/game-203232781989.png', 1, 'PGSOFT', 1),
(2916, 'wild-bandito', 'Wild Bandito', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11855.jpg', 1, 'PGSOFT', 0),
(2917, 'candy-bonanza', 'Candy Bonanza', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11854.jpg', 1, 'PGSOFT', 0),
(2918, 'majestic-ts', 'Majestic Treasures', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/11853.jpg', 1, 'PGSOFT', 0),
(2919, 'crypt-fortune', 'Raider Jane\'s Crypt of Fortune', 'https://mxvbet.xyz/uploads/game-95602634503.jpg', 1, 'PGSOFT', 1),
(2920, 'sprmkt-spree', 'Supermarket Spree', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12207.png', 1, 'PGSOFT', 0),
(2921, 'lgd-monkey-kg', 'Legendary Monkey King', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12209.png', 1, 'PGSOFT', 0),
(2922, 'spirit-wonder', 'Spirited Wonders', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12306.jpg', 1, 'PGSOFT', 0),
(2923, 'emoji-riches', 'Emoji Riches', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12308.png', 1, 'PGSOFT', 0),
(2924, 'fortune-tiger', 'Fortune Tiger', 'https://mxvbet.xyz/uploads/game-54064930455.jpg', 1, 'PGSOFT', 1),
(2925, 'garuda-gems', 'Garuda Gems', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12504.png', 1, 'PGSOFT', 0),
(2926, 'dest-sun-moon', 'Destiny of Sun & Moon', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12505.png', 1, 'PGSOFT', 0),
(2927, 'btrfly-blossom', 'Butterfly Blossom', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12569.jpeg', 1, 'PGSOFT', 0),
(2928, 'rooster-rbl', 'Rooster Rumble', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12594.jpg', 1, 'PGSOFT', 0),
(2929, 'battleground', 'Battleground Royale', 'https://resource.fdsigaming.com/thumbnail/slot/pgsoft/12633.jpg', 1, 'PGSOFT', 0),
(2930, 'fortune-rabbit', 'Fortune Rabbit', 'https://mxvbet.xyz/uploads/game-174372858262.jpg', 1, 'PGSOFT', 1),
(2931, 'btball5x20', 'Crazy Basketball', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/021.Crazy Basketball.png', 1, 'DREAMTECH', 0),
(2932, 'dnp', 'DragonPhoenix Prosper', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/022.DragonPhoenix Prosper.png', 1, 'DREAMTECH', 0),
(2933, 'crystal', 'Glory of Heroes', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/023.Glory of Heroes.png', 1, 'DREAMTECH', 0),
(2934, 'xjqy5x9', 'Chinese Paladin', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/024.Chinese Paladin.png', 1, 'DREAMTECH', 0),
(2935, 'fls', 'FULUSHOU', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/025.FULUSHOU.png', 1, 'DREAMTECH', 0),
(2936, 'fourss', 'Four Holy Beasts', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/026.Four Holy Beasts.png', 1, 'DREAMTECH', 0),
(2937, 'casino', '3D Slot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/028.3D Slot.png', 1, 'DREAMTECH', 0),
(2938, 'crazy5x243', 'Crazy GO GO GO', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/029.Crazy GO GO GO.png', 1, 'DREAMTECH', 0),
(2939, 'rocknight', 'RocknRoll Night', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/031.RocknRoll Night.png', 1, 'DREAMTECH', 0),
(2940, 'bluesea', 'Blue Sea', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/032.Blue Sea.png', 1, 'DREAMTECH', 0),
(2941, 'klnz5x20', 'Happy Farm', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/033.Happy Farm.png', 1, 'DREAMTECH', 0),
(2942, 'circus', 'Crazy Circus', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/034.Crazy Circus.png', 1, 'DREAMTECH', 0),
(2943, 'sq5x243', '4X4 BATTLE', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/036.4X4 BATTLE.png', 1, 'DREAMTECH', 0),
(2944, 'bikini', 'Bikini Party', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/037.Bikini Party.png', 1, 'DREAMTECH', 0),
(2945, 'estate5x25', 'Monopoly', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/039.Monopoly.png', 1, 'DREAMTECH', 0),
(2946, 'piratetreasure', 'Pirate_Treasure', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/042.PirateTreasure.png', 1, 'DREAMTECH', 0),
(2947, 'foryouth5x25', 'SO YOUNG', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/045.SO YOUNG.png', 1, 'DREAMTECH', 0),
(2948, 'fourbeauty', 'Four Beauties', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/046.Four Beauties.png', 1, 'DREAMTECH', 0),
(2949, 'sweethouse', 'Candy House', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/047.Candy House.png', 1, 'DREAMTECH', 0),
(2950, 'legend5x25', 'Legend of the King', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/048.Legend of the King.png', 1, 'DREAMTECH', 0),
(2951, 'rocket6x25', 'Happiness Overflow', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/049.Happiness Overflow.png', 1, 'DREAMTECH', 0),
(2952, 'hotpot5x25', 'Spicy Hotpot', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/050.Spicy Hotpot.png', 1, 'DREAMTECH', 0),
(2953, 'opera', 'Beijing opera', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/051.Beijing opera.jpeg', 1, 'DREAMTECH', 0),
(2954, 'bigred', 'Big Red', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/055.Big Red.jpeg', 1, 'DREAMTECH', 0),
(2955, 'wrathofthor', 'Wrath of Thor', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/056.Wrath of Thor.png', 1, 'DREAMTECH', 0),
(2956, 'boxingarena', 'Boxing Arena', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/059.Boxing Arena.jpeg', 1, 'DREAMTECH', 0),
(2957, 'bxgh5x25', 'Eight Immortals', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/060.Eight Immortals.png', 1, 'DREAMTECH', 0),
(2958, 'fantasyforest', 'Elf Kingdom', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/061.Elf Kingdom.png', 1, 'DREAMTECH', 0),
(2959, 'camgirl5x25', 'Sexy Camgirl', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/062.Sexy Camgirl.png', 1, 'DREAMTECH', 0),
(2960, 'hotpotfeast', 'Hotpot Feast', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/064.Hotpot Feast.png', 1, 'DREAMTECH', 0),
(2961, 'magician', 'Magician', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/065.Magician.png', 1, 'DREAMTECH', 0),
(2962, 'armorCrisis5x25', 'Armor Crisis', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/067.Armor Crisis.jpeg', 1, 'DREAMTECH', 0),
(2963, 'galaxywars', 'Galaxy Wars', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/068.Galaxy Wars.png', 1, 'DREAMTECH', 0),
(2964, 'easyrider', 'Easy Rider', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/069.Easy Rider.png', 1, 'DREAMTECH', 0),
(2965, 'bwzq5x25', 'Joust for a spouse', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/070.Joust for a spouse.png', 1, 'DREAMTECH', 0),
(2966, 'worldCup5x25', 'FIFA World Cup', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/071.FIFA World Cup.png', 1, 'DREAMTECH', 0),
(2967, 'goldjade5x50', 'Jin Yu Man Tang', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/072.Jin Yu Man Tang.png', 1, 'DREAMTECH', 0),
(2968, 'shokudo', 'shokudo', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/073.shokudo.jpeg', 1, 'DREAMTECH', 0),
(2969, 'train', 'Treasure Hunt Trip', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/074.Treasure Hunt Trip.png', 1, 'DREAMTECH', 0),
(2970, 'oceanpark5x50', 'Ocean Park', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/075.Ocean Park.jpeg', 1, 'DREAMTECH', 0),
(2971, 'lovefighters', 'Love Fighters', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/077.Love Fighters.png', 1, 'DREAMTECH', 0),
(2972, 'genie', 'Aladdin\'s Wish', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/078.Aladdin\'s Wish.png', 1, 'DREAMTECH', 0),
(2973, 'garden', 'Little Big Garden', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/079.Little Big Garden.png', 1, 'DREAMTECH', 0),
(2974, 'legendary', 'Legendary Tales', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/081.Legendary Tales.png', 1, 'DREAMTECH', 0),
(2975, 'superstar5x50', 'Star Generation', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/083.Star Generation.png', 1, 'DREAMTECH', 0),
(2976, 'alchemist', 'Crazy Alchemist', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/084.Crazy Alchemist.png', 1, 'DREAMTECH', 0),
(2977, 'dinosaur5x25', 'Dinosaur World', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/089.Dinosaur World.png', 1, 'DREAMTECH', 0),
(2978, 'shopping5x243', 'National Carnival', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/090.National Carnival.png', 1, 'DREAMTECH', 0),
(2979, 'tombshadow', 'Tomb Shadow', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/086.Tomb Shadow.png', 1, 'DREAMTECH', 0),
(2980, 'clash', 'Clash of Three kingdoms', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/088.Clash of Three kingdoms.png', 1, 'DREAMTECH', 0),
(2981, 'icefire', 'Ice And Fire', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/093.Ice And Fire.png', 1, 'DREAMTECH', 0),
(2982, 'legendMir5x25', 'Legendary Hegemony', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/095.Legendary Hegemony.png', 1, 'DREAMTECH', 0),
(2983, 'whackamole', 'Whack-A-Mole', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/094.Whack-A-Mole.png', 1, 'DREAMTECH', 0),
(2984, 'onenight5x243', 'Truffle Butter', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/096.Truffle Butter.png', 1, 'DREAMTECH', 0),
(2985, 'magicbean', 'Magic Bean Legend', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/097.Magic Bean Legend.png', 1, 'DREAMTECH', 0),
(2986, 'xiaoxiaole7x50', 'Monster Pop', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/103.Monster Pop.png', 1, 'DREAMTECH', 0),
(2987, 'newyear5x25', 'Happy Piggy New Year', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/101.Happy Piggy New Year.png', 1, 'DREAMTECH', 0),
(2988, 'secretdate', 'Secret Date', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/104.Secret Date.png', 1, 'DREAMTECH', 0),
(2989, 'king5x25', 'Im King', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/105.ImKing.png', 1, 'DREAMTECH', 0),
(2990, 'bacteria', 'Germ Lab', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/106.GermLab.png', 1, 'DREAMTECH', 0),
(2991, 'cute5x50', 'Castle Guardian', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/107.CastleGurdian.png', 1, 'DREAMTECH', 0),
(2992, 'baseball', 'Baseball Frenzy', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/108.BaseballFrenzy.png', 1, 'DREAMTECH', 0),
(2993, 'streetdance5x25', 'Street Dance Show', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/109.StreetDanceShow.png', 1, 'DREAMTECH', 0),
(2994, 'museum', 'Wondrous Museum', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/110.WondrousMuseum.png', 1, 'DREAMTECH', 0),
(2995, 'mysticalstones', 'Mystical Stones', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/111.MysticalStones.png', 1, 'DREAMTECH', 0),
(2996, 'sincity', 'Sin City', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/113.SinCity.png', 1, 'DREAMTECH', 0),
(2997, 'wheel', 'Secrets of The Pentagram', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/114.Secretsofthe pentagram.png', 1, 'DREAMTECH', 0),
(2998, 'westwild', 'West Wild', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/116.WestWild.png', 1, 'DREAMTECH', 0),
(2999, 'halloween', 'Witch Winnings', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/115.WitchWinnings.png', 1, 'DREAMTECH', 0),
(3000, 'bloodmoon', 'Blood Wolf legend', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/118.BloodWolf.png', 1, 'DREAMTECH', 0),
(3001, 'wildchaser5x20', 'Battle Field', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/120.BattleField.png', 1, 'DREAMTECH', 0),
(3002, 'dragonball2', 'Heroes of the East', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/121.HeroesofTheEast.png', 1, 'DREAMTECH', 0),
(3003, 'sgkill5x20', 'Three Kingdoms', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/122.ThreeKingdoms.png', 1, 'DREAMTECH', 0),
(3004, 'pirate5x25', 'Captain\'s Treasure', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9658.png', 1, 'DREAMTECH', 0),
(3005, 'muaythai', 'Muaythai', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9659.png', 1, 'DREAMTECH', 0),
(3006, 'sailor', 'Sailor Princess', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9660.png', 1, 'DREAMTECH', 0),
(3007, 'nightclub', 'Infinity Club', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9661.png', 1, 'DREAMTECH', 0),
(3008, 'nezha', 'Nezha Legend', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/_9662.png', 1, 'DREAMTECH', 0),
(3009, 'bird', 'Bird Island', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10900.png', 1, 'DREAMTECH', 0),
(3010, 'chess', 'Dragon Auto Chess', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10901.png', 1, 'DREAMTECH', 0),
(3011, 'honor', 'Field Of Honor', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10902.png', 1, 'DREAMTECH', 0),
(3012, 'goldrat5x243', 'Golden Rat', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10905.png', 1, 'DREAMTECH', 0),
(3013, 'girlgroup5x25', 'Sexy Girls', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10906.png', 1, 'DREAMTECH', 0),
(3014, 'boss5x20', 'Rich Asians', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10907.png', 1, 'DREAMTECH', 0),
(3015, 'vikings', 'Nordic Saga', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10908.png', 1, 'DREAMTECH', 0),
(3016, 'treasures', 'Secret Treasures', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/10909.png', 1, 'DREAMTECH', 0),
(3017, 'shiningstars', 'ShiningStars', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/11268.png', 1, 'DREAMTECH', 0),
(3018, 'tgow2plus', 'Cai Shen Dao Plus', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/11555.png', 1, 'DREAMTECH', 0),
(3019, 'peeping', 'Peeping', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/11556.png', 1, 'DREAMTECH', 0),
(3020, 'ds5x25', 'Drawing Sword', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12032.png', 1, 'DREAMTECH', 0),
(3021, 'empire5x40', 'The Magic Blade', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12033.png', 1, 'DREAMTECH', 0),
(3022, 'luckyfortune5x50', 'Lucky Fortune', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12034.png', 1, 'DREAMTECH', 0),
(3023, 'maidhotel5x25', 'Maid Hotel', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12035.png', 1, 'DREAMTECH', 0),
(3024, 'secretary3x9', 'Sexy Secretary', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12036.png', 1, 'DREAMTECH', 0),
(3025, 'hawaii5x20', 'Hawaii Vacation', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12037.png', 1, 'DREAMTECH', 0),
(3026, 'billiards5x243', 'POOL EIGHT BALL', 'https://resource.fdsigaming.com/thumbnail/slot/dtech/12362.png', 1, 'DREAMTECH', 0),
(3027, 'WildTriads', 'WildTriads', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/WildTriads.png', 1, 'TOPTREND', 0),
(3028, 'ReelsOfFortune', 'Reels Of Fortune', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/ReelsOfFortune.png', 1, 'TOPTREND', 0),
(3029, 'GoldenAmazon', 'Golden Amazon', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/GoldenAmazon.png', 1, 'TOPTREND', 0),
(3030, 'MonkeyLuck', 'MonkeyLuck', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/MonkeyLuck.png', 1, 'TOPTREND', 0),
(3031, 'LeagueOfChampions', 'League Of Champions', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/LeagueOfChampions.png', 1, 'TOPTREND', 0),
(3032, 'MadMonkeyH5', 'MadMonkey', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/MadMonkeyH5.png', 1, 'TOPTREND', 0),
(3033, 'DynastyEmpire', 'Dynasty Empire', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DynastyEmpire.png', 1, 'TOPTREND', 0),
(3034, 'SuperKids', 'SuperKids', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/SuperKids.png', 1, 'TOPTREND', 0),
(3035, 'HotVolcanoH5', 'HotVolcano', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/HotVolcano.png', 1, 'TOPTREND', 0),
(3036, 'Huluwa', 'Huluwa', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/Huluwa.png', 1, 'TOPTREND', 0),
(3037, 'LegendOfLinkH5', 'LegendOfLink', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/LegendOfLinkH5.png', 1, 'TOPTREND', 0),
(3038, 'DetectiveBlackCat', 'DetectiveBlackCat', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DetectiveBlackcat.png', 1, 'TOPTREND', 0),
(3039, 'ChilliGoldH5', 'Chilli Gold', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/ChiliGoldH5.png', 1, 'TOPTREND', 0),
(3040, 'SilverLionH5', 'Silver Lion', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/SilverLionH5.png', 1, 'TOPTREND', 0),
(3041, 'ThunderingZeusH5', 'ThunderingZeus', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/ThunderingZeus.png', 1, 'TOPTREND', 0),
(3042, 'DragonPalaceH5', 'Dragon Palace', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11658.png', 1, 'TOPTREND', 0),
(3043, 'MadMonkey2', 'MadMonkey', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11660.png', 1, 'TOPTREND', 0),
(3044, 'MedusaCurse', 'Medusa Curse', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11661.png', 1, 'TOPTREND', 0),
(3045, 'BattleHeroes', 'Battle Heroes', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11662.png', 1, 'TOPTREND', 0),
(3046, 'NeptunesGoldH5', 'Neptunes Gold', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11664.png', 1, 'TOPTREND', 0),
(3047, 'HeroesNeverDie', 'Heroes Never Die', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11665.png', 1, 'TOPTREND', 0),
(3048, 'WildWildWitch', 'Wild Wild Witch', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11666.png', 1, 'TOPTREND', 0),
(3049, 'WildKartRacers', 'Wild Kart Racers', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11667.png', 1, 'TOPTREND', 0),
(3050, 'KingDinosaur', 'KingDinosaur', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11668.png', 1, 'TOPTREND', 0),
(3051, 'GoldenGenie', 'GoldenGenie', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11669.png', 1, 'TOPTREND', 0),
(3052, 'UltimateFighter', 'UltimateFighter', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11672.png', 1, 'TOPTREND', 0),
(3053, 'EverlastingSpins', 'EverlastingSpins', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11673.png', 1, 'TOPTREND', 0),
(3054, 'Zoomania', 'Zoomania', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11676.png', 1, 'TOPTREND', 0),
(3055, 'LaserCats', 'Laser Cats', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11679.png', 1, 'TOPTREND', 0),
(3056, 'DiamondFortune', 'DiamondFortune', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11682.png', 1, 'TOPTREND', 0),
(3057, 'GoldenClaw', 'GoldenClaw', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11685.png', 1, 'TOPTREND', 0),
(3058, 'PandaWarrior', 'PandaWarrior', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11687.png', 1, 'TOPTREND', 0),
(3059, 'RoyalGoldenDragon', 'RoyalGoldenDragon', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11690.png', 1, 'TOPTREND', 0),
(3060, 'MegaMaya', 'MegaMaya', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11697.png', 1, 'TOPTREND', 0),
(3061, 'MegaPhoenix', 'MegaPhoenix', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/11864.png', 1, 'TOPTREND', 0),
(3062, 'DolphinGoldH5', 'DolphinGold', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DolphinGoldH5.png', 1, 'TOPTREND', 0),
(3063, 'DragonKingH5', 'DragonKing', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/DragonKingH5.png', 1, 'TOPTREND', 0),
(3064, 'LuckyPandaH5', 'LuckyPanda', 'https://resource.fdsigaming.com/thumbnail/slot/ttg/LuckyPanda.png', 1, 'TOPTREND', 0),
(3065, 'greatwall', 'The Great Wall Treasure', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/The_Great_Wall_Treasures_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3066, 'chinesenewyear', 'Chinese New Year', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Chinese_New_Year_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3067, 'jewellerystore', 'Jewelry store', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Jewellery_Store_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3068, 'redcliff', 'Red cliff', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Red_Cliff_360x340.png', 1, 'EVOPLAY', 0),
(3069, 'ElvenPrincesses', 'Elven Princess', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Elven_Princesses_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3070, 'robinzon', 'Robinson', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Robinson_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3071, 'aeronauts', 'Aeronauts', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/Aeronauts_Thumbnail_360x360.png', 1, 'EVOPLAY', 0),
(3072, 'NukeWorld', 'Nook World', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/9102.jpg', 1, 'EVOPLAY', 0),
(3073, 'legendofkaan', 'Legend of Khan', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/10033.png', 1, 'EVOPLAY', 0),
(3074, 'LivingTales', 'Night of the Living Tales', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11292.jpg', 1, 'EVOPLAY', 0),
(3075, 'IceMania', 'Ice mania', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11384.jpg', 1, 'EVOPLAY', 0),
(3076, 'ValleyOfDreams', 'Valley of Dreams', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11427.png', 1, 'EVOPLAY', 0),
(3077, 'FruitNova', 'Fruit Nova', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11428.jpg', 1, 'EVOPLAY', 0),
(3078, 'TreeOfLight', 'Tree of light', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11503.png', 1, 'EVOPLAY', 0),
(3079, 'TempleOfDead', 'Temple of the dead', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11604.png', 1, 'EVOPLAY', 0),
(3080, 'RunesOfDestiny', 'Runes of Destiny', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11728.png', 1, 'EVOPLAY', 0),
(3081, 'EllensFortune', 'Ellen Fortune', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11729.jpg', 1, 'EVOPLAY', 0),
(3082, 'UnlimitedWishes', 'Unlimited Wishes', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11807.jpg', 1, 'EVOPLAY', 0),
(3083, 'FoodFeast', 'Food fist', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11808.jpg', 1, 'EVOPLAY', 0);
INSERT INTO `games` (`id`, `game_code`, `game_name`, `banner`, `status`, `provider`, `popular`) VALUES
(3084, 'EpicLegends', 'Epic legends', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11810.jpg', 1, 'EVOPLAY', 0),
(3085, 'SweetSugar', 'Sweet sugar', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/11811.png', 1, 'EVOPLAY', 0),
(3086, 'GangsterNight', 'Gangster night', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12057.jpg', 1, 'EVOPLAY', 0),
(3087, 'GoldOfSirens', 'Gold of sirens', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12058.jpg', 1, 'EVOPLAY', 0),
(3088, 'BloodyBrilliant', 'Bloody brilliant', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12059.jpg', 1, 'EVOPLAY', 0),
(3089, 'TempleOfDeadBonusBuy', 'Temple of the Dead BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12133.jpg', 1, 'EVOPLAY', 0),
(3090, 'AnubisMoon', 'Anubis moon', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12171.jpg', 1, 'EVOPLAY', 0),
(3091, 'FruitDisco', 'Fruit disco', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12172.jpg', 1, 'EVOPLAY', 0),
(3092, 'FruitSuperNova30', 'Fruit Super Nova 30', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12173.jpg', 1, 'EVOPLAY', 0),
(3093, 'CurseOfThePharaoh', 'Curse of the Pharaoh', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12174.jpg', 1, 'EVOPLAY', 0),
(3094, 'FruitSuperNova60', 'Fruit Super Nova 60', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12227.jpg', 1, 'EVOPLAY', 0),
(3095, 'CurseofthePharaohBonusBuy', 'Curse of the Pharaoh BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12228.jpg', 1, 'EVOPLAY', 0),
(3096, 'FruitSuperNova100', 'Fruit Super Nova 100', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12256.jpg', 1, 'EVOPLAY', 0),
(3097, 'ChristmasReach', 'Christmas lychee', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12269.jpg', 1, 'EVOPLAY', 0),
(3098, 'FruitSuperNova80', 'Whoft Super Nova 80', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12326.jpg', 1, 'EVOPLAY', 0),
(3099, 'DragonsTavern', 'Dragon\'s Tavern', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12327.jpg', 1, 'EVOPLAY', 0),
(3100, 'ChristmasReachBonusBuy', 'Christmas Riti BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12329.jpg', 1, 'EVOPLAY', 0),
(3101, 'WildOverlords', 'Wild overlord', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12329.jpg', 1, 'EVOPLAY', 0),
(3102, 'DragonsTavernBonusBuy', 'Dragon\'s Tavern BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12358.jpg', 1, 'EVOPLAY', 0),
(3103, 'BudaiReels', 'Budai reels', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12381.jpg', 1, 'EVOPLAY', 0),
(3104, 'MoneyMinter', 'Money minter', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12575_.jpeg', 1, 'EVOPLAY', 0),
(3105, 'JuicyGems', 'Watch gem', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12895.jpg', 1, 'EVOPLAY', 0),
(3106, 'JuicyGemsBB', 'Watch Gem BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12896.jpg', 1, 'EVOPLAY', 0),
(3107, 'TheGreatestCatch', 'The Greatest Catch', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12892.jpg', 1, 'EVOPLAY', 0),
(3108, 'TheGreatestCatchBonusBuy', 'The Greatest Catch BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12893.jpg', 1, 'EVOPLAY', 0),
(3109, 'TreeOfLightBB', 'Tree of Light BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12899.jpg', 1, 'EVOPLAY', 0),
(3110, 'WolfHiding', 'Wolf Hiding', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12953.jpg', 1, 'EVOPLAY', 0),
(3111, 'CaminoDeChili', 'Camino de Chili', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12902.jpg', 1, 'EVOPLAY', 0),
(3112, 'CandyDreamsSweetPlanet', 'Candy dreams', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12902.jpg', 1, 'EVOPLAY', 0),
(3113, 'WildOverlordsBonusBuy', 'Wild Overlord BB', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12890.jpg', 1, 'EVOPLAY', 0),
(3114, 'TempleOfThunder', 'Temple of Thunder', 'https://resource.fdsigaming.com/thumbnail/slot/evoplay/12891.jpg', 1, 'EVOPLAY', 0),
(3115, 'hand_of_gold', 'HAND OF GOLD', 'https://cdn46952.bngsrv.com/games/banner_220_en.png?ts=1618995876889', 1, 'PLAYSON', 0),
(3116, 'legend_of_cleopatra', 'LEGEND OF CLEOPATRA', 'https://cdn46952.bngsrv.com/static/games/banner_69_en.jpg', 1, 'PLAYSON', 0),
(3117, '40_joker_staxx', '40 JOKER STAXX', 'https://cdn46952.bngsrv.com/games/banner_96_en.png?ts=1616657514396', 1, 'PLAYSON', 0),
(3118, 'burning_wins', 'BURNING WINS', 'https://cdn46952.bngsrv.com/games/banner_102_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3119, 'book_of_gold', 'BOOK OF GOLD', 'https://cdn46952.bngsrv.com/games/banner_133_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3120, '100_joker_staxx', '100 JOKER STAXX', 'https://cdn46952.bngsrv.com/games/banner_144_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3121, 'book_of_gold_classic', 'BOOK OF GOLD CLASSIC', 'https://cdn46952.bngsrv.com/games/banner_159_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3122, 'book_of_gold_multichance', 'BOOK OF GOLD MULTICHANCE', 'https://cdn46952.bngsrv.com/games/banner_199_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3123, 'buffalo_xmas', 'BUFFALO XMAS', 'https://cdn46952.bngsrv.com/games/banner_248_en.png?ts=1575280724870', 1, 'PLAYSON', 0),
(3124, 'sun_of_egypt', 'SUN OF EGYPT', 'https://cdn46952.bngsrv.com/games/banner_173_en.jpe?ts=1573550830337', 1, 'BOOONGO', 0),
(3125, 'sun_of_egypt_2', 'SUN OF EGYPT 2', 'https://cdn46952.bngsrv.com/games/banner_202_en.jpg?ts=1602582288012', 1, 'BOOONGO', 0),
(3126, 'happy_fish', 'HAPPY FISH', 'https://cdn46952.bngsrv.com/games/banner_261_en.jpg?ts=1644912611364', 1, 'BOOONGO', 0),
(3127, 'queen_of_the_sun', 'QUEEN OF THE SUN', 'https://cdn46952.bngsrv.com/games/banner_256_en.jpg?ts=1643099409287', 1, 'BOOONGO', 0),
(3128, 'tiger_jungle', 'TIGER JUNGLE', 'https://cdn46952.bngsrv.com/games/banner_242_en.jpg?ts=1630999887216', 1, 'BOOONGO', 0),
(3129, 'black_wolf', 'BLACK WOLF', 'https://cdn46952.bngsrv.com/games/banner_254_en.jpg?ts=1637589465054', 1, 'BOOONGO', 0),
(3130, 'hit_the_gold', 'HIT THE GOLD', 'https://cdn46952.bngsrv.com/games/banner_228_en.jpg?ts=1621873173151', 1, 'BOOONGO', 0),
(3131, 'candy_boom', 'CANDY BOOM', 'https://cdn46952.bngsrv.com/games/banner_250_en.jpg?ts=1635783617393', 1, 'BOOONGO', 0),
(3132, 'scarab_riches', 'SCARAB RICHES', 'https://cdn46952.bngsrv.com/games/banner_168_en.jpe?ts=1568115171958', 1, 'BOOONGO', 0),
(3133, 'golden_dancing_lion', 'GOLDEN DANCING LION', 'https://cdn46952.bngsrv.com/games/banner_252_en.jpg?ts=1637050697146', 1, 'BOOONGO', 0),
(3134, 'dragon_pearls', 'DRAGON PEARLS', 'https://cdn46952.bngsrv.com/games/banner_151_en.jpeg?ts=1551785453936', 1, 'BOOONGO', 0),
(3135, '3_coins', '3 COINS', 'https://cdn46952.bngsrv.com/games/banner_212_en.jpg?ts=1610363762913', 1, 'BOOONGO', 0),
(3136, 'super_rich_god', 'SUPER RICH GOD', 'https://cdn46952.bngsrv.com/games/banner_217_en.jpg?ts=1614080397964', 1, 'BOOONGO', 0),
(3137, '15_dragon_pearls', '15 DRAGON PEARLS', 'https://cdn46952.bngsrv.com/games/banner_197_en.jpeg?ts=1597062411022', 1, 'BOOONGO', 0),
(3138, 'aztec_sun', 'AZTEC SUN', 'https://cdn46952.bngsrv.com/games/banner_187_en.jpe?ts=1591699656458', 1, 'BOOONGO', 0),
(3139, 'scarab_temple', 'SCARAB TEMPLE', 'https://cdn46952.bngsrv.com/games/banner_201_en.jpeg?ts=1601369529833', 1, 'BOOONGO', 0),
(3140, 'gods_temple_deluxe', 'GODS TEMPLE DELUXE', 'https://cdn46952.bngsrv.com/static/games/banner_86_en.png', 1, 'BOOONGO', 0),
(3141, 'book_of_sun', 'BOOK OF SUN', 'https://cdn46952.bngsrv.com/static/games/banner_139_en.jpg', 1, 'BOOONGO', 0),
(3142, '777_gems', '777 GEMS', 'https://cdn46952.bngsrv.com/games/banner_148_en.jpeg', 1, 'BOOONGO', 0),
(3143, 'book_of_sun_multichance', 'BOOK OF SUN MULTICHANCE', 'https://cdn46952.bngsrv.com/games/banner_157_en.jpg?ts=1557834927593', 1, 'BOOONGO', 0),
(3144, 'olympian_gods', 'OLYMPIAN GODS', 'https://cdn46952.bngsrv.com/games/banner_166_en.jpeg?ts=1565181937129', 1, 'BOOONGO', 0),
(3145, '777_gems_respin', '777 GEMS RESPIN', 'https://cdn46952.bngsrv.com/games/banner_175_en.jpg?ts=1575289527907', 1, 'BOOONGO', 0),
(3146, 'tigers_gold', 'TIGERS GOLD', 'https://cdn46952.bngsrv.com/games/banner_178_en.jpe?ts=1580204919370', 1, 'BOOONGO', 0),
(3147, 'moon_sisters', 'MOON SISTERS', 'https://cdn46952.bngsrv.com/games/banner_183_en.jpg?ts=1589276977044', 1, 'BOOONGO', 0),
(3148, 'book_of_sun_choice', 'BOOK OF SUN CHOICE', 'https://cdn46952.bngsrv.com/games/banner_184_en.jpg?ts=1586766763403', 1, 'BOOONGO', 0),
(3149, 'super_marble', 'SUPER MARBLE', 'https://cdn46952.bngsrv.com/games/banner_189_en.jpg?ts=1592834985255', 1, 'BOOONGO', 0),
(3150, 'buddha_fortune', 'BUDDHA FORTUNE', 'https://cdn46952.bngsrv.com/games/banner_190_en.jpg?ts=1594723112381', 1, 'BOOONGO', 0),
(3151, 'great_panda', 'GREAT PANDA', 'https://cdn46952.bngsrv.com/games/banner_181_en.jpg?ts=1583843045334', 1, 'BOOONGO', 0),
(3152, '15_golden_eggs', '15 GOLDEN EGGS', 'https://cdn46952.bngsrv.com/static/games/banner_14_en.png', 1, 'BOOONGO', 0),
(3153, 'thunder_of_olympus', 'THUNDER OF OLYMPUS', 'https://cdn46952.bngsrv.com/games/banner_200_en.jpe?ts=1599463031466', 1, 'BOOONGO', 0),
(3154, 'eye_of_gold', 'EYE OF GOLD', 'https://cdn46952.bngsrv.com/games/banner_204_en.jpg?ts=1607423095999', 1, 'BOOONGO', 0),
(3155, 'tiger_stone', 'TIGER STONE', 'https://cdn46952.bngsrv.com/games/banner_209_en.jpg?ts=1604945706164', 1, 'BOOONGO', 0),
(3156, 'magic_apple', 'MAGIC APPLE', 'https://cdn46952.bngsrv.com/games/banner_219_en.jpg?ts=1615278797585', 1, 'BOOONGO', 0),
(3157, 'wolf_saga', 'WOLF SAGA', 'https://cdn46952.bngsrv.com/games/banner_216_en.png?ts=1612371564816', 1, 'BOOONGO', 0),
(3158, 'magic_ball', 'MAGIC BALL', 'https://cdn46952.bngsrv.com/games/banner_223_en.jpg?ts=1618214765589', 1, 'BOOONGO', 0),
(3159, 'scarab_boost', 'SCARAB BOOST', 'https://cdn46952.bngsrv.com/games/banner_231_en.jpg?ts=1623137017503', 1, 'BOOONGO', 0),
(3160, 'wukong', 'WUKONG', 'https://cdn46952.bngsrv.com/games/banner_233_en.jpg?ts=1624348278790', 1, 'BOOONGO', 0),
(3161, 'pearl_diver', 'PEARL DIVER', 'https://cdn46952.bngsrv.com/games/banner_232_en.jpg?ts=1624952929307', 1, 'BOOONGO', 0),
(3162, '3_coins_egypt', '3 COINS EGYPT', 'https://cdn46952.bngsrv.com/games/banner_236_en.jpg?ts=1626173501198', 1, 'BOOONGO', 0),
(3163, 'ganesha_boost', 'GANESHA BOOST', 'https://cdn46952.bngsrv.com/games/banner_240_en.jpg?ts=1629708978121', 1, 'BOOONGO', 0),
(3164, 'wolf_night', 'WOLF NIGHT', 'https://cdn46952.bngsrv.com/games/banner_237_en.jpg?ts=1628583185745', 1, 'BOOONGO', 0),
(3165, 'book_of_wizard', 'BOOK OF WIZARD', 'https://cdn46952.bngsrv.com/games/banner_244_en.jpg?ts=1632823480279', 1, 'BOOONGO', 0),
(3166, 'lord_fortune_2', 'LORD FORTUNE 2', 'https://cdn46952.bngsrv.com/games/banner_245_en.jpg?ts=1633430937520', 1, 'BOOONGO', 0),
(3167, 'gold_express', 'GOLD EXPRESS', 'https://cdn46952.bngsrv.com/games/banner_249_en.jpg?ts=1634629019700', 1, 'BOOONGO', 0),
(3168, 'book_of_wizard_crystal', 'BOOK OF WIZARD CRYSTAL', 'https://cdn46952.bngsrv.com/games/banner_255_en.jpg?ts=1641895746148', 1, 'BOOONGO', 0),
(3169, 'pearl_diver_2', 'PEARL DIVER 2', 'https://cdn46952.bngsrv.com/games/banner_259_en.jpg?ts=1645521353434', 1, 'BOOONGO', 0),
(3170, 'sun_of_egypt_3', 'SUN OF EGYPT 3', 'https://cdn46952.bngsrv.com/games/banner_262_en.jpg?ts=1646655112312', 1, 'BOOONGO', 0),
(3171, 'caishen_wealth', 'CAISHEN WEALTH', 'https://cdn46952.bngsrv.com/games/banner_265_en.jpg?ts=1649711719448', 1, 'BOOONGO', 0),
(3172, 'aztec_fire', 'AZTEC FIRE', 'https://cdn46952.bngsrv.com/games/banner_272_en.jpg?ts=1658177726858', 1, 'BOOONGO', 0),
(3173, 'SGReturnToTheFeature', 'Return to the Future', 'https://app-b.insvr.com/img/s/300/SGReturnToTheFeature_ko-KR.png', 1, 'HABANERO', 0),
(3174, 'SGTabernaDeLosMuertosUltra', 'Tevena de los Muirtos Ultra', 'https://app-b.insvr.com/img/s/300/SGTabernaDeLosMuertosUltra_ko-KR.png', 1, 'HABANERO', 0),
(3175, 'SGTotemTowers', 'Totem towers', 'https://app-b.insvr.com/img/s/300/SGTotemTowers_ko-KR.png', 1, 'HABANERO', 0),
(3176, 'SGChristmasGiftRush', 'Christmas Kipoot Rush', 'https://app-b.insvr.com/img/s/300/SGChristmasGiftRush_ko-KR.png', 1, 'HABANERO', 0),
(3177, 'SGOrbsOfAtlantis', 'Overs of Atlantis', 'https://app-b.insvr.com/img/s/300/SGOrbsOfAtlantis_ko-KR.png', 1, 'HABANERO', 0),
(3178, 'SGBeforeTimeRunsOut', 'Before Time Runner Out', 'https://app-b.insvr.com/img/s/300/SGBeforeTimeRunsOut_ko-KR.png', 1, 'HABANERO', 0),
(3179, 'SGTechnoTumble', 'Techno tumble', 'https://app-b.insvr.com/img/s/300/SGTechnoTumble_ko-KR.png', 1, 'HABANERO', 0),
(3180, 'SGWealthInn', 'Wells Inn', 'https://app-b.insvr.com/img/s/300/SGWealthInn_ko-KR.png', 1, 'HABANERO', 0),
(3181, 'SGHappyApe', 'Happy ape', 'https://app-b.insvr.com/img/s/300/SGHappyApe_ko-KR.png', 1, 'HABANERO', 0),
(3182, 'SGTabernaDeLosMuertos', 'Tevena di los Muertos', 'https://app-b.insvr.com/img/s/300/SGTabernaDeLosMuertos_ko-KR.png', 1, 'HABANERO', 0),
(3183, 'SGNaughtySanta', 'Notty Santa', 'https://app-b.insvr.com/img/s/300/SGNaughtySanta_ko-KR.png', 1, 'HABANERO', 0),
(3184, 'SGFaCaiShenDeluxe', 'Pakai Sen Deluxe', 'https://app-b.insvr.com/img/s/300/SGFaCaiShenDeluxe_ko-KR.png', 1, 'HABANERO', 0),
(3185, 'SGHeySushi', 'Hey sushi', 'https://app-b.insvr.com/img/s/300/SGHeySushi_ko-KR.png', 1, 'HABANERO', 0),
(3186, 'SGKnockoutFootballRush', 'Knockout football rush', 'https://app-b.insvr.com/img/s/300/SGKnockoutFootballRush_ko-KR.png', 1, 'HABANERO', 0),
(3187, 'SGColossalGems', 'Closal Gems', 'https://app-b.insvr.com/img/s/300/SGColossalGems_ko-KR.png', 1, 'HABANERO', 0),
(3188, 'SGHotHotHalloween', 'hot hot halloween', 'https://app-b.insvr.com/img/s/300/SGHotHotHalloween_ko-KR.png', 1, 'HABANERO', 0),
(3189, 'SGLuckyFortuneCat', 'Lucky fortune cat', 'https://app-b.insvr.com/img/s/300/SGLuckyFortuneCat_ko-KR.png', 1, 'HABANERO', 0),
(3190, 'SGHotHotFruit', 'hot hot fruit', 'https://app-b.insvr.com/img/s/300/SGHotHotFruit_ko-KR.png', 1, 'HABANERO', 0),
(3191, 'SGMountMazuma', 'Mount Majuma', 'https://app-b.insvr.com/img/s/300/SGMountMazuma_ko-KR.png', 1, 'HABANERO', 0),
(3192, 'SGWildTrucks', 'Wild Trucks', 'https://app-b.insvr.com/img/s/300/SGWildTrucks_ko-KR.png', 1, 'HABANERO', 0),
(3193, 'SGLuckyLucky', 'Lucky Lucky', 'https://app-b.insvr.com/img/s/300/SGLuckyLucky_ko-KR.png', 1, 'HABANERO', 0),
(3194, 'SGKnockoutFootball', 'Knockout football', 'https://app-b.insvr.com/img/s/300/SGKnockoutFootball_ko-KR.png', 1, 'HABANERO', 0),
(3195, 'SGJump', 'Jump!', 'https://app-b.insvr.com/img/s/300/SGJump_ko-KR.png', 1, 'HABANERO', 0),
(3196, 'SGPumpkinPatch', 'Pumpkin patch', 'https://app-b.insvr.com/img/s/300/SGPumpkinPatch_ko-KR.png', 1, 'HABANERO', 0),
(3197, 'SGWaysOfFortune', 'Way of Fortune', 'https://app-b.insvr.com/img/s/300/SGWaysOfFortune_ko-KR.png', 1, 'HABANERO', 0),
(3198, 'SGFourDivineBeasts', 'For Devine Beasts', 'https://app-b.insvr.com/img/s/300/SGFourDivineBeasts_ko-KR.png', 1, 'HABANERO', 0),
(3199, 'SGPandaPanda', 'Panda panda', 'https://app-b.insvr.com/img/s/300/SGPandaPanda_ko-KR.png', 1, 'HABANERO', 0),
(3200, 'SGOceansCall', 'Ocean\'s Call', 'https://app-b.insvr.com/img/s/300/SGOceansCall_ko-KR.png', 1, 'HABANERO', 0),
(3201, 'SGScruffyScallywags', 'Scruffy Skellywex', 'https://app-b.insvr.com/img/s/300/SGScruffyScallywags_ko-KR.png', 1, 'HABANERO', 0),
(3202, 'SGNuwa', 'Nuwa', 'https://app-b.insvr.com/img/s/300/SGNuwa_ko-KR.png', 1, 'HABANERO', 0),
(3203, 'SGTheKoiGate', 'Koi gate', 'https://app-b.insvr.com/img/s/300/SGTheKoiGate_ko-KR.png', 1, 'HABANERO', 0),
(3204, 'SGFaCaiShen', 'Pacaishen', 'https://app-b.insvr.com/img/s/300/SGFaCaiShen_ko-KR.png', 1, 'HABANERO', 0),
(3205, 'SG12Zodiacs', '12 zodiacs', 'https://app-b.insvr.com/img/s/300/SG12Zodiacs_ko-KR.png', 1, 'HABANERO', 0),
(3206, 'SGFireRooster', 'Fire rooster', 'https://app-b.insvr.com/img/s/300/SGFireRooster_ko-KR.png', 1, 'HABANERO', 0),
(3207, 'SGFenghuang', 'Phoenix', 'https://app-b.insvr.com/img/s/300/SGFenghuang_ko-KR.png', 1, 'HABANERO', 0),
(3208, 'SGBirdOfThunder', 'Bird of Thunder', 'https://app-b.insvr.com/img/s/300/SGBirdOfThunder_ko-KR.png', 1, 'HABANERO', 0),
(3209, 'SGTheDeadEscape', 'The Dead Escape', 'https://app-b.insvr.com/img/s/300/SGTheDeadEscape_ko-KR.png', 1, 'HABANERO', 0),
(3210, 'SGBombsAway', 'Bombs Away', 'https://app-b.insvr.com/img/s/300/SGBombsAway_ko-KR.png', 1, 'HABANERO', 0),
(3211, 'SGGoldRush', 'Gold rush', 'https://app-b.insvr.com/img/s/300/SGGoldRush_ko-KR.png', 1, 'HABANERO', 0),
(3212, 'SGRuffledUp', 'Ruffled up', 'https://app-b.insvr.com/img/s/300/SGRuffledUp_ko-KR.png', 1, 'HABANERO', 0),
(3213, 'SGRomanEmpire', 'Roman empire', 'https://app-b.insvr.com/img/s/300/SGRomanEmpire_ko-KR.png', 1, 'HABANERO', 0),
(3214, 'SGCoyoteCrash', 'Coyote crash', 'https://app-b.insvr.com/img/s/300/SGCoyoteCrash_ko-KR.png', 1, 'HABANERO', 0),
(3215, 'SGWickedWitch', 'Wickt Location', 'https://app-b.insvr.com/img/s/300/SGWickedWitch_ko-KR.png', 1, 'HABANERO', 0),
(3216, 'SGDragonsThrone', 'Dragon\'s Throne', 'https://app-b.insvr.com/img/s/300/SGDragonsThrone_ko-KR.png', 1, 'HABANERO', 0),
(3217, 'SGBuggyBonus', 'Buggy bonus', 'https://app-b.insvr.com/img/s/300/SGBuggyBonus_ko-KR.png', 1, 'HABANERO', 0),
(3218, 'SGGlamRock', 'Glam rock', 'https://app-b.insvr.com/img/s/300/SGGlamRock_ko-KR.png', 1, 'HABANERO', 0),
(3219, 'SGSuperTwister', 'Super twister', 'https://app-b.insvr.com/img/s/300/SGSuperTwister_ko-KR.png', 1, 'HABANERO', 0),
(3220, 'SGKanesInferno', 'Keynes Inferno', 'https://app-b.insvr.com/img/s/300/SGKanesInferno_ko-KR.png', 1, 'HABANERO', 0),
(3221, 'SGTreasureTomb', 'Treasure Tomb', 'https://app-b.insvr.com/img/s/300/SGTreasureTomb_ko-KR.png', 1, 'HABANERO', 0),
(3222, 'SGJugglenaut', 'Jugglenut', 'https://app-b.insvr.com/img/s/300/SGJugglenaut_ko-KR.png', 1, 'HABANERO', 0),
(3223, 'SGGalacticCash', 'Glactic Cash', 'https://app-b.insvr.com/img/s/300/SGGalacticCash_ko-KR.png', 1, 'HABANERO', 0),
(3224, 'SGZeus2', 'Zeus 2', 'https://app-b.insvr.com/img/s/300/SGZeus2_ko-KR.png', 1, 'HABANERO', 0),
(3225, 'SGTheDragonCastle', 'Dragon castle', 'https://app-b.insvr.com/img/s/300/SGTheDragonCastle_ko-KR.png', 1, 'HABANERO', 0),
(3226, 'SGKingTutsTomb', 'King Teeth Tomb', 'https://app-b.insvr.com/img/s/300/SGKingTutsTomb_ko-KR.png', 1, 'HABANERO', 0),
(3227, 'SGCarnivalCash', 'Carnival cash', 'https://app-b.insvr.com/img/s/300/SGCarnivalCash_ko-KR.png', 1, 'HABANERO', 0),
(3228, 'SGTreasureDiver', 'Treasure diver', 'https://app-b.insvr.com/img/s/300/SGTreasureDiver_ko-KR.png', 1, 'HABANERO', 0),
(3229, 'SGLittleGreenMoney', 'Little Green Money', 'https://app-b.insvr.com/img/s/300/SGLittleGreenMoney_ko-KR.png', 1, 'HABANERO', 0),
(3230, 'SGMonsterMashCash', 'Monster Mash Cash', 'https://app-b.insvr.com/img/s/300/SGMonsterMashCash_ko-KR.png', 1, 'HABANERO', 0),
(3231, 'SGShaolinFortunes100', 'Xiaolin Fortune 100', 'https://app-b.insvr.com/img/s/300/SGShaolinFortunes100_ko-KR.png', 1, 'HABANERO', 0),
(3232, 'SGShaolinFortunes243', 'Xiaolin Fortune', 'https://app-b.insvr.com/img/s/300/SGShaolinFortunes243_ko-KR.png', 1, 'HABANERO', 0),
(3233, 'SGWeirdScience', 'Weird Science', 'https://app-b.insvr.com/img/s/300/SGWeirdScience_ko-KR.png', 1, 'HABANERO', 0),
(3234, 'SGBlackbeardsBounty', 'Blackbeards Bounty', 'https://app-b.insvr.com/img/s/300/SGBlackbeardsBounty_ko-KR.png', 1, 'HABANERO', 0),
(3235, 'SGDrFeelgood', 'Dr. Feelgood', 'https://app-b.insvr.com/img/s/300/SGDrFeelgood_ko-KR.png', 1, 'HABANERO', 0),
(3236, 'SGVikingsPlunder', 'Vikings plunder', 'https://app-b.insvr.com/img/s/300/SGVikingsPlunder_ko-KR.png', 1, 'HABANERO', 0),
(3237, 'SGDoubleODollars', 'Double O Dollars', 'https://app-b.insvr.com/img/s/300/SGDoubleODollars_ko-KR.png', 1, 'HABANERO', 0),
(3238, 'SGSpaceFortune', 'Space fortune', 'https://app-b.insvr.com/img/s/300/SGSpaceFortune_ko-KR.png', 1, 'HABANERO', 0),
(3239, 'SGPamperMe', 'Pamper me', 'https://app-b.insvr.com/img/s/300/SGPamperMe_ko-KR.png', 1, 'HABANERO', 0),
(3240, 'SGZeus', 'Zeus', 'https://app-b.insvr.com/img/s/300/SGZeus_ko-KR.png', 1, 'HABANERO', 0),
(3241, 'SGSOS', 'S.O.S.!', 'https://app-b.insvr.com/img/s/300/SGSOS_ko-KR.png', 1, 'HABANERO', 0),
(3242, 'SGPoolShark', 'Full shark', 'https://app-b.insvr.com/img/s/300/SGPoolShark_ko-KR.png', 1, 'HABANERO', 0),
(3243, 'SGEgyptianDreams', 'Egyptian Dreams', 'https://app-b.insvr.com/img/s/300/SGEgyptianDreams_ko-KR.png', 1, 'HABANERO', 0),
(3244, 'SGBarnstormerBucks', 'Barnstormer Bucks', 'https://app-b.insvr.com/img/s/300/SGBarnstormerBucks_ko-KR.png', 1, 'HABANERO', 0),
(3245, 'SGSuperStrike', 'Super strike', 'https://app-b.insvr.com/img/s/300/SGSuperStrike_ko-KR.png', 1, 'HABANERO', 0),
(3246, 'SGJungleRumble', 'Jungle rumble', 'https://app-b.insvr.com/img/s/300/SGJungleRumble_ko-KR.png', 1, 'HABANERO', 0),
(3247, 'SGArcticWonders', 'Arctic Wonders', 'https://app-b.insvr.com/img/s/300/SGArcticWonders_ko-KR.png', 1, 'HABANERO', 0),
(3248, 'SGTowerOfPizza', 'Tower of Pizza', 'https://app-b.insvr.com/img/s/300/SGTowerOfPizza_ko-KR.png', 1, 'HABANERO', 0),
(3249, 'SGMummyMoney', 'Mummy money', 'https://app-b.insvr.com/img/s/300/SGMummyMoney_ko-KR.png', 1, 'HABANERO', 0),
(3250, 'SGBikiniIsland', 'bikini island', 'https://app-b.insvr.com/img/s/300/SGBikiniIsland_ko-KR.png', 1, 'HABANERO', 0),
(3251, 'SGQueenOfQueens1024', 'Queen of Queens II', 'https://app-b.insvr.com/img/s/300/SGQueenOfQueens1024_ko-KR.png', 1, 'HABANERO', 0),
(3252, 'SGDragonsRealm', 'Dragon\'s Realm', 'https://app-b.insvr.com/img/s/300/SGDragonsRealm_ko-KR.png', 1, 'HABANERO', 0),
(3253, 'SGAllForOne', 'All for one', 'https://app-b.insvr.com/img/s/300/SGAllForOne_ko-KR.png', 1, 'HABANERO', 0),
(3254, 'SGFlyingHigh', 'Flying high', 'https://app-b.insvr.com/img/s/300/SGFlyingHigh_ko-KR.png', 1, 'HABANERO', 0),
(3255, 'SGMrBling', 'Mr. Bling', 'https://app-b.insvr.com/img/s/300/SGMrBling_ko-KR.png', 1, 'HABANERO', 0),
(3256, 'SGMysticFortune', 'Mystic Fortune', 'https://app-b.insvr.com/img/s/300/SGMysticFortune_ko-KR.png', 1, 'HABANERO', 0),
(3257, 'SGPuckerUpPrince', 'Funker up prince', 'https://app-b.insvr.com/img/s/300/SGPuckerUpPrince_ko-KR.png', 1, 'HABANERO', 0),
(3258, 'SGSirBlingalot', 'Bring it all', 'https://app-b.insvr.com/img/s/300/SGSirBlingalot_ko-KR.png', 1, 'HABANERO', 0),
(3259, 'SGCashReef', 'Cash leaf', 'https://app-b.insvr.com/img/s/300/SGCashReef_ko-KR.png', 1, 'HABANERO', 0),
(3260, 'SGQueenOfQueens243', 'Queen of queens', 'https://app-b.insvr.com/img/s/300/SGQueenOfQueens243_ko-KR.png', 1, 'HABANERO', 0),
(3261, 'SGRideEmCowboy', 'Lytham Cowboy (Pick Game)', 'https://app-b.insvr.com/img/s/300/SGRideEmCowboy_ko-KR.png', 1, 'HABANERO', 0),
(3262, 'SGGrapeEscape', 'The Graph Escape', 'https://app-b.insvr.com/img/s/300/SGGrapeEscape_ko-KR.png', 1, 'HABANERO', 0),
(3263, 'SGGoldenUnicorn', 'Golden unicorn', 'https://app-b.insvr.com/img/s/300/SGGoldenUnicorn_ko-KR.png', 1, 'HABANERO', 0),
(3264, 'SGFrontierFortunes', 'Frontier Fortune', 'https://app-b.insvr.com/img/s/300/SGFrontierFortunes_ko-KR.png', 1, 'HABANERO', 0),
(3265, 'SGIndianCashCatcher', 'Indian Cash Catcher', 'https://app-b.insvr.com/img/s/300/SGIndianCashCatcher_ko-KR.png', 1, 'HABANERO', 0),
(3266, 'SGSkysTheLimit', 'Sky\'s the Limit', 'https://app-b.insvr.com/img/s/300/SGSkysTheLimit_ko-KR.png', 1, 'HABANERO', 0),
(3267, 'SGTheBigDeal', 'The Big Deal', 'https://app-b.insvr.com/img/s/300/SGTheBigDeal_ko-KR.png', 1, 'HABANERO', 0),
(3268, 'SGCashosaurus', 'Cashosaurus', 'https://app-b.insvr.com/img/s/300/SGCashosaurus_ko-KR.png', 1, 'HABANERO', 0),
(3269, 'SGDiscoFunk', 'Disco funk', 'https://app-b.insvr.com/img/s/300/SGDiscoFunk_ko-KR.png', 1, 'HABANERO', 0),
(3270, 'SGCalaverasExplosivas', 'Calaveras Explociba', 'https://app-b.insvr.com/img/s/300/SGCalaverasExplosivas_ko-KR.png', 1, 'HABANERO', 0),
(3271, 'SGNewYearsBash', 'New Year Bessie', 'https://app-b.insvr.com/img/s/300/SGNewYearsBash_ko-KR.png', 1, 'HABANERO', 0),
(3272, 'SGNineTails', 'Nine Tales', 'https://app-b.insvr.com/img/s/300/SGNineTails_ko-KR.png', 1, 'HABANERO', 0),
(3273, 'SGMysticFortuneDeluxe', 'Mystic Fortune Deluxe', 'https://app-b.insvr.com/img/s/300/SGMysticFortuneDeluxe_ko-KR.png', 1, 'HABANERO', 0),
(3274, 'SGLuckyDurian', 'Lucky durian', 'https://app-b.insvr.com/img/s/300/SGLuckyDurian_ko-KR.png', 1, 'HABANERO', 0),
(3275, 'SGDiscoBeats', 'Disco beat', 'https://app-b.insvr.com/img/s/300/SGDiscoBeats_ko-KR.png', 1, 'HABANERO', 0),
(3276, 'SGLanternLuck', 'Lantern lucky', 'https://app-b.insvr.com/img/s/300/SGLanternLuck_ko-KR.png', 1, 'HABANERO', 0),
(3277, 'SGBombRunner', 'Boom runner', 'https://app-b.insvr.com/img/s/300/SGBombRunner_ko-KR.png', 1, 'HABANERO', 0),
(3278, 'vs243mwarrior', 'Monkey Warrior', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243mwarrior.png', 1, 'PRAGMATIC', 0),
(3279, 'vs20doghouse', 'The Dog House', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20doghouse.png', 1, 'PRAGMATIC', 0),
(3280, 'vs40pirate', 'Pirate Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40pirate.png', 1, 'PRAGMATIC', 0),
(3281, 'vs20rhino', 'Great Rhino', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20rhino.png', 1, 'PRAGMATIC', 0),
(3282, 'vs25pandagold', 'Panda Fortune', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25pandagold.png', 1, 'PRAGMATIC', 0),
(3283, 'vs4096bufking', 'Buffalo King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs4096bufking.png', 1, 'PRAGMATIC', 0),
(3284, 'vs25pyramid', 'Pyramid King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25pyramid.png', 1, 'PRAGMATIC', 0),
(3285, 'vs5ultrab', 'Ultra Burn', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5ultrab.png', 1, 'PRAGMATIC', 0),
(3286, 'vs5ultra', 'Ultra Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5ultra.png', 1, 'PRAGMATIC', 0),
(3287, 'vs25jokerking', 'Joker King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25jokerking.png', 1, 'PRAGMATIC', 0),
(3288, 'vs10returndead', 'Return of the Dead', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10returndead.png', 1, 'PRAGMATIC', 0),
(3289, 'vs10madame', 'Madame Destiny', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10madame.png', 1, 'PRAGMATIC', 0),
(3290, 'vs15diamond', 'Diamond Strike', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs15diamond.png', 1, 'PRAGMATIC', 0),
(3291, 'vs25aztecking', 'Aztec King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25aztecking.png', 1, 'PRAGMATIC', 0),
(3292, 'vs25wildspells', 'Wild Spells', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25wildspells.png', 1, 'PRAGMATIC', 0),
(3293, 'vs10bbbonanza', 'Big Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bbbonanza.png', 1, 'PRAGMATIC', 0),
(3294, 'vs10cowgold', 'Cowboys Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10cowgold.png', 1, 'PRAGMATIC', 0),
(3295, 'vs25tigerwar', 'The Tiger Warrior', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25tigerwar.png', 1, 'PRAGMATIC', 0),
(3296, 'vs25mustang', 'Mustang Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25mustang.png', 1, 'PRAGMATIC', 0),
(3297, 'vs25hotfiesta', 'Hotfiesta', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25hotfiesta.png', 1, 'PRAGMATIC', 0),
(3298, 'vs243dancingpar', 'Dance Party', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243dancingpar.png', 1, 'PRAGMATIC', 0),
(3299, 'vs576treasures', 'Wild Wild Riches', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs576treasures.png', 1, 'PRAGMATIC', 0),
(3300, 'vs20hburnhs', 'Hot to Burn Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20hburnhs.png', 1, 'PRAGMATIC', 0),
(3301, 'vs20emptybank', 'Empty the Bank', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20emptybank.png', 1, 'PRAGMATIC', 0),
(3302, 'vs20midas', 'The Hand of Midas', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20midas.png', 1, 'PRAGMATIC', 0),
(3303, 'vs20olympgate', 'Gates of Olympus', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20olympgate.png', 1, 'PRAGMATIC', 0),
(3304, 'vswayslight', 'Lucky Lightning', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayslight.png', 1, 'PRAGMATIC', 0),
(3305, 'vs20vegasmagic', 'Vegas Magic', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20vegasmagic.png', 1, 'PRAGMATIC', 0),
(3306, 'vs20fruitparty', 'Fruit Party', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20fruitparty.png', 1, 'PRAGMATIC', 0),
(3307, 'vs20fparty2', 'Fruit Party 2', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20fparty2.png', 1, 'PRAGMATIC', 0),
(3308, 'vswaysdogs', 'The Dog House Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysdogs.png', 1, 'PRAGMATIC', 0),
(3309, 'vs50juicyfr', 'Juicy Fruits', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50juicyfr.png', 1, 'PRAGMATIC', 0),
(3310, 'vs25pandatemple', 'Panda Fortune 2', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25pandatemple.png', 1, 'PRAGMATIC', 0),
(3311, 'vswaysbufking', 'Buffalo King Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysbufking.png', 1, 'PRAGMATIC', 0),
(3312, 'vs40wildwest', 'Wild West Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40wildwest.png', 1, 'PRAGMATIC', 0),
(3313, 'vs20chickdrop', 'Chicken Drop', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20chickdrop.png', 1, 'PRAGMATIC', 0),
(3314, 'vs40spartaking', 'Spartan King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40spartaking.png', 1, 'PRAGMATIC', 0),
(3315, 'vswaysrhino', 'Great Rhino Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysrhino.png', 1, 'PRAGMATIC', 0),
(3316, 'vs20sbxmas', 'Sweet Bonanza Xmas', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20sbxmas.png', 1, 'PRAGMATIC', 0),
(3317, 'vs10fruity2', 'Extra Juicy', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10fruity2.png', 1, 'PRAGMATIC', 0),
(3318, 'vs10egypt', 'Ancient Egypt', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10egypt.png', 1, 'PRAGMATIC', 0),
(3319, 'vs5drhs', 'Dragon Hot Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5drhs.png', 1, 'PRAGMATIC', 0),
(3320, 'vs12bbb', 'Bigger Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs12bbb.png', 1, 'PRAGMATIC', 0),
(3321, 'vs20tweethouse', 'The Tweety House', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20tweethouse.png', 1, 'PRAGMATIC', 0),
(3322, 'vswayslions', '5 Lions Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayslions.png', 1, 'PRAGMATIC', 0),
(3323, 'vswayssamurai', 'Rise of Samurai Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayssamurai.png', 1, 'PRAGMATIC', 0),
(3324, 'vs50pixie', 'Pixie Wings', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50pixie.png', 1, 'PRAGMATIC', 0),
(3325, 'vs10floatdrg', 'Floating Dragon', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10floatdrg.png', 1, 'PRAGMATIC', 0),
(3326, 'vs20fruitsw', 'Sweet Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20fruitsw.png', 1, 'PRAGMATIC', 0),
(3327, 'vs20rhinoluxe', 'Great Rhino Deluxe', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20rhinoluxe.png', 1, 'PRAGMATIC', 0),
(3328, 'vswaysmadame', 'Madame Destiny Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysmadame.png', 1, 'PRAGMATIC', 0),
(3329, 'vs1024temuj', 'Temujin Treasures', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1024temuj.png', 1, 'PRAGMATIC', 0),
(3330, 'vs40pirgold', 'Pirate Gold Deluxe', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40pirgold.png', 1, 'PRAGMATIC', 0),
(3331, 'vs25mmouse', 'Money Mouse', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25mmouse.png', 1, 'PRAGMATIC', 0),
(3332, 'vs10threestar', 'Three Star Fortune', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10threestar.png', 1, 'PRAGMATIC', 0),
(3333, 'vs1ball', 'Lucky Dragon Ball', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1ball.png', 1, 'PRAGMATIC', 0),
(3334, 'vs243lionsgold', '5 Lions', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243lionsgold.png', 1, 'PRAGMATIC', 0),
(3335, 'vs10egyptcls', 'Ancient Egypt Classic', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10egyptcls.png', 1, 'PRAGMATIC', 0),
(3336, 'vs25davinci', 'Da Vinci Treasure', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25davinci.png', 1, 'PRAGMATIC', 0),
(3337, 'vs7776secrets', 'Aztec Treasure', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs7776secrets.png', 1, 'PRAGMATIC', 0),
(3338, 'vs25wolfgold', 'Wolf Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25wolfgold.png', 1, 'PRAGMATIC', 0),
(3339, 'vs50safariking', 'Safari King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50safariking.png', 1, 'PRAGMATIC', 0),
(3340, 'vs25peking', 'Peking Luck', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25peking.png', 1, 'PRAGMATIC', 0),
(3341, 'vs25asgard', 'Asgard', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25asgard.png', 1, 'PRAGMATIC', 0),
(3342, 'vs25vegas', 'Vegas Nights', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25vegas.png', 1, 'PRAGMATIC', 0),
(3343, 'vs25scarabqueen', 'John Hunter and the Tomb of the Scarab Queen', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25scarabqueen.png', 1, 'PRAGMATIC', 0),
(3344, 'vs20starlight', 'Starlight Princess', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20starlight.png', 1, 'PRAGMATIC', 0),
(3345, 'vs10bookoftut', 'John Hunter and the Book of Tut', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bookoftut.png', 1, 'PRAGMATIC', 0),
(3346, 'vs9piggybank', 'Piggy Bank Bills', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs9piggybank.png', 1, 'PRAGMATIC', 0),
(3347, 'vs5drmystery', 'Dragon Kingdom Mystery', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5drmystery.png', 1, 'PRAGMATIC', 0),
(3348, 'vs20eightdragons', 'Eight Dragons', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20eightdragons.png', 1, 'PRAGMATIC', 0),
(3349, 'vs1024lionsd', '5 Lions Dance', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1024lionsd.png', 1, 'PRAGMATIC', 0),
(3350, 'vs25rio', 'Heart of Rio', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25rio.png', 1, 'PRAGMATIC', 0),
(3351, 'vs10nudgeit', 'Rise of Giza PowerNudge', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10nudgeit.png', 1, 'PRAGMATIC', 0),
(3352, 'vs10bxmasbnza', 'Christmas Big Bass Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bxmasbnza.png', 1, 'PRAGMATIC', 0),
(3353, 'vs20santawonder', 'Santa\'s Wonderland', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20santawonder.png', 1, 'PRAGMATIC', 0),
(3354, 'vs10bblpop', 'Bubble Pop', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bblpop.png', 1, 'PRAGMATIC', 0),
(3355, 'vs25btygold', 'Bounty Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25btygold.png', 1, 'PRAGMATIC', 0),
(3356, 'vs88hockattack', 'Hockey Attack™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs88hockattack.png', 1, 'PRAGMATIC', 0),
(3357, 'vswaysbbb', 'Big Bass Bonanza Megaways™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysbbb.png', 1, 'PRAGMATIC', 0),
(3358, 'vs10bookfallen', 'Book of the Fallen', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bookfallen.png', 1, 'PRAGMATIC', 0),
(3359, 'vs40bigjuan', 'Big Juan', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40bigjuan.png', 1, 'PRAGMATIC', 0),
(3360, 'vs20bermuda', 'John Hunter and the Quest for Bermuda Riches', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20bermuda.png', 1, 'PRAGMATIC', 0),
(3361, 'vs10starpirate', 'Star Pirates Code', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10starpirate.png', 1, 'PRAGMATIC', 0),
(3362, 'vswayswest', 'Mystic Chief', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayswest.png', 1, 'PRAGMATIC', 0),
(3363, 'vs20daydead', 'Day of Dead', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20daydead.png', 1, 'PRAGMATIC', 0),
(3364, 'vs20candvil', 'Candy Village', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20candvil.png', 1, 'PRAGMATIC', 0),
(3365, 'vs20wildboost', 'Wild Booster', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20wildboost.png', 1, 'PRAGMATIC', 0),
(3366, 'vswayshammthor', 'Power of Thor Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayshammthor.png', 1, 'PRAGMATIC', 0),
(3367, 'vs243lions', '5 Lions', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243lions.png', 1, 'PRAGMATIC', 0),
(3368, 'vs5super7', 'Super 7s', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5super7.png', 1, 'PRAGMATIC', 0),
(3369, 'vs1masterjoker', 'Master Joker', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1masterjoker.png', 1, 'PRAGMATIC', 0),
(3370, 'vs20kraken', 'Release the Kraken', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20kraken.png', 1, 'PRAGMATIC', 0),
(3371, 'vs10firestrike', 'Fire Strike', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10firestrike.png', 1, 'PRAGMATIC', 0),
(3372, 'vs243fortune', 'Caishen\'s Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243fortune.png', 1, 'PRAGMATIC', 0),
(3373, 'vs20aladdinsorc', 'Aladdin and the Sorcerrer', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20aladdinsorc.png', 1, 'PRAGMATIC', 0),
(3374, 'vs243fortseren', 'Greek Gods', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243fortseren.png', 1, 'PRAGMATIC', 0),
(3375, 'vs25chilli', 'Chilli Heat', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25chilli.png', 1, 'PRAGMATIC', 0),
(3376, 'vs8magicjourn', 'Magic Journey', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs8magicjourn.png', 1, 'PRAGMATIC', 0),
(3377, 'vs20leprexmas', 'Leprechaun Carol', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20leprexmas.png', 1, 'PRAGMATIC', 0),
(3378, 'vs7pigs', '7 Piggies', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs7pigs.png', 1, 'PRAGMATIC', 0),
(3379, 'vs243caishien', 'Caishen\'s Cash', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243caishien.png', 1, 'PRAGMATIC', 0),
(3380, 'vs5joker', 'Joker\'s Jewels', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5joker.png', 1, 'PRAGMATIC', 0),
(3381, 'vs25gladiator', 'Wild Gladiator', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25gladiator.png', 1, 'PRAGMATIC', 0),
(3382, 'vs25goldpig', 'Golden Pig', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25goldpig.png', 1, 'PRAGMATIC', 0),
(3383, 'vs25goldrush', 'Gold Rush', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25goldrush.png', 1, 'PRAGMATIC', 0),
(3384, 'vs25dragonkingdom', 'Dragon Kingdom', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25dragonkingdom.png', 1, 'PRAGMATIC', 0),
(3385, 'vs1dragon8', '888 Dragons', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1dragon8.png', 1, 'PRAGMATIC', 0),
(3386, 'vs5aztecgems', 'Aztec Gems', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5aztecgems.png', 1, 'PRAGMATIC', 0),
(3387, 'vs20hercpeg', 'Hercules and Pegasus', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20hercpeg.png', 1, 'PRAGMATIC', 0),
(3388, 'vs7fire88', 'Fire 88', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs7fire88.png', 1, 'PRAGMATIC', 0),
(3389, 'vs20honey', 'Honey Honey Honey', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20honey.png', 1, 'PRAGMATIC', 0),
(3390, 'vs25safari', 'Hot Safari', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25safari.png', 1, 'PRAGMATIC', 0),
(3391, 'vs25journey', 'Journey to the West', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25journey.png', 1, 'PRAGMATIC', 0),
(3392, 'vs20chicken', 'The Great Chicken Escape', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20chicken.png', 1, 'PRAGMATIC', 0),
(3393, 'vs1fortunetree', 'Tree of Riches', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1fortunetree.png', 1, 'PRAGMATIC', 0),
(3394, 'vs20wildpix', 'Wild Pixies', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20wildpix.png', 1, 'PRAGMATIC', 0),
(3395, 'vs15fairytale', 'Fairytale Fortune', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs15fairytale.png', 1, 'PRAGMATIC', 0),
(3396, 'vs20santa', 'Santa', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20santa.png', 1, 'PRAGMATIC', 0),
(3397, 'vs10vampwolf', 'Vampires vs Wolves', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10vampwolf.png', 1, 'PRAGMATIC', 0),
(3398, 'vs50aladdin', '3 Genie Wishes', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50aladdin.png', 1, 'PRAGMATIC', 0),
(3399, 'vs50hercules', 'Hercules Son of Zeus', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50hercules.png', 1, 'PRAGMATIC', 0),
(3400, 'vs7776aztec', 'Aztec Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs7776aztec.png', 1, 'PRAGMATIC', 0),
(3401, 'vs5trdragons', 'Triple Dragons', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5trdragons.png', 1, 'PRAGMATIC', 0),
(3402, 'vs40madwheel', 'The Wild Machine', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40madwheel.png', 1, 'PRAGMATIC', 0),
(3403, 'vs25newyear', 'Lucky New Year', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25newyear.png', 1, 'PRAGMATIC', 0),
(3404, 'vs40frrainbow', 'Fruit Rainbow', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40frrainbow.png', 1, 'PRAGMATIC', 0),
(3405, 'vs50kingkong', 'Mighty Kong', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50kingkong.png', 1, 'PRAGMATIC', 0),
(3406, 'vs20godiva', 'Lady Godiva', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20godiva.png', 1, 'PRAGMATIC', 0),
(3407, 'vs9madmonkey', 'Monkey Madness', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs9madmonkey.png', 1, 'PRAGMATIC', 0),
(3408, 'vs1tigers', 'Triple Tigers', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1tigers.png', 1, 'PRAGMATIC', 0),
(3409, 'vs9chen', 'Master Chen\'s Fortune', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs9chen.png', 1, 'PRAGMATIC', 0),
(3410, 'vs5hotburn', 'Hot to burn', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5hotburn.png', 1, 'PRAGMATIC', 0),
(3411, 'vs25dwarves_new', 'Dwarven Gold Deluxe', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25dwarves_new.png', 1, 'PRAGMATIC', 0),
(3412, 'vs25sea', 'Great Reef', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25sea.png', 1, 'PRAGMATIC', 0),
(3413, 'vs20leprechaun', 'Leprechaun Song', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20leprechaun.png', 1, 'PRAGMATIC', 0),
(3414, 'vs7monkeys', '7 Monkeys', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs7monkeys.png', 1, 'PRAGMATIC', 0),
(3415, 'vs50chinesecharms', 'Lucky Dragons', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50chinesecharms.png', 1, 'PRAGMATIC', 0),
(3416, 'vs18mashang', 'Treasure Horse', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs18mashang.png', 1, 'PRAGMATIC', 0),
(3417, 'vs5spjoker', 'Super Joker', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5spjoker.png', 1, 'PRAGMATIC', 0),
(3418, 'vs20egypttrs', 'Egyptian Fortunes', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20egypttrs.png', 1, 'PRAGMATIC', 0),
(3419, 'vs25queenofgold', 'Queen of Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25queenofgold.png', 1, 'PRAGMATIC', 0),
(3420, 'vs9hotroll', 'Hot Chilli', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs9hotroll.png', 1, 'PRAGMATIC', 0),
(3421, 'vs4096jurassic', 'Jurassic Giants', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs4096jurassic.png', 1, 'PRAGMATIC', 0),
(3422, 'vs3train', 'Gold Train', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs3train.png', 1, 'PRAGMATIC', 0),
(3423, 'vs40beowulf', 'Beowulf', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40beowulf.png', 1, 'PRAGMATIC', 0),
(3424, 'vs20bl', 'Busy Bees', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20bl.png', 1, 'PRAGMATIC', 0),
(3425, 'vs1money', 'Money Money Money', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1money.png', 1, 'PRAGMATIC', 0),
(3426, 'vs1600drago', 'Drago - Jewels of Fortune', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1600drago.png', 1, 'PRAGMATIC', 0),
(3427, 'vs1fufufu', 'Fu Fu Fu', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs1fufufu.png', 1, 'PRAGMATIC', 0),
(3428, 'vs40streetracer', 'Street Racer', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40streetracer.png', 1, 'PRAGMATIC', 0),
(3429, 'vs9aztecgemsdx', 'Aztec Gems Deluxe', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs9aztecgemsdx.png', 1, 'PRAGMATIC', 0),
(3430, 'vs20gorilla', 'Jungle Gorilla', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20gorilla.png', 1, 'PRAGMATIC', 0),
(3431, 'vswayswerewolf', 'Curse of the Werewolf Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayswerewolf.png', 1, 'PRAGMATIC', 0),
(3432, 'vswayshive', 'Star Bounty', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayshive.png', 1, 'PRAGMATIC', 0),
(3433, 'vs25samurai', 'Rise of Samurai', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25samurai.png', 1, 'PRAGMATIC', 0),
(3434, 'vs25walker', 'Wild Walker', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25walker.png', 1, 'PRAGMATIC', 0),
(3435, 'vs20goldfever', 'Gems Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20goldfever.png', 1, 'PRAGMATIC', 0),
(3436, 'vs25bkofkngdm', 'Book of Kingdoms', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25bkofkngdm.png', 1, 'PRAGMATIC', 0),
(3437, 'vs10goldfish', 'Fishin Reels', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10goldfish.png', 1, 'PRAGMATIC', 0),
(3438, 'vs1024dtiger', 'The Dragon Tiger', 'https://mxvbet.xyz/uploads/game-134329614054.jpg', 1, 'PRAGMATIC', 1),
(3439, 'vs20xmascarol', 'Christmas Carol Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20xmascarol.png', 1, 'PRAGMATIC', 0),
(3440, 'vs10mayangods', 'John Hunter and the Mayan Gods', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10mayangods.png', 1, 'PRAGMATIC', 0),
(3441, 'vs20bonzgold', 'Bonanza Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20bonzgold.png', 1, 'PRAGMATIC', 0),
(3442, 'vs40voodoo', 'Voodoo Magic', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40voodoo.png', 1, 'PRAGMATIC', 0),
(3443, 'vs25gldox', 'Golden Ox', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25gldox.png', 1, 'PRAGMATIC', 0),
(3444, 'vs10wildtut', 'Mysterious Egypt', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10wildtut.png', 1, 'PRAGMATIC', 0),
(3445, 'vs10eyestorm', 'Eye of the Storm', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10eyestorm.png', 1, 'PRAGMATIC', 0),
(3446, 'vs117649starz', 'Starz Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs117649starz.png', 1, 'PRAGMATIC', 0),
(3447, 'vs10amm', 'The Amazing Money Machine', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10amm.png', 1, 'PRAGMATIC', 0),
(3448, 'vs20magicpot', 'The Magic Cauldron - Enchanted Brew', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20magicpot.png', 1, 'PRAGMATIC', 0),
(3449, 'vswayselements', 'Elemental Gems Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayselements.png', 1, 'PRAGMATIC', 0),
(3450, 'vswayschilheat', 'Chilli Heat Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayschilheat.png', 1, 'PRAGMATIC', 0),
(3451, 'vs10luckcharm', 'Lucky Grace And Charm', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10luckcharm.png', 1, 'PRAGMATIC', 0),
(3452, 'vswaysaztecking', 'Aztec King Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysaztecking.png', 1, 'PRAGMATIC', 0),
(3453, 'vs20phoenixf', 'Phoenix Forge', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20phoenixf.png', 1, 'PRAGMATIC', 0),
(3454, 'vs576hokkwolf', 'Hokkaido Wolf', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs576hokkwolf.png', 1, 'PRAGMATIC', 0),
(3455, 'vs20trsbox', 'Treasure Wild', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20trsbox.png', 1, 'PRAGMATIC', 0),
(3456, 'vs243chargebull', 'Raging Bull', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243chargebull.png', 1, 'PRAGMATIC', 0),
(3457, 'vswaysbankbonz', 'Cash Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysbankbonz.png', 1, 'PRAGMATIC', 0),
(3458, 'vs20pbonanza', 'Pyramid Bonanza', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20pbonanza.png', 1, 'PRAGMATIC', 0),
(3459, 'vs243empcaishen', 'Emperor Caishen', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243empcaishen.png', 1, 'PRAGMATIC', 0),
(3460, 'vs25tigeryear', 'New Year Tiger Treasures ™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25tigeryear.png', 1, 'PRAGMATIC', 0),
(3461, 'vs20amuleteg', 'Fortune of Giza™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20amuleteg.png', 1, 'PRAGMATIC', 0),
(3462, 'vs10runes', 'Gates of Valhalla™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10runes.png', 1, 'PRAGMATIC', 0),
(3463, 'vs25goldparty', 'Gold Party®', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25goldparty.png', 1, 'PRAGMATIC', 0),
(3464, 'vswaysxjuicy', 'Extra Juicy Megaways™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswaysxjuicy.png', 1, 'PRAGMATIC', 0),
(3465, 'vs40wanderw', 'Wild Depths™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40wanderw.png', 1, 'PRAGMATIC', 0),
(3466, 'vs4096magician', 'Magician\'s Secrets™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs4096magician.png', 1, 'PRAGMATIC', 0);
INSERT INTO `games` (`id`, `game_code`, `game_name`, `banner`, `status`, `provider`, `popular`) VALUES
(3467, 'vs20smugcove', 'Smugglers Cove™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20smugcove.png', 1, 'PRAGMATIC', 0),
(3468, 'vswayscryscav', 'Crystal Caverns Megaways™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayscryscav.png', 1, 'PRAGMATIC', 0),
(3469, 'vs20superx', 'Super X™', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20superx.png', 1, 'PRAGMATIC', 0),
(3470, 'vs20rockvegas', 'Rock Vegas Mega Hold & Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20rockvegas.png', 1, 'PRAGMATIC', 0),
(3471, 'vs25copsrobbers', 'Cash Patrol', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25copsrobbers.png', 1, 'PRAGMATIC', 0),
(3472, 'vs20colcashzone', 'Colossal Cash Zone', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20colcashzone.png', 1, 'PRAGMATIC', 0),
(3473, 'vs20ultim5', 'The Ultimate 5', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20ultim5.png', 1, 'PRAGMATIC', 0),
(3474, 'vs20bchprty', 'Wild Beach Party', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20bchprty.png', 1, 'PRAGMATIC', 0),
(3475, 'vs10bookazteck', 'Book of Aztec King', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10bookazteck.png', 1, 'PRAGMATIC', 0),
(3476, 'vs50mightra', 'Might of Ra', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50mightra.png', 1, 'PRAGMATIC', 0),
(3477, 'vs25bullfiesta', 'Bull Fiesta', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs25bullfiesta.png', 1, 'PRAGMATIC', 0),
(3478, 'vs20rainbowg', 'Rainbow Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20rainbowg.png', 1, 'PRAGMATIC', 0),
(3479, 'vs10tictac', 'Tic Tac Take', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10tictac.png', 1, 'PRAGMATIC', 0),
(3480, 'vs243discolady', 'Disco Lady', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243discolady.png', 1, 'PRAGMATIC', 0),
(3481, 'vs243queenie', 'Queenie', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs243queenie.png', 1, 'PRAGMATIC', 0),
(3482, 'vs20farmfest', 'Barn Festival', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20farmfest.png', 1, 'PRAGMATIC', 0),
(3483, 'vs10chkchase', 'Chicken Chase', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10chkchase.png', 1, 'PRAGMATIC', 0),
(3484, 'vswayswildwest', 'Wild West Gold Megaways', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayswildwest.png', 1, 'PRAGMATIC', 0),
(3485, 'vs20mustanggld2', 'Clover Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20mustanggld2.png', 1, 'PRAGMATIC', 0),
(3486, 'vs20drtgold', 'Drill That Gold', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20drtgold.png', 1, 'PRAGMATIC', 0),
(3487, 'vs10spiritadv', 'Spirit of Adventure', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10spiritadv.png', 1, 'PRAGMATIC', 0),
(3488, 'vs10firestrike2', 'Fire Strike 2', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10firestrike2.png', 1, 'PRAGMATIC', 0),
(3489, 'vs40cleoeye', 'Eye of Cleopatra', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs40cleoeye.png', 1, 'PRAGMATIC', 0),
(3490, 'vs20gobnudge', 'Goblin Heist Powernudge', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20gobnudge.png', 1, 'PRAGMATIC', 0),
(3491, 'vs20stickysymbol', 'The Great Stick-up', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20stickysymbol.png', 1, 'PRAGMATIC', 0),
(3492, 'vswayszombcarn', 'Zombie Carnival', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vswayszombcarn.png', 1, 'PRAGMATIC', 0),
(3493, 'vs50northgard', 'North Guardians', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs50northgard.png', 1, 'PRAGMATIC', 0),
(3494, 'vs20sugarrush', 'Sugar Rush', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20sugarrush.png', 1, 'PRAGMATIC', 0),
(3495, 'vs20cleocatra', 'Cleocatra', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs20cleocatra.png', 1, 'PRAGMATIC', 0),
(3496, 'vs5littlegem', 'Little Gem Hold and Spin', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs5littlegem.png', 1, 'PRAGMATIC', 0),
(3497, 'vs10egrich', 'Queen of Gods', 'https://solawins-sg0.pragmaticplay.net/game_pic/rec/325/vs10egrich.png', 1, 'PRAGMATIC', 0),
(3498, 'vs243koipond', 'Koi Pond', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs243koipond.png', 1, 'PRAGMATIC', 0),
(3499, 'vs40samurai3', 'Rise of Samurai 3', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs40samurai3.png', 1, 'PRAGMATIC', 0),
(3500, 'vs40cosmiccash', 'Cosmic Cash', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs40cosmiccash.png', 1, 'PRAGMATIC', 0),
(3501, 'vs25bomb', 'Bomb Bonanza', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs25bomb.png', 1, 'PRAGMATIC', 0),
(3502, 'vs1024mahjpanda', 'Mahjong Panda', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs1024mahjpanda.png', 1, 'PRAGMATIC', 0),
(3503, 'vs10coffee', 'Coffee Wild', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs10coffee.png', 1, 'PRAGMATIC', 0),
(3504, 'vs100sh', 'Shining Hot 100', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs100sh.png', 1, 'PRAGMATIC', 0),
(3505, 'vs20sh', 'Shining Hot 20', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20sh.png', 1, 'PRAGMATIC', 0),
(3506, 'vs40sh', 'Shining Hot 40', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs40sh.png', 1, 'PRAGMATIC', 0),
(3507, 'vs5sh', 'Shining Hot 5', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs5sh.png', 1, 'PRAGMATIC', 0),
(3508, 'vswaysjkrdrop', 'Tropical Tiki', 'https://api-sg57.ppgames.net/game_pic/rec/325/vswaysjkrdrop.png', 1, 'PRAGMATIC', 0),
(3509, 'vs243ckemp', 'Cheeky Emperor', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs243ckemp.png', 1, 'PRAGMATIC', 0),
(3510, 'vs40hotburnx', 'Hot To Burn Extreme', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs40hotburnx.png', 1, 'PRAGMATIC', 0),
(3511, 'vs1024gmayhem', 'Gorilla Mayhem', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs1024gmayhem.png', 1, 'PRAGMATIC', 0),
(3512, 'vs20octobeer', 'Octobeer Fortunes', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20octobeer.png', 1, 'PRAGMATIC', 0),
(3513, 'vs10txbigbass', 'Big Bass Splash', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs10txbigbass.png', 1, 'PRAGMATIC', 0),
(3514, 'vs100firehot', 'Fire Hot 100', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs100firehot.png', 1, 'PRAGMATIC', 0),
(3515, 'vs20fh', 'Fire Hot 20', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20fh.png', 1, 'PRAGMATIC', 0),
(3516, 'vs40firehot', 'Fire Hot 40', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs40firehot.png', 1, 'PRAGMATIC', 0),
(3517, 'vs5firehot', 'Fire Hot 5', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs5firehot.png', 1, 'PRAGMATIC', 0),
(3518, 'vs20wolfie', 'Greedy Wolf', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20wolfie.png', 1, 'PRAGMATIC', 0),
(3519, 'vs20underground', 'Down the Rails', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20underground.png', 1, 'PRAGMATIC', 0),
(3520, 'vs10mmm', 'Magic Money Maze', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs10mmm.png', 1, 'PRAGMATIC', 0),
(3521, 'vswaysfltdrg', 'Floating Dragon Hold & Spin Megaways', 'https://api-sg57.ppgames.net/game_pic/rec/325/vswaysfltdrg.png', 1, 'PRAGMATIC', 0),
(3522, 'vs20trswild2', 'Black Bull', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20trswild2.png', 1, 'PRAGMATIC', 0),
(3523, 'vswaysstrwild', 'Candy Stars', 'https://api-sg57.ppgames.net/game_pic/rec/325/vswaysstrwild.png', 1, 'PRAGMATIC', 0),
(3524, 'vs10crownfire', 'Crown of Fire', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs10crownfire.png', 1, 'PRAGMATIC', 0),
(3525, 'vs20muertos', 'Muertos Multiplier Megaways', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20muertos.png', 1, 'PRAGMATIC', 0),
(3526, 'vswayslofhero', 'Legend of Heroes', 'https://api-sg57.ppgames.net/game_pic/rec/325/vswayslofhero.png', 1, 'PRAGMATIC', 0),
(3527, 'vs5strh', 'Striking Hot 5', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs5strh.png', 1, 'PRAGMATIC', 0),
(3528, 'vs10snakeeyes', 'Snakes & Ladders - Snake Eyes', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs10snakeeyes.png', 1, 'PRAGMATIC', 0),
(3529, 'vswaysbook', 'Book of Golden Sands', 'https://api-sg57.ppgames.net/game_pic/rec/325/vswaysbook.png', 1, 'PRAGMATIC', 0),
(3530, 'vs20mparty', 'Wild Hop and Drop', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20mparty.png', 1, 'PRAGMATIC', 0),
(3531, 'vs20swordofares', 'Sword of Ares', 'https://api-sg57.ppgames.net/game_pic/rec/325/vs20swordofares.png', 1, 'PRAGMATIC', 0),
(3532, 'vswaysfrywld', 'Spin & Score Megaways', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14187.png', 1, 'PRAGMATIC', 0),
(3533, 'vs12bbbxmas', 'Bigger Bass Blizzaro', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14192.jpg', 1, 'PRAGMATIC', 0),
(3534, 'vs25kfruit', 'Aztec Blaze', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14236.jpg', 1, 'PRAGMATIC', 0),
(3535, 'vswaysconcoll', 'Sweet PowerNudge™', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14240.jpg', 1, 'PRAGMATIC', 0),
(3536, 'vs20schristmas', 'Starlight Chrismas', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14241.jpg', 1, 'PRAGMATIC', 0),
(3537, 'vs20lcount', 'Gems of Serengeti™', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14257.jpg', 1, 'PRAGMATIC', 0),
(3538, 'vs20sparta', 'Shield of Sparta', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14259.jpg', 1, 'PRAGMATIC', 0),
(3539, 'vs10bbkir', 'Big Bass Bonanza Keeping it Reel', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14275.jpg', 1, 'PRAGMATIC', 0),
(3540, 'vswaysluckyfish', 'Lucky Fishing Megaways™', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14276.jpg', 1, 'PRAGMATIC', 0),
(3541, 'vs20drgbless', 'Dragon Hero', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14282.jpg', 1, 'PRAGMATIC', 0),
(3542, 'vswayspizza', 'Pizza Pizza Pizza', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14324.jpg', 1, 'PRAGMATIC', 0),
(3543, 'vs20dugems', 'Hot Pepper™', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14327.jpg', 1, 'PRAGMATIC', 0),
(3544, 'vs20clspwrndg', 'Sweet PowerNudge', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14328.jpg', 1, 'PRAGMATIC', 0),
(3545, 'vswaysfuryodin', 'Fury of Odin Megaways™', 'https://resource.fdsigaming.com/thumbnail/slot/ppNew/14337.jpg', 1, 'PRAGMATIC', 0),
(3546, 'vs20sugarcoins', 'Viking Forge', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sugarcoins.png', 1, 'PRAGMATIC', 0),
(3547, 'vs20dhcluster', 'Twilight Princess', 'https://api-2103.ppgames.net/game_pic/square/200/vs20dhcluster.png', 1, 'PRAGMATIC', 0),
(3548, 'vs20olympgrace', 'Grace of Ebisu', 'https://api-2103.ppgames.net/game_pic/square/200/vs20olympgrace.png', 1, 'PRAGMATIC', 0),
(3549, 'vs20starlightx', 'Starlight Princess 1000', 'https://api-2103.ppgames.net/game_pic/square/200/vs20starlightx.png', 1, 'PRAGMATIC', 0),
(3550, 'vswaysmoneyman', 'The Money Men Megaways', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysmoneyman.png', 1, 'PRAGMATIC', 0),
(3551, 'vs40demonpots', 'Demon Pots', 'https://api-2103.ppgames.net/game_pic/square/200/vs40demonpots.png', 1, 'PRAGMATIC', 0),
(3552, 'vswaystut', 'John Hunter and the Book of Tut Megaways', 'https://api-2103.ppgames.net/game_pic/square/200/vswaystut.png', 1, 'PRAGMATIC', 0),
(3553, 'vs10gdchalleng', '8 Golden Dragon Challenge', 'https://api-2103.ppgames.net/game_pic/square/200/vs10gdchalleng.png', 1, 'PRAGMATIC', 0),
(3554, 'vs20yisunshin', 'Yi Sun Shin', 'https://api-2103.ppgames.net/game_pic/square/200/vs20yisunshin.png', 1, 'PRAGMATIC', 0),
(3555, 'vs20candyblitz', 'Candy Blitz', 'https://api-2103.ppgames.net/game_pic/square/200/vs20candyblitz.png', 1, 'PRAGMATIC', 0),
(3556, 'vswaysstrlght', 'Fortunes of Aztec', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysstrlght.png', 1, 'PRAGMATIC', 0),
(3557, 'vs40infwild', 'Infective Wild', 'https://api-2103.ppgames.net/game_pic/square/200/vs40infwild.png', 1, 'PRAGMATIC', 0),
(3558, 'vs20gravity', 'Gravity Bonanza', 'https://api-2103.ppgames.net/game_pic/square/200/vs20gravity.png', 1, 'PRAGMATIC', 0),
(3559, 'vs40rainbowr', 'Rainbow Reels', 'https://api-2103.ppgames.net/game_pic/square/200/vs40rainbowr.png', 1, 'PRAGMATIC', 0),
(3560, 'vs20bnnzdice', 'Sweet Bonanza Dice', 'https://api-2103.ppgames.net/game_pic/square/200/vs20bnnzdice.png', 1, 'PRAGMATIC', 0),
(3561, 'vs10bhallbnza', 'Big Bass Halloween', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bhallbnza.png', 1, 'PRAGMATIC', 0),
(3562, 'vswaysraghex', 'Tundra\'s Fortune', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysraghex.png', 1, 'PRAGMATIC', 0),
(3563, 'vs20maskgame', 'Cash Chips', 'https://api-2103.ppgames.net/game_pic/square/200/vs20maskgame.png', 1, 'PRAGMATIC', 0),
(3564, 'vs5gemstone', 'Gemstone', 'https://api-2103.ppgames.net/game_pic/square/200/vs5gemstone.png', 1, 'PRAGMATIC', 0),
(3565, 'vs1024mahjwins', 'Mahjong Wins', 'https://api-2103.ppgames.net/game_pic/square/200/vs1024mahjwins.png', 1, 'PRAGMATIC', 0),
(3566, 'vs20procount', 'Wisdom of Athena', 'https://api-2103.ppgames.net/game_pic/square/200/vs20procount.png', 1, 'PRAGMATIC', 0),
(3567, 'vs20forge', 'Forge of Olympus', 'https://api-2103.ppgames.net/game_pic/square/200/vs20forge.png', 1, 'PRAGMATIC', 0),
(3568, 'vswaysbbhas', 'Big Bass Hold & Spinner Megaways', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysbbhas.png', 1, 'PRAGMATIC', 0),
(3569, 'vs20earthquake', 'Cyclops Smash', 'https://api-2103.ppgames.net/game_pic/square/200/vs20earthquake.png', 1, 'PRAGMATIC', 0),
(3570, 'vs20saiman', 'Saiyan Mania', 'https://api-2103.ppgames.net/game_pic/square/200/vs20saiman.png', 1, 'PRAGMATIC', 0),
(3571, 'vs20piggybank', 'Piggy Bankers', 'https://api-2103.ppgames.net/game_pic/square/200/vs20piggybank.png', 1, 'PRAGMATIC', 0),
(3572, 'vs20lvlup', 'Pub Kings', 'https://api-2103.ppgames.net/game_pic/square/200/vs20lvlup.png', 1, 'PRAGMATIC', 0),
(3573, 'vs10trail', 'Mustang Trail', 'https://api-2103.ppgames.net/game_pic/square/200/vs10trail.png', 1, 'PRAGMATIC', 0),
(3574, 'vs20supermania', 'Supermania', 'https://api-2103.ppgames.net/game_pic/square/200/vs20supermania.png', 1, 'PRAGMATIC', 0),
(3575, 'vs50dmdcascade', 'Diamond Cascade', 'https://api-2103.ppgames.net/game_pic/square/200/vs50dmdcascade.png', 1, 'PRAGMATIC', 0),
(3576, 'vs20lobcrab', 'Lobster Bob\'s Crazy Crab Shack', 'https://api-2103.ppgames.net/game_pic/square/200/vs20lobcrab.png', 1, 'PRAGMATIC', 0),
(3577, 'vs20wildparty', '3 Buzzing Wilds', 'https://api-2103.ppgames.net/game_pic/square/200/vs20wildparty.png', 1, 'PRAGMATIC', 0),
(3578, 'vs20doghousemh', 'The Dog House Multihold', 'https://api-2103.ppgames.net/game_pic/square/200/vs20doghousemh.png', 1, 'PRAGMATIC', 0),
(3579, 'vs20splmystery', 'Spellbinding Mystery', 'https://api-2103.ppgames.net/game_pic/square/200/vs20splmystery.png', 1, 'PRAGMATIC', 0),
(3580, 'vs20cashmachine', 'Cash Box', 'https://api-2103.ppgames.net/game_pic/square/200/vs20cashmachine.png', 1, 'PRAGMATIC', 0),
(3581, 'vs50jucier', 'Sky Bounty', 'https://api-2103.ppgames.net/game_pic/square/200/vs50jucier.png', 1, 'PRAGMATIC', 0),
(3582, 'vs243nudge4gold', 'Hellvis Wild', 'https://api-2103.ppgames.net/game_pic/square/200/vs243nudge4gold.png', 1, 'PRAGMATIC', 0),
(3583, 'vs25jokrace', 'Joker Race', 'https://api-2103.ppgames.net/game_pic/square/200/vs25jokrace.png', 1, 'PRAGMATIC', 0),
(3584, 'vs20hstgldngt', 'Heist for the Golden Nuggets', 'https://api-2103.ppgames.net/game_pic/square/200/vs20hstgldngt.png', 1, 'PRAGMATIC', 0),
(3585, 'vs20beefed', 'Fat Panda', 'https://api-2103.ppgames.net/game_pic/square/200/vs20beefed.png', 1, 'PRAGMATIC', 0),
(3586, 'vs20jewelparty', 'Jewel Rush', 'https://api-2103.ppgames.net/game_pic/square/200/vs20jewelparty.png', 1, 'PRAGMATIC', 0),
(3587, 'vs9outlaw', 'Pirates Pub', 'https://api-2103.ppgames.net/game_pic/square/200/vs9outlaw.png', 1, 'PRAGMATIC', 0),
(3588, 'vswaysfrbugs', 'Frogs & Bugs', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysfrbugs.png', 1, 'PRAGMATIC', 0),
(3589, 'vs20lampinf', 'Lamp Of Infinity', 'https://api-2103.ppgames.net/game_pic/square/200/vs20lampinf.png', 1, 'PRAGMATIC', 0),
(3590, 'vs4096robber', 'Robber Strike', 'https://api-2103.ppgames.net/game_pic/square/200/vs4096robber.png', 1, 'PRAGMATIC', 0),
(3591, 'vs10fdrasbf', 'Floating Dragon - Dragon Boat Festival', 'https://api-2103.ppgames.net/game_pic/square/200/vs10fdrasbf.png', 1, 'PRAGMATIC', 0),
(3592, 'vs20clustwild', 'Sticky Bees', 'https://api-2103.ppgames.net/game_pic/square/200/vs20clustwild.png', 1, 'PRAGMATIC', 0),
(3593, 'vs25spotz', 'Knight Hot Spotz', 'https://api-2103.ppgames.net/game_pic/square/200/vs25spotz.png', 1, 'PRAGMATIC', 0),
(3594, 'vs20excalibur', 'Excalibur Unleashed', 'https://api-2103.ppgames.net/game_pic/square/200/vs20excalibur.png', 1, 'PRAGMATIC', 0),
(3595, 'vs20stickywild', 'Wild Bison Charge', 'https://api-2103.ppgames.net/game_pic/square/200/vs20stickywild.png', 1, 'PRAGMATIC', 0),
(3596, 'vs25holiday', 'Holiday Ride', 'https://api-2103.ppgames.net/game_pic/square/200/vs25holiday.png', 1, 'PRAGMATIC', 0),
(3597, 'vs20mvwild', 'Jasmine Dreams', 'https://api-2103.ppgames.net/game_pic/square/200/vs20mvwild.png', 1, 'PRAGMATIC', 0),
(3598, 'vs10kingofdth', 'Kingdom of the Dead', 'https://api-2103.ppgames.net/game_pic/square/200/vs10kingofdth.png', 1, 'PRAGMATIC', 0),
(3599, 'vswaysultrcoin', 'Cowboy Coins', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysultrcoin.png', 1, 'PRAGMATIC', 0),
(3600, 'vs10gizagods', 'Gods of Giza', 'https://api-2103.ppgames.net/game_pic/square/200/vs10gizagods.png', 1, 'PRAGMATIC', 0),
(3601, 'vswaysrsm', 'Wild Celebrity Bus Megaways', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysrsm.png', 1, 'PRAGMATIC', 0),
(3602, 'vswaysmonkey', '3 Dancing Monkeys', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysmonkey.png', 1, 'PRAGMATIC', 0),
(3603, 'vs20hotzone', 'African Elephant', 'https://api-2103.ppgames.net/game_pic/square/200/vs20hotzone.png', 1, 'PRAGMATIC', 0),
(3604, 'vs10bbhas', 'Big Bass - Hold & Spinner', 'https://api-2103.ppgames.net/game_pic/square/200/vs10bbhas.png', 1, 'PRAGMATIC', 0),
(3605, 'vs1024moonsh', 'Moonshot', 'https://api-2103.ppgames.net/game_pic/square/200/vs1024moonsh.png', 1, 'PRAGMATIC', 0),
(3606, 'vswaysredqueen', 'The Red Queen', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysredqueen.png', 1, 'PRAGMATIC', 0),
(3607, 'vs20framazon', 'Fruits of the Amazon', 'https://api-2103.ppgames.net/game_pic/square/200/vs20framazon.png', 1, 'PRAGMATIC', 0),
(3608, 'vs20sknights', 'The Knight King', 'https://api-2103.ppgames.net/game_pic/square/200/vs20sknights.png', 1, 'PRAGMATIC', 0),
(3609, 'vs20goldclust', 'Rabbit Garden', 'https://api-2103.ppgames.net/game_pic/square/200/vs20goldclust.png', 1, 'PRAGMATIC', 0),
(3610, 'vswaysmorient', 'Mystery of the Orient', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysmorient.png', 1, 'PRAGMATIC', 0),
(3611, 'vs10powerlines', 'Peak Power', 'https://api-2103.ppgames.net/game_pic/square/200/vs10powerlines.png', 1, 'PRAGMATIC', 0),
(3612, 'vs12tropicana', 'Club Tropicana', 'https://api-2103.ppgames.net/game_pic/square/200/vs12tropicana.png', 1, 'PRAGMATIC', 0),
(3613, 'vs25archer', 'Fire Archer', 'https://api-2103.ppgames.net/game_pic/square/200/vs25archer.png', 1, 'PRAGMATIC', 0),
(3614, 'vs20gatotfury', 'Gatot Kaca\'s Fury', 'https://api-2103.ppgames.net/game_pic/square/200/vs20gatotfury.png', 1, 'PRAGMATIC', 0),
(3615, 'vs20mochimon', 'Mochimon', 'https://api-2103.ppgames.net/game_pic/square/200/vs20mochimon.png', 1, 'PRAGMATIC', 0),
(3616, 'vs10fisheye', 'Fish Eye', 'https://api-2103.ppgames.net/game_pic/square/200/vs10fisheye.png', 1, 'PRAGMATIC', 0),
(3617, 'vs20superlanche', 'Monster Superlanche', 'https://api-2103.ppgames.net/game_pic/square/200/vs20superlanche.png', 1, 'PRAGMATIC', 0),
(3618, 'vswaysftropics', 'Frozen Tropics', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysftropics.png', 1, 'PRAGMATIC', 0),
(3619, 'vswaysincwnd', 'Gold Oasis', 'https://api-2103.ppgames.net/game_pic/square/200/vswaysincwnd.png', 1, 'PRAGMATIC', 0),
(3620, 'vs25spgldways', 'Secret City Gold', 'https://api-2103.ppgames.net/game_pic/square/200/vs25spgldways.png', 1, 'PRAGMATIC', 0),
(3621, 'vswayswwhex', 'Wild Wild Bananas', 'https://api-2103.ppgames.net/game_pic/square/200/vswayswwhex.png', 1, 'PRAGMATIC', 0),
(3622, 'prosper-ftree', 'Prosperity Fortune Tree', 'https://mxvbet.xyz/uploads/game-164668899011.webp', 1, 'PGSOFT', 1),
(3623, 'pnkk4iuchw7blb2p', 'Dragonara Roulette', 'https://evolution.bet4wins.net/assets/banner/DragonaraRoulette.webp', 1, 'EVOLUTION', 0),
(3624, 'MonBigBaller0001', 'MONOPOLY Big Baller', 'https://mxvbet.xyz/uploads/game-60672771801.jpg', 1, 'EVOLUTION', 0),
(3625, 'lr6t4k3lcd4qgyrk', 'Grand Casino Roulette', 'https://evolution.bet4wins.net/assets/banner/grand_casino.webp', 1, 'EVOLUTION', 0),
(3626, 'rep5ca4ynyjl7wdw', 'Speed Baccarat 7', 'https://evolution.bet4wins.net/assets/banner/SpeedBaccarat7.webp', 1, 'EVOLUTION', 0),
(3627, 'mrpuiwhx5slaurcy', 'Hippodrome Grand Casino', 'https://evolution.bet4wins.net/assets/banner/hippodrome_grand.webp', 1, 'EVOLUTION', 0),
(3628, 'Monopoly00000001', 'MONOPOLY Live', 'https://evolution.bet4wins.net/assets/banner/monopoly.webp', 1, 'EVOLUTION', 0),
(3629, 'TRLRou0000000001', 'Türkçe Lightning Rulet', 'https://evolution.bet4wins.net/assets/banner/TurkishLightningRoulette.webp', 1, 'EVOLUTION', 0),
(3630, 'mvrcophqscoqosd6', 'Casino Malta Roulette', 'https://evolution.bet4wins.net/assets/banner/casino_malta.webp', 1, 'EVOLUTION', 0),
(3631, 'rep5eiecnyjl75lq', 'Speed Baccarat 8', 'https://evolution.bet4wins.net/assets/banner/SpeedBaccarat8.webp', 1, 'EVOLUTION', 0),
(3632, 'rep5aor7nyjl7qli', 'Speed Baccarat 6', 'https://evolution.bet4wins.net/assets/banner/SpeedBaccarat6.webp', 1, 'EVOLUTION', 0),
(3633, '541000', 'Ultimate Roulette', 'https://ezugi.bet4wins.net/assets/banner/UltimateRoulette.webp', 1, 'EZUGI', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico_play`
--

CREATE TABLE `historico_play` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nome_game` text NOT NULL,
  `bet_money` decimal(10,2) NOT NULL DEFAULT 0.00,
  `win_money` decimal(10,2) NOT NULL DEFAULT 0.00,
  `txn_id` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status_play` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logs_acessos_adm`
--

CREATE TABLE `logs_acessos_adm` (
  `id` int(11) NOT NULL,
  `id_adm` int(11) NOT NULL,
  `entrada` time NOT NULL,
  `saida` time DEFAULT NULL,
  `token` text NOT NULL,
  `data_cad` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagstart`
--

CREATE TABLE `pagstart` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `access_key` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  `url_callback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pagstart`
--

INSERT INTO `pagstart` (`id`, `url`, `access_key`, `email`, `tenant_id`, `url_callback`) VALUES
(1, 'https://api.pagstar.com/api/v2', 'bQyhJDao6Lr3qW0L', 'conta1@mkmonster.com.br', '5ebeffa2-4fd5-4e07-85f0-617df7869d0d', 'http://localhost');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pay_valores_cassino`
--

CREATE TABLE `pay_valores_cassino` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 0 COMMENT '0: CPA / 1: REV / 2: GAMES',
  `data_time` datetime NOT NULL,
  `game` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `populares`
--

CREATE TABLE `populares` (
  `id` int(11) NOT NULL,
  `game_code` varchar(20) NOT NULL,
  `game_name` varchar(100) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `provider` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `provedores`
--

CREATE TABLE `provedores` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `provedores`
--

INSERT INTO `provedores` (`id`, `code`, `name`, `type`, `status`) VALUES
(39, 'PRAGMATIC', 'Pragmatic Play', 'slot', 1),
(40, 'HABANERO', 'Habanero', 'slot', 1),
(41, 'BOOONGO', 'Booongo', 'slot', 1),
(42, 'PLAYSON', 'Playson', 'slot', 1),
(43, 'CQ9', 'CQ9', 'slot', 1),
(44, 'EVOPLAY', 'Evoplay', 'slot', 1),
(45, 'TOPTREND', 'TopTrend Gaming', 'slot', 1),
(46, 'DREAMTECH', 'DreamTech', 'slot', 1),
(47, 'PGSOFT', 'PG Soft', 'slot', 1),
(48, 'REELKINGDOM', 'Reel Kingdom', 'slot', 1),
(49, 'EZUGI', 'Ezugi', 'live', 1),
(50, 'EVOLUTION', 'Evolution', 'live', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacao_saques`
--

CREATE TABLE `solicitacao_saques` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `transacao_id` text NOT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo` text NOT NULL,
  `pix` text NOT NULL,
  `data_cad` date NOT NULL,
  `data_hora` time NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `data_att` datetime DEFAULT NULL,
  `tipo_saque` int(11) NOT NULL DEFAULT 0 COMMENT '0: cassino / 1: afiliados'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `suitpay`
--

CREATE TABLE `suitpay` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `client_id` text DEFAULT NULL,
  `client_secret` text DEFAULT NULL,
  `atualizado` varchar(45) DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `suitpay`
--

INSERT INTO `suitpay` (`id`, `url`, `client_id`, `client_secret`, `atualizado`, `ativo`) VALUES
(1, 'https://ws.suitpay.app', '', '', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tema`
--

CREATE TABLE `tema` (
  `id` int(11) NOT NULL,
  `cor_padrao` varchar(45) DEFAULT NULL,
  `custom_css` longtext DEFAULT NULL,
  `texto` varchar(45) DEFAULT NULL,
  `status_topheader` int(11) NOT NULL DEFAULT 0,
  `cor_topheader` varchar(48) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `tema`
--

INSERT INTO `tema` (`id`, `cor_padrao`, `custom_css`, `texto`, `status_topheader`, `cor_topheader`) VALUES
(0, '#9BCD10', '', '#FFFFFF', 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `id` int(11) NOT NULL,
  `transacao_id` varchar(255) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `tipo` enum('deposito','saque') DEFAULT NULL,
  `data_hora` varchar(255) DEFAULT NULL,
  `qrcode` text DEFAULT NULL,
  `code` text DEFAULT NULL,
  `status` enum('pago','processamento') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `transacoes`
--

INSERT INTO `transacoes` (`id`, `transacao_id`, `usuario`, `valor`, `tipo`, `data_hora`, `qrcode`, `code`, `status`) VALUES
(620, '91166d9e-f43c-40bb-b137-b32f726a3506', 835, '10.00', 'deposito', '2024-01-10 16:11:05', 'iVBORw0KGgoAAAANSUhEUgAAAKsAAACrAQMAAAAjJv5aAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAACxUlEQVRIie2Wv63kIBDGxyIgsxtAog0yWrIbsL0N4JbIaAOJBuyMAHnuY73v3ukuOYgfQpb12xUe5s83Q/Sz/l0T807JGey4mjJavtvxSOLI7AxzferbgLRjm5wVh0+3LVum1bDrwrvBpinQbMvci53Vu03MabeR+nC9pSLiHU4yYv/z8v+N4e+3s7/2dxga8Pv4uGXYGDcv3HfwG/AUxElxCRq3dBZeT2cHZpq8vi1z0LukxeseHBJX62imdHhxZbG34yHEgdOFp8d7mXwZO3AWpxFIZCSRo8S+zO14tIWMIhlXXDTTFp5btmFYx168MuImrqBvims7JgQ8x8mnl0foYOxzdhseMrNX1VKTTplO8/lkEyZTBlaLr3sK2slPEjbhAfliy+AjUuAmfWTtOnAoS05X5qN6qwyBz3Y8SnF5vqVgj/c4k+7BFgWhlgBv4SMawV/b8RSgLgqlwKwmHzd+tKoR+zhatVS1g2ri4CdobRg5iHJ8msluajdw7RhCBeVeDeobTlIrffzdhtGIAk1ZMEOu1MapB9uy+EgyXV6NlE6rO/DA4mJYV6asr4y6/Lp8Cx4NVAGNUaG4DwgnFWrHRGKXECq4XG0+XVDxHhwXVjV0SEB0Evm4qg0PuQ4IW1aQT3SS/dPTGjHjlmWVSMB3K7DibMdkkYNx8emtWGiM4u7BCHtZoTSwEemTn07ShlGXDlNPQDUg+OkIv8u1AUM1R0mbp9lodLYp09yOoZpV6kL1OmoL/1o7MPwNrWJ9SjUE/fJPOrRhVCRUEznITKvUB39GoiZM7xnq4jqFORtHelp0GwY7ch2+kIBnHW/T3Y4xD74ypFdjEkRJYV5wHRgVIGPVqqwQvYnL2IWRyNDOkfjymIPU3IXhbGcRPahm7ZNjB0YZSXhLvyDAQc3yc3YTrjMyfrEYsfm06ZUfV7Xhn/X3+gWzTVLxM3weNgAAAABJRU5ErkJggg==', '00020101021226790014br.gov.bcb.pix2557brcode.starkinfra.com/v2/060cae1bbe1641dbb4853a7d4f8085b85204000053039865802BR5925Suitpay Instituicao de Pa6007Goiania62070503***63049E69', 'pago'),
(0, 'PIXSP853-2024JanFri100108', 835, '10.00', 'deposito', '2024-01-19 10:35:12', 'iVBORw0KGgoAAAANSUhEUgAAAKsAAACrAQMAAAAjJv5aAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAACqUlEQVRIie2XQY6kMAxFjVhkBxeIlGtklyvBBSi4AFyJXa4RKRegdllEeL6pnunRzGac9UStUvejhOJv+9tN9P/8fUbm3bit9Cu5O9AQ+Nbjgfrd0+vkI1IX+9uD6HHIO/UHu/dJi0+L570NG7eHfjd1MGlqxWtwa8hc+j0kasOI0tDk8+rrXPD5Hfy/Y9Hb5++f39Lw7xin47SQ3PHgz4vVeDx5JYuEM1tItRh367G8zNspUHd+hbs3YIgU0nzakdPMmaNd9HiMdfHIeR0LvaC3cZced+y2EzrxVvLl+R25AY9cX7Hn4i7RiVefBj1GlBekIlwTt0MVfN6tw92Z8GTj1LF9FfSla8DI+YpapjQW6aoJ19Rj8rWLkErE3g2e10GPxzMfgusM1XHT0l8t2C6+PwpvZ30VaI/76jFDZtRg7YqdvOP4dUEVpiAVhFpeECKKkfKqx4OBJdQxOmZ8hQ+uUwNGusAwBAIeyleGBoxuNo9dBUSMUmrBXUzjiaoRA74JvpsaMFzzpvQ6ESX6ST53PR6CJWOJkDGSWeSfJChxx/0G4wwAdi5u96kJE0Jk1I7ppbmDHfSYQr7JXT7fIaMP5kKTHo8RFfSoHuE3yGEThrUY2AO/pbnxp9v1uCtVfhXVYTB5i9yAwQ6RGXnrYQ/I/KXHXZH48OQmsYo1fMaRFvP9OATK8PZ8nF/1rcIjJjOhfKAT+gk2k3c97k7MNEx4sUzoPcdP0pRY3AUzzc6xjhj11K96jMwfGPJQWkpAvGrR48dpnlbwuClYIj2GQ8gswtUCJgAWsV/LmQJjHzxKJWxhsttC7Hw1YGxwhZ/NFM6NKLkNr0b0RnzwXYzooQlvsU7+s3E8a10DliilHd/SoI/56fGzI9vB9++CVsA/ED/rW4P/nz/PD5J5HbqenbSIAAAAAElFTkSuQmCC', '00020101021226880014br.gov.bcb.pix2566qrcode.microcashif.com.br/pix/793c7eed-f1aa-4232-b3ac-c938e29f55ee5204000053039865802BR5925PAGSTAR SERVICOS DE PAGAM6009Sao Paulo62070503***63045799', 'processamento'),
(0, 'PIXSP368-2024JanFri100125', NULL, '10.00', 'deposito', '2024-01-19 10:50:29', 'iVBORw0KGgoAAAANSUhEUgAAAJ8AAACfAQMAAADd1ZmjAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAACUUlEQVRIieWWO47kIBCGCxGQ4Qsg+RpkXMl9AT8u4L4SGddA4gJ2RoC69me6Z3ZDatNBqOX+AlSPvx5Ev/lMzHtoCxGuioU5i6Alffr5jvrgRkbvJISh7ESr1xzLkfSziuGzalg1MVlT/gMeqW2VX54UyyHpZ3SryVPEx183ByHiefryc3+CPAj7Cbx7vIn7T0bH4MSFK1+emctu3CPJoA15SoRLnqb6sWcckpkv0jdDDA62XUKoUramPSLSwTuV3csg0nEZ+FLu2B6VNpZBoraa+eb58vMR82Jk0FLhmKlLkZ8w7KOQUaiSQxJX7xbKW9RnIBGkMJ9UXuS2xD2bUQZVzKiCu1ul4ZF9mzQMUUccaTF8VEfGfStkGJq8pa7GOyIpeDmLoGLEEIdfRp/EXEkEUT7WQwbQM8Oj6V2bw1DVclIjKkjlEdFDSAThwlRnaACqQAOxXgathy+ZDH7RTPjTvYehqm6qUBStIaseWBLBKc5HLS+DFuqs1+8qHoco4QndG7/JqdhWIVSRuwY8hhdawY+ShyHTir/c/UJCryCE+DDlqBCzPhAWn0UQjqB2VkLn54O/CkoCrceDmLxN9YBggpMITr2K8wMzyyObefUyCA1foSv57tmkR5VBxaidcn2JajFtCTJoe+uGGLqS78ScZLA7Vd0W+wTZUp9iItibNrdey4EejKTIIEbPEbEv9Z0BmrQkhOH9Tq9l1cdflkJsLIvnE4LEyuRJDJO+fNvYrVBjFELsiuj/qRGMMeVdR+Ow70uh9701tK1HRgZ/7/kDnvF5wuzGxD8AAAAASUVORK5CYII=', '00020101021226880014br.gov.bcb.pix2566qrcode.microcashif.com.br/pix/345fc222-93d4-43b0-8c44-bfa110e82dd65204000053039865802BR5925PAGSTAR SERVICOS DE PAGAM6009Sao Paulo62070503***630497F9', 'processamento'),
(0, 'PIXSP239-2024JanFri100157', 835, '20.00', 'deposito', '2024-01-19 10:51:01', 'iVBORw0KGgoAAAANSUhEUgAAAKsAAACrAQMAAAAjJv5aAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAACr0lEQVRIie2XsY3kMAxFaShQZjVgQG0oU0t2Ax5PA56WlKkNAW7AzhQI5n16vbvAXUTHJwwmeAI00if5ySH6v/5djvnD26eady4uUR/51OOezIfLlP1Cw2zNGUD0OG5r2Lj6I9Ecyhx4fYYtr9GstvW2jE/xEv0ScbxZY6FnmMwa2hi2JbSp4vvn8QoMvfHK389vGBRYVjAn+UUE+7qdGrvE7+wZq5qdCll/6nGXSpchNnXZQ/IZ8usxRV4svRKSSKRa4zDqcW/bxMNoeSF61e28L6jDRNCJlwiRtj3wkb/V0uDekqtXInOZ8Quh9HqMpPswH+nKHWR04F2POwGQvHSQijdm/wD3wb/ZH7U4ORtSbaceEzXHCB3EJpfbaNuoxz15yd+4HXmYEvQ2+wMcqWPDUljtVVuX+RHe3pmm1FwaxuA5t1mPHQ+EgEeEXayip23RYyI+I0RCaUploCZGPe6RdBHvM0uAhcNjvupSh8miFtssRoXE8dcd9TgWx2YRA8Y1UQrlAe4DM5wmIf6y8+I7aDoccRgCNUwV7Yh/e5oGu8owBnGIgB2/I3p6TLa5DIeAXRkpbrrdR4V74k/eDlhd3PC+MZRRj10dZvIyKeTWVQSNnuAs9XTCLzFuWBk9Vj2GRbmEg4euos8PqMvlCZZ+uAdcE8wcd+R1WE5NuBcayDCjzd7tSIfhVajsKZVX8ngr50J6LLZdr/SxBTa83mOLEsuRovqCsrYAZn+AGR1edJoSJCepUT12GDQs/NJIb8xoCN9FosHXDo7E/AWxUaC3cagwprA3YwLCMNhebL67qw7LjFxht9LhxfZu/1ZimZj4mkxlEz1/fYTf6GlSnYg8uuv2FJdJCgJ9Xtr+/gBjRpYLlgnhig0DCOnx9Q8GGmNsoSlD8p+gKfD/9ff6A84hdK7vc02eAAAAAElFTkSuQmCC', '00020101021226880014br.gov.bcb.pix2566qrcode.microcashif.com.br/pix/605bf5bb-cf0a-4103-8b73-fb1c48c6cf9b5204000053039865802BR5925PAGSTAR SERVICOS DE PAGAM6009Sao Paulo62070503***63041362', 'processamento'),
(0, 'PIXSP858-2024JanFri120144', 835, '60.00', 'deposito', '2024-01-19 12:47:48', 'iVBORw0KGgoAAAANSUhEUgAAAKsAAACrAQMAAAAjJv5aAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAACvklEQVRIie2XvY3kMAyFaShQZjcgQG0oU0ueBvzTgN2SMrUhQA3YmQLBvKfx7O3hLjk6XmOCwWdAQ1KPjxyin+ffZ2BeiHqn1pjmWHvPlxz3pPZAXbCHrpPmy4HIsc97MJOvQ1RcaHK8PcJrrK9oz9hejk/x5jIXy0VtPtEzjCyLurxaPB9OLX8k//8Y9cbZ35/vaxDgdrxjHLx4tfMdnRijzGdMvUex80Y4Ox9y3HEaol25dpw5pJntExwtc4J87tAmnS85Jg/JmN7bzdUOEgh1lGOcuseKPuiKWggx1l6OSadXpBkvi10LzfHOUoaHwGuoqNClEzK+6M5ShlHvju3JZvRmjvmMnyyFmPcCBdUXp0kr1H56gs0QW6WHlqJa+dagDA8hHxqdlE9WB7RcmnVJMZGZHC7K9FTnArP5aikJHhhn01AMudRrGukWowy/z4Yr5LUYFJ6LmR5g2C3OboA50MxfGpTgntDZMAa7+DoHmqhOckxwBWcX3RxrR3fCrp5gnE2vkBef3rOIDzlGN1wtUXgVbxqe97tJBJje/Q2vmkNC1eGdj7DdWoAVZvMqfJZEcgzhjA6jNd0/gmAXOe64dcDlkRxizIe7NSjDvTfv4YzoFGTY0+1VMkyt0nZnhZIv+PiPfEQY1941h0CR4Fhp9OqQY4AD5fGtITYyb2mLMaxuLnmPdg+JtBnKZ1mQYa1OzFU4Tds1cts7nmBIr5Ju/dRmtftcgwi3Jc4jOeSKWZ3gVdcDzFAx7wFrwu3fapHjAduTw0hkLINdyDvfNy/D7U2wb+EgQFTr44MiPLSZBi23FexwWG/zJcfYB9eAPsBESlNzu3uBEmKst82u4N/4ngau9AjvbF4Rc55XRm/R+AijSK+AlcHM8Coo6AFuO3L709CVfGDp1vaQ47YjEyOuvu3IqD1vcvzz/P38AiDEU29KALLJAAAAAElFTkSuQmCC', '00020101021226880014br.gov.bcb.pix2566qrcode.microcashif.com.br/pix/ba9994ae-ac53-4425-bbbb-3b997b60b1c05204000053039865802BR5925PAGSTAR SERVICOS DE PAGAM6009Sao Paulo62070503***63044ECB', 'processamento'),
(0, 'PIXSP676-2024JanFri130141', 835, '2.00', 'deposito', '2024-01-19 13:00:46', 'iVBORw0KGgoAAAANSUhEUgAAAKsAAACrAQMAAAAjJv5aAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAACsElEQVRIie2XsY3kMAxFaShQZjdgQG0oU0t2AzNyA3ZLytyGADUwmykQzPvc8e0e7pKj4hUGhvEMaCXy85NL9LP+XRPzHvhly1HdcdIY+NLjkcyRaEjt/X55PPU4lOMsW3UfiR4+PzzvnRhnNLtto81LL46WYyhczR4y9WEyO5WXL9G3teL5dXkFlnj78v37Iw3/j7GGE68uBoPn/p18BZ4SbwiVZ9zyYEjAXR244tEomC19Rh1n7MAsAR7SPFUXPW9pXnrwvCbknLdKz1ou66IeD1XkE0ObKlLHH+c781qcH9YwTmfxwtH34IlLJPeitngRIwL/6sC1TWceOK9cDsb2d6hUeDjNxiZSRsxQUhPTQ49H2x6+jcEdDA1mCm3UY4KEobuASOcBMkxm12PckgJsho/annJjjh34dNuZoaCpzot3fDbS45HaM0E+mSxKAVfMHXiqUtnH6ZiJAktp6vEY8uiRKAMtrxUh/+2DGow4iVnSp1HZefR51GORjJRUwe/CR+rBJC6FeDupKm/4vqUS21k0SPNT2hHq8i1kJYYrSNJQkfOKBpu+DqjA4hDSi2ZkHsV92bLrMeKEa4k9hIKXle+aV2GyyJgRLZ9tSu6oPRjVwMnBotBAnpxRE6MeDwk1zWjy5OHc0pqiHk8Qr8fejRAn+AT3YArYHtMTDggJmFe4L6/CwwmrgwbzkNyFuwbqwUxrFflEiwJ1r9s1lThJY4f1vlBPVtS0dGDsfRpO6LGob4JbkB4j3ogTZiiuImG0/UuP5UuiJcCr4Bblul1Th7FZtLSigaAVcPluuhos82CQiSPKbFtkNuzAQfb7nEzbQuLfexeOMnHAq5D5ttwOocYbY9xAo8Z3eN5bg0os/ze04cT8hdZatlSiHiPeR0KLxl9Ah0dna6Me/6y/1y/JblmTNVl1TwAAAABJRU5ErkJggg==', '00020101021226880014br.gov.bcb.pix2566qrcode.microcashif.com.br/pix/6534d148-c394-4642-adb3-0d9b9cf4264c5204000053039865802BR5925PAGSTAR SERVICOS DE PAGAM6009Sao Paulo62070503***6304421C', 'processamento'),
(0, 'PIXSP879-2024JanFri150126', 835, '20.00', 'deposito', '2024-01-19 15:16:30', 'iVBORw0KGgoAAAANSUhEUgAAAKsAAACrAQMAAAAjJv5aAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAACxUlEQVRIie2WP86jMBDFB7mgMxew5Gu485XIBYBcAK7kztew5AtA58Ji9jkkm9Vus0P9oShCv0iO5897M0Q/z7/PwLy4vBX1DPl0VXs+5ViTWinNQR2xdmxPByLHHgdX8nWIigtNjtdbeHHmEe0RzeTreBcjRC6Wi1p9onuY1MZp8mrxvDu1fIMXYOR7dfn7+ZZBgF+/EPW8eDOz0X8W/78x0nzEvCHZDJwXn3c57iKNpPbePrnOyFm8LijErDikR8hI81CQfrXI8RCM7uvomUvtYh1CJTnuYhPBHKEJnJo5VC3HQ0TL0BzsQvZZaI5mlGMiVB4tjEZOXbQnfSovwV2Lkh5sRo+E1QenUY51n5/FTGQAUEDc9LyBmyhbqja2O9mDE8kxKn/2eXf2KPn09REuXcrwwGkodaRKKF2B2fAux+RwNn7B7RJyNpK9gYeSupA05SMYuCbM5pTjjtHCaosAzIFm/gQvw0k7u5JFI29o6k/7iDD5psipRyfWCW7nLjXIsHZJ+zQ6uHjFPMHZ+w0MWTc9ZUS5uzTAruS4i0g2H8UMr6yfXu1yjFeOhNY70dEF30nLMUYijGrv0+t/7BEuNcgw1LD0NHmUC8LC7X6LRIChSwhiauqksU0ku9/BeYN/M8Yjso7xmCY5hvGPaBwYHjef2D9DQISpb8N58WhDi0Ze6RrRMoxJgpkG8CyJetMVXuRY97wVZKg10UoYs9d0lWHYLVyKmqTaHNBvmxHigOHc7oUOaqMJ4d7AWDeoonQwCUz7xb+nqwgPWL4IdYNX2RMbGddJjl8pt9wWFggdu08d5Rhb2FZMF9XqsLOo010OIcO6NW/bKxcHTSDWdy1luK23fPaIEu/wqitKMd4YojSYZk9uBRxv4ScWhGbAZi6MxV/fwJBCQPcx1ND8u3+fLcKvHRniVgc3ZXDJqxz/PH8/vwBh8FvQ+8p5cAAAAABJRU5ErkJggg==', '00020101021226880014br.gov.bcb.pix2566qrcode.microcashif.com.br/pix/48b93d53-8dfd-4b93-9ffb-9e7b363292fe5204000053039865802BR5925PAGSTAR SERVICOS DE PAGAM6009Sao Paulo62070503***630449BC', 'processamento');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `token_refer` text DEFAULT NULL,
  `nascimento` varchar(50) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `afiliado` varchar(255) DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `cep` text DEFAULT NULL,
  `chave_pix` text DEFAULT NULL,
  `data_cad` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `usuario`, `token_refer`, `nascimento`, `senha`, `cpf`, `telefone`, `email`, `afiliado`, `endereco`, `cep`, `chave_pix`, `data_cad`) VALUES
(835, 'Admin', NULL, 'af835McWDWRNn', NULL, '$2y$10$k5.tnAsJLNJ9dmxDptt5TuDDEIfG5N8zaFtCVLZqzsDOek4KvVV8m', NULL, NULL, 'contato@winner2.bet', 'af21Zd9OXRc', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `visita_site`
--

CREATE TABLE `visita_site` (
  `id` int(11) NOT NULL,
  `nav_os` text DEFAULT NULL,
  `mac_os` text DEFAULT NULL,
  `ip_visita` text DEFAULT NULL,
  `refer_visita` text DEFAULT NULL,
  `data_cad` date DEFAULT NULL,
  `hora_cad` time DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `pais` text DEFAULT NULL,
  `cidade` text DEFAULT NULL,
  `estado` text DEFAULT NULL,
  `ads_tipo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `visita_site`
--

INSERT INTO `visita_site` (`id`, `nav_os`, `mac_os`, `ip_visita`, `refer_visita`, `data_cad`, `hora_cad`, `id_user`, `pais`, `cidade`, `estado`, `ads_tipo`) VALUES
(46, 'Chrome', 'Windows 10', '46.183.221.197', 'https://brsbet.online/', '2023-12-18', '01:02:24', 1, 'Latvia', 'Riga', 'Riga', NULL),
(47, 'Unknown Browser', 'iPhone', '66.220.149.8', 'https://brsbet.online/?fbclid=IwAR1krR2a3yHT88rZHIigRZfmJ5Erbmg8okFvX4LcIAo-kNQDiIEVhOvypXM', '2023-12-18', '01:03:15', 1, 'United States', 'Menlo Park', 'California', NULL),
(48, 'Firefox', 'Linux', '113.30.153.7', 'https://brsbet.online/', '2023-12-18', '01:04:18', 1, 'United States', 'Jerusalem', 'Ohio', NULL),
(49, 'Handheld Browser', 'Android', '185.67.34.70', 'https://brsbet.online/', '2023-12-18', '01:04:31', 1, 'Turkey', 'Ankara', 'Ankara', NULL),
(50, 'Chrome', 'Mac OS X', '44.203.122.123', 'https://brsbet.online/', '2023-12-18', '01:06:03', 1, 'United States', 'Ashburn', 'Virginia', NULL),
(51, 'Chrome', 'Windows 7', '34.122.89.224', 'https://brsbet.online/', '2023-12-18', '01:09:20', 1, 'United States', 'Council Bluffs', 'Iowa', NULL),
(52, 'Chrome', 'Mac OS X', '104.164.173.99', 'https://brsbet.online/', '2023-12-18', '01:09:37', 1, 'United States', 'San Jose', 'California', NULL),
(53, 'Chrome', 'Linux', '154.28.229.116', 'https://brsbet.online/', '2023-12-18', '01:09:41', 1, 'United States', 'Charlotte', 'North Carolina', NULL),
(54, 'Firefox', 'Linux', '54.247.57.72', 'https://www.brsbet.online/', '2023-12-18', '01:14:06', 1, 'Ireland', 'Dublin', 'Leinster', NULL),
(55, 'Unknown Browser', 'Windows 10', '45.77.99.178', 'https://brsbet.online/', '2023-12-18', '01:15:05', 1, 'United States', 'Piscataway', 'New Jersey', NULL),
(56, 'Unknown Browser', 'Windows 10', '15.204.137.225', 'https://brsbet.online/', '2023-12-18', '01:15:06', 1, 'United States', 'Palo Alto', 'California', NULL),
(57, 'Safari', 'Mac OS X', '93.119.227.91', 'https://brsbet.online/', '2023-12-18', '01:17:16', 1, 'Romania', 'Suceava', 'Suceava', NULL),
(58, 'Chrome', 'Windows 7', '8.215.42.88', 'https://brsbet.online/', '2023-12-18', '01:17:34', 1, 'Indonesia', 'Jakarta', 'Jakarta', NULL),
(59, 'Chrome', 'Windows 10', '82.199.130.38', 'https://brsbet.online/', '2023-12-18', '01:52:04', 1, 'United Kingdom', 'Blackwall', 'England', NULL),
(60, 'Handheld Browser', 'iPhone', '128.90.61.22', 'https://brsbet.online/', '2023-12-18', '02:06:10', 1, 'United States', 'Austin', 'Texas', NULL),
(61, 'Handheld Browser', 'iPhone', '172.94.84.2', 'https://brsbet.online/', '2023-12-18', '02:06:10', 1, 'Spain', 'Madrid', 'Madrid', NULL),
(62, 'Handheld Browser', 'iPhone', '104.244.209.39', 'https://brsbet.online/', '2023-12-18', '02:06:11', 1, 'United States', 'Saline', 'Michigan', NULL),
(63, 'Chrome', 'Windows 10', '84.17.42.45', 'https://brsbet.online/', '2023-12-18', '02:06:13', 1, 'France', 'Paris', 'Ile-de-France', NULL),
(64, 'Unknown Browser', 'Android', '31.6.10.39', 'https://brsbet.online/', '2023-12-18', '02:07:06', 1, 'Egypt', 'Cairo', 'Cairo Governorate', NULL),
(65, 'Safari', 'Mac OS X', '165.231.253.254', 'https://brsbet.online/', '2023-12-18', '02:07:06', 1, 'India', 'Mumbai', 'Maharashtra', NULL),
(66, 'Handheld Browser', 'iPhone', '104.255.169.118', 'https://brsbet.online/', '2023-12-18', '02:07:06', 1, 'United States', 'Melbourne', 'Florida', NULL),
(67, 'Safari', 'Mac OS X', '128.90.104.55', 'https://brsbet.online/', '2023-12-18', '02:07:08', 1, 'Algeria', 'Algiers', 'Algiers Province', NULL),
(68, 'Handheld Browser', 'iPhone', '87.89.48.69', 'http://brsbet.online/', '2023-12-18', '02:07:52', 1, 'France', 'Roubaix', 'Hauts-de-France', NULL),
(69, 'Chrome', 'Mac OS X', '104.129.56.71', 'http://brsbet.online/', '2023-12-18', '02:07:54', 1, 'United States', 'Kent', 'Washington', NULL),
(70, 'Handheld Browser', 'Android', '133.242.174.119', 'https://www.brsbet.online/', '2023-12-18', '03:57:51', 1, 'Japan', 'Tokyo', 'Tokyo', NULL),
(71, 'Chrome', 'Windows 10', '96.9.249.36', 'https://brsbet.online/', '2023-12-18', '04:09:28', 1, 'United States', 'Buffalo', 'New York', NULL),
(72, 'Chrome', 'Windows 10', '46.228.199.158', 'https://brsbet.online/', '2023-12-18', '04:13:09', 1, 'Germany', 'Dusseldorf', 'Nordrhein-Westfalen', NULL),
(73, 'Chrome', 'Windows 10', '51.159.214.65', 'https://brsbet.online/', '2023-12-18', '06:33:40', 1, 'France', 'Paris', 'Ile-de-France', NULL),
(74, 'Handheld Browser', 'Android', '171.244.43.14', 'https://www.brsbet.online/', '2023-12-18', '07:43:47', 1, 'Vietnam', 'Hanoi', 'Hanoi', NULL),
(75, 'Chrome', 'Windows 10', '36.99.136.142', 'http://brsbet.online', '2023-12-18', '08:33:29', 1, 'China', 'Hangzhou', 'Zhejiang', NULL),
(76, 'Chrome', 'Windows 10', '2804:14d:be88:8a71:3850:daea:de11:eadb', 'https://mxvbet.xyz/', '2023-12-29', '13:27:35', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(77, 'Handheld Browser', 'iPhone', '43.128.68.127', 'http://www.mxvbet.xyz', '2023-12-29', '13:40:27', 1, 'Singapore', 'Singapore', '', NULL),
(78, 'Handheld Browser', 'iPhone', '2001:818:e8da:6900:a85b:47a8:edf4:4279', 'https://mxvbet.xyz/', '2023-12-29', '13:49:59', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(79, 'Firefox', 'Windows 10', '2804:29b8:5158:5fe:f533:b8d3:2740:864', 'https://mxvbet.xyz/', '2023-12-29', '13:54:20', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(80, 'Handheld Browser', 'iPhone', '170.106.82.193', 'http://mxvbet.xyz', '2023-12-29', '15:01:44', 1, 'United States', 'San Francisco', 'California', NULL),
(81, 'Chrome', 'Windows 10', '164.152.195.40', 'https://mxvbet.xyz/', '2023-12-29', '15:03:19', 1, 'Brazil', 'Praia Grande', 'Sao Paulo', NULL),
(82, 'Handheld Browser', 'Android', '23.111.114.116', 'https://mxvbet.xyz/', '2023-12-29', '15:39:40', 1, 'Russia', 'Moscow', 'Moscow', NULL),
(83, 'Chrome', 'Windows 10', '2804:14d:5880:9357:8976:d3ee:963b:14a', 'https://mxvbet.xyz/', '2023-12-29', '15:44:27', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(84, 'Handheld Browser', 'iPhone', '187.26.200.52', 'https://mxvbet.xyz/', '2023-12-29', '15:44:47', 1, 'Brazil', 'Maringa', 'Parana', NULL),
(85, 'Chrome', 'Mac OS X', '47.242.182.173', 'https://mxvbet.xyz/', '2023-12-29', '16:33:12', 1, 'Hong Kong', 'Hong Kong', 'Southern', NULL),
(86, 'Chrome', 'Mac OS X', '47.243.15.50', 'https://www.mxvbet.xyz/', '2023-12-29', '16:33:23', 1, 'Hong Kong', 'Hong Kong', 'Southern', NULL),
(87, 'Handheld Browser', 'iPhone', '179.211.190.83', 'https://mxvbet.xyz/', '2023-12-29', '16:38:05', 1, 'Brazil', 'Natal', 'Rio Grande do Norte', NULL),
(88, 'Handheld Browser', 'iPhone', '190.111.150.140', 'https://mxvbet.xyz/', '2023-12-29', '16:48:43', 1, 'Brazil', 'Planaltina', 'Goias', NULL),
(89, 'Chrome', 'Windows 10', '2804:7490:89ce:c900:7486:85c:38d:424', 'https://mxvbet.xyz/', '2023-12-29', '17:44:33', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(90, 'Chrome', 'Windows 10', '200.71.118.8', 'https://mxvbet.xyz/', '2023-12-29', '18:01:53', 1, 'Brazil', 'Bituruna', 'Parana', NULL),
(91, 'Handheld Browser', 'iPhone', '129.226.146.179', 'http://www.mxvbet.xyz', '2023-12-29', '18:01:55', 1, 'Singapore', 'Singapore', '', NULL),
(92, 'Handheld Browser', 'iPhone', '143.208.127.90', 'https://mxvbet.xyz/', '2023-12-29', '18:36:12', 1, 'Brazil', 'Presidente Prudente', 'Sao Paulo', NULL),
(93, 'Handheld Browser', 'iPhone', '2804:2af0:2dd:3700:6098:6ad2:39a8:761d', 'https://mxvbet.xyz/', '2023-12-29', '18:54:24', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(94, 'Handheld Browser', 'iPhone', '2a09:bac5:58c2:2c8::47:560', 'https://mxvbet.xyz/', '2023-12-29', '19:05:37', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(95, 'Chrome', 'Windows 10', '138.36.56.244', 'https://web.telegram.org/', '2023-12-29', '19:05:38', 1, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(96, 'Handheld Browser', 'iPhone', '143.208.113.108', 'https://mxvbet.xyz/', '2023-12-29', '19:37:10', 1, 'Brazil', 'Presidente Prudente', 'Sao Paulo', NULL),
(97, 'Chrome', 'Windows 10', '189.89.220.70', 'https://mxvbet.xyz/aovivo', '2023-12-29', '19:40:41', 1, 'Brazil', 'Lavras', 'Minas Gerais', NULL),
(98, 'Handheld Browser', 'iPhone', '179.241.15.43', 'https://mxvbet.xyz/', '2023-12-29', '20:09:21', 1, 'Brazil', 'Campinas', 'Sao Paulo', NULL),
(99, 'Handheld Browser', 'iPhone', '2804:14d:5880:8975:75d1:b6e4:d9d5:22a2', 'https://mxvbet.xyz/', '2023-12-29', '20:14:04', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(100, 'Handheld Browser', 'iPhone', '189.63.224.104', 'https://mxvbet.xyz/', '2023-12-29', '20:57:19', 1, 'Brazil', 'Ribeirao Preto', 'Sao Paulo', NULL),
(101, 'Handheld Browser', 'iPhone', '43.133.38.182', 'http://mxvbet.xyz', '2023-12-29', '21:02:35', 1, 'Singapore', 'Singapore', '', NULL),
(102, 'Handheld Browser', 'Android', '67.220.86.160', 'https://mxvbet.xyz/', '2023-12-29', '21:06:27', 1, 'United States', 'Phoenix', 'Arizona', NULL),
(103, 'Handheld Browser', 'Android', '2804:10f8:4287:e000:6856:daa6:65be:8f1a', 'https://mxvbet.xyz/', '2023-12-29', '21:08:14', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(104, 'Handheld Browser', 'Android', '2804:7d6c:44:7a00:9808:fddc:2244:e4d3', 'https://mxvbet.xyz/', '2023-12-29', '21:48:45', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(105, 'Handheld Browser', 'iPhone', '2804:14d:be88:8a71:f48a:4f4a:5a50:7b9c', 'https://mxvbet.xyz/', '2023-12-29', '21:48:56', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(106, 'Handheld Browser', 'Android', '66.249.66.208', 'https://www.mxvbet.xyz/', '2023-12-29', '22:13:54', 1, 'United States', 'Mountain View', 'California', NULL),
(107, 'Handheld Browser', 'iPhone', '43.134.37.211', 'http://www.mxvbet.xyz', '2023-12-29', '22:14:09', 1, 'Singapore', 'Singapore', '', NULL),
(108, 'Handheld Browser', 'Android', '66.249.66.206', 'https://www.mxvbet.xyz/', '2023-12-29', '22:14:21', 1, 'United States', 'Mountain View', 'California', NULL),
(109, 'Handheld Browser', 'iPhone', '43.159.129.209', 'http://www.mxvbet.xyz', '2023-12-29', '23:01:20', 1, 'United States', 'Santa Clara', 'California', NULL),
(110, 'Handheld Browser', 'Android', '192.141.114.252', 'https://mxvbet.xyz/', '2023-12-29', '23:12:20', 1, 'Brazil', 'Rio de Janeiro', 'Rio de Janeiro', NULL),
(111, 'Chrome', 'Windows 10', '179.253.245.145', 'https://mxvbet.xyz/', '2023-12-29', '23:38:46', 1, 'Brazil', 'Colombo', 'Parana', NULL),
(112, 'Chrome', 'Windows 10', '2804:14d:be88:8a71:3850:daea:de11:eadb', 'https://mxvbet.xyz/', '2023-12-30', '00:02:06', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(113, 'Handheld Browser', 'iPhone', '43.128.68.127', 'http://www.mxvbet.xyz', '2023-12-30', '00:09:53', 1, 'Singapore', 'Singapore', '', NULL),
(114, 'Handheld Browser', 'Android', '177.87.135.206', 'https://mxvbet.xyz/', '2023-12-30', '00:11:46', 1, 'Brazil', 'Porto Barra do Ivinheima', 'Mato Grosso do Sul', NULL),
(115, 'Chrome', 'Mac OS X', '2804:d6c:fff1:802e:b1fd:5774:f7c5:a2ae', 'https://mxvbet.xyz/', '2023-12-30', '00:13:00', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(116, 'Chrome', 'Windows 10', '200.71.118.8', 'https://mxvbet.xyz/', '2023-12-30', '00:18:14', 1, 'Brazil', 'Bituruna', 'Parana', NULL),
(117, 'Handheld Browser', 'iPhone', '2804:14d:be88:8a71:f48a:4f4a:5a50:7b9c', 'https://mxvbet.xyz/aovivo', '2023-12-30', '00:34:23', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(118, 'Handheld Browser', 'Android', '170.81.108.227', 'https://mxvbet.xyz/', '2023-12-30', '00:38:14', 1, 'Brazil', 'Vitoria da Conquista', 'Bahia', NULL),
(119, 'Chrome', 'Windows 10', '89.104.111.6', 'https://mxvbet.xyz/', '2023-12-30', '00:45:04', 1, 'Russia', 'Moscow', 'Moscow', NULL),
(120, 'Chrome', 'Windows 10', '186.236.196.151', 'https://mxvbet.xyz/', '2023-12-30', '01:33:47', 1, 'Brazil', 'Natal', 'Rio Grande do Norte', NULL),
(121, 'Handheld Browser', 'Android', '45.239.10.104', 'https://mxvbet.xyz/', '2023-12-30', '01:56:21', 1, 'Brazil', 'Aquiraz', 'Ceara', NULL),
(122, 'Handheld Browser', 'iPhone', '95.177.180.82', 'https://mxvbet.xyz/', '2023-12-30', '02:17:10', 1, 'Saudi Arabia', 'Riyadh', 'Ar Riyad', NULL),
(123, 'Handheld Browser', 'iPhone', '179.211.190.83', 'https://mxvbet.xyz/', '2023-12-30', '02:21:52', 1, 'Brazil', 'Natal', 'Rio Grande do Norte', NULL),
(124, 'Firefox', 'Windows 10', '2620:101:2002:11a4::1019', 'https://www.mxvbet.xyz/', '2023-12-30', '02:24:01', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(125, 'Handheld Browser', 'Android', '2804:18:7064:83d2:4fd:7fff:fe14:2528', 'https://mxvbet.xyz/', '2023-12-30', '04:05:22', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(126, 'Chrome', 'Windows 10', '89.104.111.22', 'https://mxvbet.xyz/', '2023-12-30', '04:44:29', 1, 'Russia', 'Moscow', 'Moscow', NULL),
(127, 'Firefox', 'Windows 10', '128.90.135.40', 'https://mxvbet.xyz/', '2023-12-30', '04:59:58', 1, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(128, 'Handheld Browser', 'Android', '2804:14d:1685:a2a0:7506:89bb:f519:5a81', 'https://mxvbet.xyz/', '2023-12-30', '05:58:56', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(129, 'Chrome', 'Windows 10', '82.147.84.193', 'https://mxvbet.xyz/', '2023-12-30', '06:21:56', 1, 'United States', 'Claymont', 'Delaware', NULL),
(130, 'Handheld Browser', 'Android', '191.57.14.173', 'https://mxvbet.xyz/', '2023-12-30', '08:31:19', 1, 'Brazil', 'Rio de Janeiro', 'Rio de Janeiro', NULL),
(131, 'Handheld Browser', 'Android', '66.249.64.108', 'https://www.mxvbet.xyz/aovivo', '2023-12-30', '08:54:57', 1, 'United States', 'Mountain View', 'California', NULL),
(132, 'Handheld Browser', 'iPhone', '43.130.37.62', 'http://www.mxvbet.xyz', '2023-12-30', '09:01:40', 1, 'United States', 'Santa Clara', 'California', NULL),
(133, 'Handheld Browser', 'Android', '66.249.64.110', 'https://www.mxvbet.xyz/termos-de-uso', '2023-12-30', '09:22:02', 1, 'United States', 'Mountain View', 'California', NULL),
(134, 'Handheld Browser', 'iPhone', '2804:d84:21af:ef00:c493:316d:4894:fb84', 'https://mxvbet.xyz/', '2023-12-30', '09:49:56', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(135, 'Chrome', 'Linux', '18.117.89.73', 'https://mxvbet.xyz/', '2023-12-30', '09:54:00', 1, 'United States', 'Columbus', 'Ohio', NULL),
(136, 'Chrome', 'Windows 7', '46.191.187.71', 'https://mxvbet.xyz/', '2023-12-30', '10:38:13', 1, 'Russia', 'Orenburg', 'Orenburg Oblast', NULL),
(137, 'Chrome', 'Linux', '54.187.62.104', 'https://mxvbet.xyz/', '2023-12-30', '11:25:23', 1, 'United States', 'Portland', 'Oregon', NULL),
(138, 'Chrome', 'Linux', '35.91.57.97', 'https://mxvbet.xyz/', '2023-12-30', '11:26:36', 1, 'United States', 'Portland', 'Oregon', NULL),
(139, 'Chrome', 'Linux', '54.190.64.231', 'https://mxvbet.xyz/', '2023-12-30', '11:26:41', 1, 'United States', 'Portland', 'Oregon', NULL),
(140, 'Chrome', 'Linux', '34.210.27.15', 'https://mxvbet.xyz/', '2023-12-30', '11:27:12', 1, 'United States', 'Portland', 'Oregon', NULL),
(141, 'Chrome', 'Linux', '35.90.5.166', 'http://mxvbet.xyz', '2023-12-30', '11:29:18', 1, 'United States', 'Portland', 'Oregon', NULL),
(142, 'Handheld Browser', 'iPhone', '143.208.127.90', 'https://mxvbet.xyz/aovivo', '2023-12-30', '11:36:25', 1, 'Brazil', 'Presidente Prudente', 'Sao Paulo', NULL),
(143, 'Handheld Browser', 'Android', '189.84.81.45', 'https://mxvbet.xyz/', '2023-12-30', '11:37:44', 1, 'Brazil', 'Marica', 'Rio de Janeiro', NULL),
(144, 'Handheld Browser', 'iPhone', '43.134.89.111', 'http://www.mxvbet.xyz', '2023-12-30', '12:03:56', 1, 'Singapore', 'Singapore', '', NULL),
(145, 'Chrome', 'Windows 10', '2400:6180:10:200::ee:d000', 'https://mxvbet.xyz/', '2023-12-30', '12:11:23', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(146, 'Firefox', 'Ubuntu', '185.144.76.217', 'https://mxvbet.xyz/', '2023-12-30', '13:03:28', 1, 'Turkey', 'Mersin', 'Mersin', NULL),
(147, 'Chrome', 'Windows 10', '168.0.190.211', 'https://mxvbet.xyz/', '2023-12-30', '13:05:39', 1, 'Brazil', 'Sousa', 'Paraiba', NULL),
(148, 'Handheld Browser', 'Android', '2804:214:82a0:5fce:c14:5ff:fe65:458d', 'https://mxvbet.xyz/', '2023-12-30', '13:12:41', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(149, 'Handheld Browser', 'iPhone', '2804:389:a285:6c89:2c:2a33:f3ef:3fa5', 'https://mxvbet.xyz/', '2023-12-30', '13:15:23', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(150, 'Chrome', 'Linux', '2804:30c:1b11:9f00:8f28:2ebc:691b:a22b', 'https://mxvbet.xyz/', '2023-12-30', '14:02:09', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(151, 'Handheld Browser', 'iPhone', '177.124.149.113', 'https://mxvbet.xyz/', '2023-12-30', '14:27:06', 1, 'Brazil', 'Garopaba', 'Santa Catarina', NULL),
(152, 'Unknown Browser', 'Windows 95', '54.235.17.232', 'https://mxvbet.xyz/', '2023-12-30', '14:49:20', 1, 'United States', 'Ashburn', 'Virginia', NULL),
(153, 'Handheld Browser', 'iPhone', '43.159.128.172', 'http://mxvbet.xyz', '2023-12-30', '15:01:34', 1, 'United States', 'Santa Clara', 'California', NULL),
(154, 'Handheld Browser', 'Android', '179.180.156.211', 'https://mxvbet.xyz/', '2023-12-30', '15:19:41', 1, 'Brazil', 'Recife', 'Pernambuco', NULL),
(155, 'Chrome', 'Windows 10', '181.233.26.136', 'https://mxvbet.xyz/', '2023-12-30', '15:23:02', 1, 'Peru', 'Lima', 'Lima region', NULL),
(156, 'Chrome', 'Windows 10', '2804:29b8:5119:783:2943:ea2:4cf5:b441', 'https://mxvbet.xyz/', '2023-12-30', '15:59:05', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(157, 'Chrome', 'Linux', '188.166.104.51', 'https://mxvbet.xyz/', '2023-12-30', '16:04:02', 1, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(158, 'Handheld Browser', 'iPhone', '2804:14d:be88:8a71:c48c:4625:3658:1dd7', 'https://mxvbet.xyz/', '2023-12-30', '16:05:13', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(159, 'Handheld Browser', 'Android', '2804:8aa4:330a:1e00:bf98:e84d:e0d1:47e4', 'https://mxvbet.xyz/', '2023-12-30', '16:23:28', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(160, 'Handheld Browser', 'Android', '2804:4df4:fffe:a630:83f:c19a:3eac:5fb7', 'https://mxvbet.xyz/', '2023-12-30', '16:31:56', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(161, 'Handheld Browser', 'Android', '45.226.117.91', 'android-app://ir.ilmili.telegraph/', '2023-12-30', '16:46:19', 1, 'Brazil', 'Sao Pedro da Aldeia', 'Rio de Janeiro', NULL),
(162, 'Handheld Browser', 'Android', '23.111.114.116', 'https://mxvbet.xyz/', '2023-12-30', '16:55:06', 1, 'Russia', 'Moscow', 'Moscow', NULL),
(163, 'Chrome', 'Windows 10', '2804:d45:9b46:8800:f08d:e189:6337:788c', 'https://mxvbet.xyz/', '2023-12-30', '17:18:46', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(164, 'Handheld Browser', 'Android', '179.97.29.133', 'https://mxvbet.xyz/', '2023-12-30', '17:36:52', 1, 'Brazil', 'Nova Iguacu', 'Rio de Janeiro', NULL),
(165, 'Chrome', 'Windows 10', '2804:14d:be88:8a71:55b9:93f9:7812:f45d', 'https://mxvbet.xyz/', '2023-12-30', '17:47:39', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(166, 'Handheld Browser', 'iPhone', '43.159.141.180', 'http://www.mxvbet.xyz', '2023-12-30', '18:02:19', 1, 'United States', 'Santa Clara', 'California', NULL),
(167, 'Chrome', 'Mac OS X', '2a02:4780:13::2d', 'https://mxvbet.xyz/', '2023-12-30', '18:06:12', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(168, 'Chrome', 'Windows 10', '2804:14d:be88:8a71:d034:b4a8:fa9f:6d42', 'https://lafortuna.bet/', '2024-01-03', '16:24:11', 1, 'Unknown', 'Unknown', 'Unknown', NULL),
(169, 'Firefox', 'Linux', '45.61.122.28', 'https://lafortuna.bet/', '2024-01-03', '16:29:53', 1, 'United States', 'Dallas', 'Texas', NULL),
(170, 'Handheld Browser', 'Android', '177.51.112.154', 'https://seusistemabet.com/', '2024-01-04', '03:59:33', 0, 'Brazil', 'Maringa', 'Parana', NULL),
(171, 'Chrome', 'Windows 10', '178.33.144.176', 'https://seusistemabet.com/', '2024-01-04', '04:02:16', 0, 'France', 'Roubaix', 'Hauts-de-France', NULL),
(172, 'Handheld Browser', 'Android', '179.109.43.97', 'https://seusistemabet.com/', '2024-01-04', '04:11:42', 0, 'Brazil', 'Fazenda Rio Grande', 'Parana', NULL),
(173, 'Firefox', 'Linux', '104.223.175.198', 'https://seusistemabet.com/', '2024-01-04', '04:30:21', 0, 'United States', 'Los Angeles', 'California', NULL),
(174, 'Chrome', 'Linux', '35.203.242.194', 'https://seusistemabet.com/', '2024-01-04', '04:30:33', 0, 'United States', 'Mountain View', 'California', NULL),
(175, 'Firefox', 'Linux', '34.248.137.227', 'https://mail.seusistemabet.com/', '2024-01-04', '04:41:25', 0, 'Ireland', 'Dublin', 'Leinster', NULL),
(176, 'Chrome', 'Windows 10', '217.138.196.106', 'https://seusistemabet.com/', '2024-01-04', '04:55:29', 0, 'United Kingdom', 'Manchester', 'England', NULL),
(177, 'Handheld Browser', 'iPhone', '179.96.164.188', 'https://seusistemabet.com/', '2024-01-04', '05:51:07', 0, 'Brazil', 'Duque de Caxias', 'Rio de Janeiro', NULL),
(178, 'Handheld Browser', 'Android', '200.71.118.8', 'https://seusistemabet.com/', '2024-01-04', '07:09:59', 0, 'Brazil', 'Bituruna', 'Parana', NULL),
(179, 'Chrome', 'Mac OS X', '54.92.107.92', 'https://mail.seusistemabet.com/', '2024-01-04', '07:44:12', 0, 'Japan', 'Tokyo', 'Tokyo', NULL),
(180, 'Chrome', 'Linux', '199.244.88.219', 'http://seusistemabet.com', '2024-01-04', '08:00:30', 0, 'United States', 'Troy', 'Ohio', NULL),
(181, 'Chrome', 'Windows 10', '51.79.160.196', 'https://seusistemabet.com/', '2024-01-04', '09:51:19', 0, 'Singapore', 'Singapore', '', NULL),
(182, 'Chrome', 'Windows 7', '52.26.92.7', 'http://seusistemabet.com', '2024-01-04', '10:30:24', 0, 'United States', 'Portland', 'Oregon', NULL),
(183, 'Chrome', 'Windows 7', '189.193.65.67', 'http://seusistemabet.com', '2024-01-04', '10:30:29', 0, 'Mexico', 'Queretaro City', 'Queretaro', NULL),
(184, 'Chrome', 'Linux', '52.87.44.246', 'https://seusistemabet.com/', '2024-01-04', '10:47:01', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(185, 'Chrome', 'Mac OS X', '54.213.144.212', 'https://seusistemabet.com/', '2024-01-04', '11:35:21', 0, 'United States', 'Portland', 'Oregon', NULL),
(186, 'Chrome', 'Windows 10', '62.210.90.209', 'https://seusistemabet.com/', '2024-01-04', '12:53:25', 0, 'France', 'Paris', 'Ile-de-France', NULL),
(187, 'Handheld Browser', 'Android', '177.87.135.202', 'https://seusistemabet.com/aovivo', '2024-01-04', '13:05:31', 0, 'Brazil', 'Porto Barra do Ivinheima', 'Mato Grosso do Sul', NULL),
(188, 'Firefox', 'Mac OS X', '208.115.223.66', 'https://seusistemabet.com/', '2024-01-04', '13:08:08', 0, 'United States', 'New York', 'New York', NULL),
(189, 'Unknown Browser', 'Windows 10', '45.33.24.128', 'https://seusistemabet.com/', '2024-01-04', '13:08:09', 0, 'United States', 'Richardson', 'Texas', NULL),
(190, 'Chrome', 'Linux', '157.119.232.164', 'https://seusistemabet.com/', '2024-01-04', '13:29:54', 0, 'Hong Kong', 'Hong Kong', 'Southern', NULL),
(191, 'Handheld Browser', 'Android', '187.19.252.202', 'https://seusistemabet.com/', '2024-01-04', '13:37:54', 0, 'Brazil', 'Patos', 'Paraiba', NULL),
(192, 'Handheld Browser', 'Android', '177.69.110.228', 'https://www.google.com/', '2024-01-04', '13:38:00', 0, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(193, 'Handheld Browser', 'Android', '186.204.56.11', 'https://seusistemabet.com/', '2024-01-04', '14:26:28', 0, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(194, 'Chrome', 'Linux', '154.28.229.202', 'https://seusistemabet.com/', '2024-01-04', '15:33:34', 0, 'United States', 'Charlotte', 'North Carolina', NULL),
(195, 'Chrome', 'Windows 10', '104.164.173.110', 'https://mail.seusistemabet.com/', '2024-01-04', '15:33:35', 0, 'United States', 'San Jose', 'California', NULL),
(196, 'Chrome', 'Linux', '154.28.229.105', 'https://mail.seusistemabet.com/', '2024-01-04', '15:33:37', 0, 'United States', 'Charlotte', 'North Carolina', NULL),
(197, 'Chrome', 'Mac OS X', '104.164.173.82', 'https://seusistemabet.com/', '2024-01-04', '15:33:37', 0, 'United States', 'San Jose', 'California', NULL),
(198, 'Handheld Browser', 'Android', '200.153.161.180', 'https://seusistemabet.com/', '2024-01-04', '16:39:39', 0, 'Brazil', 'Guarulhos', 'Sao Paulo', NULL),
(199, 'Handheld Browser', 'Android', '177.51.113.186', 'https://seusistemabet.com/', '2024-01-04', '17:02:48', 0, 'Brazil', 'Maringa', 'Parana', NULL),
(200, 'Handheld Browser', 'iPad', '54.233.239.67', 'https://seusistemabet.com/', '2024-01-04', '19:05:16', 0, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(201, 'Handheld Browser', 'iPad', '45.87.9.28', 'https://www.seusistemabet.com/', '2024-01-04', '19:05:16', 0, 'United States', 'Sterling', 'Virginia', NULL),
(202, 'Handheld Browser', 'iPhone', '15.229.32.38', 'https://seusistemabet.com/', '2024-01-04', '19:31:51', 0, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(203, 'Handheld Browser', 'iPhone', '15.229.215.120', 'https://www.seusistemabet.com/', '2024-01-04', '19:31:51', 0, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(204, 'Handheld Browser', 'Android', '172.58.5.15', 'https://www.google.com/', '2024-01-04', '19:44:08', 0, 'United States', 'Atlanta', 'Georgia', NULL),
(205, 'Chrome', 'Windows 10', '170.239.53.1', 'https://seusistemabet.com/', '2024-01-04', '19:53:15', 0, 'Brazil', 'Presidente Prudente', 'Sao Paulo', NULL),
(206, 'Chrome', 'Windows 8', '35.223.180.38', 'https://seusistemabet.com/', '2024-01-04', '20:15:02', 0, 'United States', 'Council Bluffs', 'Iowa', NULL),
(207, 'Chrome', 'Mac OS X', '209.127.253.62', 'https://seusistemabet.com/', '2024-01-04', '22:06:51', 0, 'United States', 'Piscataway', 'New Jersey', NULL),
(208, 'Chrome', 'Linux', '209.127.106.172', 'https://seusistemabet.com/', '2024-01-04', '22:58:28', 0, 'United States', 'Piscataway', 'New Jersey', NULL),
(209, 'Chrome', 'Linux', '157.230.222.28', 'https://www.seusistemabet.com/', '2024-01-04', '23:10:40', 0, 'United States', 'North Bergen', 'New Jersey', NULL),
(210, 'Handheld Browser', 'iPhone', '128.90.104.79', 'https://seusistemabet.com/', '2024-01-05', '00:56:16', 0, 'Algeria', 'Algiers', 'Algiers Province', NULL),
(211, 'Handheld Browser', 'iPhone', '149.40.50.72', 'https://seusistemabet.com/', '2024-01-05', '00:56:16', 0, 'United States', 'Washington D.C.', 'District of Columbia', NULL),
(212, 'Chrome', 'Mac OS X', '146.70.107.22', 'https://seusistemabet.com/', '2024-01-05', '00:56:18', 0, 'Germany', 'Frankfurt am Main', 'Hessen', NULL),
(213, 'Handheld Browser', 'iPhone', '37.120.149.61', 'https://seusistemabet.com/', '2024-01-05', '00:56:18', 0, 'Norway', 'Oslo', 'Oslo', NULL),
(214, 'Chrome', 'Windows 10', '34.219.36.174', 'https://seusistemabet.com/', '2024-01-05', '01:02:06', 0, 'United States', 'Portland', 'Oregon', NULL),
(215, 'Handheld Browser', 'iPhone', '13.38.60.206', 'https://seusistemabet.com/', '2024-01-05', '01:04:07', 0, 'France', 'Paris', 'Ile-de-France', NULL),
(216, 'Handheld Browser', 'Android', '177.87.135.202', 'https://seusistemabet.com/', '2024-01-05', '01:52:06', 0, 'Brazil', 'Porto Barra do Ivinheima', 'Mato Grosso do Sul', NULL),
(217, 'Chrome', 'Windows 10', '179.109.43.97', 'https://seusistemabet.com/', '2024-01-05', '02:25:39', 0, 'Brazil', 'Fazenda Rio Grande', 'Parana', NULL),
(218, 'Chrome', 'Linux', '52.88.90.8', 'https://seusistemabet.com/', '2024-01-05', '02:27:29', 0, 'United States', 'Portland', 'Oregon', NULL),
(219, 'Chrome', 'Linux', '35.86.84.41', 'https://seusistemabet.com/', '2024-01-05', '02:27:50', 0, 'United States', 'Portland', 'Oregon', NULL),
(220, 'Handheld Browser', 'iPhone', '128.90.104.51', 'https://seusistemabet.com/', '2024-01-05', '03:11:57', 0, 'Algeria', 'Algiers', 'Algiers Province', NULL),
(221, 'Chrome', 'Mac OS X', '23.82.137.75', 'https://seusistemabet.com/', '2024-01-05', '03:11:57', 0, 'United States', 'Bunnell', 'Florida', NULL),
(222, 'Handheld Browser', 'iPhone', '146.70.107.26', 'https://seusistemabet.com/', '2024-01-05', '03:12:02', 0, 'Germany', 'Frankfurt am Main', 'Hessen', NULL),
(223, 'Chrome', 'Linux', '207.244.124.121', 'http://seusistemabet.com/', '2024-01-05', '03:12:47', 0, 'United States', 'Manassas', 'Virginia', NULL),
(224, 'Handheld Browser', 'iPhone', '51.75.141.254', 'http://seusistemabet.com/', '2024-01-05', '03:12:48', 0, 'France', 'Roubaix', 'Hauts-de-France', NULL),
(225, 'Handheld Browser', 'iPhone', '185.253.96.40', 'http://seusistemabet.com/', '2024-01-05', '03:12:48', 0, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(226, 'Chrome', 'Windows 10', '31.6.10.131', 'http://seusistemabet.com/', '2024-01-05', '03:12:51', 0, 'Egypt', 'Cairo', 'Cairo Governorate', NULL),
(227, 'Chrome', 'Windows 10', '139.99.237.35', 'https://seusistemabet.com/', '2024-01-05', '04:48:02', 0, 'Australia', 'Sydney', 'New South Wales', NULL),
(228, 'Firefox', 'Windows 10', '135.148.195.14', 'https://seusistemabet.com/', '2024-01-05', '05:57:39', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(229, 'Chrome', 'Linux', '35.91.246.227', 'https://seusistemabet.com/', '2024-01-05', '06:11:50', 0, 'United States', 'Portland', 'Oregon', NULL),
(230, 'Chrome', 'Linux', '34.212.172.152', 'https://seusistemabet.com/', '2024-01-05', '06:11:57', 0, 'United States', 'Portland', 'Oregon', NULL),
(231, 'Chrome', 'Linux', '54.149.135.121', 'https://seusistemabet.com/', '2024-01-05', '06:16:51', 0, 'United States', 'Portland', 'Oregon', NULL),
(232, 'Chrome', 'Linux', '3.12.165.206', 'https://seusistemabet.com/', '2024-01-05', '06:20:44', 0, 'United States', 'Columbus', 'Ohio', NULL),
(233, 'Chrome', 'Windows 10', '176.53.218.244', 'https://seusistemabet.com/', '2024-01-05', '06:46:31', 0, 'Russia', 'Moscow', 'Moscow', NULL),
(234, 'Handheld Browser', 'iPhone', '43.128.68.127', 'http://seusistemabet.com', '2024-01-05', '07:17:14', 0, 'Singapore', 'Singapore', '', NULL),
(235, 'Handheld Browser', 'Android', '177.51.115.112', 'https://seusistemabet.com/', '2024-01-05', '07:26:54', 0, 'Brazil', 'Maringa', 'Parana', NULL),
(236, 'Handheld Browser', 'iPhone', '168.151.114.79', 'https://seusistemabet.com/', '2024-01-05', '08:02:12', 0, 'United States', 'New York', 'New York', NULL),
(237, 'Chrome', 'Windows Server 2003/XP x64', '159.203.118.28', 'https://seusistemabet.com/', '2024-01-05', '08:21:35', 0, 'United States', 'Clifton', 'New Jersey', NULL),
(238, 'Chrome', 'Windows 10', '178.254.29.124', 'https://seusistemabet.com/', '2024-01-05', '09:21:54', 0, 'Germany', 'Berlin', 'Berlin', NULL),
(239, 'Handheld Browser', 'Android', '177.51.114.98', 'https://seusistemabet.com/', '2024-01-05', '10:16:18', 0, 'Brazil', 'Maringa', 'Parana', NULL),
(240, 'Chrome', 'Windows 10', '45.226.200.251', 'https://seusistemabet.com/', '2024-01-05', '10:35:27', 0, 'Brazil', 'Bezerros', 'Pernambuco', NULL),
(241, 'Chrome', 'Windows 10', '200.71.118.8', 'https://seusistemabet.com/', '2024-01-05', '10:35:35', 0, 'Brazil', 'Bituruna', 'Parana', NULL),
(242, 'Handheld Browser', 'iPhone', '177.73.94.1', 'https://seusistemabet.com/', '2024-01-05', '10:37:10', 0, 'Brazil', 'Afogados da Ingazeira', 'Pernambuco', NULL),
(243, 'Chrome', 'Windows 10', '200.236.198.181', 'https://seusistemabet.com/', '2024-01-05', '10:39:17', 0, 'Brazil', 'Jaguariuna', 'Sao Paulo', NULL),
(244, 'Handheld Browser', 'iPad', '45.87.9.45', 'https://www.seusistemabet.com/', '2024-01-05', '12:08:31', 0, 'United States', 'Sterling', 'Virginia', NULL),
(245, 'Handheld Browser', 'iPad', '54.233.239.67', 'https://seusistemabet.com/', '2024-01-05', '12:08:31', 0, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(246, 'Handheld Browser', 'iPhone', '3.79.47.81', 'https://seusistemabet.com/', '2024-01-05', '12:34:57', 0, 'Germany', 'Frankfurt am Main', 'Hessen', NULL),
(247, 'Chrome', 'Linux', '195.78.54.252', 'https://seusistemabet.com/', '2024-01-05', '12:34:59', 0, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(248, 'Chrome', 'Windows 10', '172.94.84.2', 'https://seusistemabet.com/', '2024-01-05', '12:35:01', 0, 'Spain', 'Madrid', 'Madrid', NULL),
(249, 'Handheld Browser', 'iPhone', '87.89.48.69', 'http://seusistemabet.com/', '2024-01-05', '12:36:08', 0, 'France', 'Roubaix', 'Hauts-de-France', NULL),
(250, 'Handheld Browser', 'iPhone', '167.88.60.234', 'http://seusistemabet.com/', '2024-01-05', '12:36:09', 0, 'United States', 'Santa Clara', 'California', NULL),
(251, 'Chrome', 'Windows 10', '197.242.159.110', 'http://seusistemabet.com/', '2024-01-05', '12:36:11', 0, 'South Africa', 'Sandton', 'Gauteng', NULL),
(252, 'Handheld Browser', 'Android', '209.146.124.179', 'https://seusistemabet.com/', '2024-01-05', '12:44:02', 0, 'Hong Kong', 'Hong Kong', 'Southern', NULL),
(253, 'Handheld Browser', 'Android', '177.51.116.156', 'https://seusistemabet.com/', '2024-01-05', '13:01:34', 0, 'Brazil', 'Maringa', 'Parana', NULL),
(254, 'Chrome', 'Windows 10', '170.239.53.1', 'https://seusistemabet.com/', '2024-01-05', '14:15:53', 0, 'Brazil', 'Presidente Prudente', 'Sao Paulo', NULL),
(255, 'Chrome', 'Windows 10', '217.114.218.21', 'https://seusistemabet.com/', '2024-01-05', '14:16:12', 0, 'Germany', 'Erfurt', 'Thuringen', NULL),
(256, 'Handheld Browser', 'Android', '189.28.157.164', 'https://seusistemabet.com/', '2024-01-05', '14:16:14', 0, 'Brazil', 'Poa', 'Sao Paulo', NULL),
(257, 'Handheld Browser', 'Android', '39.108.48.119', 'https://seusistemabet.com/', '2024-01-05', '14:16:45', 0, 'China', 'Shenzhen', 'Guangdong', NULL),
(258, 'Handheld Browser', 'iPhone', '18.196.46.141', 'https://seusistemabet.com/', '2024-01-05', '14:17:20', 0, 'Germany', 'Frankfurt am Main', 'Hessen', NULL),
(259, 'Chrome', 'Windows 7', '212.143.94.254', 'https://www.google.ie/', '2024-01-05', '14:17:38', 0, 'Israel', 'Haifa', 'Haifa District', NULL),
(260, 'Chrome', 'Windows 10', '47.44.191.122', 'https://seusistemabet.com/', '2024-01-05', '14:18:23', 0, 'United States', 'Roseburg', 'Oregon', NULL),
(261, 'Chrome', 'Windows 10', '184.103.79.28', 'https://seusistemabet.com/', '2024-01-05', '14:18:31', 0, 'United States', 'Maricopa', 'Arizona', NULL),
(262, 'Chrome', 'Linux', '102.129.153.152', 'http://seusistemabet.com/', '2024-01-05', '14:18:44', 0, 'United States', 'Titusville', 'Florida', NULL),
(263, 'Chrome', 'Linux', '31.6.10.183', 'http://seusistemabet.com/', '2024-01-05', '14:18:44', 0, 'Egypt', 'Cairo', 'Cairo Governorate', NULL),
(264, 'Handheld Browser', 'iPhone', '216.24.213.36', 'http://seusistemabet.com/', '2024-01-05', '14:18:45', 0, 'Germany', 'Frankfurt am Main', 'Hessen', NULL),
(265, 'Edge', 'Windows 10', '156.67.218.94', 'https://seusistemabet.com/', '2024-01-05', '14:31:25', 0, 'Singapore', 'Singapore', '', NULL),
(266, 'Handheld Browser', 'iPhone', '104.168.34.156', 'https://seusistemabet.com/', '2024-01-05', '14:32:55', 0, 'Canada', 'Richmond Hill', 'Ontario', NULL),
(267, 'Handheld Browser', 'iPhone', '172.94.84.4', 'https://seusistemabet.com/', '2024-01-05', '14:32:55', 0, 'Spain', 'Madrid', 'Madrid', NULL),
(268, 'Handheld Browser', 'iPhone', '104.152.222.43', 'https://seusistemabet.com/', '2024-01-05', '14:32:56', 0, 'United States', 'Bend', 'Oregon', NULL),
(269, 'Chrome', 'Linux', '103.27.227.152', 'https://seusistemabet.com/', '2024-01-05', '14:32:57', 0, 'New Zealand', 'Auckland', 'Auckland', NULL),
(270, 'Chrome', 'Linux', '103.1.212.247', 'https://seusistemabet.com/', '2024-01-05', '14:32:57', 0, 'Australia', 'Sydney', 'New South Wales', NULL),
(271, 'Handheld Browser', 'iPhone', '106.161.65.206', 'https://seusistemabet.com/', '2024-01-05', '14:33:02', 0, 'Japan', 'Fuchu', 'Tokyo', NULL),
(272, 'Handheld Browser', 'iPhone', '103.108.94.169', 'https://seusistemabet.com/', '2024-01-05', '14:33:04', 0, 'New Zealand', 'Auckland', 'Auckland', NULL),
(273, 'Chrome', 'Linux', '45.74.55.7', 'https://seusistemabet.com/', '2024-01-05', '14:35:05', 0, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(274, 'Chrome', 'Linux', '172.111.183.7', 'https://seusistemabet.com/', '2024-01-05', '14:36:11', 0, 'United States', 'New York', 'New York', NULL),
(275, 'Handheld Browser', 'iPhone', '31.6.10.243', 'https://seusistemabet.com/popular', '2024-01-05', '14:47:47', 0, 'Egypt', 'Cairo', 'Cairo Governorate', NULL),
(276, 'Chrome', 'Mac OS X', '192.158.226.17', 'https://seusistemabet.com/indique', '2024-01-05', '14:47:47', 0, 'United States', 'Charlotte', 'North Carolina', NULL),
(277, 'Chrome', 'Mac OS X', '128.90.104.198', 'https://seusistemabet.com/cassino', '2024-01-05', '14:47:47', 0, 'Algeria', 'Algiers', 'Algiers Province', NULL),
(278, 'Chrome', 'Linux', '103.108.94.173', 'https://seusistemabet.com/cassino', '2024-01-05', '14:47:49', 0, 'New Zealand', 'Auckland', 'Auckland', NULL),
(279, 'Chrome', 'Linux', '179.61.228.101', 'https://seusistemabet.com/popular', '2024-01-05', '14:47:49', 0, 'Australia', 'Perth', 'Western Australia', NULL),
(280, 'Handheld Browser', 'iPhone', '179.61.240.60', 'https://seusistemabet.com/indique', '2024-01-05', '14:47:49', 0, 'New Zealand', 'Auckland', 'Auckland', NULL),
(281, 'Handheld Browser', 'iPhone', '103.108.92.94', 'https://seusistemabet.com/cassino', '2024-01-05', '14:47:50', 0, 'Australia', 'Adelaide', 'South Australia', NULL),
(282, 'Handheld Browser', 'Android', '177.87.135.236', 'https://seusistemabet.com/', '2024-01-05', '16:45:34', 0, 'Brazil', 'Porto Barra do Ivinheima', 'Mato Grosso do Sul', NULL),
(283, 'Firefox', 'Linux', '45.153.216.71', 'https://seusistemabet.com/', '2024-01-05', '16:57:39', 0, 'Seychelles', 'Victoria', 'English River', NULL),
(284, 'Safari', 'Mac OS X', '3.94.145.85', 'https://seusistemabet.com/', '2024-01-05', '17:41:38', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(285, 'Chrome', 'Mac OS X', '184.72.244.125', 'https://seusistemabet.com/', '2024-01-05', '17:41:41', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(286, 'Firefox', 'Mac OS X', '3.231.210.46', 'https://seusistemabet.com/', '2024-01-05', '17:41:57', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(287, 'Chrome', 'Windows 10', '176.53.223.85', 'https://seusistemabet.com/', '2024-01-05', '17:56:10', 0, 'Russia', 'Moscow', 'Moscow', NULL),
(288, 'Handheld Browser', 'Android', '186.204.56.11', 'https://seusistemabet.com/', '2024-01-05', '18:41:09', 0, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(289, 'Handheld Browser', 'Android', '167.249.25.132', 'https://seusistemabet.com/', '2024-01-05', '18:41:57', 0, 'Brazil', 'Cananeia', 'Sao Paulo', NULL),
(290, 'Chrome', 'Mac OS X', '44.234.19.83', 'https://seusistemabet.com/', '2024-01-05', '19:28:17', 0, 'United States', 'Portland', 'Oregon', NULL),
(291, 'Chrome', 'Windows 7', '20.172.154.149', 'https://seusistemabet.com/', '2024-01-05', '19:29:43', 0, 'United States', 'Washington', 'Virginia', NULL),
(292, 'Chrome', 'Windows 10', '45.90.61.4', 'https://seusistemabet.com/', '2024-01-05', '19:55:51', 0, 'Russia', 'Moscow', 'Moscow', NULL),
(293, 'Chrome', 'Windows 10', '123.60.68.42', 'https://www.seusistemabet.com/', '2024-01-05', '20:21:37', 0, 'China', 'Shanghai', 'Shanghai Municipality', NULL),
(294, 'Chrome', 'Windows 10', '194.114.136.24', 'https://www.demo.seusistemabet.com/', '2024-01-05', '22:49:46', 0, 'Netherlands', 'Duivendrecht', 'Noord-Holland', NULL),
(295, 'Firefox', 'Linux', '52.16.245.145', 'https://demo.seusistemabet.com/', '2024-01-05', '22:58:12', 0, 'Ireland', 'Dublin', 'Leinster', NULL),
(296, 'Chrome', 'Mac OS X', '35.170.40.121', 'https://seusistemabet.com/', '2024-01-06', '00:22:51', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(297, 'Handheld Browser', 'Android', '177.87.135.236', 'https://seusistemabet.com/', '2024-01-06', '00:29:53', 0, 'Brazil', 'Porto Barra do Ivinheima', 'Mato Grosso do Sul', NULL),
(298, 'Chrome', 'Windows 10', '104.164.173.204', 'https://seusistemabet.com/', '2024-01-06', '00:43:01', 0, 'United States', 'San Jose', 'California', NULL),
(299, 'Chrome', 'Mac OS X', '104.164.173.46', 'https://mail.seusistemabet.com/', '2024-01-06', '00:43:01', 0, 'United States', 'San Jose', 'California', NULL),
(300, 'Chrome', 'Linux', '104.164.173.201', 'https://seusistemabet.com/', '2024-01-06', '00:43:04', 0, 'United States', 'San Jose', 'California', NULL),
(301, 'Chrome', 'Mac OS X', '104.164.173.249', 'https://mail.seusistemabet.com/', '2024-01-06', '00:43:04', 0, 'United States', 'San Jose', 'California', NULL),
(302, 'Chrome', 'Windows 10', '43.225.189.147', 'https://seusistemabet.com/', '2024-01-06', '00:44:04', 0, 'United States', 'Boston', 'Massachusetts', NULL),
(303, 'Chrome', 'Windows 10', '198.54.131.102', 'https://seusistemabet.com/', '2024-01-06', '00:46:41', 0, 'United States', 'Seattle', 'Washington', NULL),
(304, 'Chrome', 'Linux', '177.87.135.253', 'https://winner2.bet/', '2024-01-10', '15:47:19', 0, 'Brazil', 'Porto Barra do Ivinheima', 'Mato Grosso do Sul', NULL),
(305, 'Chrome', 'Windows 10', '170.239.52.73', 'https://winner2.bet/', '2024-01-10', '16:04:56', 0, 'Brazil', 'Presidente Prudente', 'Sao Paulo', NULL),
(306, 'Handheld Browser', 'Android', '200.71.118.8', 'https://winner2.bet/', '2024-01-10', '16:14:53', 0, 'Brazil', 'Bituruna', 'Parana', NULL),
(307, 'Handheld Browser', 'Android', '168.232.160.31', 'https://winner2.bet/', '2024-01-10', '16:29:04', 0, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(308, 'Handheld Browser', 'Android', '38.50.156.11', 'https://winner2.bet/', '2024-01-10', '16:32:03', 0, 'Brazil', 'Goiania', 'Goias', NULL),
(309, 'Handheld Browser', 'Android', '187.24.244.229', 'https://winner2.bet/', '2024-01-10', '16:39:58', 0, 'Brazil', 'Belem', 'Para', NULL),
(310, 'Handheld Browser', 'iPhone', '179.96.164.252', 'https://winner2.bet/', '2024-01-10', '17:01:47', 0, 'Brazil', 'Duque de Caxias', 'Rio de Janeiro', NULL),
(311, 'Handheld Browser', 'Android', '45.187.163.39', 'https://winner2.bet/', '2024-01-10', '18:22:51', 0, 'Brazil', 'Pao de Ouro', 'Para', NULL),
(312, 'Handheld Browser', 'Android', '45.235.221.192', 'https://winner2.bet/', '2024-01-10', '18:29:18', 0, 'Brazil', 'Ananindeua', 'Para', NULL),
(313, 'Chrome', 'Windows 10', '179.109.43.97', 'https://winner2.bet/', '2024-01-10', '18:48:13', 0, 'Brazil', 'Fazenda Rio Grande', 'Parana', NULL),
(314, 'Chrome', 'Windows 10', '195.211.77.140', 'https://autoconfig.brisa777.com/', '2024-01-10', '18:58:02', 0, 'Russia', 'Moscow', 'Moscow', NULL),
(315, 'Chrome', 'Windows 10', '195.211.77.142', 'https://autoconfig.brisa777.com/', '2024-01-10', '19:01:10', 0, 'Russia', 'Moscow', 'Moscow', NULL),
(316, 'Chrome', 'Linux', '99.79.53.219', 'https://winner2.bet/', '2024-01-10', '19:13:15', 0, 'Canada', 'Montreal', 'Quebec', NULL),
(317, 'Chrome', 'Windows 10', '167.71.54.51', 'https://181.215.46.153/', '2024-01-10', '19:21:58', 0, 'Germany', 'Frankfurt am Main', 'Hessen', NULL),
(318, 'Chrome', 'Windows 10', '209.141.60.74', 'https://wenvpn.com', '2024-01-10', '20:34:32', 0, 'United States', 'Las Vegas', 'Nevada', NULL),
(319, 'Handheld Browser', 'Android', '177.51.112.161', 'https://betfly.online/', '2024-01-10', '22:29:15', 0, 'Brazil', 'Maringa', 'Parana', NULL),
(320, 'Chrome', 'Linux', '154.28.229.245', 'https://betfly.online/', '2024-01-10', '22:30:42', 0, 'United States', 'Charlotte', 'North Carolina', NULL),
(321, 'Chrome', 'Windows 10', '104.164.173.160', 'https://betfly.online/', '2024-01-10', '22:30:49', 0, 'United States', 'San Jose', 'California', NULL),
(322, 'Firefox', 'Linux', '179.43.169.181', 'https://www.betfly.online/', '2024-01-10', '22:31:47', 0, 'Switzerland', 'Zurich', 'Zurich', NULL),
(323, 'Chrome', 'Mac OS X', '54.210.99.118', 'https://betfly.online/', '2024-01-10', '22:32:16', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(324, 'Handheld Browser', 'iPhone', '45.142.97.173', 'https://betfly.online/', '2024-01-10', '22:33:48', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(325, 'Handheld Browser', 'iPhone', '188.212.139.55', 'https://mail.betfly.online/', '2024-01-10', '22:33:48', 0, 'United States', 'San Francisco', 'California', NULL),
(326, 'Handheld Browser', 'iPhone', '199.244.60.96', 'https://betfly.online/', '2024-01-10', '22:33:50', 0, 'United States', 'Troy', 'Ohio', NULL),
(327, 'Handheld Browser', 'iPhone', '103.211.185.239', 'https://www.betfly.online/', '2024-01-10', '22:33:53', 0, 'United States', 'Sioux Falls', 'South Dakota', NULL),
(328, 'Handheld Browser', 'iPhone', '93.180.236.131', 'https://betfly.online/', '2024-01-10', '22:34:39', 0, 'United States', 'Wilmington', 'Delaware', NULL),
(329, 'Handheld Browser', 'iPhone', '188.212.141.165', 'https://betfly.online/', '2024-01-10', '22:34:55', 0, 'United States', 'San Francisco', 'California', NULL),
(330, 'Handheld Browser', 'Android', '66.249.74.45', 'https://winner2.bet/cassino/blackjack', '2024-01-10', '22:48:47', 0, 'United States', 'Mountain View', 'California', NULL),
(331, 'Firefox', 'Linux', '34.248.137.227', 'https://mail.betfly.online/', '2024-01-10', '23:11:52', 0, 'Ireland', 'Dublin', 'Leinster', NULL),
(332, 'Chrome', 'Linux', '157.230.62.148', 'https://mail.181-215-46-153.cprapid.com/', '2024-01-10', '23:27:43', 0, 'United States', 'North Bergen', 'New Jersey', NULL),
(333, 'Handheld Browser', 'Android', '66.249.74.44', 'https://winner2.bet/indique', '2024-01-10', '23:27:54', 0, 'United States', 'Mountain View', 'California', NULL),
(334, 'Chrome', 'Mac OS X', '45.79.181.223', 'https://181.215.46.153/', '2024-01-10', '23:41:11', 0, 'United States', 'Cedar Knolls', 'New Jersey', NULL),
(335, 'Handheld Browser', 'Android', '93.119.227.91', 'https://mail.betfly.online/', '2024-01-10', '23:43:22', 0, 'Romania', 'Suceava', 'Suceava', NULL),
(336, 'Handheld Browser', 'Android', '66.249.74.43', 'https://winner2.bet/gambling', '2024-01-11', '00:07:02', 0, 'United States', 'Mountain View', 'California', NULL),
(337, 'Edge', 'Windows 10', '69.4.87.74', 'https://mail.betfly.online/', '2024-01-11', '00:29:43', 0, 'United States', 'Buffalo', 'New York', NULL),
(338, 'Chrome', 'Windows 10', '170.239.52.73', 'https://winner2.bet/', '2024-01-11', '00:30:33', 0, 'Brazil', 'Presidente Prudente', 'Sao Paulo', NULL),
(339, 'Chrome', 'Windows 10', '44.205.29.107', 'https://cpanel.subway.winner2.bet/', '2024-01-11', '00:43:35', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(340, 'Chrome', 'Windows 10', '54.209.165.177', 'https://autoconfig.subway.winner2.bet/', '2024-01-11', '00:52:33', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(341, 'Chrome', 'Linux', '159.223.228.192', 'https://181.215.46.153/', '2024-01-11', '00:58:24', 0, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(342, 'Handheld Browser', 'iPhone', '191.6.97.232', 'https://winner2.bet/', '2024-01-11', '01:17:29', 0, 'Brazil', 'Macapa', 'Amapa', NULL),
(343, 'Handheld Browser', 'Android', '66.249.74.45', 'https://winner2.bet/termos-de-uso', '2024-01-11', '01:25:18', 0, 'United States', 'Mountain View', 'California', NULL),
(344, 'Chrome', 'Windows 10', '185.180.143.72', 'https://181.215.46.153/', '2024-01-11', '01:54:20', 0, 'Belgium', 'Bruxelles', 'Bruxelles', NULL),
(345, 'Handheld Browser', 'Android', '66.249.74.44', 'https://winner2.bet/cassino/aovivo', '2024-01-11', '02:16:15', 0, 'United States', 'Mountain View', 'California', NULL),
(346, 'Handheld Browser', 'Android', '66.249.74.38', 'https://winner2.bet/', '2024-01-11', '03:31:17', 0, 'United States', 'Mountain View', 'California', NULL),
(347, 'Firefox', 'Windows 10', '185.100.87.136', 'https://181.215.46.153/', '2024-01-11', '04:09:23', 0, 'Romania', 'Victoria', 'Braila', NULL),
(348, 'Chrome', 'Windows 10', '38.132.118.68', 'https://mail.betfly.online/', '2024-01-11', '04:22:33', 0, 'United States', 'Hialeah Gardens', 'Florida', NULL),
(349, 'Firefox', 'Linux', '104.166.80.173', 'https://mail.betfly.online/', '2024-01-11', '04:32:45', 0, 'United States', 'Cornelius', 'North Carolina', NULL),
(350, 'Handheld Browser', 'Android', '177.87.135.253', 'https://winner2.bet/', '2024-01-11', '04:33:24', 0, 'Brazil', 'Porto Barra do Ivinheima', 'Mato Grosso do Sul', NULL),
(351, 'Chrome', 'Windows 10', '195.211.77.142', 'https://ftp.brisa777.com/', '2024-01-11', '06:18:50', 0, 'Russia', 'Moscow', 'Moscow', NULL),
(352, 'Chrome', 'Mac OS X', '119.188.157.200', 'https://181.215.46.153/', '2024-01-11', '06:42:01', 0, 'China', 'Jinan', 'Shandong', NULL),
(353, 'Chrome', 'Windows 10', '195.211.77.140', 'https://autoconfig.brisa777.com/', '2024-01-11', '06:57:25', 0, 'Russia', 'Moscow', 'Moscow', NULL),
(354, 'Handheld Browser', 'Android', '45.191.204.118', 'https://winner2.bet/', '2024-01-11', '07:27:08', 0, 'Brazil', 'Aparecida de Goiania', 'Goias', NULL),
(355, 'Handheld Browser', 'Android', '66.249.64.43', 'https://winner2.bet/termos-de-uso', '2024-01-11', '09:16:59', 0, 'United States', 'Mountain View', 'California', NULL),
(356, 'Handheld Browser', 'Android', '47.251.14.232', 'https://mail.betfly.online/', '2024-01-11', '10:22:17', 0, 'United States', 'Los Angeles', 'California', NULL),
(357, 'Chrome', 'Windows 10', '35.171.144.152', 'https://winner2.bet./', '2024-01-11', '11:24:45', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(358, 'Chrome', 'Windows 10', '192.140.117.25', 'https://181.215.46.153/', '2024-01-11', '14:25:13', 0, 'Brazil', 'Maceio', 'Alagoas', NULL),
(359, 'Handheld Browser', 'Android', '66.249.64.42', 'https://winner2.bet/cassino', '2024-01-11', '14:46:15', 0, 'United States', 'Mountain View', 'California', NULL),
(360, 'Firefox', 'Windows 10', '139.59.72.49', 'https://181.215.46.153/', '2024-01-11', '15:01:01', 0, 'India', 'Bengaluru', 'Karnataka', NULL),
(361, 'Firefox', 'Windows 10', '138.68.255.153', 'https://181.215.46.153/', '2024-01-11', '15:07:25', 0, 'United States', 'Santa Clara', 'California', NULL),
(362, 'Chrome', 'Windows 10', '35.204.157.49', 'https://winner2.bet/', '2024-01-11', '15:53:33', 0, 'Netherlands', 'Eemshaven', 'Groningen', NULL),
(363, 'Chrome', 'Linux', '51.79.196.197', 'https://181.215.46.153/', '2024-01-11', '15:57:29', 0, 'Singapore', 'Singapore', '', NULL),
(364, 'Chrome', 'Windows 10', '98.96.193.11', 'https://181.215.46.153/', '2024-01-11', '17:25:28', 0, 'United States', 'Dallas', 'Texas', NULL),
(365, 'Chrome', 'Windows 10', '38.122.112.147', 'https://winner2.bet/', '2024-01-11', '17:27:01', 0, 'United States', 'Chicago', 'Illinois', NULL),
(366, 'Chrome', 'Windows 10', '62.133.46.137', 'https://181.215.46.153/', '2024-01-11', '17:33:09', 0, 'Iran', 'Tehran', 'Tehran', NULL),
(367, 'Handheld Browser', 'Android', '200.71.118.8', 'https://winner2.bet/', '2024-01-11', '18:27:23', 0, 'Brazil', 'Bituruna', 'Parana', NULL),
(368, 'Chrome', 'Windows 10', '179.109.43.97', 'https://winner2.bet/', '2024-01-11', '19:24:10', 0, 'Brazil', 'Fazenda Rio Grande', 'Parana', NULL),
(369, 'Chrome', 'Windows 10', '209.141.60.74', 'https://wenvpn.com', '2024-01-11', '21:55:55', 0, 'United States', 'Las Vegas', 'Nevada', NULL),
(370, 'Chrome', 'Mac OS X', '20.203.40.116', 'https://181.215.46.153:443/', '2024-01-11', '23:51:45', 0, 'United Arab Emirates', 'Dubai', 'Dubai', NULL),
(371, 'Chrome', 'Mac OS X', '172.105.128.11', 'https://181.215.46.153/', '2024-01-11', '23:52:48', 0, 'United States', 'Cedar Knolls', 'New Jersey', NULL),
(372, 'Handheld Browser', 'Android', '66.249.64.42', 'https://winner2.bet/cassino/blackjack', '2024-01-12', '00:49:31', 0, 'United States', 'Mountain View', 'California', NULL);
INSERT INTO `visita_site` (`id`, `nav_os`, `mac_os`, `ip_visita`, `refer_visita`, `data_cad`, `hora_cad`, `id_user`, `pais`, `cidade`, `estado`, `ads_tipo`) VALUES
(373, 'Chrome', 'Windows 10', '51.81.245.138', 'https://webdisk.betfly.online/', '2024-01-12', '01:04:57', 0, 'United States', 'Portland', 'Oregon', NULL),
(374, 'Chrome', 'Linux', '154.28.229.33', 'https://cpcontacts.betfly.online/', '2024-01-12', '01:04:58', 0, 'United States', 'Charlotte', 'North Carolina', NULL),
(375, 'Chrome', 'Mac OS X', '154.28.229.214', 'https://cpanel.betfly.online/', '2024-01-12', '01:05:00', 0, 'United States', 'Charlotte', 'North Carolina', NULL),
(376, 'Chrome', 'Mac OS X', '104.164.173.74', 'https://webdisk.betfly.online/', '2024-01-12', '01:05:02', 0, 'United States', 'San Jose', 'California', NULL),
(377, 'Chrome', 'Windows 10', '104.164.173.124', 'https://webmail.betfly.online/', '2024-01-12', '01:05:02', 0, 'United States', 'San Jose', 'California', NULL),
(378, 'Chrome', 'Windows 10', '104.164.173.207', 'https://cpcalendars.betfly.online/', '2024-01-12', '01:05:02', 0, 'United States', 'San Jose', 'California', NULL),
(379, 'Chrome', 'Linux', '104.164.173.96', 'https://autodiscover.betfly.online/', '2024-01-12', '01:05:02', 0, 'United States', 'San Jose', 'California', NULL),
(380, 'Chrome', 'Linux', '154.28.229.235', 'https://webdisk.betfly.online/', '2024-01-12', '01:05:05', 0, 'United States', 'Charlotte', 'North Carolina', NULL),
(381, 'Chrome', 'Linux', '154.28.229.126', 'https://cpanel.betfly.online/', '2024-01-12', '01:05:05', 0, 'United States', 'Charlotte', 'North Carolina', NULL),
(382, 'Chrome', 'Mac OS X', '104.164.173.250', 'https://webmail.betfly.online/', '2024-01-12', '01:05:05', 0, 'United States', 'San Jose', 'California', NULL),
(383, 'Chrome', 'Windows 10', '104.164.173.60', 'https://cpcalendars.betfly.online/', '2024-01-12', '01:05:05', 0, 'United States', 'San Jose', 'California', NULL),
(384, 'Chrome', 'Mac OS X', '104.164.173.83', 'https://autodiscover.betfly.online/', '2024-01-12', '01:05:05', 0, 'United States', 'San Jose', 'California', NULL),
(385, 'Chrome', 'Windows 10', '104.164.173.48', 'https://cpcontacts.betfly.online/', '2024-01-12', '01:05:05', 0, 'United States', 'San Jose', 'California', NULL),
(386, 'Chrome', 'Mac OS X', '104.164.173.41', 'https://mail.betfly.online/', '2024-01-12', '01:05:07', 0, 'United States', 'San Jose', 'California', NULL),
(387, 'Handheld Browser', 'Android', '161.35.190.56', 'https://webdisk.betfly.online/', '2024-01-12', '01:05:10', 0, 'United States', 'Francisco', 'Indiana', NULL),
(388, 'Handheld Browser', 'Android', '159.203.44.43', 'https://cpcalendars.betfly.online/', '2024-01-12', '01:05:11', 0, 'Canada', 'Toronto', 'Ontario', NULL),
(389, 'Handheld Browser', 'Android', '161.35.27.144', 'https://autodiscover.betfly.online/', '2024-01-12', '01:05:12', 0, 'Germany', 'Frankfurt am Main', 'Hessen', NULL),
(390, 'Handheld Browser', 'Android', '164.90.222.93', 'https://webmail.betfly.online/', '2024-01-12', '01:05:13', 0, 'Germany', 'Frankfurt am Main', 'Hessen', NULL),
(391, 'Handheld Browser', 'Android', '164.90.205.35', 'https://cpanel.betfly.online/', '2024-01-12', '01:05:13', 0, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(392, 'Handheld Browser', 'Android', '134.122.89.242', 'https://cpcontacts.betfly.online/', '2024-01-12', '01:05:13', 0, 'Germany', 'Frankfurt am Main', 'Hessen', NULL),
(393, 'Handheld Browser', 'iPhone', '13.38.14.70', 'https://cpanel.betfly.online/', '2024-01-12', '01:06:40', 0, 'France', 'Paris', 'Ile-de-France', NULL),
(394, 'Handheld Browser', 'iPhone', '45.87.212.88', 'https://cpanel.betfly.online/', '2024-01-12', '01:06:40', 0, 'Germany', 'Frankfurt am Main', 'Hessen', NULL),
(395, 'Chrome', 'Linux', '37.120.149.61', 'https://cpanel.betfly.online/', '2024-01-12', '01:06:40', 0, 'Norway', 'Oslo', 'Oslo', NULL),
(396, 'Handheld Browser', 'iPhone', '107.150.31.136', 'https://cpanel.betfly.online/', '2024-01-12', '01:06:40', 0, 'United States', 'Atlanta', 'Georgia', NULL),
(397, 'Chrome', 'Linux', '161.35.246.138', 'https://cpanel.betfly.online/', '2024-01-12', '01:06:40', 0, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(398, 'Chrome', 'Linux', '3.8.148.160', 'https://webdisk.betfly.online/', '2024-01-12', '01:06:47', 0, 'United Kingdom', 'London', 'England', NULL),
(399, 'Handheld Browser', 'iPhone', '45.141.202.164', 'https://webdisk.betfly.online/', '2024-01-12', '01:06:48', 0, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(400, 'Chrome', 'Mac OS X', '138.199.47.245', 'https://webdisk.betfly.online/', '2024-01-12', '01:06:48', 0, 'France', 'Paris', 'Ile-de-France', NULL),
(401, 'Handheld Browser', 'iPhone', '119.13.202.75', 'https://autodiscover.betfly.online/', '2024-01-12', '01:08:15', 0, 'United States', 'Wilmington', 'Delaware', NULL),
(402, 'Handheld Browser', 'iPhone', '168.151.109.142', 'https://webmail.betfly.online/', '2024-01-12', '01:08:15', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(403, 'Handheld Browser', 'iPhone', '161.129.174.168', 'https://cpcalendars.betfly.online/', '2024-01-12', '01:08:15', 0, 'United States', 'Wilmington', 'Delaware', NULL),
(404, 'Handheld Browser', 'iPhone', '206.204.6.166', 'https://cpanel.betfly.online/', '2024-01-12', '01:08:15', 0, 'United States', 'Irving', 'Texas', NULL),
(405, 'Handheld Browser', 'iPhone', '213.188.87.161', 'https://webdisk.betfly.online/', '2024-01-12', '01:08:16', 0, 'United States', 'Wilmington', 'Delaware', NULL),
(406, 'Handheld Browser', 'iPhone', '152.39.205.172', 'https://cpcontacts.betfly.online/', '2024-01-12', '01:08:16', 0, 'United States', 'Mount Laurel', 'New Jersey', NULL),
(407, 'Firefox', 'Linux', '54.247.57.72', 'https://webdisk.betfly.online/', '2024-01-12', '01:20:23', 0, 'Ireland', 'Dublin', 'Leinster', NULL),
(408, 'Handheld Browser', 'Android', '177.87.135.253', 'https://winner2.bet/', '2024-01-12', '01:22:13', 0, 'Brazil', 'Porto Barra do Ivinheima', 'Mato Grosso do Sul', NULL),
(409, 'Handheld Browser', 'Android', '177.51.110.233', 'https://winner2.bet/', '2024-01-12', '01:57:12', 0, 'Brazil', 'Goiania', 'Goias', NULL),
(410, 'Chrome', 'Windows 10', '38.50.156.208', 'https://winner2.bet/', '2024-01-12', '01:57:31', 0, 'Brazil', 'Goiania', 'Goias', NULL),
(411, 'Safari', 'Mac OS X', '93.119.227.91', 'https://cpanel.betfly.online/', '2024-01-12', '02:52:09', 0, 'Romania', 'Suceava', 'Suceava', NULL),
(412, 'Handheld Browser', 'Android', '45.191.204.118', 'https://winner2.bet/', '2024-01-12', '03:12:23', 0, 'Brazil', 'Aparecida de Goiania', 'Goias', NULL),
(413, 'Handheld Browser', 'Android', '69.4.87.74', 'https://cpanel.betfly.online/', '2024-01-12', '03:14:10', 0, 'United States', 'Buffalo', 'New York', NULL),
(414, 'Handheld Browser', 'Android', '66.249.64.44', 'https://winner2.bet/aovivo', '2024-01-12', '03:33:53', 0, 'United States', 'Mountain View', 'California', NULL),
(415, 'Chrome', 'Linux', '165.227.207.106', 'https://winner2.bet/', '2024-01-12', '03:49:24', 0, 'United States', 'North Bergen', 'New Jersey', NULL),
(416, 'Chrome', 'Windows 10', '195.211.77.142', 'https://autoconfig.brisa777.com/', '2024-01-12', '04:10:00', 0, 'Russia', 'Moscow', 'Moscow', NULL),
(417, 'Firefox', 'Windows 10', '104.166.80.179', 'https://webmail.betfly.online/', '2024-01-12', '04:30:47', 0, 'United States', 'Cornelius', 'North Carolina', NULL),
(418, 'Chrome', 'Windows 10', '38.132.118.68', 'https://autodiscover.betfly.online/', '2024-01-12', '04:48:44', 0, 'United States', 'Hialeah Gardens', 'Florida', NULL),
(419, 'Firefox', 'Windows 10', '104.166.80.254', 'https://cpanel.betfly.online/', '2024-01-12', '04:51:54', 0, 'United States', 'Cornelius', 'North Carolina', NULL),
(420, 'Chrome', 'Windows 10', '38.132.118.69', 'https://cpcontacts.betfly.online/', '2024-01-12', '04:59:16', 0, 'United States', 'Hialeah Gardens', 'Florida', NULL),
(421, 'Handheld Browser', 'iPhone', '138.199.18.140', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:00:23', 0, 'Germany', 'Frankfurt am Main', 'Hessen', NULL),
(422, 'Chrome', 'Linux', '104.255.169.110', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:00:25', 0, 'United States', 'Melbourne', 'Florida', NULL),
(423, 'Chrome', 'Windows 7', '188.42.195.140', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:00:42', 0, 'Luxembourg', 'Luxembourg', 'Luxembourg', NULL),
(424, 'Chrome', 'Windows 10', '63.246.149.226', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:01:02', 0, 'United States', 'Woodside', 'New York', NULL),
(425, 'Chrome', 'Windows 7', '94.102.63.27', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:01:05', 0, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(426, 'Handheld Browser', 'iPhone', '138.199.47.221', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:01:51', 0, 'France', 'Paris', 'Ile-de-France', NULL),
(427, 'Chrome', 'Mac OS X', '104.223.88.21', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:01:52', 0, 'United States', 'Atlanta', 'Georgia', NULL),
(428, 'Chrome', 'Mac OS X', '186.227.198.149', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:01:52', 0, 'Brazil', 'Joao Pessoa', 'Paraiba', NULL),
(429, 'Handheld Browser', 'iPhone', '82.102.30.95', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:01:52', 0, 'United States', 'Las Vegas', 'Nevada', NULL),
(430, 'Handheld Browser', 'iPhone', '45.92.1.74', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:01:53', 0, 'Germany', 'Hamburg', 'Hamburg', NULL),
(431, 'Handheld Browser', 'iPhone', '45.133.172.88', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:01:56', 0, 'United Kingdom', 'Sutton', 'England', NULL),
(432, 'Handheld Browser', 'iPhone', '176.67.82.3', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:01:57', 0, 'France', 'Marseille', 'Provence-Alpes-Cote d\'Azur', NULL),
(433, 'Chrome', 'Linux', '68.183.245.101', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:01:58', 0, 'India', 'Bengaluru', 'Karnataka', NULL),
(434, 'Chrome', 'Windows 10', '184.73.136.229', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:02:15', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(435, 'Chrome', 'Windows 10', '38.95.185.5', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:02:50', 0, 'United States', 'Pasadena', 'California', NULL),
(436, 'Handheld Browser', 'iPhone', '116.70.226.201', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:04:02', 0, 'Japan', 'Tokyo', 'Tokyo', NULL),
(437, 'Handheld Browser', 'iPhone', '106.161.65.206', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:12:38', 0, 'Japan', 'Fuchu', 'Tokyo', NULL),
(438, 'Chrome', 'Linux', '203.57.50.250', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:12:38', 0, 'Australia', 'Brisbane', 'Queensland', NULL),
(439, 'Chrome', 'Linux', '207.244.124.120', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:12:38', 0, 'United States', 'Manassas', 'Virginia', NULL),
(440, 'Handheld Browser', 'iPhone', '103.27.227.65', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:12:39', 0, 'New Zealand', 'Auckland', 'Auckland', NULL),
(441, 'Handheld Browser', 'iPhone', '92.17.140.143', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:12:46', 0, 'United Kingdom', 'Weston-super-Mare', 'England', NULL),
(442, 'Chrome', 'Linux', '54.66.245.129', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:14:43', 0, 'Australia', 'Sydney', 'New South Wales', NULL),
(443, 'Chrome', 'Windows 10', '54.209.165.177', 'https://webdisk.subway.winner2.bet/', '2024-01-12', '05:18:43', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(444, 'Firefox', 'Windows 10', '104.166.80.15', 'https://cpcalendars.betfly.online/', '2024-01-12', '05:29:51', 0, 'United States', 'Cornelius', 'North Carolina', NULL),
(445, 'Chrome', 'Windows 10', '89.208.29.209', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:38:28', 0, 'Russia', 'Moscow', 'Moscow', NULL),
(446, 'Handheld Browser', 'iPhone', '61.115.12.244', 'https://cpcontacts.betfly.online/', '2024-01-12', '05:39:12', 0, 'Japan', 'Shiogama', 'Miyagi', NULL),
(447, 'Chrome', 'Windows 10', '96.9.249.34', 'https://webdisk.betfly.online/', '2024-01-12', '05:45:54', 0, 'United States', 'Buffalo', 'New York', NULL),
(448, 'Firefox', 'Windows 10', '104.166.80.220', 'https://webdisk.betfly.online/', '2024-01-12', '05:47:32', 0, 'United States', 'Cornelius', 'North Carolina', NULL),
(449, 'Chrome', 'Windows 10', '5.181.234.133', 'https://webmail.betfly.online/', '2024-01-12', '05:47:49', 0, 'United States', 'New York', 'New York', NULL),
(450, 'Chrome', 'Windows 10', '46.183.221.195', 'https://webdisk.betfly.online/', '2024-01-12', '05:49:36', 0, 'Latvia', 'Riga', 'Riga', NULL),
(451, 'Chrome', 'Windows 10', '5.181.234.134', 'https://webdisk.betfly.online/', '2024-01-12', '05:49:48', 0, 'United States', 'New York', 'New York', NULL),
(452, 'Chrome', 'Windows 10', '38.132.118.77', 'https://webmail.betfly.online/', '2024-01-12', '05:50:04', 0, 'United States', 'Hialeah Gardens', 'Florida', NULL),
(453, 'Chrome', 'Windows 10', '44.205.29.107', 'https://autoconfig.subway.winner2.bet/', '2024-01-12', '06:03:48', 0, 'United States', 'Ashburn', 'Virginia', NULL),
(454, 'Handheld Browser', 'iPhone', '74.80.181.137', 'https://webmail.betfly.online/', '2024-01-12', '06:04:41', 0, 'United States', 'Vero Beach', 'Florida', NULL),
(455, 'Handheld Browser', 'iPhone', '191.252.111.55', 'https://webmail.betfly.online/', '2024-01-12', '06:04:41', 0, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(456, 'Handheld Browser', 'iPhone', '104.129.18.34', 'https://webmail.betfly.online/', '2024-01-12', '06:04:43', 0, 'United States', 'Atlanta', 'Georgia', NULL),
(457, 'Chrome', 'Linux', '146.70.163.102', 'https://webmail.betfly.online/', '2024-01-12', '06:04:45', 0, 'Brazil', 'Barueri', 'Sao Paulo', NULL),
(458, 'Handheld Browser', 'iPhone', '149.78.184.101', 'https://webdisk.betfly.online/', '2024-01-12', '06:05:49', 0, 'Brazil', 'Sao Paulo', 'Sao Paulo', NULL),
(459, 'Chrome', 'Mac OS X', '104.129.56.81', 'https://webdisk.betfly.online/', '2024-01-12', '06:05:49', 0, 'United States', 'Kent', 'Washington', NULL),
(460, 'Chrome', 'Windows 10', '5.133.192.146', 'https://winner2.bet/', '2024-01-12', '06:08:08', 0, 'Sweden', 'Stockholm', 'Stockholms lan', NULL),
(461, 'Chrome', 'Windows 10', '98.159.226.221', 'https://webmail.betfly.online/', '2024-01-12', '06:16:46', 0, 'Monaco', 'Monaco', 'Commune de Monaco', NULL),
(462, 'Chrome', 'Windows 10', '98.159.226.218', 'https://webdisk.betfly.online/', '2024-01-12', '06:22:37', 0, 'Monaco', 'Monaco', 'Commune de Monaco', NULL),
(463, 'Chrome', 'Windows 10', '117.62.218.192', 'https://easyseo.s-nac.com', '2024-01-12', '06:28:19', 0, 'China', 'Nanjing', 'Jiangsu', NULL),
(464, 'Chrome', 'Linux', '146.190.22.149', 'https://mail.winner2.bet/', '2024-01-12', '06:29:23', 0, 'Netherlands', 'Amsterdam', 'Noord-Holland', NULL),
(465, 'Chrome', 'Windows 10', '195.211.77.140', 'https://autoconfig.brisa777.com/', '2024-01-12', '06:58:06', 0, 'Russia', 'Moscow', 'Moscow', NULL),
(466, 'Chrome', 'Mac OS X', '207.244.91.145', 'https://cpcontacts.betfly.online/', '2024-01-12', '07:26:29', 0, 'United States', 'Manassas', 'Virginia', NULL),
(467, 'Chrome', 'Linux', '104.248.126.210', 'https://cpcontacts.brisa777.com/', '2024-01-12', '07:43:08', 0, 'United States', 'North Bergen', 'New Jersey', NULL),
(468, 'Chrome', 'Mac OS X', '44.234.19.83', 'https://cpcontacts.betfly.online/', '2024-01-12', '08:42:47', 0, 'United States', 'Portland', 'Oregon', NULL),
(469, 'Firefox', 'Windows 7', '139.162.245.244', 'https://181.215.46.153/', '2024-01-12', '09:02:50', 0, 'United Kingdom', 'London', 'England', NULL),
(470, 'Firefox', 'Ubuntu', '15.188.77.42', 'https://mail.betfly.online/', '2024-01-12', '12:27:46', 0, 'France', 'Paris', 'Ile-de-France', NULL),
(471, 'Firefox', 'Linux', '167.71.251.209', 'https://181.215.46.153/', '2024-01-12', '12:41:55', 0, 'United States', 'Clifton', 'New Jersey', NULL),
(0, 'Chrome', 'Windows 10', '::1', 'http://localhost/', '2024-01-19', '09:08:22', 0, 'Unknown', 'Unknown', 'Unknown', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `afiliados_config`
--
ALTER TABLE `afiliados_config`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagstart`
--
ALTER TABLE `pagstart`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pagstart`
--
ALTER TABLE `pagstart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

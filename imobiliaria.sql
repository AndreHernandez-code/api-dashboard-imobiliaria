-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/09/2026 às 21:58
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
-- Banco de dados: `imobiliaria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `imovel`
--

CREATE TABLE `imovel` (
  `codigo_imovel` int(11) NOT NULL,
  `descricao_imovel` varchar(255) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `imovel`
--

INSERT INTO `imovel` (`codigo_imovel`, `descricao_imovel`, `id_tipo`) VALUES
(4356, 'Apartamento 100 m2 em condomínio fechado', 1),
(4357, 'Apartamento 60 m2 no centro', 1),
(4358, 'Apartamento cobertura duplex', 1),
(5001, 'Terreno 300 m2 em loteamento', 2),
(5002, 'Terreno 500 m2 área industrial', 2),
(6001, 'Sala comercial 40 m2 térreo', 3),
(6002, 'Sala comercial 80 m2 em prédio corporativo', 3),
(6003, 'Sala comercial 35 m2 com garagem', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_venda` int(11) NOT NULL,
  `data_pagamento` date NOT NULL,
  `valor_pagamento` decimal(10,2) NOT NULL,
  `codigo_imovel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id_venda`, `data_pagamento`, `valor_pagamento`, `codigo_imovel`) VALUES
(1, '2023-08-10', 5000.00, 4356),
(2, '2023-08-11', 2500.00, 4357),
(3, '2023-08-12', 8000.00, 4358),
(4, '2023-08-15', 12000.00, 5001),
(5, '2023-08-20', 45000.00, 5002),
(6, '2023-08-25', 3000.00, 6001),
(7, '2023-09-05', 5000.00, 4356),
(8, '2023-09-10', 2500.00, 4357),
(9, '2023-09-12', 8000.00, 4358),
(10, '2023-09-15', 12000.00, 5001),
(11, '2023-09-20', 3200.00, 6002),
(12, '2023-09-25', 3000.00, 6001),
(13, '2023-10-05', 5000.00, 4356),
(14, '2023-10-10', 2500.00, 4357),
(15, '2023-10-12', 8000.00, 4358),
(16, '2023-10-18', 2000.00, 6003),
(17, '2023-10-20', 3200.00, 6002),
(18, '2023-10-25', 3000.00, 6001),
(19, '2023-11-05', 5000.00, 4356),
(20, '2023-11-10', 2500.00, 4357),
(21, '2023-11-12', 8000.00, 4358),
(22, '2023-11-18', 2000.00, 6003),
(23, '2023-11-20', 3200.00, 6002),
(24, '2023-11-25', 3000.00, 6001),
(25, '2023-12-05', 5000.00, 4356),
(26, '2023-12-10', 2500.00, 4357),
(27, '2023-12-12', 8000.00, 4358),
(28, '2023-12-18', 2000.00, 6003),
(29, '2023-12-20', 3200.00, 6002),
(30, '2023-12-25', 3000.00, 6001),
(33, '2026-09-20', 5000.00, 4356),
(34, '2026-09-21', 2500.00, 4357),
(35, '2026-09-22', 8000.00, 4358),
(36, '2026-09-23', 12000.00, 5001),
(37, '2026-09-24', 45000.00, 5002),
(38, '2026-09-25', 3000.00, 6001);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_imovel`
--

CREATE TABLE `tipo_imovel` (
  `id_tipo` int(11) NOT NULL,
  `nome_tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_imovel`
--

INSERT INTO `tipo_imovel` (`id_tipo`, `nome_tipo`) VALUES
(1, 'Apartamento'),
(2, 'Terreno'),
(3, 'Sala Comercial');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `imovel`
--
ALTER TABLE `imovel`
  ADD PRIMARY KEY (`codigo_imovel`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `codigo_imovel` (`codigo_imovel`);

--
-- Índices de tabela `tipo_imovel`
--
ALTER TABLE `tipo_imovel`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `tipo_imovel`
--
ALTER TABLE `tipo_imovel`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `imovel_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_imovel` (`id_tipo`);

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`codigo_imovel`) REFERENCES `imovel` (`codigo_imovel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

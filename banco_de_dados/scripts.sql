CREATE DATABASE IF NOT EXISTS Flexpoint;
USE Flexpoint;

CREATE TABLE `biblioteca_exercicios` (
  `id` int(11) NOT NULL,
  `fisioterapeuta_id` int(11) NOT NULL,
  `titulo_exercicio` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `url_midia` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `biblioteca_exercicios` (`id`, `fisioterapeuta_id`, `titulo_exercicio`, `descricao`, `url_midia`) VALUES
(1, 1, 'levantamento de pescoço', 'coloque um peso no pescoço e levante', 'https://youtu.be/wnbxgBMIcps?si=IZ1f3xIgU-Sixal2');

-- --------------------------------------------------------


CREATE TABLE `consultas` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `fisioterapeuta_id` int(11) NOT NULL,
  `data_hora` datetime NOT NULL,
  `status` enum('agendada','realizada','cancelada','pendente') DEFAULT 'pendente',
  `observacoes_consulta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `consultas` (`id`, `paciente_id`, `fisioterapeuta_id`, `data_hora`, `status`, `observacoes_consulta`) VALUES
(1, 3, 1, '2025-08-02 14:42:46', 'realizada', 'sessão 1 muito bem desenvolvida, paciente tem boa previsão de melhora'),
(2, 3, 1, '2025-08-19 14:00:00', 'agendada', NULL),
(3, 3, 1, '2025-08-31 15:00:00', 'agendada', NULL),
(4, 4, 1, '2025-08-05 04:00:00', 'pendente', NULL),
(5, 4, 1, '2025-08-05 11:00:00', 'agendada', NULL),
(6, 7, 5, '2025-08-19 08:27:19', 'realizada', ''),
(7, 8, 1, '2025-08-26 09:06:51', 'realizada', 'LEGAl');

-- --------------------------------------------------------

CREATE TABLE `dados_pacientes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `dados_pacientes` (`id`, `usuario_id`, `cpf`, `telefone`, `cidade`) VALUES
(1, 3, '12345678910', '13313133131331313313', 'goiania'),
(2, 4, '1111111111111', '11991156933', 'Cajacity'),
(3, 6, '31232131212412', '412423141421', 'eewew');

-- --------------------------------------------------------


CREATE TABLE `disponibilidade` (
  `id` int(11) NOT NULL,
  `fisioterapeuta_id` int(11) NOT NULL,
  `dia_semana` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `disponibilidade` (`id`, `fisioterapeuta_id`, `dia_semana`, `hora_inicio`, `hora_fim`) VALUES
(24, 1, 1, '09:00:00', '18:00:00'),
(25, 1, 2, '04:00:00', '18:00:00'),
(26, 1, 3, '06:00:00', '18:00:00'),
(27, 1, 4, '09:00:00', '18:00:00'),
(28, 1, 5, '09:00:00', '18:00:00'),
(29, 1, 0, '09:00:00', '18:00:00');

-- --------------------------------------------------------


CREATE TABLE `fisioterapeuta_paciente_vinculo` (
  `id` int(11) NOT NULL,
  `fisioterapeuta_id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `fisioterapeuta_paciente_vinculo` (`id`, `fisioterapeuta_id`, `paciente_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 5, 7),
(4, 1, 8);

-- --------------------------------------------------------


CREATE TABLE `medicoes_adm` (
  `id` int(11) NOT NULL,
  `consulta_id` int(11) NOT NULL,
  `articulacao` enum('cotovelo','joelho') NOT NULL,
  `grau_maximo` decimal(5,2) NOT NULL,
  `grau_minimo` decimal(5,2) DEFAULT NULL,
  `timestamp_medicao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `medicoes_adm` (`id`, `consulta_id`, `articulacao`, `grau_maximo`, `grau_minimo`, `timestamp_medicao`) VALUES
(1, 1, 'cotovelo', 160.00, 90.00, '2025-08-02 17:42:46'),
(2, 1, 'cotovelo', 150.00, 90.00, '2025-08-02 17:43:24'),
(3, 1, 'cotovelo', 130.00, 80.00, '2025-08-02 17:43:42'),
(4, 1, 'cotovelo', 130.00, 80.00, '2025-08-02 17:43:42'),
(5, 1, 'cotovelo', 190.00, 100.00, '2025-08-02 17:44:04'),
(6, 4, 'joelho', 35.00, NULL, '2025-08-05 10:45:00'),
(7, 4, 'joelho', 65.00, NULL, '2025-08-05 10:45:19'),
(8, 4, 'joelho', 90.00, NULL, '2025-08-05 10:46:37'),
(9, 4, 'joelho', 145.00, NULL, '2025-08-05 10:46:50'),
(10, 6, 'cotovelo', 110.00, 90.00, '2025-08-19 11:27:19'),
(11, 6, 'cotovelo', 150.00, 100.00, '2025-08-19 11:27:32'),
(12, 6, 'cotovelo', 90.00, 125.00, '2025-08-19 11:27:42'),
(13, 6, 'cotovelo', 90.00, 160.00, '2025-08-19 11:27:52'),
(14, 6, 'cotovelo', 160.00, 90.00, '2025-08-19 11:28:08'),
(15, 6, 'cotovelo', 360.00, 90.00, '2025-08-19 11:28:29'),
(16, 7, 'cotovelo', 12.00, 2.00, '2025-08-26 12:06:51'),
(17, 7, 'cotovelo', 17.00, 2.00, '2025-08-26 12:07:01');

-- --------------------------------------------------------


CREATE TABLE `mensagens_chat` (
  `id` int(11) NOT NULL,
  `remetente_id` int(11) NOT NULL,
  `destinatario_id` int(11) NOT NULL,
  `conteudo_mensagem` text NOT NULL,
  `timestamp_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_leitura` enum('lida','nao_lida') DEFAULT 'nao_lida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `mensagens_chat` (`id`, `remetente_id`, `destinatario_id`, `conteudo_mensagem`, `timestamp_envio`, `status_leitura`) VALUES
(1, 1, 3, 'Eae arthur cabecinha, tudo bem?', '2025-08-02 17:39:25', 'nao_lida'),
(2, 1, 3, 'oi', '2025-08-06 13:19:11', 'nao_lida');

-- --------------------------------------------------------


CREATE TABLE `plano_exercicios_paciente` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `exercicio_id` int(11) NOT NULL,
  `observacoes_fisioterapeuta` text DEFAULT NULL,
  `data_atribuicao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `plano_exercicios_paciente` (`id`, `paciente_id`, `exercicio_id`, `observacoes_fisioterapeuta`, `data_atribuicao`) VALUES
(1, 3, 1, '', '2025-08-02 17:50:20'),
(2, 4, 1, 'Faz aí zé mané, 3 sessões', '2025-08-05 10:48:07');

-- --------------------------------------------------------


CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome_completo` varchar(255) NOT NULL,
  `tipo_usuario` enum('fisioterapeuta','paciente') NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `usuarios` (`id`, `email`, `senha`, `nome_completo`, `tipo_usuario`, `data_cadastro`) VALUES
(1, 'ojoao.silva7689@gmail.com', '$2y$10$tmlTmoexzx1J7LEcjkRfGOTi8iDvQ45LNRDyMxeSreJ2hYiw9QE4W', 'Dr. João Pedro', 'fisioterapeuta', '2025-08-02 17:36:38'),
(2, 'cleitongoncalves@gmail.com', '$2y$10$jaetdSatdIseGOG.Jqoxq.5Snk9jKYGHUyg1Kpe5rxvwhEAdK9WSe', 'Cletin do Rasta Fari', 'paciente', '2025-08-02 17:36:38'),
(3, 'arthurcabecinha12@gmail.com', '$2y$10$p0wKOGCPq.B/OpJCF9tMxOHL6d/lufF2Y8/jbS/BsQJLZRfmjI/ti', 'arthur cabecinha da silva', 'paciente', '2025-08-02 17:39:06'),
(4, 'arthur.santos@gmail.com', '$2y$10$AbW2R7uz8l6DzS.Gz2xkBOVmaDI91aiLs0CubkUKdj1PCpcjHadSG', 'Arthur de Oliveira', 'paciente', '2025-08-05 10:37:18'),
(5, 'arthurteste.fisio@flexpoint.com', '$2y$10$xt6p19nsxktBHkHDF3QGP.p25tGiIe92l3vPcb1hiOpX6UoAFH/gm', 'Dr. Arthur', 'fisioterapeuta', '2025-08-16 20:14:38'),
(6, 'arthuruser@email.com', '$2y$10$8jgl8RyquhXjqazF4f30AeP2JKOIIJmbcaVfiuhYtO294iHSkj1Aq', 'Paciente Arthur', 'paciente', '2025-08-16 20:14:38'),
(7, 'oliveiraarthur@flexpoint.com', '$2y$10$arHSMtiG1RvhHGj5GobMheDWCMLRGWWTMW7Jd9ki1vqIQgfUykQsK', 'Arthur de Oliveira', 'paciente', '2025-08-19 11:26:59'),
(8, 'iara@123', '$2y$10$DEkKmOPWtxuT9DPJ.tEw8ORt2Rjjkz8zI0vLDczkkaBqGh8wzetcq', 'Iara', 'paciente', '2025-08-26 12:06:29');


ALTER TABLE `biblioteca_exercicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fisioterapeuta_id` (`fisioterapeuta_id`);


ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `fisioterapeuta_id` (`fisioterapeuta_id`);

ALTER TABLE `dados_pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`),
  ADD UNIQUE KEY `cpf` (`cpf`);


ALTER TABLE `disponibilidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fisioterapeuta_id` (`fisioterapeuta_id`);


ALTER TABLE `fisioterapeuta_paciente_vinculo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fisioterapeuta_id` (`fisioterapeuta_id`),
  ADD KEY `paciente_id` (`paciente_id`);

ALTER TABLE `medicoes_adm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consulta_id` (`consulta_id`);


ALTER TABLE `mensagens_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `remetente_id` (`remetente_id`),
  ADD KEY `destinatario_id` (`destinatario_id`);

ALTER TABLE `plano_exercicios_paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `exercicio_id` (`exercicio_id`);


ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);


ALTER TABLE `biblioteca_exercicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `dados_pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `disponibilidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;


ALTER TABLE `fisioterapeuta_paciente_vinculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `medicoes_adm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

ALTER TABLE `mensagens_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `plano_exercicios_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `biblioteca_exercicios`
  ADD CONSTRAINT `biblioteca_exercicios_ibfk_1` FOREIGN KEY (`fisioterapeuta_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`fisioterapeuta_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

ALTER TABLE `dados_pacientes`
  ADD CONSTRAINT `dados_pacientes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

ALTER TABLE `disponibilidade`
  ADD CONSTRAINT `disponibilidade_ibfk_1` FOREIGN KEY (`fisioterapeuta_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

ALTER TABLE `fisioterapeuta_paciente_vinculo`
  ADD CONSTRAINT `fisioterapeuta_paciente_vinculo_ibfk_1` FOREIGN KEY (`fisioterapeuta_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fisioterapeuta_paciente_vinculo_ibfk_2` FOREIGN KEY (`paciente_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

ALTER TABLE `medicoes_adm`
  ADD CONSTRAINT `medicoes_adm_ibfk_1` FOREIGN KEY (`consulta_id`) REFERENCES `consultas` (`id`) ON DELETE CASCADE;

ALTER TABLE `mensagens_chat`
  ADD CONSTRAINT `mensagens_chat_ibfk_1` FOREIGN KEY (`remetente_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mensagens_chat_ibfk_2` FOREIGN KEY (`destinatario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

ALTER TABLE `plano_exercicios_paciente`
  ADD CONSTRAINT `plano_exercicios_paciente_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `plano_exercicios_paciente_ibfk_2` FOREIGN KEY (`exercicio_id`) REFERENCES `biblioteca_exercicios` (`id`) ON DELETE CASCADE;
COMMIT;

show tables;
select * from usuarios;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Сен 11 2024 г., 12:13
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Полюс`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `requests`
--

CREATE TABLE `requests` (
  `request_id` int(11) NOT NULL,
  `startDate` datetime(6) NOT NULL,
  `type_id` int(11) NOT NULL,
  `orgTechModel` varchar(255) NOT NULL,
  `problemDescryption` varchar(255) NOT NULL,
  `status_id` int(11) NOT NULL,
  `completionDate` varchar(255) NOT NULL,
  `repairParts` varchar(255) NOT NULL,
  `master_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `request_status`
--

CREATE TABLE `request_status` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `request_status`
--

INSERT INTO `request_status` (`id`, `code`, `name`) VALUES
(1, 'ready', 'ready'),
(2, 'todo', 'todo'),
(3, 'wait', 'wait');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `code`, `name`) VALUES
(1, 'Manager', 'Менеджер'),
(2, 'Master', 'Мастер'),
(3, 'Operator', 'Оператор'),
(4, 'Customer', 'Заказчик');

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `type`
--

INSERT INTO `type` (`id`, `code`, `name`) VALUES
(1, 'PC', 'Компьютер'),
(2, 'Notebook', 'Ноутбук'),
(3, 'Printer', 'Принтер');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `fio`, `phone`, `username`, `password`, `role_id`) VALUES
(1, 'Носов Иван Михайлович', '89210563128', 'login1', 'a722c63db8ec8625af6cf71cb8c2d939', 2),
(2, 'Ильин Александр Андреевич', '89535078985', 'login2', 'c1572d05424d0ecb2a65ec6a82aeacbf', 2),
(3, 'Никифоров Иван Дмитриевич', '89210673849', 'login3', '3afc79b597f88a72528e864cf81856d2', 2),
(4, 'Елисеев Артём Леонидович', '89990563748', 'login4', 'fc2921d9057ac44e549efaf0048b2512', 3),
(5, 'Титов Сергей Кириллович', '89994563847', 'login5', 'd35f6fa9a79434bcd17f8049714ebfcb', 3),
(6, 'Григорьев Семён Викторович', '89219567849', 'login11', '0102812fbd5f73aa18aa0bae2cd8f79f', 4),
(7, 'Сорокин Дмитрий Ильич', '89219567841', 'login12', '0bd0fe6372c64e09c4ae81e056a9dbda', 4),
(8, 'Белоусов Егор Ярославович', '89219567842', 'login13', 'c868bff94e54b8eddbdbce22159c0299', 4),
(9, 'Суслов Михаил Александрович', '89219567843', 'login14', 'd1f38b569c772ebb8fa464e1a90c5a00', 4),
(10, 'Васильев Вячеслав Александрович', '89219567844', 'login15', 'b279786ec5a7ed00dbe4d3fe1516c121', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `customer_id` (`master_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `customer_id_2` (`customer_id`);

--
-- Индексы таблицы `request_status`
--
ALTER TABLE `request_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `request_status`
--
ALTER TABLE `request_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Ограничения внешнего ключа таблицы `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `request_status` (`id`),
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `requests_ibfk_3` FOREIGN KEY (`master_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `requests_ibfk_4` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `requests_ibfk_5` FOREIGN KEY (`customer_id`) REFERENCES `role` (`id`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

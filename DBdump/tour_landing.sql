-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 22 2022 г., 12:24
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tour_landing`
--

-- --------------------------------------------------------

--
-- Структура таблицы `description`
--

CREATE TABLE `description` (
  `ID` int NOT NULL,
  `IDTour` int NOT NULL,
  `IDMedia` int NOT NULL,
  `HeadDescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `description`
--

INSERT INTO `description` (`ID`, `IDTour`, `IDMedia`, `HeadDescription`, `Description`) VALUES
(1, 1, 2, 'Посетите озеро Любви в горах Архыза', 'Отличное место для активного отдыха'),
(3, 1, 6, '3000м над уровнем моря', 'На вершинах открывается безупречный вид на коры кавказа'),
(4, 1, 5, 'Софийские озера', 'До озер сложно добраться, но для неподготовленных на пути встречаются красивые Софийские водопады'),
(5, 3, 7, 'Красивые водопады', ''),
(6, 3, 8, 'Голубые реки в горах', ''),
(7, 3, 9, 'Дагестанские каньоны', 'Захватывающие формы'),
(8, 2, 10, 'Горные реки', ''),
(9, 2, 11, 'Завлекающие виды и свежий воздух', 'Для тех, кто ищет вдохновление'),
(10, 2, 12, 'Эльбрус недалеко!', 'В хорошую погоду можно отчетливо увидеть вершины Эльбруса');

-- --------------------------------------------------------

--
-- Структура таблицы `media`
--

CREATE TABLE `media` (
  `ID` int NOT NULL,
  `MediaType` text NOT NULL,
  `FileName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `media`
--

INSERT INTO `media` (`ID`, `MediaType`, `FileName`) VALUES
(1, 'Video', 'arkhyz'),
(2, 'Image', 'arkhyza'),
(3, 'Video', 'dombai'),
(4, 'Video', 'dagestan'),
(5, 'Image', 'arkhyzb'),
(6, 'Image', 'arkhyzc'),
(7, 'Image', 'dagestana'),
(8, 'Image', 'dagestanb'),
(9, 'Image', 'dagestanc'),
(10, 'Image', 'dombaia'),
(11, 'Image', 'dombaib'),
(12, 'Image', 'dombaic');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `ID` int NOT NULL,
  `IDTour` int NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `PhoneNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`ID`, `IDTour`, `FirstName`, `PhoneNumber`) VALUES
(2, 3, 'Данил', '89008007060'),
(3, 1, 'Виктория', '89247482927');

-- --------------------------------------------------------

--
-- Структура таблицы `tour`
--

CREATE TABLE `tour` (
  `ID` int NOT NULL,
  `Name` text NOT NULL,
  `Cost` double NOT NULL,
  `IDMedia` int NOT NULL,
  `Active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tour`
--

INSERT INTO `tour` (`ID`, `Name`, `Cost`, `IDMedia`, `Active`) VALUES
(1, 'Архыз', 9990, 1, 1),
(2, 'Домбай', 14990, 3, 1),
(3, 'Дагестан', 16490, 4, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `description`
--
ALTER TABLE `description`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `description`
--
ALTER TABLE `description`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `media`
--
ALTER TABLE `media`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tour`
--
ALTER TABLE `tour`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

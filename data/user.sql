-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 10 2023 г., 23:03
-- Версия сервера: 10.4.14-MariaDB
-- Версия PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `user`
--

-- --------------------------------------------------------

--
-- Структура таблицы `sotrudnikroles`
--

CREATE TABLE `sotrudnikroles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `sotrudnikroles`
--

INSERT INTO `sotrudnikroles` (`id`, `name`) VALUES
(1, 'Бухгалтер'),
(2, 'Директор по развитию'),
(3, 'Менеджер по работе с клиентами'),
(4, 'Руководитель отдела технической поддержки'),
(5, 'Руководитель по работе с клиентами'),
(6, 'Специалист ТП (выездной инженер)'),
(7, 'Технический департамент');

-- --------------------------------------------------------

--
-- Структура таблицы `sotrudniks`
--

CREATE TABLE `sotrudniks` (
  `Num` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `SecondName` varchar(100) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `sotrudniks`
--

INSERT INTO `sotrudniks` (`Num`, `Password`, `SecondName`, `FirstName`, `LastName`, `role`) VALUES
('ID1516', '1516', 'Шилов', 'Вольдемар', 'Степанович', 5),
('ID1517', '1517', 'Мясников', 'Власий', 'Лаврентьевич', 4),
('ID1518', '1518', 'Макаров', 'Овидий', 'Вячеславович', 6),
('ID1519', '1519', 'Рябов', 'Валентин', 'Миронович', 6),
('ID1520', '1520', 'Архипов', 'Валентин', 'Богуславович', 6),
('ID1521', '1521', 'Федосеев', 'Август', 'Аристархович', 6),
('ID1522', '1522', 'Козлов', 'Азарий', 'Владимирович', 6),
('ID1523', '1523', 'Кондратьев', 'Владислав', 'Агафонович', 6),
('ID1524', '1524', 'Лапин', 'Альфред', 'Александрович', 6),
('ID1525', '1525', 'Тимофеев', 'Май', 'Филиппович', 6),
('ID1526', '1526', 'Сидоров', 'Арсений', 'Богуславович', 2),
('ID1527', '1527', 'Самсонов', 'Егор', 'Тимофеевич', 7),
('ID1528', '1528', 'Журавлёв', 'Панкрат', 'Валерьянович', 7),
('ID1529', '1529', 'Жуков', 'Виталий', 'Проклович', 7),
('ID1530', '1530', 'Якушев', 'Гордий', 'Гордеевич', 7),
('ID1531', '1531', 'Симонова', 'Сильвия', 'Валерьевна', 1),
('ID1532', '1532', 'Дмитриева', 'Вероника', 'Прокловна', 1),
('ID1533', '1533', 'Панова', 'Марина', 'Викторовна', 1),
('ID1534', '1534', 'Афанасьева', 'Дарина', 'Львовна', 3),
('ID1535', '1535', 'Шубина', 'Мелитта', 'Тарасовна', 3),
('ID1536', '1536', 'Белякова', 'Элла', 'Игнатьевна', 3),
('ID1537', '1537', 'Осипова', 'Индира', 'Оскаровна', 3),
('ID1538', '1538', 'Ефремова', 'Анна', 'Николаевна', 3),
('ID1539', '1539', 'Симонова', 'Герда', 'Наумовна', 3),
('ID1540', '1540', 'Авдеева', 'Нега', 'Евгеньевна', 3),
('ID1541', '1541', 'Никифорова', 'Алиса', 'Робертовна', 3),
('ID1542', '1542', 'Семёнова', 'Габриэлла', 'Иринеевна', 3),
('ID1543', '1543', 'Авдеева', 'Таисия', 'Анатольевна', 3),
('ID1544', '1544', 'Мухина', 'Доминика', 'Лукьяновна', 3),
('ID1545', '1545', 'Муравьёва', 'Римма', 'Максовна', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sotrudnikroles`
--
ALTER TABLE `sotrudnikroles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sotrudniks`
--
ALTER TABLE `sotrudniks`
  ADD PRIMARY KEY (`Num`),
  ADD KEY `role` (`role`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `sotrudnikroles`
--
ALTER TABLE `sotrudnikroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `sotrudniks`
--
ALTER TABLE `sotrudniks`
  ADD CONSTRAINT `sotrudniks_ibfk_1` FOREIGN KEY (`role`) REFERENCES `sotrudnikroles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

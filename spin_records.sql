-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2024 a las 02:27:57
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `spin_records`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `addresses`
--

INSERT INTO `addresses` (`id`, `customerId`, `address`, `city`, `state`, `country`) VALUES
(1, 1, 'calle inventada 1234 ', 'ciudad Pluche', 'Estado Solido', 'Pais imaginario'),
(2, 2, 'Calle falsa 123', 'Pueblo Paleta', 'Guanajuato', 'Mexico'),
(3, 3, 'I put a taqueria on the moon, Calle TheCar 7', 'Sheffield', 'Yorkshire', 'Inglaterra'),
(4, 4, 'Plastic Beach, calle Beatlebum 25', 'Colchester', 'Essex', 'Inglaterra'),
(5, 5, 'Reptilia, Calle LastNite', 'New York', 'New York', 'Estados Unidos de América');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Phone number` int(11) DEFAULT NULL,
  `Address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `Phone number`, `Address`) VALUES
(1, 'Juan Pérez', 'juan.perez@example.com', 'contraseña1', 2147483647, 'Ciudad ficticia, calle arboledas 125'),
(2, 'María López', 'maria.lopez@example.com', 'contraseña2', 2147483647, 'Pueblo paleta, calle venaderos 34'),
(3, 'Alex Turner', 'Papitorner@gmail.com', 'megustamessi1213', 324223455, 'I put a taqueria on the moon, Calle TheCar 7'),
(4, 'Damon Albarn', 'ALBRANN97@gmail.com', 'BluresmejorqueGorillaz', 341490678, 'Plastic Beach, calle Beatlebum 25'),
(5, 'Julian Casablancas', 'JulesC@gmail.com', 'NadieconoceTheVoidz', 456341267, 'Reptilia, Calle LastNite');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `discId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `orderId`, `discId`, `quantity`, `price`) VALUES
(1, 55, 5, 1, 280.00),
(5, 3, 4, 2, 600.00),
(23, 33, 3, 1, 350.00),
(33, 4, 2, 1, 280.00),
(55, 33, 1, 3, 900.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `orderDate` timestamp NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `paymentMethodId` int(11) DEFAULT NULL,
  `Promotions` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `customerId`, `orderDate`, `total`, `paymentMethodId`, `Promotions`) VALUES
(2, 1, '2024-12-04 13:28:27', 300.00, 55, 1),
(3, 3, '2024-12-04 13:28:27', 1500.00, 22, 0),
(4, 5, '2024-12-04 13:29:42', 350.00, 22, 1),
(33, 4, '2024-12-04 13:29:02', 300.00, 2, 0),
(55, 3, '2024-12-04 13:29:02', 1500.00, 22, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paymentmethods`
--

CREATE TABLE `paymentmethods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paymentmethods`
--

INSERT INTO `paymentmethods` (`id`, `name`, `description`) VALUES
(1, 'Tarjeta de crédito	', 'Visa, MasterCard, American Express\r\n'),
(2, 'Apple Pay	', 'Pago digital a través de dispositivos Apple\r\n'),
(12, 'PayPal', 'Pagos rápidos y seguros en línea\r\n'),
(22, 'Stripe', 'Pagos rápidos y seguros en línea\r\n'),
(55, 'Transferencia bancaria', 'Depósito directo a cuenta bancaria\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `artist` varchar(100) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `genre` text NOT NULL
) ;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `title`, `artist`, `year`, `price`, `stock`, `description`, `categoryId`, `genre`) VALUES
(1, 'Blur', 'Blur', 1997, 300.00, 234, 'El álbum homónimo de Blur, lanzado en 1997, presentó un sonido más crudo y experimental, alejándose del Britpop que los había hecho famosos. Incluye su emblemático sencillo \'Song 2\', conocido por su energía y su famoso grito \'Woo-hoo!\'.', NULL, 'Alternative rock'),
(2, 'Favourite Worst Nightmare\r\n', 'Arctic Monkeys\r\n\r\n', 2007, 320.00, 255, 'El segundo álbum de Arctic Monkeys, lanzado en 2007, presenta un sonido más maduro y agresivo que su debut. Destacan canciones como \'Brianstorm\' y \'Fluorescent Adolescent\', mostrando su capacidad para mezclar energía punk con melodías pegajosas.\r\n\r\n', NULL, 'Rock'),
(3, 'OK Computer\r\n', 'Radiohead\r\n\r\n', 1997, 350.00, 45, 'Lanzado en 1997, \'OK Computer\' es uno de los álbumes más aclamados de Radiohead, explorando temas como el aislamiento tecnológico y la alienación moderna. Incluye éxitos como \'Paranoid Android\' y \'Karma Police\'.\r\n\r\n', NULL, 'Alternative Rock'),
(4, 'The New Abnormal\r\n', 'The Strokes\r\n\r\n', 2020, 300.00, 34, 'Lanzado en 2020, \'The New Abnormal\' es el sexto álbum de estudio de The Strokes. Ganador del Grammy al Mejor Álbum de Rock, incluye canciones como \'At the Door\' y \'Ode to the mets\', destacando por su sonido melódico y nostálgico.\r\n\r\n', NULL, 'Rock'),
(5, 'Modern Life is Rubbish\r\n', 'Blur\r\n\r\n', 1993, 280.00, 67, 'El segundo álbum de estudio de Blur, lanzado en 1993, marcó el comienzo del sonido Britpop que definiría su carrera. Con influencias del rock británico de los años 60, este álbum es una crítica al estilo de vida moderno. Canciones destacadas incluyen \'Coping\' y \'Popscene\'.\r\n\r\n', NULL, 'Alternative Rock');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`) VALUES
(1, 'Alternative Rock'),
(3, 'Grunge'),
(5, 'Heavy-Metal'),
(4, 'Post-Punk'),
(2, 'Rock');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `discId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `reviewDate` timestamp NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `reviews`
--

INSERT INTO `reviews` (`id`, `discId`, `customerId`, `rating`, `comment`, `reviewDate`) VALUES
(23, 2, 4, 5, '\"Excelente calidad de audio, muy satisfecho.\"	', '2024-12-04 13:24:52'),
(33, 3, 3, 5, '\"Excelente calidad de audio, muy satisfecho.\"	', '2024-12-04 13:23:20'),
(44, 1, 5, 5, '\"Buena edición, aunque la portada llegó con un ligero daño.\"	', '2024-12-04 13:24:11'),
(45, 5, 2, 4, '\"Buena música, pero el disco tiene algunos saltos.\"	', '2024-12-04 13:23:20'),
(55, 4, 1, 5, '\"Buena edición, aunque la portada llegó con un ligero daño.\"	', '2024-12-04 13:21:27');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerId` (`customerId`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `discId` (`discId`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `paymentMethodId` (`paymentMethodId`);

--
-- Indices de la tabla `paymentmethods`
--
ALTER TABLE `paymentmethods`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Indices de la tabla `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discId` (`discId`),
  ADD KEY `customerId` (`customerId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `paymentmethods`
--
ALTER TABLE `paymentmethods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`);

--
-- Filtros para la tabla `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`discId`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`paymentMethodId`) REFERENCES `paymentmethods` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `discs_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `product_categories` (`id`);

--
-- Filtros para la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`discId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

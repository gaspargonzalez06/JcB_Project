-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2022 a las 22:44:57
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jcb_database2`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `calcularCantidad` (`tiempo` INT, `tiempo_promedio` INT) RETURNS INT(10) BEGIN
    DECLARE Cantidad int(10);
    SET Cantidad = tiempo / tiempo_promedio;
    RETURN Cantidad;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_mantenimiento`
--

CREATE TABLE `categorias_mantenimiento` (
  `Id_Categoria` int(11) NOT NULL,
  `Nombre_Categoria` varchar(30) NOT NULL,
  `Sub_Categoria` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias_mantenimiento`
--

INSERT INTO `categorias_mantenimiento` (`Id_Categoria`, `Nombre_Categoria`, `Sub_Categoria`) VALUES
(1, 'Filtracion', NULL),
(3, 'Lubricacion ', NULL),
(4, 'Desgaste ', NULL),
(5, 'Motor', 'Motor'),
(6, 'Servo_Transmision', NULL),
(7, 'Eje_Delantero', NULL),
(8, 'Eje_Trasero', NULL),
(9, 'Sistemas_Hidraulicos', NULL),
(10, 'Bastidor', NULL),
(11, 'Electrico', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `Id_Equipo` int(11) NOT NULL,
  `Nombre_Equipo` varchar(30) NOT NULL,
  `Imagen` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`Id_Equipo`, `Nombre_Equipo`, `Imagen`) VALUES
(1, '3cx', 'assets/3CX.png'),
(9, 'Equipo2', ''),
(18, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mainlogin`
--

CREATE TABLE `mainlogin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `mainlogin`
--

INSERT INTO `mainlogin` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'Hall Billard', 'admin@jcb.com', '123456', 'admin'),
(2, 'Pablo Pinero', 'colaborador@jcb.com', '123456', 'colab');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `piezas_desgaste`
--

CREATE TABLE `piezas_desgaste` (
  `Id_Pieza` int(11) NOT NULL,
  `Id_Categoria` int(11) NOT NULL,
  `Nombre_Pieza` varchar(200) NOT NULL,
  `Cantidad_Piezas` int(20) NOT NULL,
  `Tiempo_Promedio` int(20) NOT NULL,
  `Precio_unidad` decimal(8,2) NOT NULL,
  `Id_Equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `piezas_desgaste`
--

INSERT INTO `piezas_desgaste` (`Id_Pieza`, `Id_Categoria`, `Nombre_Pieza`, `Cantidad_Piezas`, `Tiempo_Promedio`, `Precio_unidad`, `Id_Equipo`) VALUES
(100, 1, ' Filter Air Cab', 1, 500, '7.93', 1),
(101, 1, ' Filter A/C', 1, 500, '10.00', 1),
(102, 1, ' Engine Oil Filter', 1, 250, '7.36', 1),
(103, 1, ' Belt Drive W/AC', 1, 6000, '25.22', 1),
(104, 1, ' Fan Belt ', 1, 6000, '25.13', 1),
(105, 1, ' Air Filter  Main ', 1, 1000, '22.61', 1),
(106, 1, ' Air Filter Safety ', 1, 1000, '12.80', 1),
(107, 1, ' Main Fuel Filter/Sedimenters', 1, 500, '27.37', 1),
(108, 1, ' Engine Fuel Fileter', 1, 250, '24.53', 1),
(109, 1, ' Rocker Cover Valve', 1, 2000, '16.25', 1),
(110, 1, ' Filter Transmission', 1, 500, '11.10', 1),
(111, 1, ' Hydraulic Cap', 1, 2000, '59.38', 1),
(112, 1, ' Filter Hydraulic', 1, 500, '29.32', 1),
(113, 3, ' Engine Oil 15L', 1, 250, '39.69', 1),
(114, 3, ' Coolant 20.5L', 1, 2000, '8.84', 1),
(115, 3, ' Transmission Oil 11L', 1, 1000, '42.75', 1),
(116, 3, ' Front Axle & hubs Oil 13+4L', 1, 1000, '51.55', 1),
(117, 3, ' Rear Axle housing Oil 21L', 1, 500, '44.94', 1),
(118, 3, ' Rear hub Oil ', 1, 1000, '51.55', 1),
(119, 3, ' Hydraulic Oil HP46130L', 1, 2000, '30.47', 1),
(120, 3, ' Breaks Oil 1L', 1, 2000, '13.17', 1),
(121, 4, ' Side  Cutter L/H', 1, 1750, '13.63', 1),
(122, 4, ' Side Cutter R/H', 1, 1750, '13.63', 1),
(123, 4, ' Bush Spring ', 1, 1750, '6.97', 1),
(124, 4, ' Tooth bolt on Bucket', 1, 1750, '6.54', 1),
(125, 4, ' Tooth bolt  on Shovel', 1, 1750, '6.54', 1),
(126, 4, ' Thooth Tip  Forged Pin Lock ', 1, 6700, '9.64', 1),
(127, 4, ' Pin Flex ', 1, 6700, '3.55', 1),
(128, 4, ' Bolt 700mm(2x+both)(2x Sidecutter)', 1, 1750, '1.21', 1),
(129, 4, ' Nut(2 x Tooth)(3 x Sidecutter)', 1, 1750, '0.33', 1),
(130, 4, ' Bearing Liner ', 1, 3000, '2.55', 1),
(131, 4, ' Seal', 1, 3000, '25.50', 1),
(132, 4, ' Kit-spider 106.4 X 34.9 Dia (Grease nipple 816/13275)', 1, 3000, '69.43', 1),
(133, 5, ' Kit sensor Water In Fuel', 1, 5000, '94.08', 1),
(134, 5, ' Injector de combustible ', 4, 6000, '72.15', 1),
(135, 5, ' Sello guardapolvo injector', 4, 6000, '3.48', 1),
(136, 5, ' Empaque tapa de valvulas', 1, 6000, '16.25', 1),
(137, 5, ' Bomba de trasferencia combustible', 1, 6000, '17.64', 1),
(138, 5, ' Bomba de agua', 0, 6700, '57.41', 1),
(139, 5, ' Auto tencionador', 1, 6000, '39.80', 1),
(140, 5, ' Termostado', 1, 4000, '14.43', 1),
(141, 5, ' Poles de guia', 1, 6000, '33.69', 1),
(142, 5, '   Turbo compresor', 0, 6700, '859.05', 1),
(143, 5, '  Kit reparacion bombin', 4, 6000, '73.42', 1),
(144, 5, ' clip sugecion linea de retorno', 4, 2000, '0.47', 1),
(145, 5, '  Motor de arranque', 1, 5000, '225.59', 1),
(146, 5, ' Alternador', 1, 5000, '235.40', 1),
(147, 5, ' Sensor interruptor de temperatura', 1, 6000, '19.72', 1),
(148, 5, ' Interruptor de aceite de motor', 1, 6000, '18.69', 1),
(149, 5, ' Solenoide de corte de combustible, parada de motor', 2, 5500, '40.56', 1),
(150, 5, ' Cable de acelerador bomba de injection m global', 1, 6000, '30.76', 1),
(151, 5, ' Interruptor filtro de aire', 1, 5000, '16.60', 1),
(152, 6, ' Bomba de carga de la transmision ', 1, 6000, '252.61', 1),
(153, 6, ' Sello de la bomba de las transmision ', 1, 6000, '10.83', 1),
(154, 6, ' sello de salida para el eje delantero 4WD ', 1, 6000, '17.60', 1),
(155, 6, ' Sello de salida eje trasero', 1, 6000, '17.60', 1),
(156, 6, ' Tuerca de salida servo a eje trasero', 1, 6000, '8.62', 1),
(157, 6, ' filtro de succion ', 1, 6000, '33.22', 1),
(158, 6, ' empaque de la bomba de transmision', 1, 6000, '14.49', 1),
(159, 6, ' Fuelle de salida de palanca de transision ', 1, 6000, '5.26', 1),
(160, 6, ' Kit de empaquetadura de control de la transmision ', 1, 6000, '12.52', 1),
(161, 6, ' empaque de control de marchas  ', 1, 6000, '9.77', 1),
(162, 6, ' Perno de salida a eje delantero ', 1, 6000, '10.51', 1),
(163, 6, ' Junta de empaque palanca ', 1, 6000, '0.24', 1),
(164, 6, ' Interruptor de presión ', 1, 4000, '16.01', 1),
(165, 7, '   Kit cruceta', 4, 6000, '40.32', 1),
(166, 7, '  Sello de salida eje a hub Delantero ', 2, 6000, '30.01', 1),
(167, 7, '  Sello de entrada al eje delantero ', 1, 5000, '17.60', 1),
(168, 7, '  Sellos del hub ', 2, 5000, '25.50', 1),
(169, 7, '  Oring de los hub ', 2, 5000, '5.61', 1),
(170, 7, '  Sellos del de salida de hub a eje ', 2, 5000, '33.25', 1),
(171, 7, '   Terminales de direccion', 2, 5000, '95.99', 1),
(172, 7, '  Retenedor de articulacion cubos ', 1, 5000, '13.53', 1),
(173, 8, ' Discos de desgaste freno  ', 10, 4000, '31.82', 1),
(174, 8, '  Empaque de piston de freno  ', 2, 4000, '10.31', 1),
(175, 8, ' Empaque de piston de freno ', 2, 4000, '10.17', 1),
(176, 8, ' Empaque de piston de freno  ', 2, 4000, '25.56', 1),
(177, 8, '  Empaque de piston de  freno ', 2, 4000, '14.48', 1),
(178, 8, ' Sello de entrada al eje desde la transmision ', 1, 5000, '17.60', 1),
(179, 8, '  Kit de frenos  ', 1, 5000, '80.03', 1),
(180, 8, ' Tuerca  de ajuste entrada eje, retencion de sello ', 2, 4000, '6.68', 1),
(181, 8, '  Kit cruceta cardan trasero y delantero  ', 4, 4000, '69.43', 1),
(182, 9, ' Filtro estrainer de succion', 1, 2000, '10.78', 1),
(183, 9, ' Tapa de tanque hidraulico', 1, 3500, '25.20', 1),
(184, 9, ' Tapa de tanque hidraulico', 1, 3500, '25.20', 1),
(185, 9, ' Empaque tanque hidraulico ', 1, 3500, '6.22', 1),
(186, 9, 'Empaque tapa alojamiento filtro', 1, 3000, '10.33', 1),
(187, 9, ' Empaquetadura bomba hidraulica ', 1, 6500, '141.94', 1),
(188, 9, ' empaquetadura cilindros de direcccion ', 1, 4000, '68.90', 1),
(189, 9, ' empaquetadura cilindros de elevacion H ', 2, 6000, '17.83', 1),
(190, 9, ' Empaquetadura cilindro de la cuchara ', 2, 6000, '78.86', 1),
(191, 9, ' Empaquetadura cilindros de giro ', 2, 4250, '112.06', 1),
(192, 9, ' Limpiador de spool control cargador y excavador ', 16, 6500, '11.68', 1),
(193, 9, ' Empaque de spool control cargador y excavador. ', 18, 6500, '8.63', 1),
(194, 9, ' Kit de reparacion valvula alivio principal sistema  HCO ', 1, 5000, '14.79', 1),
(195, 9, '  Oring Control', 1, 5000, '2.11', 1),
(196, 9, ' Valvula auxiliar de servicio de la pala ', 1, 6500, '87.87', 1),
(197, 9, ' Valvula auxiliar de servicio de la pala ', 1, 6500, '87.84', 1),
(198, 9, 'Acoplamiento 1-1/16\" 12 UNF, Female Quick Release', 1, 6500, '47.68', 1),
(199, 9, ' Copling QR hembra HQ19-12SAE ', 1, 6500, '90.24', 1),
(200, 10, ' Bujes brazo H superior ', 2, 3500, '35.08', 1),
(201, 10, ' Buje montaje brazo excavador ', 3, 3500, '9.01', 1),
(202, 10, ' Bujes de pala parte inferior', 4, 3500, '14.68', 1),
(203, 10, ' Pasadores de la cuchara', 2, 3500, '46.38', 1),
(204, 10, ' Bujes de leva cuchara', 2, 3500, '14.09', 1),
(205, 10, ' Bujes de la cuchara de la punta extrading', 2, 3500, '2.55', 1),
(206, 10, ' Esparrago de ruedas', 10, 3500, '2.12', 1),
(207, 10, ' Tuercas de ruedas', 10, 3500, '4.47', 1),
(208, 10, ' Tapa tanque de combustible', 1, 5000, '15.77', 1),
(209, 11, ' Sensor de freno de estacionamiento ', 0, 5000, '21.48', 1),
(210, 11, ' Swich principal', 1, 4500, '32.21', 1),
(211, 11, ' Interruptor de proximidad', 1, 4500, '61.65', 1),
(212, 1, 'Pieza 1 prueba', 2, 500, '12.55', 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias_mantenimiento`
--
ALTER TABLE `categorias_mantenimiento`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`Id_Equipo`);

--
-- Indices de la tabla `mainlogin`
--
ALTER TABLE `mainlogin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `piezas_desgaste`
--
ALTER TABLE `piezas_desgaste`
  ADD PRIMARY KEY (`Id_Pieza`) USING BTREE,
  ADD KEY `Id_Equipo` (`Id_Equipo`) USING BTREE,
  ADD KEY `Id_Categoria` (`Id_Categoria`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias_mantenimiento`
--
ALTER TABLE `categorias_mantenimiento`
  MODIFY `Id_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `Id_Equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `mainlogin`
--
ALTER TABLE `mainlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `piezas_desgaste`
--
ALTER TABLE `piezas_desgaste`
  MODIFY `Id_Pieza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `piezas_desgaste`
--
ALTER TABLE `piezas_desgaste`
  ADD CONSTRAINT `piezas_desgaste_ibfk_1` FOREIGN KEY (`Id_Categoria`) REFERENCES `categorias_mantenimiento` (`Id_Categoria`),
  ADD CONSTRAINT `piezas_desgaste_ibfk_2` FOREIGN KEY (`Id_Equipo`) REFERENCES `equipo` (`Id_Equipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

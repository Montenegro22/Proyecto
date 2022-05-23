-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-05-2022 a las 03:33:58
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbsistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `idpersona` int(11) NOT NULL,
  `idlaboratorio` int(11) NOT NULL,
  `registroinvima` tinyint(1) NOT NULL DEFAULT 1,
  `expedicioninvima` date DEFAULT NULL,
  `vencimientoinvima` date DEFAULT NULL,
  `unidadmanejo` varchar(20) NOT NULL,
  `cum` varchar(50) NOT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `condicion` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `codigo`, `nombre`, `stock`, `descripcion`, `idpersona`, `idlaboratorio`, `registroinvima`, `expedicioninvima`, `vencimientoinvima`, `unidadmanejo`, `cum`, `imagen`, `condicion`) VALUES
(6, 7, '00458', 'Ligheter', 71, 'modelo lighter de MICRONICS', 0, 0, 0, NULL, NULL, '', '', '1535417422.jpg', 1),
(7, 9, '0040kl', 'disco solido', 62, 'disco marca KINGSTON', 0, 0, 0, NULL, NULL, '', '', '1535417431.jfif', 1),
(8, 9, 'HJL-OP', 'DATATRABEL', 108, 'usb de 15gb', 0, 0, 0, NULL, NULL, '', '', '1535417452.jpg', 1),
(9, 13, 'vogue01', 'Vougue esmalte rojo', 459998, 'Esmalte brillante color rojo marca Vougue', 0, 0, 1, NULL, NULL, '', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `idbodega` int(11) NOT NULL,
  `ubicacionbod` varchar(80) NOT NULL,
  `detallesbod` varchar(200) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidadarticulo` int(11) NOT NULL,
  `capacidadbod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `condicion`) VALUES
(7, 'TECLADOS', 'teclados gamers', 0),
(8, 'CPU\'s', 'cpus gamers de alta categoria', 0),
(9, 'DISCOS DUROS', 'disco solidos', 1),
(12, 'MONITORES', 'monitores gamers', 1),
(13, 'Esmaltes', 'Esmalte para uñas', 1),
(14, 'Labiales', 'Labiales hidratantes con ingredientes naturales', 1),
(15, 'Jabon para rostro', 'jabon loreal para rostro', 1),
(16, 'Botox', 'consiste en pequeñas inyecciones en las áreas a tratar, que consiguen bloquear de forma reversible el impulso nervioso que produce la contracción muscular', 1),
(17, 'Capilares', 'Productos para el cabello', 1),
(18, 'Faciales', 'Productos para el rostro', 1),
(19, 'Vitaminas', 'Supplementos vitaminicos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `idbodega` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_ingreso`
--

INSERT INTO `detalle_ingreso` (`iddetalle_ingreso`, `idingreso`, `idarticulo`, `idbodega`, `cantidad`, `precio_compra`, `precio_venta`) VALUES
(16, 6, 6, 0, 10, '20.00', '30.00'),
(17, 6, 7, 0, 5, '200.00', '250.00'),
(18, 7, 8, 0, 10, '16.00', '25.00'),
(19, 8, 7, 0, 10, '250.00', '300.00'),
(20, 9, 8, 0, 50, '20.00', '30.00'),
(21, 10, 6, 0, 10, '25.00', '30.00'),
(22, 11, 7, 0, 15, '250.00', '300.00'),
(23, 12, 6, 0, 5, '10000.00', '15000.00'),
(24, 12, 7, 0, 3, '130000.00', '140000.00'),
(25, 12, 8, 0, 2, '5000000.00', '5500000.00'),
(26, 12, 7, 0, 1, '350000.00', '400000.00'),
(27, 12, 6, 0, 1, '150000.00', '150000.00'),
(28, 13, 7, 0, 4, '11000.00', '1.00'),
(29, 13, 6, 0, 4, '1.00', '1.00'),
(30, 13, 6, 0, 8, '1.00', '1.00'),
(31, 13, 6, 0, 1, '1.00', '1.00'),
(32, 13, 6, 0, 1, '1.00', '1.00'),
(33, 13, 6, 0, 1, '1.00', '1.00'),
(34, 13, 6, 0, 1, '1.00', '1.00'),
(35, 13, 6, 0, 1, '1.00', '1.00'),
(36, 13, 6, 0, 1, '1.00', '1.00'),
(37, 13, 6, 0, 1, '1.00', '1.00'),
(38, 13, 6, 0, 1, '1.00', '1.00'),
(39, 13, 6, 0, 1, '1.00', '1.00'),
(40, 13, 6, 0, 1, '1.00', '1.00'),
(41, 13, 6, 0, 1, '1.00', '1.00'),
(42, 13, 6, 0, 1, '1.00', '1.00'),
(43, 13, 6, 0, 1, '1.00', '1.00'),
(44, 13, 6, 0, 1, '1.00', '1.00'),
(45, 13, 6, 0, 1, '1.00', '1.00'),
(46, 13, 6, 0, 1, '1.00', '1.00'),
(47, 13, 6, 0, 1, '1.00', '1.00'),
(48, 13, 6, 0, 1, '1.00', '1.00'),
(49, 13, 6, 0, 1, '1.00', '1.00'),
(50, 13, 6, 0, 1, '1.00', '1.00'),
(51, 13, 6, 0, 1, '1.00', '1.00'),
(52, 13, 6, 0, 1, '1.00', '1.00'),
(53, 13, 6, 0, 1, '1.00', '1.00'),
(54, 13, 6, 0, 1, '1.00', '1.00'),
(55, 13, 6, 0, 1, '1.00', '1.00'),
(56, 13, 6, 0, 1, '1.00', '1.00'),
(57, 13, 6, 0, 1, '1.00', '1.00'),
(58, 13, 6, 0, 1, '1.00', '1.00'),
(59, 13, 6, 0, 1, '1.00', '1.00'),
(60, 13, 6, 0, 1, '1.00', '1.00'),
(61, 13, 6, 0, 1, '1.00', '1.00');

--
-- Disparadores `detalle_ingreso`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockIngreso` AFTER INSERT ON `detalle_ingreso` FOR EACH ROW BEGIN
UPDATE articulo SET stock=stock + NEW.cantidad
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`) VALUES
(12, 10, 6, 10, '30.00', '5.00'),
(13, 10, 7, 10, '250.00', '10.00'),
(14, 11, 6, 1, '30.00', '0.00'),
(15, 11, 7, 1, '250.00', '0.00'),
(16, 12, 7, 4, '250.00', '0.00'),
(17, 13, 7, 1, '250.00', '10.00'),
(18, 14, 7, 2, '250.00', '10.00'),
(19, 15, 6, 1, '30.00', '10.00'),
(20, 16, 7, 1, '250.00', '5.00'),
(21, 17, 7, 1, '250.00', '5.00'),
(22, 18, 6, 1, '30.00', '0.00'),
(23, 19, 7, 1, '250.00', '2.00'),
(24, 20, 8, 2, '25.00', '0.00'),
(25, 21, 6, 1, '30.00', '5.00'),
(26, 22, 6, 1, '30.00', '0.00'),
(27, 22, 7, 1, '300.00', '0.00'),
(28, 22, 8, 1, '30.00', '0.00'),
(29, 23, 6, 2, '150000.00', '5000.00'),
(30, 23, 7, 2, '400000.00', '1000.00'),
(31, 24, 6, 1, '1.00', '0.00'),
(32, 24, 7, 1, '1.00', '0.00'),
(33, 24, 8, 1, '5500000.00', '0.00'),
(34, 25, 9, 1, '460.00', '0.00'),
(35, 26, 9, 1, '60000.00', '0.00'),
(36, 27, 7, 1, '1.00', '0.00');

--
-- Disparadores `detalle_venta`
--
DELIMITER $$
CREATE TRIGGER `tr_udpStockVenta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
UPDATE articulo SET stock = stock - NEW.cantidad
WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idbodega` int(11) DEFAULT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`idingreso`, `idproveedor`, `idusuario`, `idbodega`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_compra`, `estado`) VALUES
(6, 7, 1, NULL, 'Factura', '001', '0001', '2018-08-20 00:00:00', '18.00', '1200.00', 'Aceptado'),
(7, 7, 1, NULL, 'Factura', '001', '008', '2018-08-21 00:00:00', '18.00', '160.00', 'Aceptado'),
(8, 7, 1, NULL, 'Boleta', '0002', '0004', '2018-08-22 00:00:00', '0.00', '2500.00', 'Aceptado'),
(9, 9, 1, NULL, 'Factura', '001', '0005', '2018-08-23 00:00:00', '18.00', '1000.00', 'Aceptado'),
(10, 10, 1, NULL, 'Factura', '001', '0006', '2018-08-25 00:00:00', '18.00', '250.00', 'Aceptado'),
(11, 10, 1, NULL, 'Factura', '001', '0007', '2018-08-27 00:00:00', '18.00', '3750.00', 'Aceptado'),
(12, 9, 1, NULL, 'Boleta', '1204', '333333', '2022-04-11 00:00:00', '99.99', '5.00', 'Aceptado'),
(13, 12, 2, NULL, 'Ticket', '1111', '3203200', '2022-04-11 00:00:00', '99.99', '34.00', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `idlaboratorio` int(11) NOT NULL,
  `descripcionlab` text NOT NULL,
  `nombrelab` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Almacen'),
(3, 'Compras'),
(4, 'Ventas'),
(5, 'Acceso'),
(6, 'Consulta Compras'),
(7, 'Consulta Ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`) VALUES
(7, 'Proveedor', 'INKA-PC S.R.L', 'RUT', '12587845254', 'Av. los pinos 201', '54328730', 'inkapc@hotmail.com'),
(8, 'Cliente', 'publico general', 'DNI', '30224520', 'Av.jose olaya 215', '54325230', 'public@hotmail.com'),
(9, 'Proveedor', 'TECNO-PC', 'RUT', '20485248751', 'Calle los naranjales 245', '054587852', 'tecno@gmail.com'),
(10, 'Proveedor', 'INFONET', 'RUT', '40485245824', 'Av. quiñones 102', '054789854', 'infonet@hotmail.com'),
(11, 'Cliente', 'pedro', 'DNI', '458521748', 'Simon bolivar 120', '78954263', 'pedro@gmailcom'),
(12, 'Proveedor', 'OMAR CHAPARRO', 'CEDULA', '10000000', 'calle 13', '3200000', 'Omar1@correo.com'),
(13, 'Cliente', 'marta lucia', 'CEDULA', '101010101', 'calle 13, medellin', '23451652', 'marta@gmail.com'),
(14, 'Cliente', 'Peluqueria bellezas', 'DNI', '999999', 'Bogota DC', '3205643726', 'pelubellezas@gmail.com'),
(15, 'Cliente', 'Alejandro Cicery', 'CEDULA', '33333333', 'Carrera 113', '28282717836', 'alejo@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `login` varchar(20) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `condicion` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`) VALUES
(1, 'Oscar Cicery', 'CEDULA', '10000000', 'Colombia', '3203826569', 'oscar@gmail.com', 'Administrador', 'oscar', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '1649818169.png', 1),
(2, 'Camilo', 'DNI', '78952358', 'Colombia', '985632589', 'camilo@hotmail.com', 'empleado', 'camilo', '173af653133d964edfc16cafe0aba33c8f500a07f3ba3f81943916910c257705', '1649818191.png', 1),
(3, 'admin', 'CEDULA', '89562135', 'Colombia', '95424152', 'admin@hotmail.com', 'Administrador', 'admin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '1649818044.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(148, 3, 1),
(149, 3, 2),
(150, 3, 3),
(151, 3, 4),
(152, 3, 5),
(153, 3, 6),
(154, 3, 7),
(162, 2, 1),
(163, 2, 2),
(164, 2, 3),
(165, 2, 4),
(166, 2, 5),
(167, 2, 6),
(168, 2, 7),
(169, 1, 1),
(170, 1, 2),
(171, 1, 3),
(172, 1, 4),
(173, 1, 5),
(174, 1, 6),
(175, 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `tipoventa` varchar(20) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `impuesto` decimal(4,2) DEFAULT NULL,
  `total_venta` decimal(11,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `tipoventa`, `fecha_hora`, `impuesto`, `total_venta`, `estado`) VALUES
(10, 8, 1, 'Boleta', '001', '0001', '2018-01-08 00:00:00', '0.00', '11800.15', 'Anulado'),
(11, 8, 1, 'Factura', '001', '0002', '2018-03-05 00:00:00', '18.00', '3800.00', 'Anulado'),
(12, 8, 1, 'Ticket', '001', '0001', '2018-04-17 00:00:00', '0.00', '1000.00', 'Anulado'),
(13, 8, 1, 'Factura', '001', '0002', '2018-06-09 00:00:00', '18.00', '240.00', 'Anulado'),
(14, 8, 1, 'Factura', '20', '30', '2018-07-24 00:00:00', '18.00', '490.00', 'Anulado'),
(15, 8, 1, 'Factura', '001', '0008', '2018-08-26 00:00:00', '18.00', '20.00', 'Anulado'),
(16, 8, 1, 'Boleta', '001', '0070', '2018-08-26 00:00:00', '0.00', '245.00', 'Anulado'),
(17, 8, 1, 'Factura', '002', '0004', '2018-08-26 00:00:00', '18.00', '245.00', 'Anulado'),
(18, 8, 1, 'Boleta', '001', '0006', '2018-08-26 00:00:00', '0.00', '30.00', 'Anulado'),
(19, 8, 1, 'Factura', '001', '0009', '2018-08-26 00:00:00', '18.00', '248.00', 'Anulado'),
(20, 8, 1, 'Factura', '001', '002', '2018-08-26 00:00:00', '18.00', '50.00', 'Anulado'),
(21, 8, 1, 'Factura', '001', '0004', '2018-08-27 00:00:00', '18.00', '25.00', 'Anulado'),
(22, 11, 1, 'Ticket', '001', '0004', '2018-08-27 00:00:00', '0.00', '360.00', 'Anulado'),
(23, 13, 1, 'Factura', '1234', '123345', '2022-04-11 00:00:00', '99.99', '550000.00', 'Anulado'),
(24, 14, 2, 'Boleta', '1204', '123345', '2022-04-11 00:00:00', '99.99', '5500002.00', 'Anulado'),
(25, 8, 3, 'Factura', '1111', '', '2022-04-13 00:00:00', '19.00', '0.00', 'Anulado'),
(26, 8, 3, 'Factura', '0000', '', '2022-04-13 00:00:00', '18.00', '0.00', 'Anulado'),
(27, 13, 3, 'Boleta', '00001', 'Cotizacion', '2022-04-15 00:00:00', '99.99', '1.00', 'Anulado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`idarticulo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD KEY `fk_articulo_categoria_idx` (`idcategoria`),
  ADD KEY `idlaboratorio` (`idlaboratorio`),
  ADD KEY `idpersona` (`idpersona`);

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`idbodega`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`iddetalle_ingreso`),
  ADD KEY `fk_detalle_ingreso_idx` (`idingreso`),
  ADD KEY `fk_detalle_articulo_idx` (`idarticulo`),
  ADD KEY `idbodega` (`idbodega`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`iddetalle_venta`),
  ADD KEY `fk_detalle_venta_venta_idx` (`idventa`),
  ADD KEY `fk_detalle_venta_articulo_idx` (`idarticulo`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`idingreso`),
  ADD KEY `fk_ingreso_persona_idx` (`idproveedor`),
  ADD KEY `fk_ingreso_usuario_idx` (`idusuario`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`idlaboratorio`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- Indices de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD PRIMARY KEY (`idusuario_permiso`),
  ADD KEY `fk_u_permiso_usuario_idx` (`idusuario`),
  ADD KEY `fk_usuario_permiso_idx` (`idpermiso`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_venta_persona_idx` (`idcliente`),
  ADD KEY `fk_venta_usuario_idx` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `idarticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `bodega`
--
ALTER TABLE `bodega`
  MODIFY `idbodega` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `idingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `idlaboratorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `idpermiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  MODIFY `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD CONSTRAINT `fk_detalle_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_ingreso` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_permiso`
--
ALTER TABLE `usuario_permiso`
  ADD CONSTRAINT `fk_u_permiso_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_permiso` FOREIGN KEY (`idpermiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_persona` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE TABLE `detalle_cotizacion` (
  `iddetalle_cotizacion` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Indices de la tabla `detalle_cotizacion`
--
ALTER TABLE `detalle_cotizacion`
  ADD PRIMARY KEY (`iddetalle_cotizacion`),
  ADD KEY `fk_detalle_cotizacion_venta_idx` (`idventa`),
  ADD KEY `fk_detalle_cotizacion_articulo_idx` (`idarticulo`);



--
-- Filtros para la tabla `detalle_cotizacion`
--
ALTER TABLE `detalle_cotizacion`
  ADD CONSTRAINT `fk_detalle_cotizacion_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_cotizacion_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION;


--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_cotizacion`
  MODIFY `iddetalle_cotizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

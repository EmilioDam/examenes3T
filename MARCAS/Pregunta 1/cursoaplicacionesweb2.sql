-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2023 a las 16:43:06
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cursoaplicacionesweb2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Idclientes` int(255) NOT NULL,
  `usuario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Aquí voy a guardar los datos de mis usuarios';

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Idclientes`, `usuario`, `password`, `nombre`, `apellidos`, `email`, `direccion`, `telefono`) VALUES
(1, 'rosa', 'rosacontra', 'Rosa', 'Gomez Ruíz', 'rosi@gmail.com', 'C/ Las Tablas', '654456655'),
(3, 'pepa', 'pepapepa', 'Manuela', 'Sierra', 'mansi@mail.com', 'C/ Laurel', '655478897'),
(5, 'Emilio', 'contrasena', 'Emilio', 'Cifuentes Lloret', 'emilio@gmail.com', 'C/ Pintor Sorolla', '652224477'),
(6, 'juan', 'juancontra', 'juan', 'garcia', 'juan@gmail.com', 'C/ Mi dirección', '652478954'),
(16, 'admin', 'admin', 'Emilio', 'Cifuentes Lloret', 'emilio@gmail.com', 'C/ La fuente', '622547898');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `existencias`
--

CREATE TABLE `existencias` (
  `Identificador` int(25) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `cantidad` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `existencias`
--

INSERT INTO `existencias` (`Identificador`, `producto`, `cantidad`) VALUES
(2, 'Impresora Kyocera', 3),
(3, 'Toner negro', 36),
(4, 'Toner Cyan', 36),
(5, 'Toner Amarillo', 36),
(6, 'Toner Azul', 36),
(7, 'Pantalla 19\" 4K', 16),
(8, 'Raton ergonomico a pilar', 42),
(9, 'Disco duro SATA 1 TB', 13),
(10, 'Disco duro SSD 2 TB', 16),
(11, 'Teclado gamer', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gestion`
--

CREATE TABLE `gestion` (
  `Identificador` int(255) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `precio` decimal(4,2) NOT NULL,
  `peso` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `dimensiones` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `unidades` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `gestion`
--

INSERT INTO `gestion` (`Identificador`, `nombre`, `descripcion`, `precio`, `peso`, `dimensiones`, `unidades`) VALUES
(1, 'Toner', 'Toner de color negro', '8.00', '0.5', '20x30x20', 1),
(2, 'Impresora', 'Impresora KYOCERA toner', '99.99', '5.0', '40x50x20', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `Identificador` int(255) NOT NULL,
  `idusuario` int(255) NOT NULL,
  `idproducto` int(255) NOT NULL,
  `cantidad` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`Identificador`, `idusuario`, `idproducto`, `cantidad`) VALUES
(1, 1, 2, 1),
(3, 3, 1, 4),
(5, 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproductos` int(11) NOT NULL,
  `nombreproducto` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `precio` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproductos`, `nombreproducto`, `descripcion`, `precio`) VALUES
(2, 'Raton', 'Raton a bateria', '35€'),
(3, 'Teclado', 'Teclado gamer', '68€'),
(4, 'Pantalla', 'Pantalla 19\" 4k', '255€'),
(5, 'Raton', 'Raton ergonómico a pilas', '20€'),
(6, 'Disco duro', 'Disco duro SATA 1 tb', '68€'),
(7, 'Disco duro', 'Disco duro SSD 2TB', '156€'),
(8, 'Impresora', 'Impresora a toner KYOCERA ', '355€'),
(9, 'Toner', 'Toner color negro', '8€'),
(10, 'Toner', 'Toner color azul', '8€'),
(11, 'Toner', 'Toner color Cyan', '8€'),
(12, 'Toner', 'Toner color amarillo', '8€');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Identificador` int(255) NOT NULL,
  `usuario` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Aquí voy a guardar los datos de mis usuarios';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Identificador`, `usuario`, `password`, `nombre`, `apellidos`, `email`, `direccion`, `telefono`) VALUES
(1, 'rosa', 'rosacontra', 'Rosa', 'Gomez Ruíz', 'rosi@gmail.com', 'C/ Las Tablas', '654456655'),
(3, 'pepa', 'pepapepa', 'Manuela', 'Sierra', 'mansi@mail.com', 'C/ Laurel', '655478897'),
(5, 'Emilio', 'contrasena', 'Emilio', 'Cifuentes Lloret', 'emilio@gmail.com', 'C/ Pintor Sorolla', '652224477'),
(6, 'juan', 'juancontra', 'juan', 'garcia', 'juan@gmail.com', 'C/ Mi dirección', '652478954'),
(16, 'admin', 'admin', 'Emilio', 'Cifuentes Lloret', 'emilio@gmail.com', 'C/ La fuente', '622547898');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ventas_clientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ventas_clientes` (
`Nombre del cliente` varchar(255)
,`Apellidos del cliente` varchar(255)
,`Correo del cliente` varchar(255)
,`Dirección del cliente` varchar(255)
,`Teléfono del cliente` varchar(255)
,`Producto` varchar(55)
,`Descripción` varchar(255)
,`Precio del producto` varchar(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `ventas_clientes`
--
DROP TABLE IF EXISTS `ventas_clientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ventas_clientes`  AS SELECT `clientes`.`nombre` AS `Nombre del cliente`, `clientes`.`apellidos` AS `Apellidos del cliente`, `clientes`.`email` AS `Correo del cliente`, `clientes`.`direccion` AS `Dirección del cliente`, `clientes`.`telefono` AS `Teléfono del cliente`, `productos`.`nombreproducto` AS `Producto`, `productos`.`descripcion` AS `Descripción`, `productos`.`precio` AS `Precio del producto` FROM (`clientes` left join `productos` on(`clientes`.`Idclientes` = `productos`.`idproductos`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Idclientes`);

--
-- Indices de la tabla `existencias`
--
ALTER TABLE `existencias`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `gestion`
--
ALTER TABLE `gestion`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Identificador`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproductos`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Identificador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Idclientes` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `existencias`
--
ALTER TABLE `existencias`
  MODIFY `Identificador` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `gestion`
--
ALTER TABLE `gestion`
  MODIFY `Identificador` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `Identificador` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproductos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Identificador` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

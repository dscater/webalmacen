-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-05-2024 a las 16:41:43
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `webalmacen_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'CATEGORIA #1', 'DESC. CAT. 1', '2024-05-16', '2024-05-16 15:55:33', '2024-05-16 15:55:33'),
(2, 'CATEGORIA #2', '', '2024-05-16', '2024-05-16 15:55:38', '2024-05-16 15:55:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `razon_social`, `ciudad`, `dir`, `fono`, `correo`, `web`, `actividad`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'WEBALMACEN', 'WA', 'WEBALMACEN S.A.', 'LA PAZ', 'LOS OLIVOS', '7777777', 'WEBALMACEN@GMAIL.COM', 'WEBALMACEN.COM', 'ACTIVIDAD', '1710002413_1.jpg', NULL, '2024-03-09 16:40:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-05-09 13:06:14<br/>', NULL, 'USUARIOS', '2024-05-09', '13:06:14', '2024-05-09 17:06:14', '2024-05-09 17:06:14'),
(2, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PROVEEDOR', 'id: 1<br/>razon_social: PROVEEDOR #1 S.A.<br/>nit: 111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESCRIPCION PROVEEDOR 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:47:54<br/>updated_at: 2024-05-16 11:47:54<br/>', NULL, 'PROVEEDORES', '2024-05-16', '11:47:54', '2024-05-16 15:47:54', '2024-05-16 15:47:54'),
(3, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROVEEDOR', 'id: 1<br/>razon_social: PROVEEDOR #1 S.A.<br/>nit: 111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESCRIPCION PROVEEDOR 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:47:54<br/>updated_at: 2024-05-16 11:47:54<br/>', 'id: 1<br/>razon_social: PROVEEDOR #1 S.A.<br/>nit: 111111<br/>dir: LOS OLIVOSA<br/>nombre_contacto: JUAN PERESA<br/>fono: 77777777A<br/>descripcion: DESCRIPCION PROVEEDOR 1A<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:47:54<br/>updated_at: 2024-05-16 11:48:46<br/>', 'PROVEEDORES', '2024-05-16', '11:48:46', '2024-05-16 15:48:46', '2024-05-16 15:48:46'),
(4, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROVEEDOR', 'id: 1<br/>razon_social: PROVEEDOR #1 S.A.<br/>nit: 111111<br/>dir: LOS OLIVOSA<br/>nombre_contacto: JUAN PERESA<br/>fono: 77777777A<br/>descripcion: DESCRIPCION PROVEEDOR 1A<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:47:54<br/>updated_at: 2024-05-16 11:48:46<br/>', 'id: 1<br/>razon_social: PROVEEDOR #1 S.A.<br/>nit: 111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESCRIPCION PROVEEDOR 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:47:54<br/>updated_at: 2024-05-16 11:48:54<br/>', 'PROVEEDORES', '2024-05-16', '11:48:54', '2024-05-16 15:48:54', '2024-05-16 15:48:54'),
(5, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN PROVEEDOR', 'id: 1<br/>razon_social: PROVEEDOR #1 S.A.<br/>nit: 111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESCRIPCION PROVEEDOR 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:47:54<br/>updated_at: 2024-05-16 11:48:54<br/>', NULL, 'PROVEEDORES', '2024-05-16', '11:49:09', '2024-05-16 15:49:09', '2024-05-16 15:49:09'),
(6, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PROVEEDOR', 'id: 1<br/>razon_social: PROVEEDOR #1 S.A.<br/>nit: 1111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESC. PROVEEDOR #1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:45<br/>updated_at: 2024-05-16 11:49:45<br/>', NULL, 'PROVEEDORES', '2024-05-16', '11:49:45', '2024-05-16 15:49:45', '2024-05-16 15:49:45'),
(7, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PROVEEDOR', 'id: 2<br/>razon_social: PROVEEDOR #2 S.R.L.<br/>nit: 123123123123<br/>dir: <br/>nombre_contacto: <br/>fono: <br/>descripcion: <br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:57<br/>updated_at: 2024-05-16 11:49:57<br/>', NULL, 'PROVEEDORES', '2024-05-16', '11:49:57', '2024-05-16 15:49:57', '2024-05-16 15:49:57'),
(8, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 1<br/>nombre: CATEGORIA #1<br/>descripcion: DESC. CAT. 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:04<br/>updated_at: 2024-05-16 11:55:04<br/>', NULL, 'CATEGORIAS', '2024-05-16', '11:55:04', '2024-05-16 15:55:04', '2024-05-16 15:55:04'),
(9, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 1<br/>nombre: CATEGORIA #1<br/>descripcion: DESC. CAT. 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:04<br/>updated_at: 2024-05-16 11:55:04<br/>', 'id: 1<br/>nombre: CATEGORIA #1S<br/>descripcion: DESC. CAT. 1S<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:04<br/>updated_at: 2024-05-16 11:55:09<br/>', 'CATEGORIAS', '2024-05-16', '11:55:09', '2024-05-16 15:55:09', '2024-05-16 15:55:09'),
(10, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 1<br/>nombre: CATEGORIA #1S<br/>descripcion: DESC. CAT. 1S<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:04<br/>updated_at: 2024-05-16 11:55:09<br/>', 'id: 1<br/>nombre: CATEGORIA #1<br/>descripcion: DESC. CAT. 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:04<br/>updated_at: 2024-05-16 11:55:13<br/>', 'CATEGORIAS', '2024-05-16', '11:55:13', '2024-05-16 15:55:13', '2024-05-16 15:55:13'),
(11, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA CATEGORIA', 'id: 1<br/>nombre: CATEGORIA #1<br/>descripcion: DESC. CAT. 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:04<br/>updated_at: 2024-05-16 11:55:13<br/>', NULL, 'CATEGORIAS', '2024-05-16', '11:55:20', '2024-05-16 15:55:20', '2024-05-16 15:55:20'),
(12, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 1<br/>nombre: CATEGORIA #1<br/>descripcion: DESC. CAT. 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:33<br/>updated_at: 2024-05-16 11:55:33<br/>', NULL, 'CATEGORIAS', '2024-05-16', '11:55:33', '2024-05-16 15:55:33', '2024-05-16 15:55:33'),
(13, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 2<br/>nombre: CATEGORIA #2<br/>descripcion: <br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:38<br/>updated_at: 2024-05-16 11:55:38<br/>', NULL, 'CATEGORIAS', '2024-05-16', '11:55:38', '2024-05-16 15:55:38', '2024-05-16 15:55:38'),
(14, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN TIPO DE PRODUCTO', 'id: 1<br/>nombre: TIPO PRODUCTO #1<br/>descripcion: DESC. TIPO 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 12:00:18<br/>updated_at: 2024-05-16 12:00:18<br/>', NULL, 'TIPO DE PRODUCTOS', '2024-05-16', '12:00:18', '2024-05-16 16:00:18', '2024-05-16 16:00:18'),
(15, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN TIPO DE PRODUCTO', 'id: 1<br/>nombre: TIPO PRODUCTO #1<br/>descripcion: DESC. TIPO 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 12:00:18<br/>updated_at: 2024-05-16 12:00:18<br/>', 'id: 1<br/>nombre: TIPO PRODUCTO #1A<br/>descripcion: DESC. TIPO 1A<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 12:00:18<br/>updated_at: 2024-05-16 12:00:22<br/>', 'TIPO DE PRODUCTOS', '2024-05-16', '12:00:22', '2024-05-16 16:00:22', '2024-05-16 16:00:22'),
(16, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN TIPO DE PRODUCTO', 'id: 1<br/>nombre: TIPO PRODUCTO #1A<br/>descripcion: DESC. TIPO 1A<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 12:00:18<br/>updated_at: 2024-05-16 12:00:22<br/>', NULL, 'TIPO DE PRODUCTOS', '2024-05-16', '12:00:26', '2024-05-16 16:00:26', '2024-05-16 16:00:26'),
(17, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN TIPO DE PRODUCTO', 'id: 1<br/>nombre: TIPO PRODUCTO #1<br/>descripcion: DESC. TIPO 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 12:00:44<br/>updated_at: 2024-05-16 12:00:44<br/>', NULL, 'TIPO DE PRODUCTOS', '2024-05-16', '12:00:44', '2024-05-16 16:00:44', '2024-05-16 16:00:44'),
(18, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN TIPO DE PRODUCTO', 'id: 2<br/>nombre: TIPO PRODUCTO #2<br/>descripcion: <br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 12:00:50<br/>updated_at: 2024-05-16 12:00:50<br/>', NULL, 'TIPO DE PRODUCTOS', '2024-05-16', '12:00:50', '2024-05-16 16:00:50', '2024-05-16 16:00:50'),
(19, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PROD #1<br/>descripcion: PROD 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 5<br/>stock_actual: <br/>imagen: 1715878006_1.png<br/>fecha_registro: 2024-05-16<br/>status: <br/>created_at: 2024-05-16 12:46:46<br/>updated_at: 2024-05-16 12:46:46<br/>', NULL, 'CATEGORIAS', '2024-05-16', '12:46:46', '2024-05-16 16:46:46', '2024-05-16 16:46:46'),
(20, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PROD #1<br/>descripcion: PROD 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 5<br/>stock_actual: 0<br/>imagen: 1715878006_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:46:46<br/>updated_at: 2024-05-16 12:46:46<br/>', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PROD #1<br/>descripcion: PROD 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 5<br/>stock_actual: 0<br/>imagen: 1715878114_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:46:46<br/>updated_at: 2024-05-16 12:48:34<br/>', 'CATEGORIAS', '2024-05-16', '12:48:34', '2024-05-16 16:48:34', '2024-05-16 16:48:34'),
(21, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PROD #1<br/>descripcion: PROD 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 5<br/>stock_actual: 0<br/>imagen: 1715878114_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:46:46<br/>updated_at: 2024-05-16 12:48:34<br/>', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PROD #1A<br/>descripcion: PROD 1A<br/>categoria_id: 2<br/>tipo_producto_id: 2<br/>stock_minimo: 2<br/>stock_actual: 0<br/>imagen: 1715878114_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:46:46<br/>updated_at: 2024-05-16 12:48:46<br/>', 'CATEGORIAS', '2024-05-16', '12:48:46', '2024-05-16 16:48:46', '2024-05-16 16:48:46'),
(22, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA CATEGORIA', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PROD #1A<br/>descripcion: PROD 1A<br/>categoria_id: 2<br/>tipo_producto_id: 2<br/>stock_minimo: 2<br/>stock_actual: 0<br/>imagen: 1715878114_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:46:46<br/>updated_at: 2024-05-16 12:48:46<br/>', NULL, 'CATEGORIAS', '2024-05-16', '12:48:55', '2024-05-16 16:48:55', '2024-05-16 16:48:55'),
(23, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: ASD<br/>descripcion: ASD<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 2<br/>stock_actual: <br/>imagen: 1715878191_1.png<br/>fecha_registro: 2024-05-16<br/>status: <br/>created_at: 2024-05-16 12:49:51<br/>updated_at: 2024-05-16 12:49:51<br/>', NULL, 'CATEGORIAS', '2024-05-16', '12:49:51', '2024-05-16 16:49:51', '2024-05-16 16:49:51'),
(24, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA CATEGORIA', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: ASD<br/>descripcion: ASD<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 2<br/>stock_actual: 0<br/>imagen: 1715878191_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:49:51<br/>updated_at: 2024-05-16 12:49:51<br/>', NULL, 'CATEGORIAS', '2024-05-16', '12:49:54', '2024-05-16 16:49:54', '2024-05-16 16:49:54'),
(25, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 2<br/>codigo: P.1<br/>nro: 1<br/>nombre: ASD<br/>descripcion: <br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 0<br/>stock_actual: <br/>imagen: 1715878290_2.jpg<br/>fecha_registro: 2024-05-16<br/>status: <br/>created_at: 2024-05-16 12:51:30<br/>updated_at: 2024-05-16 12:51:30<br/>', NULL, 'CATEGORIAS', '2024-05-16', '12:51:30', '2024-05-16 16:51:30', '2024-05-16 16:51:30'),
(26, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA CATEGORIA', 'id: 2<br/>codigo: P.1<br/>nro: 1<br/>nombre: ASD<br/>descripcion: <br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 0<br/>stock_actual: 0<br/>imagen: 1715878290_2.jpg<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:30<br/>updated_at: 2024-05-16 12:51:30<br/>', NULL, 'CATEGORIAS', '2024-05-16', '12:51:33', '2024-05-16 16:51:33', '2024-05-16 16:51:33'),
(27, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO #1<br/>descripcion: DESC. PROD. 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 5<br/>stock_actual: <br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: <br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-05-16 12:51:56<br/>', NULL, 'CATEGORIAS', '2024-05-16', '12:51:56', '2024-05-16 16:51:56', '2024-05-16 16:51:56'),
(28, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 1<br/>nombre: TIPO INGRESO #1<br/>descripcion: TIPO INGRESO 1<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:26:30<br/>updated_at: 2024-05-17 11:26:30<br/>', NULL, 'CATEGORIAS', '2024-05-17', '11:26:30', '2024-05-17 15:26:30', '2024-05-17 15:26:30'),
(29, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 1<br/>nombre: TIPO INGRESO #1<br/>descripcion: TIPO INGRESO 1<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:26:30<br/>updated_at: 2024-05-17 11:26:30<br/>', 'id: 1<br/>nombre: TIPO INGRESO #1A<br/>descripcion: TIPO INGRESO 1A<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:26:30<br/>updated_at: 2024-05-17 11:26:35<br/>', 'CATEGORIAS', '2024-05-17', '11:26:35', '2024-05-17 15:26:35', '2024-05-17 15:26:35'),
(30, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA CATEGORIA', 'id: 1<br/>nombre: TIPO INGRESO #1A<br/>descripcion: TIPO INGRESO 1A<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:26:30<br/>updated_at: 2024-05-17 11:26:35<br/>', NULL, 'CATEGORIAS', '2024-05-17', '11:26:39', '2024-05-17 15:26:39', '2024-05-17 15:26:39'),
(31, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 1<br/>nombre: TIPO INGRESO #1<br/>descripcion: TIPO 1<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:26:57<br/>updated_at: 2024-05-17 11:26:57<br/>', NULL, 'CATEGORIAS', '2024-05-17', '11:26:57', '2024-05-17 15:26:57', '2024-05-17 15:26:57'),
(32, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 2<br/>nombre: TIPO INGRESO #2<br/>descripcion: <br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:27:03<br/>updated_at: 2024-05-17 11:27:03<br/>', NULL, 'CATEGORIAS', '2024-05-17', '11:27:03', '2024-05-17 15:27:03', '2024-05-17 15:27:03'),
(33, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 1<br/>nombre: TIPO INGRESO #1<br/>descripcion: TIPO 1<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:26:57<br/>updated_at: 2024-05-17 11:26:57<br/>', 'id: 1<br/>nombre: TIPO INGRESO #1<br/>descripcion: TIPO DE INGRESO 1<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:26:57<br/>updated_at: 2024-05-17 11:27:14<br/>', 'CATEGORIAS', '2024-05-17', '11:27:14', '2024-05-17 15:27:14', '2024-05-17 15:27:14'),
(34, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN PRODUCTO', 'id: 2<br/>codigo: P.2<br/>nro: 2<br/>nombre: PRODUCTO #2<br/>descripcion: DESCRIPCION<br/>categoria_id: 2<br/>tipo_producto_id: 2<br/>stock_minimo: 3<br/>stock_actual: <br/>imagen: <br/>fecha_registro: 2024-05-17<br/>status: <br/>created_at: 2024-05-17 12:51:36<br/>updated_at: 2024-05-17 12:51:36<br/>', NULL, 'PRODUCTOS', '2024-05-17', '12:51:36', '2024-05-17 16:51:36', '2024-05-17 16:51:36'),
(35, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO #1<br/>descripcion: DESC. PROD. 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 5<br/>stock_actual: 0<br/>precio: 0.00<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-05-16 12:51:56<br/>', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO #1<br/>descripcion: DESC. PROD. 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 5<br/>stock_actual: 0<br/>precio: 20<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-05-17 13:03:11<br/>', 'PRODUCTOS', '2024-05-17', '13:03:11', '2024-05-17 17:03:11', '2024-05-17 17:03:11'),
(36, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 2<br/>codigo: P.2<br/>nro: 2<br/>nombre: PRODUCTO #2<br/>descripcion: DESCRIPCION<br/>categoria_id: 2<br/>tipo_producto_id: 2<br/>stock_minimo: 3<br/>stock_actual: 0<br/>precio: 0.00<br/>imagen: <br/>fecha_registro: 2024-05-17<br/>status: 1<br/>created_at: 2024-05-17 12:51:36<br/>updated_at: 2024-05-17 12:51:36<br/>', 'id: 2<br/>codigo: P.2<br/>nro: 2<br/>nombre: PRODUCTO #2<br/>descripcion: DESCRIPCION<br/>categoria_id: 2<br/>tipo_producto_id: 2<br/>stock_minimo: 3<br/>stock_actual: 0<br/>precio: 40<br/>imagen: <br/>fecha_registro: 2024-05-17<br/>status: 1<br/>created_at: 2024-05-17 12:51:36<br/>updated_at: 2024-05-17 13:03:53<br/>', 'PRODUCTOS', '2024-05-17', '13:03:53', '2024-05-17 17:03:53', '2024-05-17 17:03:53'),
(37, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN INGRESO DE PRODUCTO', 'id: 1<br/>proveedor_id: 1<br/>tipo_ingreso_id: 1<br/>precio: 2000<br/>nro_factura: 1111111<br/>descripcion: INGRESO INICIAL<br/>fecha_ingreso: 2024-05-17<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 14:25:29<br/>updated_at: 2024-05-17 14:25:29<br/>', NULL, 'INGRESO DE PRODUCTOS', '2024-05-17', '14:25:29', '2024-05-17 18:25:29', '2024-05-17 18:25:29'),
(38, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 1<br/>nombre: TIPO SALIDA #1<br/>descripcion: DESC TIPO 1<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:06:44<br/>updated_at: 2024-05-17 15:06:44<br/>', NULL, 'CATEGORIAS', '2024-05-17', '15:06:44', '2024-05-17 19:06:44', '2024-05-17 19:06:44'),
(39, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 1<br/>nombre: TIPO SALIDA #1<br/>descripcion: DESC TIPO 1<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:06:44<br/>updated_at: 2024-05-17 15:06:44<br/>', 'id: 1<br/>nombre: TIPO SALIDA #1A<br/>descripcion: DESC TIPO 1A<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:06:44<br/>updated_at: 2024-05-17 15:06:50<br/>', 'CATEGORIAS', '2024-05-17', '15:06:50', '2024-05-17 19:06:50', '2024-05-17 19:06:50'),
(40, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UNA CATEGORIA', 'id: 1<br/>nombre: TIPO SALIDA #1A<br/>descripcion: DESC TIPO 1A<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:06:44<br/>updated_at: 2024-05-17 15:06:50<br/>', NULL, 'CATEGORIAS', '2024-05-17', '15:07:04', '2024-05-17 19:07:04', '2024-05-17 19:07:04'),
(41, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 1<br/>nombre: TIPO DE SALIDA #1<br/>descripcion: DESC. TIPO SALIDA 1<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:07:29<br/>updated_at: 2024-05-17 15:07:29<br/>', NULL, 'CATEGORIAS', '2024-05-17', '15:07:29', '2024-05-17 19:07:29', '2024-05-17 19:07:29'),
(42, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA CATEGORIA', 'id: 2<br/>nombre: TIPO DE SALIDA #2<br/>descripcion: <br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:07:38<br/>updated_at: 2024-05-17 15:07:38<br/>', NULL, 'CATEGORIAS', '2024-05-17', '15:07:38', '2024-05-17 19:07:38', '2024-05-17 19:07:38'),
(43, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE PRODUCTO', 'id: 3<br/>tipo_salida_id: 1<br/>unidad_solicitante: LA PAZ<br/>descripcion: PRUEBA SALIDA 1<br/>fecha_salida: 2024-05-17<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:47:59<br/>updated_at: 2024-05-17 15:47:59<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-05-17', '15:47:59', '2024-05-17 19:47:59', '2024-05-17 19:47:59'),
(44, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 3<br/>usuario: MMAMANI<br/>password: $2y$12$sjG/cz2q0H7k0nn1.Ya6GODlBnj6DvplYcTej8bU3RBGWt9dCJ/Pm<br/>nombre: MARCOS<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 7777777<br/>tipo: ALMACENERO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-05-20 00:00:00<br/>created_at: 2024-05-20 12:09:22<br/>updated_at: 2024-05-20 12:09:22<br/>', NULL, 'USUARIOS', '2024-05-20', '12:09:22', '2024-05-20 16:09:22', '2024-05-20 16:09:22'),
(45, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO #1<br/>descripcion: DESC. PROD. 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 5<br/>stock_actual: 95<br/>precio: 20.00<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-05-17 15:47:59<br/>', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO #1<br/>descripcion: DESC. PROD. 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 100<br/>stock_actual: 95<br/>precio: 20.00<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-05-20 12:23:29<br/>', 'PRODUCTOS', '2024-05-20', '12:23:29', '2024-05-20 16:23:29', '2024-05-20 16:23:29'),
(46, 1, 'ELIMINACIÓN', 'EL USUARIO  ELIMINÓ UN PRODUCTO', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO #1<br/>descripcion: DESC. PROD. 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 100<br/>stock_actual: 95<br/>precio: 20.00<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-05-20 12:23:29<br/>', NULL, 'PRODUCTOS', '2024-05-20', '12:41:01', '2024-05-20 16:41:01', '2024-05-20 16:41:01'),
(47, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO #1<br/>descripcion: DESC. PROD. 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 100<br/>stock_actual: 95<br/>precio: 20.00<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-05-20 12:41:01<br/>', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO #1<br/>descripcion: DESC. PROD. 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 20<br/>stock_actual: 95<br/>precio: 20.00<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-05-20 12:41:35<br/>', 'PRODUCTOS', '2024-05-20', '12:41:35', '2024-05-20 16:41:35', '2024-05-20 16:41:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE `ingresos` (
  `id` bigint UNSIGNED NOT NULL,
  `proveedor_id` bigint UNSIGNED NOT NULL,
  `tipo_ingreso_id` bigint UNSIGNED NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `nro_factura` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `proveedor_id`, `tipo_ingreso_id`, `precio`, `nro_factura`, `descripcion`, `fecha_ingreso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2000.00, '1111111', 'INGRESO INICIAL', '2024-05-17', '2024-05-17', '2024-05-17 18:25:29', '2024-05-17 18:25:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_detalles`
--

CREATE TABLE `ingreso_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `ingreso_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingreso_detalles`
--

INSERT INTO `ingreso_detalles` (`id`, `ingreso_id`, `producto_id`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 100.00, '2024-05-17 18:25:29', '2024-05-17 18:25:29'),
(2, 1, 2, 150.00, '2024-05-17 18:25:29', '2024-05-17 18:25:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex_productos`
--

CREATE TABLE `kardex_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo_registro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_id` bigint UNSIGNED DEFAULT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `detalle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(24,2) DEFAULT NULL,
  `tipo_is` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad_ingreso` double DEFAULT NULL,
  `cantidad_salida` double DEFAULT NULL,
  `cantidad_saldo` double NOT NULL,
  `cu` decimal(24,2) NOT NULL,
  `monto_ingreso` decimal(24,2) DEFAULT NULL,
  `monto_salida` decimal(24,2) DEFAULT NULL,
  `monto_saldo` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `kardex_productos`
--

INSERT INTO `kardex_productos` (`id`, `tipo_registro`, `registro_id`, `producto_id`, `detalle`, `precio`, `tipo_is`, `cantidad_ingreso`, `cantidad_salida`, `cantidad_saldo`, `cu`, `monto_ingreso`, `monto_salida`, `monto_saldo`, `fecha`, `created_at`, `updated_at`) VALUES
(1, 'INGRESO', 1, 1, 'INGRESO INICIAL', 20.00, 'INGRESO', 100, NULL, 100, 20.00, 2000.00, NULL, 2000.00, '2024-05-17', '2024-05-17 18:25:29', '2024-05-17 18:25:29'),
(2, 'INGRESO', 2, 2, 'INGRESO INICIAL', 40.00, 'INGRESO', 150, NULL, 150, 40.00, 6000.00, NULL, 6000.00, '2024-05-17', '2024-05-17 18:25:29', '2024-05-17 18:25:29'),
(5, 'SALIDA', 4, 1, 'PRUEBA SALIDA 1', 20.00, 'EGRESO', NULL, 5, 95, 20.00, NULL, 100.00, 1900.00, '2024-05-17', '2024-05-17 19:47:59', '2024-05-17 19:47:59'),
(6, 'SALIDA', 5, 2, 'PRUEBA SALIDA 1', 40.00, 'EGRESO', NULL, 3, 147, 40.00, NULL, 120.00, 5880.00, '2024-05-17', '2024-05-17 19:47:59', '2024-05-17 19:47:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_01_31_165641_create_configuracions_table', 1),
(4, '2024_02_02_205431_create_historial_accions_table', 1),
(5, '2024_05_15_172254_create_proveedors_table', 2),
(6, '2024_05_15_172313_create_categorias_table', 2),
(7, '2024_05_15_172329_create_tipo_productos_table', 2),
(8, '2024_05_15_172515_create_productos_table', 2),
(9, '2024_05_15_172527_create_tipo_ingresos_table', 2),
(10, '2024_05_15_172542_create_ingresos_table', 2),
(11, '2024_05_15_172550_create_tipo_salidas_table', 2),
(12, '2024_05_15_172558_create_salidas_table', 2),
(13, '2024_05_15_172717_create_notificacions_table', 2),
(14, '2024_05_15_172720_create_notificacion_users_table', 2),
(15, '2024_05_15_173812_create_ingreso_detalles_table', 2),
(16, '2024_05_15_173817_create_salida_detalles_table', 2),
(17, '2024_05_15_174805_create_kardex_productos_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacions`
--

CREATE TABLE `notificacions` (
  `id` bigint UNSIGNED NOT NULL,
  `evento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_id` bigint UNSIGNED DEFAULT NULL,
  `descripcion` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificacions`
--

INSERT INTO `notificacions` (`id`, `evento`, `modulo`, `registro_id`, `descripcion`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 'INGRESO DE PRODUCTO', 'INGRESO DETALLE', 1, 'INGRESO DEL PRODUCTO PRODUCTO #1', '2024-05-17', '14:25:00', '2024-05-17 18:25:29', '2024-05-17 18:25:29'),
(2, 'INGRESO DE PRODUCTO', 'INGRESO DETALLE', 2, 'INGRESO DEL PRODUCTO PRODUCTO #2', '2024-05-17', '14:25:00', '2024-05-17 18:25:29', '2024-05-17 18:25:29'),
(5, 'SALIDA DE PRODUCTO', 'SALIDA DETALLE', 4, 'SALIDA DEL PRODUCTO PRODUCTO #1', '2024-05-17', '15:47:00', '2024-05-17 19:47:59', '2024-05-17 19:47:59'),
(6, 'SALIDA DE PRODUCTO', 'SALIDA DETALLE', 5, 'SALIDA DEL PRODUCTO PRODUCTO #2', '2024-05-17', '15:47:00', '2024-05-17 19:47:59', '2024-05-17 19:47:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion_users`
--

CREATE TABLE `notificacion_users` (
  `id` bigint UNSIGNED NOT NULL,
  `notificacion_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `visto` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificacion_users`
--

INSERT INTO `notificacion_users` (`id`, `notificacion_id`, `user_id`, `visto`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2024-05-17 18:25:29', '2024-05-18 14:56:51'),
(2, 2, 2, 1, '2024-05-17 18:25:29', '2024-05-18 14:52:48'),
(5, 5, 2, 1, '2024-05-17 19:47:59', '2024-05-18 14:56:28'),
(6, 6, 2, 0, '2024-05-17 19:47:59', '2024-05-17 19:47:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nro` bigint NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria_id` bigint UNSIGNED NOT NULL,
  `tipo_producto_id` bigint UNSIGNED NOT NULL,
  `stock_minimo` double(8,2) NOT NULL,
  `stock_actual` double(8,2) NOT NULL DEFAULT '0.00',
  `precio` decimal(24,2) NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nro`, `nombre`, `descripcion`, `categoria_id`, `tipo_producto_id`, `stock_minimo`, `stock_actual`, `precio`, `imagen`, `fecha_registro`, `status`, `created_at`, `updated_at`) VALUES
(1, 'P.1', 1, 'PRODUCTO #1', 'DESC. PROD. 1', 1, 1, 20.00, 95.00, 20.00, '1715878316_1.png', '2024-05-16', 1, '2024-05-16 16:51:56', '2024-05-20 16:41:35'),
(2, 'P.2', 2, 'PRODUCTO #2', 'DESCRIPCION', 2, 2, 3.00, 147.00, 40.00, NULL, '2024-05-17', 1, '2024-05-17 16:51:36', '2024-05-17 19:47:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE `proveedors` (
  `id` bigint UNSIGNED NOT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_contacto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `razon_social`, `nit`, `dir`, `nombre_contacto`, `fono`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'PROVEEDOR #1 S.A.', '1111111', 'LOS OLIVOS', 'JUAN PERES', '77777777', 'DESC. PROVEEDOR #1', '2024-05-16', '2024-05-16 15:49:45', '2024-05-16 15:49:45'),
(2, 'PROVEEDOR #2 S.R.L.', '123123123123', '', '', '', '', '2024-05-16', '2024-05-16 15:49:57', '2024-05-16 15:49:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo_salida_id` bigint UNSIGNED NOT NULL,
  `unidad_solicitante` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `salidas`
--

INSERT INTO `salidas` (`id`, `tipo_salida_id`, `unidad_solicitante`, `descripcion`, `fecha_salida`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(3, 1, 'LA PAZ', 'PRUEBA SALIDA 1', '2024-05-17', '2024-05-17', '2024-05-17 19:47:59', '2024-05-17 19:47:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_detalles`
--

CREATE TABLE `salida_detalles` (
  `id` bigint UNSIGNED NOT NULL,
  `salida_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `salida_detalles`
--

INSERT INTO `salida_detalles` (`id`, `salida_id`, `producto_id`, `cantidad`, `created_at`, `updated_at`) VALUES
(4, 3, 1, 5.00, '2024-05-17 19:47:59', '2024-05-17 19:47:59'),
(5, 3, 2, 3.00, '2024-05-17 19:47:59', '2024-05-17 19:47:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ingresos`
--

CREATE TABLE `tipo_ingresos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_ingresos`
--

INSERT INTO `tipo_ingresos` (`id`, `nombre`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'TIPO INGRESO #1', 'TIPO DE INGRESO 1', '2024-05-17', '2024-05-17 15:26:57', '2024-05-17 15:27:14'),
(2, 'TIPO INGRESO #2', '', '2024-05-17', '2024-05-17 15:27:03', '2024-05-17 15:27:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_productos`
--

CREATE TABLE `tipo_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_productos`
--

INSERT INTO `tipo_productos` (`id`, `nombre`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'TIPO PRODUCTO #1', 'DESC. TIPO 1', '2024-05-16', '2024-05-16 16:00:44', '2024-05-16 16:00:44'),
(2, 'TIPO PRODUCTO #2', '', '2024-05-16', '2024-05-16 16:00:50', '2024-05-16 16:00:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_salidas`
--

CREATE TABLE `tipo_salidas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_salidas`
--

INSERT INTO `tipo_salidas` (`id`, `nombre`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'TIPO DE SALIDA #1', 'DESC. TIPO SALIDA 1', '2024-05-17', '2024-05-17 19:07:29', '2024-05-17 19:07:29'),
(2, 'TIPO DE SALIDA #2', '', '2024-05-17', '2024-05-17 19:07:38', '2024-05-17 19:07:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceso` int NOT NULL DEFAULT '1',
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `password`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `email`, `fono`, `tipo`, `foto`, `acceso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 'admin', NULL, NULL, '0', '', '', 'admin@gmail.com', '', 'ADMINISTRADOR', NULL, 1, '2024-01-31', NULL, NULL),
(2, 'JPERES', '$2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG', 'JUAN', 'PERES', 'MAMANI', '111', 'LP', 'LOS OLIVOS', 'JUAN@GMAIL.COM', '77777777', 'SUPERVISOR DE ALMACEN', '1715274374_JPERES.jpg', 1, '2024-05-09', '2024-05-09 17:06:14', '2024-05-09 17:06:14'),
(3, 'MMAMANI', '$2y$12$sjG/cz2q0H7k0nn1.Ya6GODlBnj6DvplYcTej8bU3RBGWt9dCJ/Pm', 'MARCOS', 'MAMANI', 'MAMANI', '2222', 'LP', 'LOS OLIVOS', '', '7777777', 'ALMACENERO', NULL, 1, '2024-05-20', '2024-05-20 16:09:22', '2024-05-20 16:09:22');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingresos_proveedor_id_foreign` (`proveedor_id`),
  ADD KEY `ingresos_tipo_ingreso_id_foreign` (`tipo_ingreso_id`);

--
-- Indices de la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingreso_detalles_ingreso_id_foreign` (`ingreso_id`),
  ADD KEY `ingreso_detalles_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `kardex_productos`
--
ALTER TABLE `kardex_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kardex_productos_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificacions`
--
ALTER TABLE `notificacions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notificacion_users_notificacion_id_foreign` (`notificacion_id`),
  ADD KEY `notificacion_users_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productos_codigo_unique` (`codigo`),
  ADD KEY `productos_categoria_id_foreign` (`categoria_id`),
  ADD KEY `productos_tipo_producto_id_foreign` (`tipo_producto_id`);

--
-- Indices de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salidas_tipo_salida_id_foreign` (`tipo_salida_id`);

--
-- Indices de la tabla `salida_detalles`
--
ALTER TABLE `salida_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salida_detalles_salida_id_foreign` (`salida_id`),
  ADD KEY `salida_detalles_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `tipo_ingresos`
--
ALTER TABLE `tipo_ingresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_productos`
--
ALTER TABLE `tipo_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_salidas`
--
ALTER TABLE `tipo_salidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `kardex_productos`
--
ALTER TABLE `kardex_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `notificacions`
--
ALTER TABLE `notificacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salidas`
--
ALTER TABLE `salidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `salida_detalles`
--
ALTER TABLE `salida_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_ingresos`
--
ALTER TABLE `tipo_ingresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_productos`
--
ALTER TABLE `tipo_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_salidas`
--
ALTER TABLE `tipo_salidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_proveedor_id_foreign` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedors` (`id`),
  ADD CONSTRAINT `ingresos_tipo_ingreso_id_foreign` FOREIGN KEY (`tipo_ingreso_id`) REFERENCES `tipo_ingresos` (`id`);

--
-- Filtros para la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  ADD CONSTRAINT `ingreso_detalles_ingreso_id_foreign` FOREIGN KEY (`ingreso_id`) REFERENCES `ingresos` (`id`),
  ADD CONSTRAINT `ingreso_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `kardex_productos`
--
ALTER TABLE `kardex_productos`
  ADD CONSTRAINT `kardex_productos_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  ADD CONSTRAINT `notificacion_users_notificacion_id_foreign` FOREIGN KEY (`notificacion_id`) REFERENCES `notificacions` (`id`),
  ADD CONSTRAINT `notificacion_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `productos_tipo_producto_id_foreign` FOREIGN KEY (`tipo_producto_id`) REFERENCES `tipo_productos` (`id`);

--
-- Filtros para la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD CONSTRAINT `salidas_tipo_salida_id_foreign` FOREIGN KEY (`tipo_salida_id`) REFERENCES `tipo_salidas` (`id`);

--
-- Filtros para la tabla `salida_detalles`
--
ALTER TABLE `salida_detalles`
  ADD CONSTRAINT `salida_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `salida_detalles_salida_id_foreign` FOREIGN KEY (`salida_id`) REFERENCES `salidas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

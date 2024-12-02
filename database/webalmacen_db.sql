-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-12-2024 a las 19:14:21
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.22

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
(1, 'CATEGORIA  UNO', 'DESC. CAT. 1', '2024-05-16', '2024-05-16 15:55:33', '2024-12-02 18:21:45'),
(2, 'CATEGORIA DOS', '', '2024-05-16', '2024-05-16 15:55:38', '2024-12-02 18:22:34');

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
(1, 'WEBALMACEN', 'WA', 'WEBALMACEN S.A.', 'LA PAZ', 'LOS OLIVOS', '7777777', 'WEBALMACEN@GMAIL.COM', 'WEBALMACEN.COM', 'ACTIVIDAD', '1716506212_1.jpg', NULL, '2024-05-23 23:16:52');

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
(47, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO #1<br/>descripcion: DESC. PROD. 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 100<br/>stock_actual: 95<br/>precio: 20.00<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-05-20 12:41:01<br/>', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO #1<br/>descripcion: DESC. PROD. 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 20<br/>stock_actual: 95<br/>precio: 20.00<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-05-20 12:41:35<br/>', 'PRODUCTOS', '2024-05-20', '12:41:35', '2024-05-20 16:41:35', '2024-05-20 16:41:35'),
(48, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN INGRESO DE PRODUCTO', 'id: 2<br/>proveedor_id: 2<br/>tipo_ingreso_id: 1<br/>precio: 3000<br/>nro_factura: 121231231<br/>descripcion: <br/>fecha_ingreso: 2024-05-24<br/>fecha_registro: 2024-05-24<br/>created_at: 2024-05-24 10:20:18<br/>updated_at: 2024-05-24 10:20:18<br/>', NULL, 'INGRESO DE PRODUCTOS', '2024-05-24', '10:20:18', '2024-05-24 14:20:18', '2024-05-24 14:20:18'),
(49, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE PRODUCTO', 'id: 4<br/>tipo_salida_id: 2<br/>unidad_solicitante: LA PAZ<br/>descripcion: DESCRIPCION SALIDA<br/>fecha_salida: 2024-05-29<br/>fecha_registro: 2024-05-29<br/>created_at: 2024-05-29 08:24:18<br/>updated_at: 2024-05-29 08:24:18<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-05-29', '08:24:18', '2024-05-29 12:24:18', '2024-05-29 12:24:18'),
(50, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE PRODUCTO', 'id: 7<br/>tipo_salida_id: 1<br/>unidad_solicitante: la paz<br/>descripcion: descripcion<br/>fecha_salida: 2024-05-29<br/>fecha_registro: 2024-05-29<br/>created_at: 2024-05-29 08:37:34<br/>updated_at: 2024-05-29 08:37:34<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-05-29', '08:37:34', '2024-05-29 12:37:34', '2024-05-29 12:37:34'),
(51, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 4<br/>usuario: SCORTEZ<br/>password: $2y$12$lGkdvp27XH5WETidgcQNJ.sRUnpVd/ToAhdFmA8rT03to2tIY8sa2<br/>nombre: SANDRO<br/>paterno: CORTEZ<br/>materno: <br/>ci: 3333<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: SANDRO@GMAIL.COM<br/>fono: 7777777<br/>tipo: ADMINISTRADOR<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-12-02 00:00:00<br/>created_at: 2024-12-02 14:13:31<br/>updated_at: 2024-12-02 14:13:31<br/>', NULL, 'USUARIOS', '2024-12-02', '14:13:31', '2024-12-02 18:13:31', '2024-12-02 18:13:31'),
(52, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN USUARIO', 'id: 4<br/>usuario: SCORTEZ<br/>password: $2y$12$lGkdvp27XH5WETidgcQNJ.sRUnpVd/ToAhdFmA8rT03to2tIY8sa2<br/>nombre: SANDRO<br/>paterno: CORTEZ<br/>materno: <br/>ci: 3333<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: SANDRO@GMAIL.COM<br/>fono: 7777777<br/>tipo: ADMINISTRADOR<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-12-02 00:00:00<br/>created_at: 2024-12-02 14:13:31<br/>updated_at: 2024-12-02 14:13:31<br/>', NULL, 'USUARIOS', '2024-12-02', '14:14:25', '2024-12-02 18:14:25', '2024-12-02 18:14:25'),
(53, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-05-09 13:06:14<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI2<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:18:10<br/>', 'USUARIOS', '2024-12-02', '14:18:10', '2024-12-02 18:18:10', '2024-12-02 18:18:10'),
(54, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI2<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:18:10<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:18:29<br/>', 'USUARIOS', '2024-12-02', '14:18:29', '2024-12-02 18:18:29', '2024-12-02 18:18:29'),
(55, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:18:29<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO.<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:19:25<br/>', 'USUARIOS', '2024-12-02', '14:19:25', '2024-12-02 18:19:25', '2024-12-02 18:19:25'),
(56, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO.<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:19:25<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:19:29<br/>', 'USUARIOS', '2024-12-02', '14:19:29', '2024-12-02 18:19:29', '2024-12-02 18:19:29'),
(57, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:19:29<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM##<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:20:12<br/>', 'USUARIOS', '2024-12-02', '14:20:12', '2024-12-02 18:20:12', '2024-12-02 18:20:12'),
(58, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM##<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:20:12<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:20:18<br/>', 'USUARIOS', '2024-12-02', '14:20:18', '2024-12-02 18:20:18', '2024-12-02 18:20:18'),
(59, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:20:18<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:20:23<br/>', 'USUARIOS', '2024-12-02', '14:20:23', '2024-12-02 18:20:23', '2024-12-02 18:20:23'),
(60, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:20:23<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:20:23<br/>', 'USUARIOS', '2024-12-02', '14:20:58', '2024-12-02 18:20:58', '2024-12-02 18:20:58'),
(61, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 3<br/>usuario: MMAMANI<br/>password: $2y$12$sjG/cz2q0H7k0nn1.Ya6GODlBnj6DvplYcTej8bU3RBGWt9dCJ/Pm<br/>nombre: MARCOS<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 7777777<br/>tipo: ALMACENERO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-05-20 00:00:00<br/>created_at: 2024-05-20 12:09:22<br/>updated_at: 2024-05-20 12:09:22<br/>', 'id: 3<br/>usuario: MMAMANI<br/>password: $2y$12$sjG/cz2q0H7k0nn1.Ya6GODlBnj6DvplYcTej8bU3RBGWt9dCJ/Pm<br/>nombre: MARCOS<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 7777777<br/>tipo: ALMACENERO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-05-20 00:00:00<br/>created_at: 2024-05-20 12:09:22<br/>updated_at: 2024-05-20 12:09:22<br/>', 'USUARIOS', '2024-12-02', '14:21:01', '2024-12-02 18:21:01', '2024-12-02 18:21:01'),
(62, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 3<br/>usuario: MMAMANI<br/>password: $2y$12$sjG/cz2q0H7k0nn1.Ya6GODlBnj6DvplYcTej8bU3RBGWt9dCJ/Pm<br/>nombre: MARCOS<br/>paterno: MAMANI<br/>materno: MAMANI<br/>ci: 2222<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 7777777<br/>tipo: ALMACENERO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-05-20 00:00:00<br/>created_at: 2024-05-20 12:09:22<br/>updated_at: 2024-05-20 12:09:22<br/>', 'id: 3<br/>usuario: MMAMANI<br/>password: $2y$12$sjG/cz2q0H7k0nn1.Ya6GODlBnj6DvplYcTej8bU3RBGWt9dCJ/Pm<br/>nombre: MARCOS<br/>paterno: MAMANI<br/>materno: <br/>ci: 2222<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 7777777<br/>tipo: ALMACENERO<br/>foto: <br/>acceso: 1<br/>fecha_registro: 2024-05-20 00:00:00<br/>created_at: 2024-05-20 12:09:22<br/>updated_at: 2024-12-02 14:21:09<br/>', 'USUARIOS', '2024-12-02', '14:21:09', '2024-12-02 18:21:09', '2024-12-02 18:21:09'),
(63, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 1<br/>nombre: CATEGORIA #1<br/>descripcion: DESC. CAT. 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:33<br/>updated_at: 2024-05-16 11:55:33<br/>', 'id: 1<br/>nombre: CATEGORIA  UNO<br/>descripcion: DESC. CAT. 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:33<br/>updated_at: 2024-12-02 14:21:45<br/>', 'CATEGORIAS', '2024-12-02', '14:21:45', '2024-12-02 18:21:45', '2024-12-02 18:21:45'),
(64, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 2<br/>nombre: CATEGORIA #2<br/>descripcion: <br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:38<br/>updated_at: 2024-05-16 11:55:38<br/>', 'id: 2<br/>nombre: CATEGORIA DOS<br/>descripcion: <br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:55:38<br/>updated_at: 2024-12-02 14:22:34<br/>', 'CATEGORIAS', '2024-12-02', '14:22:34', '2024-12-02 18:22:34', '2024-12-02 18:22:34'),
(65, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN TIPO DE PRODUCTO', 'id: 1<br/>nombre: TIPO PRODUCTO #1<br/>descripcion: DESC. TIPO 1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 12:00:44<br/>updated_at: 2024-05-16 12:00:44<br/>', 'id: 1<br/>nombre: TIPO PRODUCTO UNO<br/>descripcion: DESC. TIPO UNO<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 12:00:44<br/>updated_at: 2024-12-02 14:23:21<br/>', 'TIPO DE PRODUCTOS', '2024-12-02', '14:23:21', '2024-12-02 18:23:21', '2024-12-02 18:23:21'),
(66, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN TIPO DE PRODUCTO', 'id: 2<br/>nombre: TIPO PRODUCTO #2<br/>descripcion: <br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 12:00:50<br/>updated_at: 2024-05-16 12:00:50<br/>', 'id: 2<br/>nombre: TIPO PRODUCTO DOS<br/>descripcion: <br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 12:00:50<br/>updated_at: 2024-12-02 14:23:28<br/>', 'TIPO DE PRODUCTOS', '2024-12-02', '14:23:28', '2024-12-02 18:23:28', '2024-12-02 18:23:28'),
(67, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO #1<br/>descripcion: DESC. PROD. 1<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 20<br/>stock_actual: 15<br/>precio: 20.00<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-05-29 08:37:34<br/>', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO UNO<br/>descripcion: DESC. PROD. UNO<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 20<br/>stock_actual: 15<br/>precio: 20<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-12-02 14:24:38<br/>', 'PRODUCTOS', '2024-12-02', '14:24:38', '2024-12-02 18:24:38', '2024-12-02 18:24:38'),
(68, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO UNO<br/>descripcion: DESC. PROD. UNO<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 20<br/>stock_actual: 15<br/>precio: 20.00<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-12-02 14:24:38<br/>', 'id: 1<br/>codigo: P.1<br/>nro: 1<br/>nombre: PRODUCTO UNO<br/>descripcion: DESC. PROD. UNO<br/>categoria_id: 1<br/>tipo_producto_id: 1<br/>stock_minimo: 4<br/>stock_actual: 15<br/>precio: 20.00<br/>imagen: 1715878316_1.png<br/>fecha_registro: 2024-05-16<br/>status: 1<br/>created_at: 2024-05-16 12:51:56<br/>updated_at: 2024-12-02 14:25:16<br/>', 'PRODUCTOS', '2024-12-02', '14:25:16', '2024-12-02 18:25:16', '2024-12-02 18:25:16'),
(69, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 1<br/>nombre: TIPO INGRESO #1<br/>descripcion: TIPO DE INGRESO 1<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:26:57<br/>updated_at: 2024-05-17 11:27:14<br/>', 'id: 1<br/>nombre: TIPO INGRESO UNO<br/>descripcion: TIPO DE INGRESO UNO<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:26:57<br/>updated_at: 2024-12-02 14:26:34<br/>', 'CATEGORIAS', '2024-12-02', '14:26:34', '2024-12-02 18:26:34', '2024-12-02 18:26:34'),
(70, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 2<br/>nombre: TIPO INGRESO #2<br/>descripcion: <br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:27:03<br/>updated_at: 2024-05-17 11:27:03<br/>', 'id: 2<br/>nombre: TIPO INGRESO DOS<br/>descripcion: <br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 11:27:03<br/>updated_at: 2024-12-02 14:26:38<br/>', 'CATEGORIAS', '2024-12-02', '14:26:38', '2024-12-02 18:26:38', '2024-12-02 18:26:38'),
(71, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 1<br/>nombre: TIPO DE SALIDA #1<br/>descripcion: DESC. TIPO SALIDA 1<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:07:29<br/>updated_at: 2024-05-17 15:07:29<br/>', 'id: 1<br/>nombre: TIPO DE SALIDA UNO<br/>descripcion: DESC. TIPO SALIDA UNO<br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:07:29<br/>updated_at: 2024-12-02 14:27:11<br/>', 'CATEGORIAS', '2024-12-02', '14:27:11', '2024-12-02 18:27:11', '2024-12-02 18:27:11'),
(72, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 2<br/>nombre: TIPO DE SALIDA #2<br/>descripcion: <br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:07:38<br/>updated_at: 2024-05-17 15:07:38<br/>', 'id: 2<br/>nombre: TIPO DE SALIDA DOS Ñ<br/>descripcion: <br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:07:38<br/>updated_at: 2024-12-02 14:27:17<br/>', 'CATEGORIAS', '2024-12-02', '14:27:17', '2024-12-02 18:27:17', '2024-12-02 18:27:17'),
(73, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA CATEGORIA', 'id: 2<br/>nombre: TIPO DE SALIDA DOS Ñ<br/>descripcion: <br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:07:38<br/>updated_at: 2024-12-02 14:27:17<br/>', 'id: 2<br/>nombre: TIPO DE SALIDA DOS<br/>descripcion: <br/>fecha_registro: 2024-05-17<br/>created_at: 2024-05-17 15:07:38<br/>updated_at: 2024-12-02 14:27:21<br/>', 'CATEGORIAS', '2024-12-02', '14:27:21', '2024-12-02 18:27:21', '2024-12-02 18:27:21'),
(74, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$LN2T5t7hPBB1hvyDpC5uFeFhWLYXLTs8Ec8mNBB0HSetrhXNrOGtG<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:20:23<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$tf.kxKWMW4w6eNfHsWkgtuC6MJuUw556RHNduGkCdX8tiTzyP3OwW<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:42:52<br/>', 'USUARIOS', '2024-12-02', '14:42:52', '2024-12-02 18:42:52', '2024-12-02 18:42:52'),
(75, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$tf.kxKWMW4w6eNfHsWkgtuC6MJuUw556RHNduGkCdX8tiTzyP3OwW<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:42:52<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$.9tm5qarotseEt/PrU8cbO9s.Mvtbdpfjp1BEnYguJUTyf67Akv5C<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:43:27<br/>', 'USUARIOS', '2024-12-02', '14:43:27', '2024-12-02 18:43:27', '2024-12-02 18:43:27'),
(76, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN LA CONTRASEÑA DE UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$.9tm5qarotseEt/PrU8cbO9s.Mvtbdpfjp1BEnYguJUTyf67Akv5C<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:43:27<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$S5xCEOkchMcOqZESxFF.qOGydDkt8nvr3VcB0O5yqnQyqa/3JqptS<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 111<br/>ci_exp: LP<br/>dir: LOS OLIVOS NRO. 2<br/>email: JUAN@GMAIL.COM<br/>fono: 77777777<br/>tipo: SUPERVISOR DE ALMACEN<br/>foto: 1715274374_JPERES.jpg<br/>acceso: 1<br/>fecha_registro: 2024-05-09 00:00:00<br/>created_at: 2024-05-09 13:06:14<br/>updated_at: 2024-12-02 14:43:40<br/>', 'USUARIOS', '2024-12-02', '14:43:40', '2024-12-02 18:43:40', '2024-12-02 18:43:40'),
(77, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROVEEDOR', 'id: 1<br/>razon_social: PROVEEDOR #1 S.A.<br/>nit: 1111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESC. PROVEEDOR #1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:45<br/>updated_at: 2024-05-16 11:49:45<br/>', 'id: 1<br/>razon_social: PROVEEDOR #1 S.A.<br/>nit: 1111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESC. PROVEEDOR #1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:45<br/>updated_at: 2024-05-16 11:49:45<br/>', 'PROVEEDORES', '2024-12-02', '14:44:49', '2024-12-02 18:44:49', '2024-12-02 18:44:49'),
(78, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROVEEDOR', 'id: 1<br/>razon_social: PROVEEDOR #1 S.A.<br/>nit: 1111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESC. PROVEEDOR #1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:45<br/>updated_at: 2024-05-16 11:49:45<br/>', 'id: 1<br/>razon_social: PROVEEDOR UNO S.A.<br/>nit: 1111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESC. PROVEEDOR #1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:45<br/>updated_at: 2024-12-02 14:45:18<br/>', 'PROVEEDORES', '2024-12-02', '14:45:18', '2024-12-02 18:45:18', '2024-12-02 18:45:18'),
(79, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROVEEDOR', 'id: 1<br/>razon_social: PROVEEDOR UNO S.A.<br/>nit: 1111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESC. PROVEEDOR #1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:45<br/>updated_at: 2024-12-02 14:45:18<br/>', 'id: 1<br/>razon_social: PROVEEDOR UNO S.A.<br/>nit: 1111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESC. PROVEEDOR #1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:45<br/>updated_at: 2024-12-02 14:45:18<br/>', 'PROVEEDORES', '2024-12-02', '14:45:32', '2024-12-02 18:45:32', '2024-12-02 18:45:32'),
(80, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROVEEDOR', 'id: 1<br/>razon_social: PROVEEDOR UNO S.A.<br/>nit: 1111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESC. PROVEEDOR #1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:45<br/>updated_at: 2024-12-02 14:45:18<br/>', 'id: 1<br/>razon_social: PROVEEDOR UNO S.A.<br/>nit: 1111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESC. PROVEEDOR #1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:45<br/>updated_at: 2024-12-02 14:45:18<br/>', 'PROVEEDORES', '2024-12-02', '14:45:55', '2024-12-02 18:45:55', '2024-12-02 18:45:55'),
(81, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROVEEDOR', 'id: 1<br/>razon_social: PROVEEDOR UNO S.A.<br/>nit: 1111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESC. PROVEEDOR #1<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:45<br/>updated_at: 2024-12-02 14:45:18<br/>', 'id: 1<br/>razon_social: PROVEEDOR UNO S.A.<br/>nit: 1111111<br/>dir: LOS OLIVOS<br/>nombre_contacto: JUAN PERES<br/>fono: 77777777<br/>descripcion: DESC. PROVEEDOR UNO<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:45<br/>updated_at: 2024-12-02 14:48:08<br/>', 'PROVEEDORES', '2024-12-02', '14:48:08', '2024-12-02 18:48:08', '2024-12-02 18:48:08'),
(82, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROVEEDOR', 'id: 2<br/>razon_social: PROVEEDOR #2 S.R.L.<br/>nit: 123123123123<br/>dir: <br/>nombre_contacto: <br/>fono: <br/>descripcion: <br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:57<br/>updated_at: 2024-05-16 11:49:57<br/>', 'id: 2<br/>razon_social: PROVEEDOR DOS S.R.L.<br/>nit: 123123123123<br/>dir: <br/>nombre_contacto: <br/>fono: <br/>descripcion: <br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:57<br/>updated_at: 2024-12-02 14:48:19<br/>', 'PROVEEDORES', '2024-12-02', '14:48:19', '2024-12-02 18:48:19', '2024-12-02 18:48:19'),
(83, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PROVEEDOR', 'id: 2<br/>razon_social: PROVEEDOR DOS S.R.L.<br/>nit: 123123123123<br/>dir: <br/>nombre_contacto: <br/>fono: <br/>descripcion: <br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:57<br/>updated_at: 2024-12-02 14:48:19<br/>', 'id: 2<br/>razon_social: PROVEEDOR DOS S.R.L.<br/>nit: 123123123123<br/>dir: LOS PEDREGALES<br/>nombre_contacto: EDUARDO CONDORI<br/>fono: 655656556<br/>descripcion: DESC. PROV. DOS<br/>fecha_registro: 2024-05-16<br/>created_at: 2024-05-16 11:49:57<br/>updated_at: 2024-12-02 14:48:56<br/>', 'PROVEEDORES', '2024-12-02', '14:48:56', '2024-12-02 18:48:56', '2024-12-02 18:48:56'),
(84, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA UNIDAD', 'id: 1<br/>nombre: UNIDAD LA PAZ<br/>descripcion: <br/>created_at: 2024-12-02 14:56:34<br/>updated_at: 2024-12-02 14:56:34<br/>', NULL, 'UNIDADES', '2024-12-02', '14:56:34', '2024-12-02 18:56:34', '2024-12-02 18:56:34'),
(85, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UNA UNIDAD', 'id: 1<br/>nombre: UNIDAD LA PAZ<br/>descripcion: <br/>created_at: 2024-12-02 14:56:34<br/>updated_at: 2024-12-02 14:56:34<br/>', 'id: 1<br/>nombre: UNIDAD LA PAZ<br/>descripcion: DESC UNIDAD  LA PAZ<br/>created_at: 2024-12-02 14:56:34<br/>updated_at: 2024-12-02 14:56:40<br/>', 'UNIDADES', '2024-12-02', '14:56:40', '2024-12-02 18:56:40', '2024-12-02 18:56:40');
INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(86, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA UNIDAD', 'id: 2<br/>nombre: UNIDAD SANTA CRUZ<br/>descripcion: <br/>created_at: 2024-12-02 14:56:46<br/>updated_at: 2024-12-02 14:56:46<br/>', NULL, 'UNIDADES', '2024-12-02', '14:56:46', '2024-12-02 18:56:46', '2024-12-02 18:56:46'),
(87, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN INGRESO DE PRODUCTO', 'id: 3<br/>proveedor_id: 1<br/>tipo_ingreso_id: 1<br/>precio: 3000<br/>nro_factura: 42232332<br/>descripcion: DESCRIPCION INGRESO<br/>fecha_ingreso: 2024-12-02<br/>fecha_registro: 2024-12-02<br/>created_at: 2024-12-02 15:01:29<br/>updated_at: 2024-12-02 15:01:29<br/>', NULL, 'INGRESO DE PRODUCTOS', '2024-12-02', '15:01:29', '2024-12-02 19:01:29', '2024-12-02 19:01:29'),
(88, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UN INGRESO DE PRODUCTO', 'id: 4<br/>proveedor_id: 1<br/>tipo_ingreso_id: 2<br/>precio: 3000<br/>nro_factura: 300000<br/>descripcion: <br/>fecha_ingreso: 2024-12-02<br/>fecha_registro: 2024-12-02<br/>created_at: 2024-12-02 15:04:40<br/>updated_at: 2024-12-02 15:04:40<br/>', NULL, 'INGRESO DE PRODUCTOS', '2024-12-02', '15:04:40', '2024-12-02 19:04:40', '2024-12-02 19:04:40'),
(89, 1, 'CREACIÓN', 'EL USUARIO  REGISTRO UNA SALIDA DE PRODUCTO', 'id: 8<br/>tipo_salida_id: 2<br/>unidad_solicitante: 2<br/>descripcion: descripcion salida<br/>fecha_salida: 2024-12-02<br/>fecha_registro: 2024-12-02<br/>created_at: 2024-12-02 15:13:37<br/>updated_at: 2024-12-02 15:13:37<br/>', NULL, 'SALIDA DE PRODUCTOS', '2024-12-02', '15:13:37', '2024-12-02 19:13:37', '2024-12-02 19:13:37'),
(90, 1, 'MODIFICACIÓN', 'EL USUARIO  MODIFICÓ UN PRODUCTO', 'id: 2<br/>codigo: P.2<br/>nro: 2<br/>nombre: PRODUCTO #2<br/>descripcion: DESCRIPCION<br/>categoria_id: 2<br/>tipo_producto_id: 2<br/>stock_minimo: 3<br/>stock_actual: 227<br/>precio: 40.00<br/>imagen: <br/>fecha_registro: 2024-05-17<br/>status: 1<br/>created_at: 2024-05-17 12:51:36<br/>updated_at: 2024-12-02 15:04:40<br/>', 'id: 2<br/>codigo: P.2<br/>nro: 2<br/>nombre: PRODUCTO DOS<br/>descripcion: DESCRIPCION<br/>categoria_id: 2<br/>tipo_producto_id: 2<br/>stock_minimo: 3<br/>stock_actual: 227<br/>precio: 40.00<br/>imagen: <br/>fecha_registro: 2024-05-17<br/>status: 1<br/>created_at: 2024-05-17 12:51:36<br/>updated_at: 2024-12-02 15:13:50<br/>', 'PRODUCTOS', '2024-12-02', '15:13:50', '2024-12-02 19:13:50', '2024-12-02 19:13:50');

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
(1, 1, 1, 2000.00, '1111111', 'INGRESO INICIAL', '2024-05-17', '2024-05-17', '2024-05-17 18:25:29', '2024-05-17 18:25:29'),
(2, 2, 1, 3000.00, '121231231', '', '2024-05-24', '2024-05-24', '2024-05-24 14:20:18', '2024-05-24 14:20:18'),
(3, 1, 1, 3000.00, '42232332', 'DESCRIPCION INGRESO', '2024-12-02', '2024-12-02', '2024-12-02 19:01:29', '2024-12-02 19:01:29'),
(4, 1, 2, 3000.00, '300000', NULL, '2024-12-02', '2024-12-02', '2024-12-02 19:04:40', '2024-12-02 19:04:40');

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
(2, 1, 2, 150.00, '2024-05-17 18:25:29', '2024-05-17 18:25:29'),
(3, 2, 2, 100.00, '2024-05-24 14:20:18', '2024-05-24 14:20:18'),
(4, 3, 1, 30.00, '2024-12-02 19:01:29', '2024-12-02 19:01:29'),
(5, 4, 2, 20.00, '2024-12-02 19:04:40', '2024-12-02 19:04:40'),
(6, 4, 1, 20.00, '2024-12-02 19:04:40', '2024-12-02 19:04:40');

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
(6, 'SALIDA', 5, 2, 'PRUEBA SALIDA 1', 40.00, 'EGRESO', NULL, 3, 147, 40.00, NULL, 120.00, 5880.00, '2024-05-17', '2024-05-17 19:47:59', '2024-05-17 19:47:59'),
(7, 'INGRESO', 3, 2, 'INGRESO DE PRODUCTO', 40.00, 'INGRESO', 100, NULL, 247, 40.00, 4000.00, NULL, 9880.00, '2024-05-24', '2024-05-24 14:20:18', '2024-05-24 14:20:18'),
(8, 'SALIDA', 6, 1, 'DESCRIPCION SALIDA', 20.00, 'EGRESO', NULL, 50, 45, 20.00, NULL, 1000.00, 900.00, '2024-05-29', '2024-05-29 12:24:18', '2024-05-29 12:24:18'),
(9, 'SALIDA', 7, 1, 'descripcion', 20.00, 'EGRESO', NULL, 30, 15, 20.00, NULL, 600.00, 300.00, '2024-05-29', '2024-05-29 12:37:34', '2024-05-29 12:37:34'),
(10, 'SALIDA', 8, 2, 'descripcion', 40.00, 'EGRESO', NULL, 40, 207, 40.00, NULL, 1600.00, 8280.00, '2024-05-29', '2024-05-29 12:37:34', '2024-05-29 12:37:34'),
(11, 'INGRESO', 4, 1, 'DESCRIPCION INGRESO', 20.00, 'INGRESO', 30, NULL, 45, 20.00, 600.00, NULL, 900.00, '2024-12-02', '2024-12-02 19:01:29', '2024-12-02 19:01:29'),
(12, 'INGRESO', 5, 2, 'INGRESO DE PRODUCTO', 40.00, 'INGRESO', 20, NULL, 227, 40.00, 800.00, NULL, 9080.00, '2024-12-02', '2024-12-02 19:04:40', '2024-12-02 19:04:40'),
(13, 'INGRESO', 6, 1, 'INGRESO DE PRODUCTO', 20.00, 'INGRESO', 20, NULL, 65, 20.00, 400.00, NULL, 1300.00, '2024-12-02', '2024-12-02 19:04:40', '2024-12-02 19:04:40'),
(14, 'SALIDA', 9, 1, 'descripcion salida', 20.00, 'EGRESO', NULL, 7, 58, 20.00, NULL, 140.00, 1160.00, '2024-12-02', '2024-12-02 19:13:37', '2024-12-02 19:13:37');

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
(17, '2024_05_15_174805_create_kardex_productos_table', 2),
(18, '2024_12_02_144927_create_unidads_table', 3);

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
(6, 'SALIDA DE PRODUCTO', 'SALIDA DETALLE', 5, 'SALIDA DEL PRODUCTO PRODUCTO #2', '2024-05-17', '15:47:00', '2024-05-17 19:47:59', '2024-05-17 19:47:59'),
(7, 'INGRESO DE PRODUCTO', 'INGRESO DETALLE', 3, 'INGRESO DEL PRODUCTO PRODUCTO #2', '2024-05-24', '10:20:00', '2024-05-24 14:20:18', '2024-05-24 14:20:18'),
(8, 'SALIDA DE PRODUCTO', 'SALIDA DETALLE', 6, 'SALIDA DEL PRODUCTO PRODUCTO #1', '2024-05-29', '08:24:00', '2024-05-29 12:24:18', '2024-05-29 12:24:18'),
(9, 'SALIDA DE PRODUCTO', 'SALIDA DETALLE', 7, 'SALIDA DEL PRODUCTO PRODUCTO #1', '2024-05-29', '08:37:00', '2024-05-29 12:37:34', '2024-05-29 12:37:34'),
(10, 'SALIDA DE PRODUCTO', 'SALIDA DETALLE', 8, 'SALIDA DEL PRODUCTO PRODUCTO #2', '2024-05-29', '08:37:00', '2024-05-29 12:37:34', '2024-05-29 12:37:34'),
(11, 'INGRESO DE PRODUCTO', 'INGRESO DETALLE', 4, 'INGRESO DEL PRODUCTO PRODUCTO UNO', '2024-12-02', '15:01:00', '2024-12-02 19:01:29', '2024-12-02 19:01:29'),
(12, 'INGRESO DE PRODUCTO', 'INGRESO DETALLE', 5, 'INGRESO DEL PRODUCTO PRODUCTO #2', '2024-12-02', '15:04:00', '2024-12-02 19:04:40', '2024-12-02 19:04:40'),
(13, 'INGRESO DE PRODUCTO', 'INGRESO DETALLE', 6, 'INGRESO DEL PRODUCTO PRODUCTO UNO', '2024-12-02', '15:04:00', '2024-12-02 19:04:40', '2024-12-02 19:04:40'),
(14, 'SALIDA DE PRODUCTO', 'SALIDA DETALLE', 9, 'SALIDA DEL PRODUCTO PRODUCTO UNO', '2024-12-02', '15:13:00', '2024-12-02 19:13:37', '2024-12-02 19:13:37');

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
(6, 6, 2, 0, '2024-05-17 19:47:59', '2024-05-17 19:47:59'),
(7, 7, 2, 0, '2024-05-24 14:20:18', '2024-05-24 14:20:18'),
(8, 8, 2, 0, '2024-05-29 12:24:18', '2024-05-29 12:24:18'),
(9, 9, 2, 0, '2024-05-29 12:37:34', '2024-05-29 12:37:34'),
(10, 10, 2, 0, '2024-05-29 12:37:34', '2024-05-29 12:37:34'),
(11, 11, 2, 0, '2024-12-02 19:01:29', '2024-12-02 19:01:29'),
(12, 12, 2, 0, '2024-12-02 19:04:40', '2024-12-02 19:04:40'),
(13, 13, 2, 0, '2024-12-02 19:04:40', '2024-12-02 19:04:40'),
(14, 14, 2, 0, '2024-12-02 19:13:37', '2024-12-02 19:13:37');

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
(1, 'P.1', 1, 'PRODUCTO UNO', 'DESC. PROD. UNO', 1, 1, 4.00, 58.00, 20.00, '1715878316_1.png', '2024-05-16', 1, '2024-05-16 16:51:56', '2024-12-02 19:13:37'),
(2, 'P.2', 2, 'PRODUCTO DOS', 'DESCRIPCION', 2, 2, 3.00, 227.00, 40.00, NULL, '2024-05-17', 1, '2024-05-17 16:51:36', '2024-12-02 19:13:50');

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
(1, 'PROVEEDOR UNO S.A.', '1111111', 'LOS OLIVOS', 'JUAN PERES', '77777777', 'DESC. PROVEEDOR UNO', '2024-05-16', '2024-05-16 15:49:45', '2024-12-02 18:48:08'),
(2, 'PROVEEDOR DOS S.R.L.', '123123123123', 'LOS PEDREGALES', 'EDUARDO CONDORI', '655656556', 'DESC. PROV. DOS', '2024-05-16', '2024-05-16 15:49:57', '2024-12-02 18:48:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo_salida_id` bigint UNSIGNED NOT NULL,
  `unidad_solicitante` bigint UNSIGNED NOT NULL,
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
(3, 1, 1, 'PRUEBA SALIDA 1', '2024-05-17', '2024-05-17', '2024-05-17 19:47:59', '2024-05-17 19:47:59'),
(4, 2, 1, 'DESCRIPCION SALIDA', '2024-05-29', '2024-05-29', '2024-05-29 12:24:18', '2024-05-29 12:24:18'),
(7, 1, 1, 'descripcion', '2024-05-29', '2024-05-29', '2024-05-29 12:37:34', '2024-05-29 12:37:34'),
(8, 2, 2, 'descripcion salida', '2024-12-02', '2024-12-02', '2024-12-02 19:13:37', '2024-12-02 19:13:37');

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
(5, 3, 2, 3.00, '2024-05-17 19:47:59', '2024-05-17 19:47:59'),
(6, 4, 1, 50.00, '2024-05-29 12:24:18', '2024-05-29 12:24:18'),
(7, 7, 1, 30.00, '2024-05-29 12:37:34', '2024-05-29 12:37:34'),
(8, 7, 2, 40.00, '2024-05-29 12:37:34', '2024-05-29 12:37:34'),
(9, 8, 1, 7.00, '2024-12-02 19:13:37', '2024-12-02 19:13:37');

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
(1, 'TIPO INGRESO UNO', 'TIPO DE INGRESO UNO', '2024-05-17', '2024-05-17 15:26:57', '2024-12-02 18:26:34'),
(2, 'TIPO INGRESO DOS', '', '2024-05-17', '2024-05-17 15:27:03', '2024-12-02 18:26:38');

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
(1, 'TIPO PRODUCTO UNO', 'DESC. TIPO UNO', '2024-05-16', '2024-05-16 16:00:44', '2024-12-02 18:23:21'),
(2, 'TIPO PRODUCTO DOS', '', '2024-05-16', '2024-05-16 16:00:50', '2024-12-02 18:23:28');

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
(1, 'TIPO DE SALIDA UNO', 'DESC. TIPO SALIDA UNO', '2024-05-17', '2024-05-17 19:07:29', '2024-12-02 18:27:11'),
(2, 'TIPO DE SALIDA DOS', '', '2024-05-17', '2024-05-17 19:07:38', '2024-12-02 18:27:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidads`
--

CREATE TABLE `unidads` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(700) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `unidads`
--

INSERT INTO `unidads` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'UNIDAD LA PAZ', 'DESC UNIDAD  LA PAZ', '2024-12-02 18:56:34', '2024-12-02 18:56:40'),
(2, 'UNIDAD SANTA CRUZ', '', '2024-12-02 18:56:46', '2024-12-02 18:56:46');

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
(2, 'JPERES', '$2y$12$S5xCEOkchMcOqZESxFF.qOGydDkt8nvr3VcB0O5yqnQyqa/3JqptS', 'JUAN', 'PERES', 'MAMANI', '111', 'LP', 'LOS OLIVOS NRO. 2', 'JUAN@GMAIL.COM', '77777777', 'SUPERVISOR DE ALMACEN', '1715274374_JPERES.jpg', 1, '2024-05-09', '2024-05-09 17:06:14', '2024-12-02 18:43:40'),
(3, 'MMAMANI', '$2y$12$sjG/cz2q0H7k0nn1.Ya6GODlBnj6DvplYcTej8bU3RBGWt9dCJ/Pm', 'MARCOS', 'MAMANI', '', '2222', 'LP', 'LOS OLIVOS', '', '7777777', 'ALMACENERO', NULL, 1, '2024-05-20', '2024-05-20 16:09:22', '2024-12-02 18:21:09');

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
  ADD KEY `salidas_tipo_salida_id_foreign` (`tipo_salida_id`),
  ADD KEY `salidas_unidad_solicitante_foreign` (`unidad_solicitante`);

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
-- Indices de la tabla `unidads`
--
ALTER TABLE `unidads`
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `ingresos`
--
ALTER TABLE `ingresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `kardex_productos`
--
ALTER TABLE `kardex_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `notificacions`
--
ALTER TABLE `notificacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `notificacion_users`
--
ALTER TABLE `notificacion_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `salida_detalles`
--
ALTER TABLE `salida_detalles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- AUTO_INCREMENT de la tabla `unidads`
--
ALTER TABLE `unidads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `salidas_tipo_salida_id_foreign` FOREIGN KEY (`tipo_salida_id`) REFERENCES `tipo_salidas` (`id`),
  ADD CONSTRAINT `salidas_unidad_solicitante_foreign` FOREIGN KEY (`unidad_solicitante`) REFERENCES `unidads` (`id`);

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

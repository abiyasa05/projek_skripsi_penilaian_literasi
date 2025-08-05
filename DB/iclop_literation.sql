-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 05, 2025 at 04:26 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iclop_literation`
--

-- --------------------------------------------------------

--
-- Table structure for table `literacy_answers`
--

CREATE TABLE `literacy_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `option_id` bigint UNSIGNED DEFAULT NULL,
  `assessment_id` bigint UNSIGNED NOT NULL,
  `answer_text` text,
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `feedback` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `literacy_answers`
--

INSERT INTO `literacy_answers` (`id`, `question_id`, `option_id`, `assessment_id`, `answer_text`, `submitted_at`, `feedback`, `created_at`, `updated_at`) VALUES
(609, 94, NULL, 606, 'meminta cara untuk membunuh orang kayo hitam', '2025-06-21 02:43:34', NULL, '2025-06-21 02:43:34', '2025-06-21 05:26:52'),
(610, 95, NULL, 606, 'Orang Kayo Hitam memang terlalu sakti. Kalaupun ada yang dapat membunuhnya, syaratnya terlalu berat.', '2025-06-21 02:43:34', 'Terjadi kesalahan saat menghubungi AI.', '2025-06-21 02:43:34', '2025-06-21 05:33:22'),
(611, 96, NULL, 606, 'hebat, kuat', '2025-06-21 02:43:34', 'Terjadi kesalahan saat menghubungi AI.', '2025-06-21 02:43:34', '2025-06-21 05:33:32'),
(612, 97, NULL, 606, 'terlalu sakti', '2025-06-21 02:43:34', NULL, '2025-06-21 02:43:34', '2025-06-21 05:33:01'),
(613, 98, NULL, 606, 'yang mulia', '2025-06-21 02:43:34', NULL, '2025-06-21 02:43:34', '2025-06-21 05:27:55'),
(614, 99, 230, 606, NULL, '2025-06-21 04:47:48', NULL, '2025-06-21 04:47:48', '2025-06-21 04:58:05'),
(615, 100, 233, 606, NULL, '2025-06-21 05:02:17', NULL, '2025-06-21 05:02:17', '2025-06-21 05:15:12'),
(616, 101, 235, 606, NULL, '2025-06-21 05:15:20', NULL, '2025-06-21 05:15:20', '2025-06-21 05:15:20'),
(617, 102, 240, 606, NULL, '2025-06-21 05:15:23', NULL, '2025-06-21 05:15:23', '2025-06-21 05:15:23'),
(618, 103, 244, 606, NULL, '2025-06-21 05:16:17', NULL, '2025-06-21 05:16:17', '2025-06-21 05:16:17'),
(619, 104, 247, 606, NULL, '2025-06-21 05:16:51', NULL, '2025-06-21 05:16:51', '2025-06-21 05:16:51'),
(620, 105, 252, 606, NULL, '2025-06-21 05:17:08', NULL, '2025-06-21 05:17:08', '2025-06-21 05:17:08'),
(621, 106, 256, 606, NULL, '2025-06-21 05:19:38', NULL, '2025-06-21 05:19:38', '2025-06-21 05:19:38'),
(622, 107, 260, 606, NULL, '2025-06-21 05:22:11', NULL, '2025-06-21 05:22:11', '2025-06-21 05:22:11'),
(623, 108, 264, 606, NULL, '2025-06-21 05:25:16', NULL, '2025-06-21 05:25:16', '2025-06-21 05:25:16'),
(624, 109, 267, 606, NULL, '2025-06-21 05:25:21', NULL, '2025-06-21 05:25:21', '2025-06-21 05:25:21'),
(625, 110, 271, 606, NULL, '2025-06-21 05:25:26', NULL, '2025-06-21 05:25:26', '2025-06-21 05:25:26'),
(626, 111, 275, 606, NULL, '2025-06-21 05:25:42', NULL, '2025-06-21 05:25:42', '2025-06-21 05:25:42'),
(627, 112, 279, 606, NULL, '2025-06-21 05:25:49', NULL, '2025-06-21 05:25:49', '2025-06-21 05:25:49'),
(628, 113, 285, 606, NULL, '2025-06-21 05:26:11', NULL, '2025-06-21 05:26:11', '2025-06-21 05:26:11'),
(629, 94, NULL, 622, 'ingin membunuh orang kayo hitam', '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:59:41'),
(630, 95, NULL, 622, 'orang kayo hitam terlalu sakti', '2025-06-21 07:13:28', 'Feedback tidak tersedia saat ini.', '2025-06-21 07:13:28', '2025-06-22 07:09:48'),
(631, 96, NULL, 622, 'lemah', '2025-06-21 07:13:28', 'Feedback tidak tersedia saat ini.', '2025-06-21 07:13:28', '2025-06-22 07:09:48'),
(632, 97, NULL, 622, 'menyerah', '2025-06-21 07:13:28', 'Feedback tidak tersedia saat ini.', '2025-06-21 07:13:28', '2025-06-22 07:09:48'),
(633, 98, NULL, 622, 'yang mulia', '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 07:01:44'),
(634, 99, 230, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-21 07:13:38'),
(635, 100, 231, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:58:35'),
(636, 101, 235, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:58:29'),
(637, 102, 240, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:58:31'),
(638, 103, 244, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:58:44'),
(639, 104, 247, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:58:49'),
(640, 105, 252, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:58:50'),
(641, 106, 256, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:58:57'),
(642, 107, 260, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:58:59'),
(643, 108, 264, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:59:02'),
(644, 109, 267, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:59:04'),
(645, 110, 271, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:59:06'),
(646, 111, 275, 622, NULL, '2025-06-21 07:13:28', NULL, '2025-06-21 07:13:28', '2025-06-22 06:59:07'),
(647, 112, 279, 622, NULL, '2025-06-21 07:13:29', NULL, '2025-06-21 07:13:29', '2025-06-22 06:59:09'),
(648, 113, 284, 622, NULL, '2025-06-21 07:13:29', NULL, '2025-06-21 07:13:29', '2025-06-22 06:59:12'),
(729, 94, NULL, 627, 'cara untuk membunuh orang kayo hitam', '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:33:00'),
(730, 95, NULL, 627, 'syaratnya terlalu kuat', '2025-06-22 10:13:20', 'Terjadi kesalahan saat menghubungi AI.', '2025-06-22 10:13:20', '2025-06-25 02:33:59'),
(731, 96, NULL, 627, 'kuat, hebat', '2025-06-22 10:13:20', '**Feedback:** Tidak ada yang salah dengan jawaban kamu! Namun perlu diperhatikan, dalam kalimat itu, kata \'sakti\' memiliki arti istimewa. Jika kamu ingin menulis sinonimnya, sebaiknya tuliskan kata-kata itu urut dari berasal dari awal.', '2025-06-22 10:13:20', '2025-06-25 02:34:07'),
(732, 97, NULL, 627, 'memohon ampun dengan hormat', '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:33:38'),
(733, 98, NULL, 627, 'raja', '2025-06-22 10:13:20', '**Feedback:** \"Bagus sekali kamu mencoba menjawab soal ini! Namun, perlu diperhatikan bahwa jawaban \'yang mulia\' lebih tepat karena ahli nujum saat itu menunjukkan rasa hormat kepada Ratu dengan menggunakan gelar kehormatan yang tepat.\"\n\n**Petunjuk Tambahan:** \"Apa yang membuat jawaban \'yang mulia\' lebih baik? Kamu bisa coba membaca lagi soalnya untuk memahami apa yang dimaksud.\"', '2025-06-22 10:13:20', '2025-06-25 02:34:16'),
(734, 99, 230, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:09'),
(735, 100, 233, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:16'),
(736, 101, 235, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:16'),
(737, 102, 240, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:25'),
(738, 103, 244, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:26'),
(739, 104, 247, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:28'),
(740, 105, 252, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:29'),
(741, 106, 256, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:30'),
(742, 107, 260, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:34'),
(743, 108, 264, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:35'),
(744, 109, 267, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-22 10:20:52'),
(745, 110, 271, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:38'),
(746, 111, 275, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:39'),
(747, 112, 279, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:41'),
(748, 113, 284, 627, NULL, '2025-06-22 10:13:20', NULL, '2025-06-22 10:13:20', '2025-06-25 02:32:45'),
(749, 94, NULL, 628, 'ingin membunuh orang kayo hitam', '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:56'),
(750, 95, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(751, 96, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(752, 97, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(753, 98, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(754, 99, 227, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:18'),
(755, 100, 233, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:20'),
(756, 101, 236, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:26'),
(757, 102, 240, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:24'),
(758, 103, 244, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:22'),
(759, 104, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(760, 105, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(761, 106, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(762, 107, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(763, 108, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(764, 109, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(765, 110, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(766, 111, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(767, 112, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(768, 113, NULL, 628, NULL, '2025-06-22 10:34:16', NULL, '2025-06-22 10:34:16', '2025-06-22 10:34:16'),
(769, 94, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(770, 95, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(771, 96, NULL, 638, 'tes', '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:08:07'),
(772, 97, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(773, 98, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(774, 99, 230, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:55:00'),
(775, 100, 232, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:58'),
(776, 101, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(777, 102, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(778, 103, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(779, 104, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(780, 105, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(781, 106, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(782, 107, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(783, 108, 263, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:08:00'),
(784, 109, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(785, 110, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(786, 111, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(787, 112, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(788, 113, NULL, 638, NULL, '2025-06-25 03:07:53', NULL, '2025-06-25 03:07:53', '2025-06-25 03:07:53'),
(789, 94, NULL, 639, 'cara untuk membunuh orang kayo hitam', '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:59:03'),
(790, 95, NULL, 639, 'syaratnya terlalu berat', '2025-07-01 05:56:45', 'Terjadi kesalahan saat menghubungi AI.', '2025-07-01 05:56:45', '2025-07-01 06:00:01'),
(791, 96, NULL, 639, 'hebat, kuat', '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:59:18'),
(792, 97, NULL, 639, 'memohon ampun dengan hormat', '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:59:35'),
(793, 98, NULL, 639, 'putri', '2025-07-01 05:56:45', 'Siswa! Jawabanmu terdekat dengan jawaban ideal adalah \"putri\". Namun, perlu kamu tahu, jawaban ideal sebenarnya lebih tepat dengan kata bermakna yang mulia. Paham? \n\nMungkin kamu dapat menambah pengetahuan tentang bagaimana ahli nujum menghormati raja atau ratu pada masa lalu!', '2025-07-01 05:56:45', '2025-07-01 06:00:11'),
(794, 99, 230, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:06'),
(795, 100, 233, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:12'),
(796, 101, 235, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:16'),
(797, 102, 240, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:20'),
(798, 103, 244, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:30'),
(799, 104, 247, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:36'),
(800, 105, 252, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:45'),
(801, 106, 256, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:47'),
(802, 107, 260, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:54'),
(803, 108, 264, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:56'),
(804, 109, 267, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:58'),
(805, 110, 271, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:57:59'),
(806, 111, 275, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:58:01'),
(807, 112, 279, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:58:05'),
(808, 113, 284, 639, NULL, '2025-07-01 05:56:45', NULL, '2025-07-01 05:56:45', '2025-07-01 05:58:08'),
(810, 94, NULL, 621, 'cara untuk membunuh orang kayo hitam', '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:36:00'),
(811, 95, NULL, 621, 'syaratnya terlalu berat karena terlalu kuat', '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:36:23'),
(812, 96, NULL, 621, 'kuat, hebat', '2025-07-06 02:33:53', 'Terjadi kesalahan saat menghubungi AI.', '2025-07-06 02:33:53', '2025-07-06 02:48:46'),
(813, 97, NULL, 621, 'memohon ampun dengan hormat', '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:36:42'),
(814, 98, NULL, 621, 'putri', '2025-07-06 02:33:53', 'Terjadi kesalahan saat menghubungi AI.', '2025-07-06 02:33:53', '2025-07-06 02:48:56'),
(815, 99, 230, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:10'),
(816, 100, 233, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:11'),
(817, 101, 235, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:13'),
(818, 102, 240, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:14'),
(819, 103, 244, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:19'),
(820, 104, 247, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:21'),
(821, 105, 252, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:23'),
(822, 106, 256, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:35'),
(823, 107, 260, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:44'),
(824, 108, 264, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:46'),
(825, 109, 267, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:47'),
(826, 110, 271, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:51'),
(827, 111, 275, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:34:53'),
(828, 112, 279, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:35:03'),
(829, 113, 284, 621, NULL, '2025-07-06 02:33:53', NULL, '2025-07-06 02:33:53', '2025-07-06 02:35:04'),
(831, 94, NULL, 641, 'cara untuk membunuh orang kayo hitam', '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:52:01'),
(832, 95, NULL, 641, 'terlalu berat', '2025-07-06 02:51:04', 'Terjadi kesalahan saat menghubungi AI.', '2025-07-06 02:51:04', '2025-07-06 02:55:30'),
(833, 96, NULL, 641, 'hebat, kuat', '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:52:16'),
(834, 97, NULL, 641, 'memohon ampun dengan hormat', '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:52:25'),
(835, 98, NULL, 641, 'putri', '2025-07-06 02:51:04', 'Terjadi kesalahan saat menghubungi AI.', '2025-07-06 02:51:04', '2025-07-06 02:55:40'),
(836, 99, 230, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:31'),
(837, 100, 233, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:33'),
(838, 101, 235, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:36'),
(839, 102, 240, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:37'),
(840, 103, 244, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:38'),
(841, 104, 247, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:39'),
(842, 105, 252, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:41'),
(843, 106, 256, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:42'),
(844, 107, 260, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:44'),
(845, 108, 264, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:45'),
(846, 109, 267, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:47'),
(847, 110, 271, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:48'),
(848, 111, 275, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:50'),
(849, 112, 280, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:52'),
(850, 113, 284, 641, NULL, '2025-07-06 02:51:04', NULL, '2025-07-06 02:51:04', '2025-07-06 02:51:53'),
(851, 94, NULL, 642, 'cara untuk membunuh orang kayo hitam', '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 03:00:14'),
(852, 95, NULL, 642, 'syaratnya terlalu berat karena terlalu kuat', '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 03:00:31'),
(853, 96, NULL, 642, 'hebat, kuat', '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 03:00:35'),
(854, 97, NULL, 642, 'memohon ampun dengan hormat', '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 03:00:42'),
(855, 98, NULL, 642, 'putri', '2025-07-06 02:59:38', '**Feedback:** Tidak terlalu sulit ya untuk menjawab soal ini! Namun, pada saat menjawab Ratu, seharusnya kita menggunakan gelar kehormatan \"yang mulia\" bukan \"putri\". Coba kamu ingat lagi apa yang biasa digunakan oleh ahli nujum saat berbicara dengan seseorang yang hormat.', '2025-07-06 02:59:38', '2025-07-06 03:01:11'),
(856, 99, 230, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:43'),
(857, 100, 233, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:45'),
(858, 101, 235, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:46'),
(859, 102, 240, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:47'),
(860, 103, 244, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:49'),
(861, 104, 248, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:51'),
(862, 105, 252, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:52'),
(863, 106, 256, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:53'),
(864, 107, 260, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:55'),
(865, 108, 264, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:56'),
(866, 109, 267, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:57'),
(867, 110, 271, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 02:59:58'),
(868, 111, 275, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 03:00:01'),
(869, 112, 279, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 03:00:02'),
(870, 113, 284, 642, NULL, '2025-07-06 02:59:38', NULL, '2025-07-06 02:59:38', '2025-07-06 03:00:03'),
(871, 94, NULL, 633, 'cara untuk membunuh orang kayo hitam', '2025-07-06 03:05:53', NULL, '2025-07-06 03:05:53', '2025-07-06 03:06:53'),
(872, 95, NULL, 633, 'syaratnya terlalu berat karena terlalu kuat', '2025-07-06 03:05:53', NULL, '2025-07-06 03:05:53', '2025-07-06 03:07:10'),
(873, 96, NULL, 633, 'hebat, kuat', '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:53', '2025-07-06 03:07:14'),
(874, 97, NULL, 633, 'memohon dengan ampun dengan hormat', '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:07:21'),
(875, 98, NULL, 633, 'putri', '2025-07-06 03:05:54', '**Feedback:** Tidak terlalu sulit ya untuk menjawab soal ini! Namun, pada saat menjawab Ratu, seharusnya kita menggunakan gelar kehormatan \"yang mulia\" bukan \"putri\". Coba kamu ingat lagi apa yang biasa digunakan oleh ahli nujum saat berbicara dengan seseorang yang hormat.', '2025-07-06 03:05:54', '2025-07-06 03:10:28'),
(876, 99, 230, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:17'),
(877, 100, 233, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:18'),
(878, 101, 235, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:19'),
(879, 102, 240, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:20'),
(880, 103, 244, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:22'),
(881, 104, 247, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:23'),
(882, 105, 252, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:25'),
(883, 106, 256, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:30'),
(884, 107, 260, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:31'),
(885, 108, 264, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:32'),
(886, 109, 267, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:34'),
(887, 110, 271, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:35'),
(888, 111, 275, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:36'),
(889, 112, 279, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:37'),
(890, 113, 284, 633, NULL, '2025-07-06 03:05:54', NULL, '2025-07-06 03:05:54', '2025-07-06 03:06:38');

-- --------------------------------------------------------

--
-- Table structure for table `literacy_assessments`
--

CREATE TABLE `literacy_assessments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` enum('in_progress','completed','pending') NOT NULL DEFAULT 'pending',
  `score` int DEFAULT NULL,
  `assessed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `literacy_assessments`
--

INSERT INTO `literacy_assessments` (`id`, `user_id`, `status`, `score`, `assessed_at`, `created_at`, `updated_at`) VALUES
(563, 1577, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(564, 1579, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(565, 1580, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(566, 1586, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(567, 1588, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(568, 1591, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(569, 1592, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(570, 1593, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(571, 1594, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(572, 1595, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(573, 1596, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(574, 1597, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(575, 1598, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(576, 1599, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(577, 1600, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(578, 1601, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(579, 1602, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(580, 1604, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(581, 1605, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(582, 1606, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(583, 1607, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(584, 1608, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(585, 1610, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(586, 1611, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(587, 1612, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(588, 1613, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(589, 1614, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(590, 1615, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(591, 1616, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(592, 1617, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(593, 1618, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(594, 1619, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(595, 1620, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(596, 1621, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(597, 1622, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(598, 1623, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(599, 1624, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(600, 1625, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(601, 1626, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(602, 1627, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(603, 1628, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(604, 1629, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(605, 1630, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(606, 1631, 'completed', 70, '2025-06-21 05:33:32', '2025-06-21 02:43:08', '2025-06-21 05:33:32'),
(607, 1634, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(608, 1639, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(609, 1641, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(610, 1642, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(611, 1643, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(612, 1644, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(613, 1645, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(614, 1646, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(615, 1647, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(616, 1648, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(617, 1651, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(618, 1652, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(619, 1655, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(620, 1656, 'pending', 0, NULL, '2025-06-21 02:43:08', '2025-06-21 02:43:08'),
(621, 1631, 'completed', 75, '2025-07-06 02:48:56', '2025-06-21 05:33:32', '2025-07-06 02:48:56'),
(622, 1658, 'completed', 33, '2025-06-22 07:09:48', '2025-06-21 07:13:10', '2025-06-22 07:09:48'),
(627, 1658, 'completed', 63, '2025-06-25 02:34:16', '2025-06-22 08:31:44', '2025-06-25 02:34:16'),
(628, 1659, 'in_progress', 0, NULL, '2025-06-22 10:33:53', '2025-06-22 10:34:16'),
(629, 1660, 'pending', 0, NULL, '2025-06-22 10:33:53', '2025-06-22 10:33:53'),
(630, 1661, 'pending', 0, NULL, '2025-06-22 10:33:53', '2025-06-22 10:33:53'),
(631, 1662, 'pending', 0, NULL, '2025-06-22 10:33:53', '2025-06-22 10:33:53'),
(632, 1663, 'pending', 0, NULL, '2025-06-22 10:33:53', '2025-06-22 10:33:53'),
(633, 1664, 'completed', 88, '2025-07-06 03:10:28', '2025-06-22 10:33:53', '2025-07-06 03:10:28'),
(634, 1665, 'pending', 0, NULL, '2025-06-22 10:33:53', '2025-06-22 10:33:53'),
(635, 1666, 'pending', 0, NULL, '2025-06-22 10:33:53', '2025-06-22 10:33:53'),
(636, 1667, 'pending', 0, NULL, '2025-06-22 10:33:53', '2025-06-22 10:33:53'),
(637, 1668, 'pending', 0, NULL, '2025-06-22 10:33:53', '2025-06-22 10:33:53'),
(638, 1658, 'in_progress', NULL, NULL, '2025-06-25 02:34:16', '2025-06-25 03:07:53'),
(639, 1670, 'completed', 76, '2025-07-01 06:00:11', '2025-07-01 05:54:11', '2025-07-01 06:00:11'),
(640, 1670, 'pending', NULL, NULL, '2025-07-01 06:00:11', '2025-07-01 06:00:11'),
(641, 1631, 'completed', 73, '2025-07-06 02:55:40', '2025-07-06 02:48:56', '2025-07-06 02:55:40'),
(642, 1631, 'completed', 85, '2025-07-06 03:01:11', '2025-07-06 02:55:40', '2025-07-06 03:01:11'),
(643, 1631, 'pending', NULL, NULL, '2025-07-06 03:01:11', '2025-07-06 03:01:11'),
(644, 1664, 'pending', NULL, NULL, '2025-07-06 03:10:28', '2025-07-06 03:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `literacy_generated_texts`
--

CREATE TABLE `literacy_generated_texts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `material_id` bigint UNSIGNED NOT NULL,
  `generate_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `question_type` enum('multiple_choice','essay') NOT NULL,
  `question_count` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `literacy_generated_texts`
--

INSERT INTO `literacy_generated_texts` (`id`, `user_id`, `material_id`, `generate_text`, `question_type`, `question_count`, `created_at`, `updated_at`) VALUES
(98, 1635, 21, 'Berikut ini adalah **Paragraf** berdasarkan materi bacaan yang diberikan:\n\n---\n\n### 📄 Format Output: Paragraf\nKehidupan Lem Mahmud dan istri, Da Limah sangat sederhana. Mereka tinggal di sebuah gubuk tua yang hampir rubuh. Gubuk yang mereka tempati berdindingkan pelepah rumbia dan beralaskan tanah liat yang sudah mengeras. Atapnya daun kelapa kering yang dianyam pada sebilah bambu. Da Limah sendiri yang menganyamnya.\n\n---\n\nDan ini adalah **Soal Pilihan Ganda** berdasarkan paragraf tersebut:\n\n1. Pada akhir pernyataan, apa yang dimaksud dengan atap daun kelapa?\n   A. Atap rumah yang hanya bertahan setahun saja\n   B. Atap rumah yang memerlukan ganti setiap dua tahun sekali\n   C. Atap rumah yang sangat sederhana dibandingkan atap rumah biasa\n   D. Atap rumah yang terbuat dari bahan daun kelapa dan bambu\n   Jawaban: B\n   Bobot: 2\n\n2. Pada pernyataan di atas, bagaimana cara membuat anyaman daun kelapa?\n   A. Daun kelapa direndam air sungai selama semalam\n   B. Dengan menggunakan bambu sebagai bahan ankan yang dianyam\n   C. Atap rumah itu tidak perlu dibersihkan dengan sabun\n   D. Atap daun kelapa memerlukan waktu dan kesabaran\n   Jawaban: A\n   Bobot: 1\n\n3. Bagaimana cara mengganti atap yang sudah lama dipasang di rumah Lem Mahmud?\n   A. Menggunakan bahan-bahan baru seperti bambu dan daun kelapa yang masih segar\n   B. Menambahkan lebih banyak daun rumbia agar atapnya semakin kuat\n   C. Atap yang telah lama diganti dengan anyaman daun kelapa baru\n   D. Membeli atap rumah dari toko-toko di sekitar desa\n   Jawaban: C\n   Bobot: 1\n\n4. Bagaimana cara membuat tikar daun nipah?\n   A. Menggunakan bambu sebagai bahan ankan yang dianyam\n   B. Daun kelapa direndam air sungai selama semalam agar mudah disusun dan tidak mudah patah\n   C. Atap rumah itu dibuat dengan menggunakan anyaman daun kelapa kering\n   D. Tikar daun nipah dirajut oleh istrinya sendiri\n   Jawaban: D\n   Bobot: 2\n\n5. Bagaimana hubungan antara Lem Mahmud dan istri, Da Limah dalam membuat atap rumah?\n   A. Mereka sama-sama mengganti anyaman daun kelapa yang lama\n   B. Istri menganyam atap dari daun kelapa kering, sedangkan suami mendirikannya di atas gubuk\n   C. Atap rumah dibuat oleh siapa saja yang tinggal didalamnya tanpa ada hubungan yang spesifik\n   D. Suami mengganti atap yang lama dengan menggunakan anyaman daun kelapa baru\n   Jawaban: B\n   Bobot: 1', 'multiple_choice', 5, '2025-06-20 14:37:13', '2025-06-20 14:37:13'),
(102, 1635, 20, 'Baiklah, saya akan memilih sebuah paragraf dari materi bacaan dan membuat 5 soal literasi untuk siswa SD kelas 3 dan 4.\n\n**Paragraf:**\n\"Kisah tentang seekor burung yang sangat bangga dengan kemampuan mengarangnya. Burung ini bisa membuat sarang yang kompleks dan unik. Ia sangat percaya diri dan selalu berbagi keindahan ciptaannya kepada teman-temannya. Suatu hari, seekor kupu-kupu lelah mencari tempat yang indah untuk menempati sarangnya dan menemukan rumah mewah milik burung itu. Kupu-kupu merasa sangat bangga bisa tinggal di rumah tersebut.\"\n\n**Soal Pilihan Ganda:**\n\n1. Siapa yang memiliki kemampuan mengarang yang luar biasa?\n   A. Burung\n   B. Kupu-kupu\n   C. Manusia\n   D. Hewan lainnya\n   Jawaban: A\n   Bobot: 2\n\n2. Apa yang membuat burung itu bangga?\n   A. Kemampuan mengarang\n   B. Keindahan ciptaan\n   C. Ukuran rumah\n   D. Karena teman-temannya\n   Jawaban: A\n   Bobot: 1\n\n3. Siapa yang merasa sangat bangga bisa tinggal di rumah milik burung itu?\n   A. Burung\n   B. Kupu-kupu\n   C. Manusia\n   D. Hewan lainnya\n   Jawaban: B\n   Bobot: 2\n\n4. Apa yang dapat dilakukan oleh burung itu?\n   A. Mengarang sarang kompleks dan unik\n   B. Menyimpan bahan makanan\n   C. Membuat tempat beristirahat\n   D. Berburu hewan lainnya\n   Jawaban: A\n   Bobot: 1\n\n5. Apa pesan moral atau nilai karakter yang dapat diambil dari kisah ini?\n   A. Percaya diri, karena kemampuan akan membuat kita bangga.\n   B. Jangan berbagi keindahan ciptaan dengan orang lain.\n   C. Ukuran rumah bukanlah penentu keindahan atau keanggunan.\n   D. Hanya manusia yang memiliki kemampuan mengarang.\n   Jawaban: A\n   Bobot: 2\n\nDari paragraf tersebut, saya telah membuat 5 soal literasi dengan variasi jenis pertanyaan seperti fakta eksplisit, ide pokok, makna tersirat, dan pesan moral atau nilai karakter.', 'multiple_choice', 5, '2025-06-20 15:00:27', '2025-06-20 15:00:27'),
(106, 1635, 20, '**Paragraf:**\n“Suamiku, mengapa hingga kini, kita belum jua dikaruniai keturunan? Siapakah kelak yang akan meneruskan tampuk kepemimpinan kerajaan ini jika kita sudah tak ada lagi di dunia?” Ratu Malika bertanya dengan pelan. “Istriku, kita harus tetap bersabar menghadapi keadaan ini. Tentu Tuhan tidak akan menimpakan permasalahan yang tidak dapat kita tanggung dan selesaikan. Aku berharap, engkau akan terus bersabar, Ratuku.” Baginda Hasyim berupaya menenangkan perasaan Ratu Malika yang terlihat sangat cemas dan gelisah.\n\n**Soal Pilihan Ganda:**\n\n1. Siapa yang bertanya kepada suaminya mengapa belum dikaruniai keturunan?\n   A. Permaisuri\n   B. Raja Hasyim\n   C. Ratu Malika\n   D. Sang Permaisuri\n   Jawaban: C\n   Bobot: 1\n\n2. Apa yang ditekankan oleh Baginda Hasyim kepada Ratu Malika?\n   A. Kita harus menunggu waktu Tuhan\n   B. Kami akan mencari jalan alternatif\n   C. Tetaplah sabar menghadapi keadaan ini\n   D. Mencari bantuan dari kerajaan lain\n   Jawaban: C\n   Bobot: 2\n\n3. Apa yang ditunjukkan oleh Ratu Malika ketika bertanya kepada suaminya?\n   A. Senang dan gembira\n   B. Tidak terlalu peduli akan masalah tersebut\n   C. Cemas dan gelisah\n   D. Menyuruh Baginda Hasyim untuk pergi mencari jawaban sendiri\n   Jawaban: C\n   Bobot: 1\n\n4. Apa yang diharapkan oleh Baginda Hasyim kepada Ratu Malika?\n   A. Tidak akan sabar lagi\n   B. Harus mencari bantuan dari orang lain\n   C. Terus bersabar menghadapi keadaan tersebut\n   D. Mencari jawaban dengan sendirinya\n   Jawaban: C\n   Bobot: 2\n\n5. Apa yang akan terjadi jika Tuhan tidak menimpakan permasalahan yang tidak dapat ditaatkan oleh manusia?\n   A. Perutangan kejahatan semakin marak\n   B. Kekacauan dan perselisihan semakin meningkat\n   C. Masyarakat menjadi lebih baik dan harmonis\n   D. Tidak ada perubahan apa-apa\n   Jawaban: C\n   Bobot: 2', 'multiple_choice', 5, '2025-06-20 15:14:08', '2025-06-20 15:14:08'),
(110, 1635, 22, '**Paragraf:**\n\"Mereka sedikit mempercepat langkahnya. Onak dan duri tidak mereka hiraukan. Ranting-ranting kayu yang jatuh menghalangi jalan dengan cepat mereka singkirkan.\"\n\n**Soal Pilihan Ganda:**\n\n1. Bagaimana sifat Suntre dan Sasandewini saat berjalan menuju hutan?\n   A. Mereka sedang santai.\n   B. Mereka sedikit mempercepat langkahnya.\n   C. Mereka tidak hiraukan onak dan duri.\n   D. Mereka singkirkan ranting-ranting kayu yang jatuh dengan cepat.\n   Jawaban: B\n   Bobot: 3\n\n**Paragraf:**\n\"Semangat mereka sekeras baja, pantang menyerah. Semangatnya telah mengalahkan rintangan yang ada.\"\n\n**Soal Isian:**\n\n1. Apa yang dilakukan Suntre dan Sasandewini saat berjalan menuju hutan?\n   Jawaban: Mereka sedikit mempercepat langkahnya, tidak membawa perhatian terhadap onak dan duri, serta menyingkirkan ranting-ranting kayu dengan cepat.\n   Bobot: 4\n\n2. Bagaimana sifat Suntre dan Sasandewini saat menghadapi rintangan di hutan?\n   Jawaban: Semangat mereka sekeras baja dan pantang menyerah.\n   Bobot: 5\n\n3. Apa yang terjadi pada dua gadis itu setelah memasuki Hutan Kowera?\n   Jawaban: Mereka tidak berani masuk terlalu jauh karena takut tersesat.\n   Bobot: 4\n\n4. Apa yang dilakukan Suntre dan Sasandewini saat melihat kupu-kupu di hutan?\n   Jawaban: Mereka membiarkannya terbang bebas.\n   Bobot: 3\n\n5. Apa yang membuat Sasandewini dan Suntre ingin segera pulang dari perjalanan menuju Hutan Kowera?\n   Jawaban: Hari sudah siang dan mereka takut sampai malam tidak dapat kembali ke rumah.\n   Bobot: 4', 'essay', 5, '2025-06-20 15:38:18', '2025-06-20 15:38:18'),
(111, 1635, 25, '**Paragraf:**\n\"Datu Pejanggiq sangat terkenal adil dan bijaksana di negerinya, dengan sifat berani dan sakti mandraguna. Baginda raja memiliki benda keramat yang diberi nama ‘Gumala Hikmat’. Postur tubuhnya gagah berwibawa.\"\n\n**Soal Isian:**\n1. Siapakah raja yang terkenal adil dan bijaksana? \n   Jawaban: Datu Pejanggiq\n   Bobot: 3\n\n2. Sifat apa yang dimiliki oleh Datu Pejanggiq? \n   Jawaban: Berani dan sakti mandraguna.\n   Bobot: 4 \n\n3. Apa nama benda keramat milik Datu Pejanggiq?\n   Jawaban: Gumala Hikmat\n   Bobot: 5\n\n4. Bagaimana postur tubuh Datu Pejanggiq? \n   Jawaban: Gagah berwibawa\n   Bobot: 3\n\n5. Siapakah yang memberikan benda keramat tersebut kepada Datu Pejanggiq?\n   (Tidak ada jawaban karena tidak disebutkan di paragraf)\n   Bobot: -', 'essay', 5, '2025-06-20 15:48:07', '2025-06-20 15:48:07'),
(112, 1635, 20, '**Paragraf:**\n“Suamiku, mengapa hingga kini, kita belum jua dikaruniai keturunan? Siapakah kelak yang akan meneruskan tampuk kepemimpinan kerajaan ini jika kita sudah tak ada lagi di dunia?” Ratu Malika bertanya dengan pelan. Wajah bulatnya terlihat murung dan lesu.\n\n**Soal Isian:**\n1. Siapa yang pernah ditanya oleh Ratu Malika?\n   Jawaban: Suaminya\n   Bobot: 3\n\n2. Apa yang membuat Ratu Malika sangat cemas dan gelisah?\n   Jawaban: Karena belum dikaruniai keturunan\n   Bobot: 4\n\n3. Siapakah yang memberikan dukungan kepada Ratu Malika?\n   Jawaban: Suaminya\n   Bobot: 5\n\n4. Apa alasannya Raja dan Ratu Bangka tidak bisa menjawab pertanyaan dari Ratu?\n   Jawabannya: Tidak ada jawaban.\n   Bobot: 3\n\n5. Bagaimana suasana hati Ratu Malika saat bertanya pada suaminya?\n   Jawaban: Murung dan lesu\n   Bobot: 4', 'essay', 5, '2025-06-20 15:52:54', '2025-06-20 15:52:54'),
(113, 1635, 23, 'Berikut adalah 5 soal literasi berdasarkan paragraf di atas:\n\n**Paragraf:**\nRaja Dalem Solo memiliki tiga putra dan satu putri yang sangat tampan dan cantik. Suatu hari ketika sedang duduk di taman keputren bersama dayangnya, tiba-tiba Putri Keempat Dalem Solo berteriak dan terpekik.\n\n**Soal Pilihan Ganda:**\n\n1. Siapa yang berpamitan kepada Raja Dalem Solo?\n   A. Putra Sulung\n   B. Putra Kedua\n   C. Putra Ketiga\n   D. Semua keempat putra\n   Jawaban: D\n   Bobot: 1\n\n2. Apa yang dilakukan Raja Dalem Solo ketika merasakan bau harum?\n   A. Menciumi wangi itu dengan lebih kuat\n   B. Berputar berkali-kali untuk mencari sumbernya\n   C. Mendekat ke arah timur taman\n   D. Menanyakan kepada dayangnya\n   Jawaban: B\n   Bobot: 2\n\n3. Apa yang dimaksudkan oleh Raja Dalem Solo dengan \"pertanda untuk kalian mengembara\"?\n   A. Mereka harus meninggalkan istana itu\n   B. Mereka harus mencari tempat sumber wangi itu\n   C. Mereka harus menunggu instruksi lebih lanjut dari ayahandanya\n   D. Mereka harus kembali ke kerajaan dan tidak pergi sama sekali\n   Jawaban: B\n   Bobot: 2\n\n4. Siapa yang bertanggung jawab memimpin adik-adiknya dalam perjalanan jauh ini?\n   A. Raja Dalem Solo\n   B. Putra Sulung\n   C. Putri Keempat\n   D. Dayang Raja\n   Jawaban: B\n   Bobot: 1\n\n5. Apa yang dilakukan Raja Dalem Solo ketika melihat keempat putranya meninggalkan kerajaan?\n   A. Dia tersenyum dengan bahagia\n   B. Dia menghela napas panjang dan terlihat sedih\n   C. Dia memerintahkan mereka untuk kembali ke istana\n   D. Dia tidak peduli sama sekali\n   Jawaban: B\n   Bobot: 2', 'multiple_choice', 5, '2025-06-20 15:54:28', '2025-06-20 15:54:28'),
(116, 1635, 20, '**Paragraf:**\n\n Baginda Hasyim merupakan keturunan ketujuh dari silsilah Sultan Usman Hamidi, penguasa wilayah Bangka yang sangat terkenal seantero nusantara. Sejak diangkat menjadi raja dan memerintah negeri Bangka Utara, Baginda Hasyim mengutamakan sikap arif bijaksana.\n\n**Soal Pilihan Ganda:**\n\n1. Siapa keturunan ketujuh dari silsilah Sultan Usman Hamidi?\n   A. Baginda Hasyim\n   B. Ratu Malika\n   C. Raja dan Ratu Bangka Utara\n   D. Para nelayan di negeri Bangka\n   Jawaban: A. Baginda Hasyim\n   Bobot: 1\n\n2. Apa yang paling utama bagi Baginda Hasyim?\n   A. Kepentingan sendiri\n   B. Kebijaksanaan dan kesabaran\n   C. Membawa keuntungan pribadi\n   D. Mengutamakan kepentingan rakyat di atas kepentingan sendiri\n   Jawaban: D. Mengutamakan kepentingan rakyat di atas kepentingan sendiri\n   Bobot: 1\n\n3. Apa yang paling utama bagi masyarakat Bangka?\n   A. Mengutamakan kepentingan raja dan ratu\n   B. Berlomba-lomban untuk mendapatkan penghasilan\n   C. Menjadi orang yang bijaksana, sabar, dan memiliki kerukunan di antara mereka\n   D. Membawa keuntungan pribadi kepada keluarga masing-masing\n   Jawaban: C. Menjadi orang yang bijaksana, sabar, dan memiliki kerukunan di antara mereka\n   Bobot: 1\n\n4. Apa yang tidak pernah dialami oleh penduduk Bangka?\n   A. Mereka terus menikah dengan gadis asli Pulau Bangka\n   B. Mereka berlomba-lomban untuk mendapatkan penghasilan\n   C. Tidak pernah ada tindak kejahatan di negeri Bangka\n   D. Mereka selalu saling menyayangi dan menghormati satu sama lain\n   Jawaban: C. Tidak pernah ada tindak kejahatan di negeri Bangka\n   Bobot: 1\n\n5. Apa yang masih terpelihara dengan baik oleh masyarakat Bangka?\n   A. Semangat dan kegiatan gotong royong\n   B. Menjaga suasana tradisional dan keramahtamahan di antara mereka\n   C. Membawa keuntungan pribadi kepada keluarga masing-masing\n   D. Berlomba-lomban untuk mendapatkan penghasilan\n   Jawaban: A. Semangat dan kegiatan gotong royong\n   Bobot: 1', 'multiple_choice', 5, '2025-06-20 16:24:25', '2025-06-20 16:24:25'),
(117, 1635, 24, 'Paragraf:\nKemudian, Ratu Mataram memanggil ahli nujum negeri, \n“wahai ahli nujum, apa kira-kira yang dapat digunakan untuk \nmembunuh Orang Kayo Hitam?” \nJawab ahli nujum, “ampun Yang Mulia, Orang Kayo Hitam \nmemang terlalu sakti. Kalaupun ada yang dapat membunuhnya, \nsyaratnya terlalu berat.”\n\n**Soal Isian:**\n\n1. Apa yang diminta oleh Ratu Mataram kepada ahli nujum?\n   Jawaban: ... \n   Bobot: 4\n\n2. Apa syarat untuk membunuh Orang Kayo Hitam menurut ahli nujum?\n   Jawaban: Terlalu berat, dan tidak boleh disebutkan secara rinci oleh ahli nujum.\n   Bobot: 5\n\n3. Apa yang dibutuhkan Ratu Mataram untuk membunuh Orang Kayo Hitam?\n   Jawaban: Keris dan tombak terbuat dari besi Sembilan desa, dengan air penyapu dari sembilan sungai.\n   Bobot: 4\n\n4. Siapa yang menyerahkan tombak dan keris kepada Ratu Mataram?\n   Jawaban: Orang Kayo Hitam\n   Bobot: 3\n\n5. Apa yang dilakukan oleh Ratu Majapahit terhadap Orang Kayo Hitam setelah kemenangan beliau dalam perang melawan negeri lainnya?\n   Jawabannya akan disesuaikan dengan isi paragraf.\n   Bobot: 4', 'essay', 5, '2025-06-21 02:32:38', '2025-06-21 02:32:38'),
(119, 1635, 25, '### Paragraf:\n\"Pada zaman dahulu, baginda raja ini sangat terkenal adil dan bijaksana di negerinya, namanya Datu Pejanggiq. Selain sangat berani, baginda raja ini juga sakti mandraguna. Postur tubuhnya gagah berwibawa dan yang menjadikan baginda raja ini mudah dikenal adalah karena kulitnya putih kekuningan.\"\n\n### Soal Pilihan Ganda:\n1. Siapa nama raja yang terkenal adil dan bijaksana di negerinya?\n   A. Datu Pejanggiq\n   B. Patih Batu Bangka\n   C. Putri Mas Dewi Kencana\n   D. Lelaki jabut\n   Jawaban: A. Datu Pejanggiq\n   Bobot: 1\n\n2. Apa keistimewaan kulit raja yang disebutkan dalam paragraf?\n   A. Kulitnya hitam\n   B. Kulitnya putih kekuningan\n   C. Rambutnya panjang\n   D. Matanya besar\n   Jawaban: B. Kulitnya putih kekuningan\n   Bobot: 1\n\n3. Apa yang dilakukan Patih Batu Bangka saat hujan turun?\n   A. Melarikan diri\n   B. Menyuruh baginda raja tetap berteduh\n   C. Mencari tempat berlindung bagi baginda raja\n   D. Berjalan-jalan di hutan\n   Jawaban: C. Mencari tempat berlindung bagi baginda raja\n   Bobot: 1\n\n4. Siapa yang menyambut kedatangan Patih Batu Bangka dan baginda raja?\n   A. Seorang lelaki penuh bulu (jabut)\n   B. Sebuah gubug sederhana\n   C. Seorang permaisuri cantik jelita\n   D. Sebuah rumah penduduk di hutan\n   Jawaban: A. Seorang lelaki penuh bulu (jabut)\n   Bobot: 1\n\n5. Apa yang membuat baginda raja dan Patih Batu Bangka senang?\n   A. Hujan reda, baju mereka kering, dan perut mereka kenyang\n   B. Mereka menemukan gubug yang besar\n   C. Mereka bertemu dengan seorang lelaki jabut\n   D. Mereka bisa melanjutkan perjalanan untuk berburu\n   Jawaban: A. Hujan reda, baju mereka kering, dan perut mereka kenyang\n   Bobot: 2', 'multiple_choice', 5, '2025-06-21 03:04:37', '2025-06-21 03:04:37'),
(121, 1635, 22, '**Paragraf:**\nPohon pakis sedikit bisa bertahan dalam suasana kemarau seperti ini.\n\n**Soal Pilihan Ganda:**\n\n1. Pada musim apa pohon pakis bisa bertahan?\n   A. Musim hujan\n   B. Musim kemarau\n   C. Musim panas\n   D. Musim dingin\n   Jawaban: B. Musim kemarau\n   Bobot: 1\n\n2. Pada musim apa pohon pakis akan kembali bersemi?\n   A. Musim hujan\n   B. Musim kemarau\n   C. Musim panas\n   D. Musim dingin\n   Jawaban: A. Musim hujan\n   Bobot: 1\n\n3. Apa yang dilakukan tanaman untuk tetap bertahan hidup selama musim kemarau?\n   A. Menggugurkan daun untuk mengurangi penguapan\n   B. Menyimpan air di dalam akarnya\n   C. Mencari sumber air dari luar\n   D. Menanam lagi di tempat lain\n   Jawaban: A. Menggugurkan daun untuk mengurangi penguapan\n   Bobot: 1\n\n4. Apa yang menambah gerahnya suasana hutan?\n   A. Udara lembap\n   B. Cahaya matahari siang tidak terhalang awan sedikit pun\n   C. Tanah-tanah retak, menganga\n   D. Debu beterbangan bercampur daun-daun kering\n   Jawaban: B. Cahaya matahari siang tidak terhalang awan sedikit pun\n   Bobot: 2\n\n5. Apa yang menandakan kedua burung itu tengah kelelahan?\n   A. Napas mereka sangat lambat\n   B. Bulu-bulu mereka rontok\n   C. Kaki mereka terluka, kepala mereka memar, dan di bagian bawah dada pun terdapat luka\n   D. Sayap mereka lemah\n   Jawaban: C. Kaki mereka terluka, kepala mereka memar, dan di bagian bawah dada pun terdapat luka\n   Bobot: 2', 'multiple_choice', 5, '2025-06-21 03:16:18', '2025-06-21 03:16:18'),
(122, 1635, 22, '### 📚 Teks:\n\"Pakis termasuk tumbuhan paku. Pakis banyak ditemukan di hutan yang lembab. Selain di hutan, pakis juga bisa ditemukan di tebing perbukitan, merayap pada batang pohon atau batuan, di dalam kolam atau danau, serta di sela-sela bangunan yang tidak terawat.\"\n\n### Soal Pilihan Ganda:\n\n1. **Pertanyaan:** Apakah pakis ditemukan di tempat-tempat tersebut?\n   A. Ya\n   B. Tidak\n   C. Mungkin saja\n   D. Pasti tidak\n\n**Jawaban:** A.\n**Bobot:** 1\n\n2. **Pertanyaan:** Di mana pakis banyak ditemukan?\n   A. Hutan, tebing perbukitan, bangunan yang tidak terawat\n   B. Hutan dan kolam\n   C. Tebing, pohon, danau\n   D. Tidak ada jawaban\n\n**Jawaban:** A.\n**Bobot:** 1\n\n3. **Pertanyaan:** Apa yang perlu dipenuhi oleh tumbuhan paku agar tetap bertahan hidup?\n   A. Air\n   B. Sinar matahari\n   C. Udara kering\n   D. Tanah lembab\n\n**Jawaban:** A.\n**Bobot:** 2\n\n4. **Pertanyaan:** Apa yang akan dilakukan pohon pakis ketika musim hujan?\n   A. Meluruhkan daunnya\n   B. Bertahan hidup\n   C. Bersemi kembali\n   D. Menghilang\n\n**Jawaban:** C.\n**Bobot:** 1\n\n5. **Pertanyaan:** Di mana pakis bisa ditemukan di bangunan yang tidak terawat?\n   A. Sela-sela bawah\n   B. Sela-sela atas\n   C. Pada dinding\n   D. Di lantai\n\n**Jawaban:** B.\n**Bobot:** 1', 'multiple_choice', 5, '2025-06-21 03:19:53', '2025-06-21 03:19:53'),
(123, 1635, 24, 'Berikut adalah 5 soal literasi untuk kelas SD:\n\n**Paragraf:**\n\"Setelah persiapan pergantian raja dibuat, maka duduklah Orang Kayo Pingai di atas tahta kerajaan memakai pakaian serba putih. Sedangkan, Orang Kayo Hitam memakai pakaian serba kuning, yang berarti putra mahkota kerajaan.\"\n\n**Soal Pilihan Ganda:**\n\n1. Siapakah yang duduk di atas tahta kerajaan setelah persiapan pergantian raja?\n   A. Orang Kayo Pingai\n   B. Orang Kayo Hitam\n   C. Raja lama\n   D. Penduduk kerajaan\n\nJawaban: A. Orang Kayo Pingai\nBobot: 1\n\n2. Apa yang digunakan sebagai tanda putra mahkota kerajaan?\n   A. Pakaian serba putih\n   B. Pakaian serba kuning\n   C. Kopiah\n   D. Keris Si Ginjai\n\nJawaban: B. Pakaian serba kuning\nBobot: 1\n\n3. Apa yang dilakukan Orang Kayo Pingai ketika hari telah sore?\n   A. Mencabut keris Si Ginjai\n   B. Menanggalkan kopiah dan memberikannya kepada Orang Kayo Hitam\n   C. Berpikir tentang pergantian raja\n   D. Memakai pakaian serba putih\n\nJawaban: B. Menanggalkan kopiah dan memberikannya kepada Orang Kayo Hitam\nBobot: 2\n\n4. Apa yang diperintahkan oleh Orang Kayo Pingai kepada seluruh isi kerajaan?\n   A. Menghadap ke hulu Sungai Batanghari\n   B. Membuat kerajan serba putih dan serba kuning\n   C. Mengikuti titah perintahnya\n   D. Berpikir tentang pergantian raja\n\nJawaban: C. Mengikuti titah perintahnya\nBobot: 1\n\n5. Siapakah yang diakuinya oleh Orang Kayo Hitam sebagai penghulu adat kerajaan Jambi?\n   A. Raja lama\n   B. Penduduk kerajaan\n   C. Orang Kayo Pingai\n   D. Saya sendiri\n\nJawaban: C. Orang Kayo Pingai\nBobot: 1', 'multiple_choice', 5, '2025-06-22 03:50:17', '2025-06-22 03:50:17'),
(124, 1635, 23, '### Paragraf:\n\"Setelah mencari beberapa lamanya, akhirnya ia tiba di tempat bau harum itu. Tepatnya, di sebuah tempat dekat sumber mata air terdapat pohon tinggi menjulang yang mengeluarkan bau wangi menyengat.\"\n\n### Soal Pilihan Ganda:\n\n1. Apa yang dilakukan Sang Dewi setelah mendapat petunjuk untuk menemukan sumber bau harum?\n   A. Ia meminta tolong kepada Tuhan\n   B. Ia berjalan menuju tempat dengan pancaindra yang aktif.\n   C. Ia mengendarai kereta kuda ke lokasi di seberang laut\n   D. Ia menunggu petunjuk dari langit\n   Jawaban: B  \n   Bobot: 1\n\n2. Di mana terdapat sumber mata air yang berdekatan dengan pohon tinggi menjulang itu?\n   A. Di sebuah tempat di gunung\n   B. Di sebuah tempat di hutan tropis\n   C. Di sebuah tempat dekat sumber mata air\n   D. Di sebuah tempat di kota terbesar \n   Jawaban: C  \n   Bobot: 1\n\n3. Apa yang ditemukan Sang Dewi di tempat tersebut?\n   A. Pohon berduri rimbun\n   B. Sungai besar meluap\n   C. Sumber bau harum yang menyengat\n   D. Batu yang bergigi tajam \n   Jawaban: C  \n   Bobot: 1\n\n4. Apa yang dilakukan Sang Dewi setelah menemukan pohon taru menyan?\n   A. Ia menanamnya di tempat lain\n   B. Ia memakannya sebagai makanan\n   C. Ia mengelilinginya sambil merasai baunya dengan hati yang damai\n   D. Ia menempatkannya ke dalam kandang\n   Jawaban: C  \n   Bobot: 1\n\n5. Apa yang dilakukan Sang Dewi setelah ia tahu apa nama pohon taru menyan itu?\n   A. Ia meminta petunjuk lagi kepada langit\n   B. Ia tidak menanyakan lagi karena sudah tahu\n   C. Ia bertanya kepada Ida Betara tentang siapa yang akan datang ke tempat ini\n   D. Ia melupakan apa yang telah diceritakan oleh suara gaib\n   Jawaban: B  \n   Bobot: 1', 'multiple_choice', 5, '2025-06-22 04:03:54', '2025-06-22 04:03:54'),
(128, 1635, 22, 'Berikut adalah 5 soal isian berdasarkan paragraf yang diberikan:\n\n**Paragraf:**\n\"Sore itu dengan langkah tegar Sasandewini dan Suntre meninggalkan tepi Hutan Kowera. Rasa lelah seharian di hutan mereka sembunyikan di balik rasa senang karena mendapatkan daun yang mereka inginkan. Wajah ceria membucah dari wajah kedua gadis kecil itu. Mereka tidak ingin menyia-nyiakan waktu sedikit pun dalam perjalanan pulang. Selain ingin segera masak daun pakis, Sasandewini dan Suntre ingin segera mengobati luka yang ada di sekujur tubuh burung mambruk tersebut.\"\n\n**Soal Isian:**\n\n1. Apa yang dirasa oleh Sasandewini dan Suntre selain lelah?\n   Jawaban: Senang\n   Bobot: 3\n\n2. Apa yang ingin mereka lakukan terhadap burung mambruk setelah pulang?\n   Jawaban: Mengobati luka\n   Bobot: 4\n\n3. Apa yang diinginkan oleh Sasandewini dan Suntre sebelum kembali ke rumah?\n   Jawaban: Mendapatkan daun pakis untuk dimasak tumis\n   Bobot: 5\n\n4. Apa yang tersembunyi dari wajah kedua gadis kecil itu saat meninggalkan hutan?\n   Jawaban: Rasa lelah\n   Bobot: 3\n\n5. Apa yang diinginkan oleh Sasandewini dan Suntre dalam perjalanan pulang?\n   Jawaban: Meninggalkan tepi Hutan Kowera dengan langkah tegar\n   Bobot: 4', 'essay', 5, '2025-06-22 06:33:01', '2025-06-22 06:33:01'),
(138, 1635, 21, '### Soal Literasi: \n\n#### Paragraf:\n\"Polem Mahmud Seorang Pemurah, Penyayang Binatang dan Tumbuhan\" \"Meskipun hidupnya sangat sederhana, Lem Mahmud terkenal orang yang sangat baik hati dan pemurah. Meski dapurnya tidak berasap, tidak jarang ia terlihat berbagi makanan ala kadarnya dengan tetangganya yang senasib.\" \"Lem Mahmud sangat peduli dengan biota di laut.\"\n\n---\n\n#### Soal Isian: \n1. Apa yang membuat Lem Mahmud disebut orang pemurah?  \n   Jawaban: Dia terlihat berbagi makanan ala kadarnya dengan tetangganya.  \n   Bobot: 3\n\n2. Mengapa Lem Mahmud tidak memaksa sapi miliknya untuk membajak sawah?  \n   Jawaban: Ia menunggu sapinya bangun sendiri, mengenalkan kebutuhan pakan yang baik dan membiarkannya beristirahat lebih cepat jika lelah.  \n   Bobot: 5\n\n3. Apa tindakan Lem Mahmud saat melihat seekor kucing kelaparan di tepi jalan?  \n   Jawaban: Ia memberikan ikan bawal kepada si kucing yang lapar.  \n   Bobot: 4\n\n4. Mengapa Lem Mahmud melepaskan seekor ikan kecil yang ia tangkap?  \n   Jawaban: Menurutnya, nanti ikan itu akan tumbuh besar dan lebih berguna dibandingkan dengan ikan yang diambil saat masih kecil.  \n   Bobot: 5', 'essay', 5, '2025-06-23 04:55:03', '2025-06-23 04:55:03'),
(143, 1635, 21, '**Paragraf:**\n\"Pada masa Kesultanan Aceh ia begitu berjasa besar dalam mengusir Portugis yang hendak menguasai tanah Aceh. Saat itu, Keumalahayati menjadi penggagas sekaligus komandan dari Laskar Inong Balee yang legendaris. Dalam bahasa Aceh, inong berarti \'wanita\', sedangkan balee berarti \'janda\'. Jadi, laskar Inong Balee merupakan pasukan khusus yang beranggotakan para janda dari para pejuang Aceh yang gugur dalam perperangan melawan armada Portugis yang ingin menguasai Aceh.\"\n\n**Soal Isian:**\n1. Siapa wanita Aceh yang berhasil mengusir Portugis dari Aceh?  \n   Jawaban: Keumalahayati  \n   Bobot: 3\n\n2. Apa arti kata \'inong\' dalam bahasa Aceh?  \n   Jawaban: Wanita  \n   Bobot: 4\n\n3. Berapakah jumlah pasukan Inong Balee yang beranggotakan para janda prajurit Aceh?  \n   Jawaban: Tidak disebutkan  \n   Bobot: 5\n\n4. Apa keistimewaan Laskar Inong Balee yang dipimpin oleh Keumalahayati?  \n   Jawaban: Beranggotakan para janda prajurit Aceh yang gugur dalam perperangan melawan Portugis  \n   Bobot: 3\n\n5. Siapakah sahabat Keumalahayati yang pernah berbicara tak karuan?  \n   Jawaban: Keusyik Dolah  \n   Bobot: 4', 'essay', 5, '2025-06-23 05:22:32', '2025-06-23 05:22:32'),
(147, 1635, 20, '**Paragraf:**\n“Baiklah, besok pagi temani aku ke acara tersebut, bagaimana menurutmu, Dayang Biru?”\nSenyum mengembang di bibir Dayang Biru. “Tentu saja, Tuanku. Hamba sangat senang Tuanku mau ikut dalam acara pesta adat besok. Segala yang Tuanku butuhkan untuk acara itu akan segera hamba persiapkan.” \n\n**Soal Pilihan Ganda:**\n1. Siapa yang meminta Dayang Biru menghadirinya ke acara pesta adat?\n   A. Baginda Hasyim\n   B. Ratu Malika\n   C. Tetua Adat\n   D. Kakek Tua berambut Putih \n   Jawaban: B  \n   Bobot: 1\n\n2. Apa yang disampaikan Dayang Biru kepada Ratu Malika?\n   A. Ia akan menghadirinya sendiri\n   B. Ia tidak bisa hadir\n   C. Ia sangat senang Ratu Malika mau ikut dalam acara pesta adat \n   D. Ia perlu pertimbangan \n   Jawaban: C  \n   Bobot: 1\n\n3. Bagaimana jawaban Dayang Biru terhadap permintaan Ratu Malika?\n   A. Tidak mengatakan apa-apa\n   B. Mengatakan tidak bisa hadir \n   C. Menyampaikan bahwa ia akan menghadirinya sendiri\n   D. Senyum dan mengatakan \"Tentu saja, Tuanku.\" \n   Jawaban: D  \n   Bobot: 1', 'multiple_choice', 5, '2025-06-23 05:35:32', '2025-06-23 05:35:32'),
(149, 1635, 25, '**Paragraf:**\n“Sudah tujuh bulankah kita meninggalkan istana?  \nBenar baginda. Kita sudah tujuh bulan di sini. Tidak \ninginkah baginda melihat putra mahkota?” patih Batu Bangka  \nterus membujuk. “Putra mahkota?” baginda raja kembali bertanya \nseolah-olah tidak ingat. “Benar! Putra mahkota dan permaisuri \nPutri Mas Dewi Kencana yang cantik sedang menunggu baginda \nraja pulang!” patih Batu Bangka semakin yakin bahwa selama ini \nbaginda raja dibutakan hatinya oleh putri jin dan ayahnya.\n\n**Soal Pilihan Ganda:**\n1. Berapa lama waktu yang dilewati baginda raja sebelum kembali ke kerajaan?\n   A. 3 hari\n   B. 7 bulan\n   C. 7 tahun\n   D. 10 bulan\n   Jawaban: B\n   Bobot: 1\n\n2. Apa yang diminta oleh patih Batu Bangka pada baginda raja?\n   A. Membalikkan kesadaran dirinya\n   B. Menemui permaisuri dan putra mahkota di kerajaan\n   C. Berburu hewan di hutan Lengkukun\n   D. Menghadap ke istana untuk memohon ampun\n   Jawaban: B\n   Bobot: 1\n\n3. Siapa yang sedang menantikan kabar dan kepulangan baginda raja?\n   A. Patih Batu Bangka\n   B. Putri Mas Dewi Kencana\n   C. Permaisuri dan putra mahkota di kerajaan\n   D. Putri jin dan ayahnya\n   Jawaban: C\n   Bobot: 1\n\n4. Bagaimana reaksi baginda raja saat mendengar kabar patih Batu Bangka tentang permaisuri dan putra mahkota?\n   A. Gembira dan langsung pulang ke kerajaan\n   B. Berkecil hati karena sudah lama meninggalkan istana\n   C. Ingat-ingat sesuatu yang belum tentu bisa mengingatkannya\n   D. Lupa tentang permaisuri dan putra mahkota\n   Jawaban: C\n   Bobot: 1\n\n5. Apa yang terjadi pada baginda raja setelah mendengar kabar patih Batu Bangka?\n   A. Menghadap ke istana untuk memohon ampun\n   B. Membalikkan kesadaran dirinya dan kembali ke kerajaan\n   C. Menyuruh putri jin dan ayahnya untuk balik ke istana\n   D. Berencana untuk meninggalkan permaisuri dan putra mahkota\n   Jawaban: B\n   Bobot: 1', 'multiple_choice', 5, '2025-06-23 05:40:58', '2025-06-23 05:40:58'),
(157, 1635, 24, '### Paragraf:\n\"Lalu, Orang Kayo Hitam menghaturkan sembah kepada kakandanya dan berkata, “jika memang itu titah Paduka kakanda tentu semuanya harus adinda junjung. Semuanya Adinda terima tanpa membantah, akan tetapi memang harus yang tua dulu dijadikan raja menurut adat istiadat kita.”\"\n\n### Soal Pilihan Ganda:\n1. Siapa yang mengusulkan agar Orang Kayo Hitam menjadi raja?\n   A. Orang Kayo Pingai dan orang-orang kerajaan\n   B. Temenggung Merah Mato\n   C. Orang kayo Makhtar \n   D. Sunan Kembang Sri\n   Jawaban: A  \n   Bobot: 1\n\n2. Apa alasan Orang Kayo Pingai menginginkan Orang Kayo Hitam menjadi raja?\n   A. Karena Orang Kayo Hitam masih muda sedangkan dia sudah tua renta.\n   B. Karena Orang kayo Hitam memiliki senjata Si Ginjai yang sangat sakti.\n   C. Karena Orang Kayo Hitam adalah putra mahkota\n   D. Karena Orang Kayo Pingai mengenal kesaktian Orang Kayo Hitam sebelumnya\n   Jawaban: A  \n   Bobot: 1\n\n3. Apa yang harus dilakukan oleh rakyat Jambi terhadap perintah Orang kayo Pingai?\n   A. Menghadap ke hulu Sungai Batanghari\n   B. Menghadap ke hulu Pagaruyung \n   C. Tidak boleh mengubah perintah orang tua adi, jika kelak anak keturunan mereka memperebutkan tahta raja.\n   D. Menghukum temenggung Merah Mato\n   Jawaban: C  \n   Bobot: 1', 'multiple_choice', 5, '2025-06-23 07:14:53', '2025-06-23 07:14:53'),
(161, 1635, 22, 'Soal ini perlu dipilih jawaban yang paling tepat karena isinya banyak penjelasan.\n\n### Jawaban 1\nSasandewini dan Suntre masing-masing memiliki diwando, gelang kesayangan. Di mana diwando berasal dari kata \"dayo\", jalan, dan \"mando\", yang berarti tempat menunggu. Jadi, diwando adalah gelang penanda jalan atau tempat menunggu bagi Suntre dan Sasandewini.\n\n### Jawaban 2\nBacaan mengisahkan tentang perjalanan dua gadis muda bernama Sasandewini dan Suntre yang pergi ke Kerajaan Sumundui. Pada awalnya, mereka melihat Raja Ular, Sumundui, yang menyuruh mereka untuk mengikuti arus sungai ini. Mereka pun pergi menuju kerajaan itu dengan menggunakan sampan dari batang sagu.\n\n### Jawaban 3\nMenurut bacaan, gelang diwando itu diberikan oleh kakek-kakak Sasandewini dan Suntre untuk menunjukkan persahabatan. Gelang diwando yang telah mereka berikan kepada Raja Ikan Sinemanggor adalah perhiasan penanda jalan atau tempat menunggu bagi mereka.\n\n### Jawaban 4\nMenurut bacaan, gelang ini berenang tenang menuju dasar sungai dan diambil oleh Raja Ikan. Gelang yang diberikan kepada Sinemanggor kemudian digantil dengan gelang dari Raja Ikan.', 'essay', 5, '2025-06-23 07:26:25', '2025-06-23 07:26:25'),
(162, 1635, 22, 'Berikut adalah 5 soal pilihan ganda berdasarkan isi paragraf:\n\n**Paragraf:**\n\"Pak Budi memelihara ayam, bebek, dan kambing. Setiap pagi, ia memberi makan ternaknya dengan penuh kasih sayang.\"\n\n**Soal Pilihan Ganda:**\n\n1. Apa hewan yang dipelihara Pak Budi?\n   A. Kucing\n   B. Ayam dan kambing\n   C. Anjing dan bebek\n   D. Ikan dan sapi  \n   Jawaban: B  \n   Bobot: 1\n\n2. Sinonim dari kata \'ternak\' dalam paragraf tersebut adalah?\n   A. Hewan peliharaan  \n   B. Sayuran  \n   C. Alat tani  \n   D. Makanan ternak  \n   Jawaban: A  \n   Bobot: 2\n\n3. Pak Budi memberi makan ternaknya dengan cara yang mana?\n   A. Pagi dan malam\n   B. Sore dan malam\n   C. Pagi dengan penuh kasih sayang  \n   D. Siang dan pagi  \n   Jawaban: C  \n   Bobot: 1\n\n4. Apa yang dilakukan Pak Budi setiap pagi?\n   A. Memberi makan ternaknya\n   B. Membawa kambing ke pasar\n   C. Melihat ayam di rumah\n   D. Berjalan-jalan ke hutan  \n   Jawaban: A  \n   Bobot: 1\n\n5. Sebutkan hewan yang dipelihara Pak Budi!\n   A. Ayam, bebek dan anjing  \n   B. Kucing, sapi dan kuda  \n   C. Ikan, ayam dan bebek  \n   D. Ayam, kambing dan bebek  \n   Jawaban: D  \n   Bobot: 1', 'multiple_choice', 5, '2025-06-23 07:30:23', '2025-06-23 07:30:23'),
(163, 1635, 21, 'Berikut adalah 5 soal literasi berdasarkan paragraf tersebut:\n\n**Paragraf:**\n\"Polem Mahmud Seorang Pemurah, Penyayang Binatang dan Tumbuhan Meskipun hidupnya sangat sederhana, Lem Mahmud terkenal orang yang sangat baik hati dan pemurah. Meski dapurnya tidak berasap, tidak jarang ia terlihat berbagi makanan ala kadarnya dengan tetangganya yang senasib.\"\n\n**Soal Isian:**\n\n1. Apa sifat Lem Mahmud menurut paragraf tersebut?  \n   Jawaban: Baik hati dan pemurah  \n   Bobot: 4\n\n2. Bagaimana sikap Lem Mahmud terhadap tetangganya?  \n   Jawaban: Selalu menjaga silaturahmi  \n   Bobot: 3\n\n3. Apa yang dilakukan Lem Mahmud dengan temannya yang sakit?  \n   Jawaban: Mengunjungi mereka  \n   Bobot: 4\n\n4. Bagaimana sifat kehidupan Lem Mahmud menurut paragraf tersebut?  \n   Jawaban: Sederhana  \n   Bobot: 3\n\n5. Apa yang dilakukan Lem Mahmud dengan makanannya?  \n   Jawaban: Berbagi dengan tetangganya yang senasib  \n   Bobot: 4', 'essay', 5, '2025-06-23 07:33:57', '2025-06-23 07:33:57'),
(167, 1635, 23, '**Paragraf:**\n\"Pada suatu masa, Kerajaan Surakarta dipimpin oleh seorang raja yang adil dan bijaksana yang bernama Raja Dalem Solo. Sang Raja sangat dihormati dan disegani oleh rakyatnya.\"\n\n**Soal Isian:**\n\n1. Siapa nama raja yang memimpin Kerajaan Surakarta?  \n   Jawaban: Raja Dalem Solo  \n   Bobot: 3\n\n2. Apa sifat dari raja tersebut menurut paragraf?  \n   Jawaban: Adil dan bijaksana  \n   Bobot: 4\n\n3. Bagaimana sikap rakyat terhadap raja di Kerajaan Surakarta?  \n   Jawaban: Di hormati dan disegani  \n   Bobot: 5', 'essay', 5, '2025-06-23 08:24:35', '2025-06-23 08:24:35'),
(168, 1635, 20, 'Berikut adalah paragraf teks untuk dipilih, beserta 5 soal pilihan ganda untuk masing-masing jenis soal:\n\n**Paragraf:**\n\n\"Baginda Hasyim merupakan keturunan ketujuh dari silsilah Sultan Usman Hamidi, penguasa wilayah Bangka yang sangat terkenal seantero nusantara. Sejak masa pemerintahan Sultan Usman Hamidi, Bangka sudah mulai dikenal sebagai kota pelabuhan dan pusat perdagangan di bawah pengaruh Kerajaan Sriwijaya.\"\n\n**Soal Pilihan Ganda:**\n\n1. Siapa ayah dari Baginda Hasyim?\n   A. Sultan Usman Hamidi\n   B. Ratu Malika\n   C. Bangka Utara\n   D. Kerajaan Sriwijaya\n   Jawaban: A\n   Bobot: 1\n\n2. Berdasarkan paragraf, apa yang membuat Bangka dikenal di masa Sultan Usman Hamidi?\n   A. Karena banyak penduduk\n   B. Karena sebagai kota pelabuhan dan pusat perdagangan\n   C. Karena memiliki hasil laut melimpah\n   D. Karena perbukitan eloknya\n   Jawaban: B\n   Bobot: 2\n\n3. Bagaimana hubungan antara Sultan Usman Hamidi dengan Kerajaan Sriwijaya?\n   A. Sultan Usman Hamidi sebagai raja, Kerajaan Sriwijaya sebagai wilayah kekuasaannya\n   B. Bangka dikenal karena pengaruh Kerajaan Sriwijaya\n   C. Baginda Hasyim keturunan dari Sultan Usman Hamidi\n   D. Sultan Usman Hamidi dan Kerajaan Sriwijaya tidak ada hubungannya\n   Jawaban: B\n   Bobot: 2\n\n4. Apa yang membuat penduduk Bangka disayangi oleh rakyat?\n   A. Karena memiliki banyak etnis\n   B. Karena kepentingan rakyat di atas kepentingan sendiri\n   C. Karena pemerintahan berjalan lancar\n   D. Karena memiliki corak pekerjaan yang berbeda-beda\n   Jawaban: B\n   Bobot: 1\n\n5. Siapa Baginda Hasyim?\n   A. Raja Bangka Utara\n   B. Penguasa wilayah Bangka\n   C. Keturunan ketujuh dari Sultan Usman Hamidi\n   D. Sultan Usman Hamidi sendiri\n   Jawaban: C\n   Bobot: 2', 'multiple_choice', 5, '2025-06-23 08:25:52', '2025-06-23 08:25:52'),
(169, 1635, 23, 'Berikut adalah 5 soal literasi untuk masing-masing jenis soal pilihan ganda dan isian berdasarkan teks yang diberikan:\n\n**Paragraf:**\n“Suatu hari ketika sedang duduk di taman keputren bersama dayangnya, tiba-tiba Putri Keempat Dalem Solo berteriak dan terpekik. ‘Mbok Dayang, apakah kau mencium bau wangi sepertiku?’ tanya Putri Keempat. Putri pun masih tetap mengendus-endus bau wangi itu. Dayang juga ikut merasakan bau wangi dan mencoba untuk lebih merasakan lagi.” \n\n**Soal Pilihan Ganda:**\n1. Apa yang dilakukan oleh Putri Keempat Dalem Solo ketika sedang duduk di taman keputren?\n   A. Ia berbicara dengan dayangnya\n   B. Ia teriak dan terpekik\n   C. Ia duduk diam\n   D. Ia makan sayuran  \n   Jawaban: B  \n   Bobot: 1\n\n2. Apa yang dicium oleh Mbok Dayang ketika sedang duduk di taman keputren?\n   A. Bau wangi sepertu Putri Keempat Dalem Solo\n   B. Bau asam sepertu belut\n   C. Bau harum sekali\n   D. Bau amis sekali  \n   Jawaban: A  \n   Bobot: 1\n\n3. Apa yang dilakukan oleh dayang ketika merasakan bau wangi?\n   A. Ia mencoba untuk lebih merasakan lagi\n   B. Ia mengeluh dan pergi\n   C. Ia tetap diam\n   D. Ia makan sayuran  \n   Jawaban: A  \n   Bobot: 1\n\n4. Apa yang dikatakan oleh Putri Keempat Dalem Solo kepada dayangnya?\n   A. “Mbok Dayang, apakah kau mencium bau wangi sepertiku?”\n   B. “Baiklah, Mbok Dayang, mari kita masuk dan lapor kepada Ayahanda Raja”\n   C. “Wanginya sangat menyejukkan”\n   D. “Bau ini sangat harum”  \n   Jawaban: A  \n   Bobot: 1\n\n5. Apa yang dilakukan oleh ayahandanya (Raja Dalem Solo) ketika merasakan bau wangi?\n   A. Ia berkata, “Wanginya sangat menyejukkan”\n   B. Ia berputar-putar berkali-kali sambil terus merasakan keharuman wangi\n   C. Ia pergi meninggalkan taman\n   D. Ia diam dan tidak memberikan komentar  \n   Jawaban: B  \n   Bobot: 2', 'multiple_choice', 5, '2025-06-23 09:01:56', '2025-06-23 09:01:56'),
(170, 1635, 22, 'Berikut adalah 5 soal isian berdasarkan paragraf yang diberikan:\n\n**Paragraf:**\n\"Papeda adalah makanan pokok masyarakat Tamakuri, Papua, sebagai pengganti nasi. Papeda terbuat dari sagu. Masyarakat Tamakuri percaya bahwa setelah makan papeda, badan mereka menjadi sehat dan kuat.\"\n\n**Soal Isian:**\n1. Apa yang digunakan untuk membuat papeda?  \n   Jawaban: Sagu  \n   Bobot: 3\n\n2. Mengapa masyarakat Tamakuri percaya bahwa setelah makan papeda, badan mereka menjadi sehat dan kuat?  \n   Jawaban: Karena papeda terbuat dari sagu  \n   Bobot: 4\n\n3. Apakah yang digantikan oleh papeda dalam makanan pokok masyarakat Tamakuri?  \n   Jawaban: Nasi  \n   Bobot: 5\n\n4. Makanan apa yang biasanya dimasak para petani di Kampung Tamakuri untuk sarapan dan bekal mereka pergi ke ladang?  \n   Jawaban: Papeda  \n   Bobot: 3\n\n5. Apakah yang dapat terjadi pada badan masyarakat Tamakuri setelah makan papeda?  \n   Jawaban: Badan mereka menjadi sehat dan kuat  \n   Bobot: 4', 'essay', 5, '2025-06-23 12:39:36', '2025-06-23 12:39:36'),
(171, 1635, 23, 'Berikut adalah 5 soal literasi berdasarkan paragraf di atas:\n\n**Paragraf:**\n\"Suatu hari ketika sedang duduk di taman keputren bersama dayangnya, tiba-tiba Putri Keempat Dalem Solo berteriak dan terpekik. ‘Mbok Dayang, apakah kau mencium bau wangi sepertiku?’ tanya Putri Keempat.\"\n\n**Soal Pilihan Ganda:**\n1. Siapa yang mengatakan sesuatu kepada Mbok Dayang?\n   A. Raja Dalem Solo\n   B. Putra Sulung Dalem Solo\n   C. Putri Keempat Dalem Solo\n   D. Ayahanda Raja\n   Jawaban: C\n   Bobot: 1\n\n2. Bagaimana reaksi Mbok Dayang setelah mendengar kata-kata dari Putri Keempat?\n   A. Ia tidak merasakan apa-apa\n   B. Ia mencoba untuk lebih merasakan lagi bau wangi\n   C. Ia menjawab bahwa itu hanya angin segar\n   D. Ia pergi meninggalkan taman keputren\n   Jawaban: B\n   Bobot: 2\n\n3. Siapa yang mendekat ke arah timur keputren untuk merasakan wangi?\n   A. Putra Kedua Dalem Solo\n   B. Raja Dalem Solo\n   C. Ayahanda Raja\n   D. Dayang Mbok\n   Jawaban: B\n   Bobot: 1\n\n4. Apa yang diucapkan oleh Raja Dalem Solo kepada putra-putrinya?\n   A. Mereka harus pergi ke pasar\n   B. Mereka harus meninggalkan istana\n   C. Mereka harus mengembara\n   D. Mereka harus menanam bunga\n   Jawaban: C\n   Bobot: 2\n\n5. Apa yang dilakukan oleh Putra Ketiga Dalem Solo?\n   A. Ia memintal benang\n   B. Ia membaca buku\n   C. Ia bertanya kepada ayahandanya tentang maksudnya\n   D. Ia pergi ke taman keputren\n   Jawaban: C\n   Bobot: 1', 'multiple_choice', 5, '2025-06-23 12:41:43', '2025-06-23 12:41:43'),
(174, 1635, 23, 'Berikut adalah 5 soal pilihan ganda berdasarkan isi teks tersebut:\n\n**Paragraf:**\n\"Sang Dewi dan Sang Surya memiliki hubungan yang sulit. Sang Dewi marah karena pancaran sinar Sang Surya mengganggunya. Kemudian, Sang Dewi memunggungi Sang Surya sebagai tindakan balasan.\"\n\n**Soal Pilihan Ganda:**\n\n1. Apa yang membuat Sang Dewi marah?\n   A. Karena Sang Surya tidak mengikuti jalan yang sama\n   B. Pancaran sinar Sang Surya mengganggunya\n   C. Karena Sang Dewi ingin berhenti menempati desa Trunyan\n   D. Karena Sang Dewi marah karena anaknya melahirkan kembar buncing  \n   Jawaban: B  \n   Bobot: 1\n\n2. Apa yang dilakukan oleh Sang Dewi terhadap Sang Surya?\n   A. Menikahi Sang Surya\n   B. Mengutuk Sang Surya karena perilakunya\n   C. Memunggungi Sang Surya sebagai tindakan balasan  \n   D. Membuat ritual untuk kelahiran kembar buncing  \n   Jawaban: C  \n   Bobot: 2\n\n3. Apa yang menjadi sumber kesengsaraan bagi Sang Dewi?\n   A. Karena ia harus meninggalkan anak-anaknya di desa Trunyan\n   B. Karena Sang Surya mengganggunya dengan pancaran sinar\n   C. Karena ia tidak bisa menikmati pemandangan elok dan subur di Bali \n   D. Karena putri bungsu dari anak Dalem Solo memutuskan untuk tinggal di Pura Batur  \n   Jawaban: B  \n   Bobot: 1\n\n4. Apa yang dilakukan oleh Sang Dewi terhadap kelahiran kembar buncing?\n   A. Membuat ritual untuk kebaikan sang bayi\n   B. Melupakan anaknya yang melahirkan kembar buncing \n   C. Mengutuk Sang Surya karena perilakunya\n   D. Menikahi salah satu dari mereka  \n   Jawaban: A  \n   Bobot: 2\n\n5. Bagaimana sikap Sang Dewi kepada putri bungsu dari anak Dalem Solo?\n   A. Sangat menghargai dan izinkan putra sulung untuk tinggal di Pura Batur \n   B. Sang Dewi tidak peduli dengan keputusan putrinya\n   C. Sang Dewi sangat mencintai tempat itu \n   D. Menolak putri bungsunya untuk tinggal di Pura Batur  \n   Jawaban: C  \n   Bobot: 1', 'multiple_choice', 5, '2025-06-24 02:18:43', '2025-06-24 02:18:43'),
(176, 1635, 20, 'Berikut adalah 5 soal isian berdasarkan paragraf yang diberikan:\n\n**Paragraf:**\n\"Hari belum terlalu terik ketika Ratu Malika melenggangkan kakinya bersama Dayang Biru menuju ke tempat penyelenggaraan pesta adat. Ia sengaja berjalan kaki dari istana dan menyapa orang-orang yang kebetulan berpapasan dengannya di jalanan. Semua orang mengangguk penuh hormat kepada sang ratu yang tampak sangat ramah.\"\n\n**Soal Isian:**\n\n1. Apa yang dilakukan Ratu Malika sebelum tiba di tempat penyelenggaraan pesta adat?  \n   Jawaban: Berjalan kaki dari istana dan menyapa orang-orang  \n   Bobot: 3\n\n2. Bagaimana reaksi orang-orang ketika melihat Ratu Malika berjalan-jalan?  \n   Jawaban: Mengangguk penuh hormat  \n   Bobot: 4\n\n3. Apa yang dilihat Dayang Biru di pojok sebelah pasar saat mereka melewati kampung dan pasar?  \n   Jawaban: Tanaman obat buah kepayang  \n   Bobot: 5\n\n4. Bagaimana reaksi Ratu Malika ketika si kakek tua menepuk pundaknya dari belakang?  \n   Jawaban: Terperanjat mendengar pernyataan orang asing yang ada di depannya  \n   Bobot: 4\n\n5. Apa yang dikatakan si kakek tua tentang keadaan Ratu Malika sebelumnya?  \n   Jawaban: Belum pernah bertemu dengan sosok kakek ini sebelumnya  \n   Bobot: 3', 'essay', 5, '2025-06-24 02:24:53', '2025-06-24 02:24:53'),
(178, 1635, 23, 'Berikut adalah contoh soal literasi dari teks tersebut:\n\n### Paragraf:\n\"14 tersebut, Sang Surya pun mengganggunya. Bahkan, apa saja yang dilakukan Sang Dewi, pancaran sinar Sang Surya selalu mengikutinya. Hal ini sangat mengganggu Sang Dewi dan membuatnya marah kepada Sang Surya. Kemudian, Sang Dewi masuk ke dalam gua, Sang Hyang Surya pun tidak berhenti mengikutinya...\"\n\n### Soal Pilihan Ganda:\n\n1. Apa yang dilakukan oleh Sang Dewi yang membuat Sang Surya mengganggunya?\n   A. Sang Dewi memasuki gua\n   B. Sang Dewi menolak pancaran sinar Sang Surya\n   C. Sang Dewi berjalan di luar kota\n   D. Sang Dewi melakukan kegiatan spiritual\n   Jawaban: B\n   Bobot: 1\n\n2. Apa yang terjadi ketika Sang Dewi memasuki gua?\n   A. Sang Surya tidak mengikutinya lagi\n   B. Pancaran sinar Sang Surya meninggalkannya\n   C. Sang Hyang Surya menurunkan pancaran sinarnya\n   D. Sang Dewi ditinggal oleh Sang Surya\n   Jawaban: C\n   Bobot: 2\n\n3. Apakah yang dikatakan dalam paragraf mengenai perilaku Sang Dewi?\n   A. Sang Dewi tidak pernah marah\n   B. Sang Dewi selalu menghina orang lain\n   C. Sang Dewi telah melakukan kesalahan dengan menghina Sang Hyang Surya\n   D. Sang Dewi tidak memiliki kelemahan\n   Jawaban: C\n   Bobot: 1\n\n4. Apa yang terjadi sebagai akibat perilaku Sang Dewi?\n   A. Sang Dewi dikutuk oleh Sang Surya dengan cara gaib\n   B. Sang Dewi diberhentikan dari jabatannya\n   C. Sang Dewi diterima sebagai utusan Sang Hyang Surya\n   D. Sang Dewi mendapatkan hadiah dari Sang Surya\n   Jawaban: A\n   Bobot: 2\n\n5. Apakah yang dilakukan oleh Sang Dewi setelah mengetahui keadaannya?\n   A. Ia mengundurkan diri sebagai utusan Sang Hyang Surya\n   B. Ia meminta maaf kepada Sang Surya\n   C. Ia melanjutkan perjalanannya dengan hati yang tenang\n   D. Ia melakukan kegiatan spiritual untuk membuktikan kesetiaannya\n   Jawaban: A\n   Bobot: 1', 'multiple_choice', 5, '2025-06-26 02:11:22', '2025-06-26 02:11:22'),
(179, 1635, 25, 'Berikut adalah contoh soal literasi berdasarkan teks yang diberikan:\n\n### **Paragraf:**\n“Setelah semuanya terwujud, baginda raja melangkahkan kakinya menuju tempat tinggal putri jin dan ayahnya. Di-perlihatkannya istana megah yang berhasil dibangunnya. Perabotan di dalamnya juga lengkap sehingga putri jin sangat bahagia. Karena semua permintaan terpenuhi, putri jin pun bersedia menikah dengan baginda raja. Keduanya tampak sangat bahagia. Baginda raja sangat terpukau dengan kecantikan putri jin. Putri jin pun sangat senang karena di-sunting oleh seorang baginda raja yang terkenal sakti man-draguna. Mereka pun hidup bahagia di istana.\"\n\n### **Soal Isian:**\n\n1. Apa yang diperlihatkan baginda raja kepada putri jin?  \n   Jawaban: Istana megah  \n   Bobot: 3\n\n2. Bagaimana reaksi putri jin ketika melihat isi rumahnya?  \n   Jawaban: Bahagia  \n   Bobot: 4\n\n3. Apa yang membuat baginda raja sangat terpukau?  \n   Jawaban: Kecantikan putri jin  \n   Bobot: 5\n\n4. Mengapa putri jin bersedia menikah dengan baginda raja?  \n   Jawaban: Karena semua permintaannya telah terpenuhi  \n   Bobot: 3\n\n5. Bagaimana hubungan antara baginda raja dan putri jin setelah menikah?  \n   Jawaban: Mereka hidup bahagia di istana  \n   Bobot: 4', 'essay', 5, '2025-06-26 02:12:42', '2025-06-26 02:12:42'),
(181, 1669, 34, 'Berikut adalah 10 soal pilihan ganda berdasarkan isi teks:\n\n**Paragraf:**\n\"Puruk Sanukui ini adalah sebuah bukit yang sangat tinggi dan curam. Di sekitar puruk ini banyak tumbuh pepohonan yang sangat besar dan rimbun. Berbagai macam tanaman dan binatang ada di dalamnya.\"\n\n**Soal Pilihan Ganda:**\n\n1. Apa yang disebut sebagai \"tangga\" bagi raksasa Garahasi dan Garahasa?\n   A. Bukit/gunung\n   B. Sungai Kahayan\n   C. Puruk Sanukui\n   D. Langit\n\nJawaban: C\n\nBobot: 1\n\n2. Apa yang membuat manusia takut untuk naik ke Puruk Sanukui?\n   A. Ketinggian bukit/gunung\n   B. Raksasa Garahasi dan Garahasa yang ganas\n   C. Pepohonan besar dan binatang di dalamnya\n   D. Langit yang indah\n\nJawaban: B\n\nBobot: 1\n\n3. Apa yang bisa dilihat oleh beberapa orang ketika mereka berjalan ke Puruk Sanukui?\n   A. Banyak buah-buahan\n   B. Banyak binatang buruan\n   C. Pepohonan besar dan rimbun\n   D. Raksasa Garahasi dan Garahasa\n\nJawaban: C\n\nBobot: 1\n\n4. Apa yang membuat murka Ranying Mahatala Langit?\n   A. Keganasan raksasa Garahasi dan Garahasa\n   B. Kekuatannya\n   C. Memangsa manusia\n   D. Semua jawaban di atas\n\nJawaban: D\n\nBobot: 2\n\n5. Siapa yang dipilih oleh Ranying Mahatala Langit untuk menemani perjalanan ke bumi?\n   A. Raja Tunggal Sangumang dan Darung Bawan\n   B. Patahu dan Rambang, Ringkai, dan Sangen\n   C. Semua jawaban di atas\n   D. Tidak ada yang tepat\n\nJawaban: C\n\nBobot: 1', 'multiple_choice', 5, '2025-07-01 05:47:37', '2025-07-01 05:47:37');
INSERT INTO `literacy_generated_texts` (`id`, `user_id`, `material_id`, `generate_text`, `question_type`, `question_count`, `created_at`, `updated_at`) VALUES
(184, 1635, 23, 'Baiklah, saya akan membuat soal literasi berdasarkan isi teks tersebut.\n\n**Paragraf:**\n\n\"Sang Dewi masuk ke dalam gua, Sang Hyang Surya pun tidak berhenti mengikutinya. Sinar matahari yang sangat panas masuk ke dalam gua. Sang Dewi tidak mampu menahan kemarahannya. Lalu, Sang Dewi dengan sengaja memunggungi Sang Surya.\"\n\n**Soal Isian:**\n\n1. Apa yang dilakukan Sang Hyang Surya ketika Sang Dewi masuk ke dalam gua?  \n   Jawaban: Mengikutinya  \n   Bobot: 3\n\n2. Bagaimana sinar matahari yang masuk ke dalam gua?  \n   Jawaban: Sangat panas  \n   Bobot: 4\n\n3. Apa yang dilakukan Sang Dewi ketika tidak bisa menahan kemarahannya?  \n   Jawaban: Memunggungi Sang Surya  \n   Bobot: 5\n\n4. Bagaimana keadaan Sang Dewi setelah memunggungi Sang Surya?  \n   Jawaban: Membuatnya marah  \n   Bobot: 3\n\n5. Apa yang terjadi pada Sang Dewi sebagai akibat perilakunya?  \n   Jawaban: Dikutuk oleh Sang Surya dan melahirkan anak banci, kembar buncing dan bayi perempuan  \n   Bobot: 5', 'essay', 5, '2025-07-06 00:05:08', '2025-07-06 00:05:08'),
(185, 1635, 21, 'Berikut adalah 5 soal isian berdasarkan paragraf yang diberikan:\n\n**Paragraf:**\n\"Pak Ali menanam padi di sawah setiap musim tanam. Ia bekerja keras agar panennya berhasil.\"\n\n**Soal Isian:**\n\n1. Apa yang ditanam Pak Ali di sawah?\n   Jawaban: Padi\n   Bobot: 3\n\n2. Mengapa Pak Ali bekerja keras?\n   Jawaban: Agar panennya berhasil\n   Bobot: 4\n\n3. Apa sinonim dari kata \'bekerja keras\' dalam paragraf tersebut?\n   Jawaban: Rajin atau tekun\n   Bobot: 5\n\n4. Di mana Pak Ali menanam padi?\n   Jawaban: Sawah\n   Bobot: 3\n\n5. Bagaimana hasil panen Pak Ali setelah bekerja keras?\n   Jawaban: Panennya berhasil\n   Bobot: 4', 'essay', 5, '2025-07-06 00:17:44', '2025-07-06 00:17:44'),
(187, 1635, 20, 'Baiklah, saya akan membuat soal literasi berdasarkan paragraf di atas.\n\n**Paragraf:**\n\"Hari belum terlalu terik ketika Ratu Malika melenggangkan kakinya bersama Dayang Biru menuju ke tempat penyelenggaraan pesta adat. Ia sengaja berjalan kaki dari istana dan menyapa orang-orang yang kebetulan berpapasan dengannya di jalanan.\"\n\n**Soal Pilihan Ganda:**\n1. Bagaimana Ratu Malika bergerak menuju tempat penyelenggaraan pesta adat?\n   A. Berjalan kaki dari istana\n   B. Menggunakan kereta kuda\n   C. Dibawa oleh Dayang Biru\n   D. Naik kuda tunggal\n   Jawaban: A\n   Bobot: 1\n\n2. Apa yang dilakukan Ratu Malika saat berjalan kaki?\n   A. Bermain dengan anak-anak\n   B. Mengunjungi pasar dan kampung\n   C. Makan makanan ringan\n   D. Menggunakan pakaian formal\n   Jawaban: B\n   Bobot: 1\n\n3. Siapa yang berjalan bersama Ratu Malika?\n   A. Suaminya, Baginda Hasyim\n   B. Dayang Biru dan beberapa penjaga istana\n   C. Seorang kakek tua dan seorang anak kecil\n   D. Beberapa pedagang dari pasar\n   Jawaban: B\n   Bobot: 1\n\n4. Apa yang dilakukan Dayang Biru saat berjalan bersama Ratu Malika?\n   A. Membeli makanan ringan\n   B. Mengunjungi beberapa tempat di sekitar\n   C. Mencari buah kepayang di pasar\n   D. Mengajak Ratu Malika pergi dari istana\n   Jawaban: C\n   Bobot: 2\n\n5. Bagaimana suasana di pasar saat berjalan kaki?\n   A. Ramai dan banyak orang\n   B. Tidak terlalu ramai, banyak pedagang tutup tempat jualan\n   C. Hujan deras sehingga banyak orang menutup tempat jualan\n   D. Cuaca panas sehingga tidak ada yang berjalan kaki\n   Jawaban: B\n   Bobot: 1', 'multiple_choice', 5, '2025-07-07 02:34:22', '2025-07-07 02:34:22'),
(188, 1635, 20, '**Paragraf:**\n“Tak bersamaku pun tak apa.” Begitu sang raja berkata kepada isterinya.\n\n**Soal Isian:**\n\n1. Apa jawaban yang disukai oleh Ratu Malika akan suaminya?  \n   Jawaban: Tak bersamaku pun tak apa  \n   Bobot: 3\n\n2. Mengapa Ratu Malika menanggapi pernyataan suaminya tentang pergi sendiri ke pesta adat?  \n   Jawaban: Ia selalu menghargai semua tindakan yang dilakukan suaminya untuknya  \n   Bobot: 4\n\n3. Apa kata bermakna yang disebutkan sebagai jawaban Raja Hasyim kepada Ratu Malika tentang keinginannya akan anak?  \n   Jawaban: Tak bersamaku pun tak apa  \n   Bobot: 5', 'essay', 5, '2025-07-07 02:36:12', '2025-07-07 02:36:12'),
(190, 1635, 21, '**Paragraf:**\n\"Lem Mahmud terbiasa melakukannya sejak kecil. Di ujung lidi daun kelapa yang telah diraut, diikat serat benang itu berbentuk lingkaran kecil yang disesuaikan dengan mata udang.\"\n\n**Soal Pilihan Ganda:**\n\n1. Apa yang dilakukan Lem Mahmud?\n   A. Mencari makanan alternatif\n   B. Memelihara hewan\n   C. Mengait udang sungai\n   D. Memintal benang jaring  \n   Jawaban: C  \n   Bobot: 1\n\n2. Apa yang digunakan Lem Mahmud untuk mengait udang?\n   A. Benang jaring\n   B. Lidi daun kelapa  \n   C. Daun nenas hutan  \n   D. Serat benang itu  \n   Jawaban: D  \n   Bobot: 1\n\n3. Fungsi apa yang diemban oleh lingkaran serat benang itu?\n   A. Menyimpan makanan\n   B. Mengait udang sungai \n   C. Membuat jaring untuk memancing\n   D. Menutup kebun  \n   Jawaban: B  \n   Bobot: 1\n\n4. Apa yang disesuaikan dengan mata udang?\n   A. Bentuk lingkaran serat benang itu\n   B. Ukuran lidi daun kelapa \n   C. Warna lidi daun kelapa  \n   D. Panjang lidi daun kelapa  \n   Jawaban: A  \n   Bobot: 2\n\n5. Apa yang dilakukan Lem Mahmud setelah mendapatkan janeng?\n   A. Membawa pulang janeng ke rumah\n   B. Menggali buah janeng  \n   C. Menyiram daun janeng\n   D. Membakar janeng \n   Jawaban: A  \n   Bobot: 1\n\n6. Siapa yang menyiapkan air hangat untuk Lem Mahmud?\n   A. Istri tercinta Da Limah\n   B. Suami tersayang Lem Mahmud\n   C. Kakek tersayang Lem Mahmud\n   D. Teman baik Lem Mahmud  \n   Jawaban: A  \n   Bobot: 1\n\n7. Apa yang dilakukan oleh Lem Mahmud terhadap hasil irisan janeng di bibir pantai?\n   A. Menginjak-injaknya hingga keluar getah putih\n   B. Memasukkan ke dalam raga ikan \n   C. Membilasnya dengan air  \n   D. Menyimpannya di kulkas  \n   Jawaban: A  \n   Bobot: 2', 'multiple_choice', 7, '2025-07-07 02:40:11', '2025-07-07 02:40:11'),
(191, 1635, 21, 'Baiklah! Berikut adalah 10 soal isian berdasarkan paragraf di atas:\n\n**Paragraf:**\n\"Lem Mahmud mencari makanan alternatif karena persediaan beras mereka sudah menipis.\"\n\n**Soal Isian:**\n\n1. Apa yang dilakukan Lem Mahmud karena persediaan berasnya sudah menipis?  \n   Jawaban: Mencari makanan alternatif  \n   Bobot: 3\n\n2. Mengapa perlu mencari makanan alternatif?  \n   Jawaban: Karena persediaan beras sudah menipis  \n   Bobot: 4\n\n3. Apa yang dilakukan Lem Mahmud untuk memperoleh makanan alternatif?  \n   Jawaban: Mencari janeng di hutan  \n   Bobot: 5\n\n4. Bagaimana cara Da Limah mengolah irisan janeng?  \n   Jawaban: Mengupas kulit, mencuci, mengiris kecil-kecil, dan membilas sampai bersih  \n   Bobot: 4\n\n5. Apa tujuan dari pemeraman irisan janeng?  \n   Jawaban: Untuk membersihkan bahan makanan  \n   Bobot: 3\n\n6. Bagaimana cara Lem Mahmud mengumpulkan getah putih yang mengandung zat memabukkan?  \n   Jawaban: Menginjak-injak hasil irisan janeng sampai keluar kandungan racun di dalamnya  \n   Bobot: 5\n\n7. Apa gunanya menggali buah janeng yang ukuran lima kilogram?  \n   Jawaban: Untuk dimasak sebagai makanan pokok  \n   Bobot: 4\n\n8. Bagaimana cara Da Limah menyiapkan buah janeng untuk dimakan?  \n   Jawaban: Mengupas kulit, mencuci, mengiris kecil-kecil, dan membilas sampai bersih  \n   Bobot: 4\n\n9. Apa yang dilakukan Lem Mahmud setelah merebahkan diri di perbukitan hutan itu?  \n   Jawaban: Memikul buah janeng dan membawa pulang ke rumahnya  \n   Bobot: 3\n\n10. Bagaimana cara Da Limah menyimpan irisan janeng yang sudah diperam selama tiga hari?  \n   Jawaban: Ditempatkan dalam raga, keranjang ikan berbentuk bulat dari rotan seukuran jari kelingking  \n   Bobot: 5', 'essay', 10, '2025-07-07 02:43:13', '2025-07-07 02:43:13'),
(192, 1635, 22, '**Paragraf:**\n\n\"Pak Budi memelihara ayam, bebek, dan kambing. Setiap pagi, ia memberi makan ternaknya dengan penuh kasih sayang.\"\n\n**Soal Pilihan Ganda:**\n\n1. Apa hewan yang dipelihara Pak Budi?\n   A. Kucing\n   B. Ayam dan bebek\n   C. Anjing dan kambing\n   D. Ikan dan sapi  \n   Jawaban: B  \n   Bobot: 1\n\n2. Apa hal yang dilakukan oleh Pak Budi setiap pagi?\n   A. Memberi makan anjing\n   B. Memberi makan ternaknya dengan kasih sayang\n   C. Membuat kebun sayuran\n   D. Menanam pohon karet  \n   Jawaban: B  \n   Bobot: 2\n\n3. Apa yang dilakukan Pak Budi kepada hewan peliharaannya?\n   A. Menggembalakannya\n   B. Memberinya makan dengan kasih sayang\n   C. Mengekornya\n   D. Mengeluarkannya dari kandang  \n   Jawaban: B  \n   Bobot: 1\n\n**Paragraf Berbeda:**\n\n\"Pada sore hari, Sasandewini dan Suntre meninggalkan tepi Hutan Kowera setelah mereka berhasil mendapatkan daun ganemo yang mereka inginkan.\"\n\n**Soal Isian:**\n\n1. Apa yang dilakukan oleh Sasandewini dan Suntre pada sore hari?\n   Jawaban: Meninggalkan tepi Hutan Kowera', 'multiple_choice', 3, '2025-07-07 02:45:23', '2025-07-07 02:45:23'),
(196, 1635, 22, 'Soal isian berdasarkan paragraf yang diberikan adalah sebagai berikut:\n\n**Paragraf:**\n\"Burung-burung mambruk itu terbang ke tempat yang lain. Sasandewini dan Suntre mengejarnya. Meski terlihat sudah tak berdaya, dua burung itu susah juga ditangkap.\"\n\n**Soal Isian:**\n1. Tempat apa yang di mana burung-burung mambruk itu pertama kali bertarung?  \n   Jawaban: Pohon ganemo  \n   Bobot: 3\n\n2. Mengapa burung-burung itu sulit ditangkap?  \n   Jawaban: Karena mereka sudah lemah  \n   Bobot: 4\n\n3. Apa yang dilakukan Suntre dan Sasandewini setelah berhasil menangkap burung-burung mambruk itu?  \n   Jawaban: Mengobati luka-luka kedua burung tersebut  \n   Bobot: 5\n\n**Paragraf:**\n\"Sasandewini dan adiknya beristirahat di bawah pohon ganemo. Daun yang mereka peroleh kali ini sangat banyak.\"\n\n**Soal Isian:**\n4. Apa yang dilakukan Suntre dan Sasandewini setelah memetik daun ganemo?  \n   Jawaban: Beristirahat di bawah pohon ganemo  \n   Bobot: 3\n\n5. Mengapa mereka berdua ingin segera pulang?  \n   Jawaban: Untuk mengobati luka burung-burung itu dan memasak daun pakis  \n   Bobot: 4', 'essay', 5, '2025-07-07 02:50:45', '2025-07-07 02:50:45'),
(197, 1635, 23, '**Paragraf:**\nSang Dewi masuk ke dalam gua, Sang Hyang Surya pun tidak berhenti mengikutinya. Sinar matahari yang sangat panas masuk ke dalam gua. Sang Dewi tidak mampu menahan kemarahannya.\n\n**Soal Pilihan Ganda:**\n\n1. Di mana Sang Dewi masuk?\n   A. Ladang\n   B. Hutan\n   C. Gua\n   D. Danau\n   Jawaban: C  \n   Bobot: 1\n\n2. Apa yang mengikutinya Sang Hyang Surya?\n   A. Sang Dewi masuk ke dalam gua\n   B. Sang Dewi keluar dari gua\n   C. Sang Dewi tidak mampu menahan kemarahannya\n   D. Gua tertutup\n   Jawaban: A  \n   Bobot: 2\n\n3. Apa yang masuk ke dalam gua?\n   A. Sinar matahari\n   B. Angin panas\n   C. Debu kering\n   D. Hujan lebat\n   Jawaban: A  \n   Bobot: 1\n\n4. Bagaimana Sikap Sang Dewi terhadap sinar matahari yang masuk ke dalam gua?\n   A. Senang\n   B. Marah dan tidak mampu menahan kemarahannya\n   C. Bahagia\n   D. Tidak peduli\n   Jawaban: B  \n   Bobot: 2\n\n5. Apa konsekuensi tindakan Sang Dewi di dalam gua?\n   A. Menerima anugrah\n   B. Terus menangis\n   C. Diutamakan dan melahirkan anak kembar buncing\n   D. Tidak ada konsekuensinya \n   Jawaban: C  \n   Bobot: 2', 'multiple_choice', 5, '2025-07-07 02:52:31', '2025-07-07 02:52:31'),
(198, 1635, 23, '### 📚 Teks:\n14\ntersebut, Sang Surya pun mengganggunya. Bahkan, apa \nsaja yang dilakukan Sang Dewi,   pancaran sinar Sang \nSurya selalu mengikutinya. Hal ini sangat mengganggu \nSang Dewi dan membuatnya marah kepada Sang Surya.\nKemudian, Sang Dewi masuk ke dalam gua, Sang \nHyang Surya pun tidak berhenti mengikutinya. Sinar \nmatahari yang sangat panas masuk ke dalam gua. Sang \nDewi tidak mampu menahan kemarahannya. Lalu, Sang \nDewi dengan sengaja memunggungi Sang Surya. Perilaku \nSang Dewi dianggap telah menghina Sang Hyang Surya. \nSebagai akibat kenakalannya, Sang Dewi dikutuk oleh \nSang Surya. Sang Dewi secara gaib mengandung dan \nmelahirkan seorang anak banci. Setelah itu, Sang Dewi \njuga melahirkan anak kembar, laki-laki dan perempuan. \nKelahiran kembar ini disebut kembar buncing. Orang-\norang di Bali masih menganggap bahwa untuk kelahiran \nkembar buncing harus dilakukan ritual demi kebaikan \nsang bayi. Secara berturut-turut Sang Dewi melahirkan \nanak terakhir, yaitu bayi perempuan. Peristiwa ini \ndianggap aneh oleh Sang Dewi, tetapi ia ikhlas menjalani \n15\nkehidupannya. Dengan penuh kasih sayang, Sang Dewi \nmembesarkan dan mendidik anak-anaknya seorang diri. \nSingkat cerita, setelah anak-anaknya besar, Sang \nDewi kembali ke langit dan anak-anaknya tinggal di \nTrunyan. Namun, sebelum meninggalkan anak-anaknya, \nSang Dewi berpesan.\n”Dengarkan, anak-anakku, Ibu harus kembali \nke langit. Ada hal yang harus Ibu kerjakan di sana. \nKalian sudah besar. Ibu tidak akan khawatir jika harus \nmeninggalkan kalian di tempat ini. Kelak akan ada \nmanusia yang menempati Desa Trunyan. Bahkan, di \nantara kalian ada yang menikah dengan salah satu dari \nmereka, manusia bumi yang menghampiri tempat ini.”\nDengan segera Sang Dewi melayang pulang ke \nlangit. Meskipun ia tidak bisa menempati janjinya \nuntuk tinggal selamanya di bumi, keturunannya telah \nmenggantikannya.  Keempat anak Sang Dewi pun hidup \nrukun sambil menunggu manusia datang ke tempat ini. \nMereka menyibukan diri dengan merawat pohon taru \nmenyan yang ada di Trunyan. Demikianlah kisah Sang \nDewi beserta anak-anaknya.\n\n### 📌 Soal Isian\n\n**1. Apa yang dilakukan Sang Dewi terhadap Sang Surya?**\n   Jawaban: Memunggungi\n   Bobot: 3\n   \n**2. Apa yang membuat Sang Dewi marah kepada Sang Surya?**\n   Jawaban: Pancaran sinar Sang Surya mengikutinya\n   Bobot: 4\n\n**3. Mengapa Sang Dewi dikutuk oleh Sang Surya?**\n   Jawaban: Karena perilaku Sang Dewi dianggap telah menghina Sang Hyang Surya.\n   Bobot: 5\n\n**4. Apakah yang dilakukan orang-orang di Bali atas kelahiran kembar buncing?**\n   Jawaban: Ritual demi kebaikan sang bayi\n   Bobot: 3\n\n**5. Keturunan siapa yang menggantikannya?**\n   Jawaban: Keturunan Sang Dewi\n   Bobot: 4\n\n**6. Apa yang dilakukan oleh Keempat anak Sang Dewi sambil menunggu manusia datang ke tempat ini?**\n   Jawaban: Merawat pohon taru menyan di Trunyan\n   Bobot: 5\n\n**7. Berapa jumlah anak yang melahirkan Sang Dewi secara berturut-turut?**\n   Jawaban: 4\n   Bobot: 3', 'essay', 7, '2025-07-07 02:56:38', '2025-07-07 02:56:38'),
(199, 1635, 24, '### Paragraf:\n\"Setelah tiga hari Orang Kayo Hitam pun datang menghadap Temenggung Temuntan lagi. Sampai di hadapan, kata Temenggung Temuntan “maksud hati anak muda ini telah mamanda sampaikan kepada warisnya. Semua pada dasarnya menyetujui, namun sesuai adatnya, ananda harus menyerahkan emas sebanyak tujuh lesung. Begitulah adat mamanda di sini.” Jawab Orang Kayo Hitam, “baiklah, ananda minta tempo kepada mamanda enam bulan pergi pulang untuk mencarikan adat tersebut.” Jawab Temenggung Temuntan “baiklah.”\n\n### Soal Pilihan Ganda:\n\n1. Siapa yang menghadap Orang Kayo Hitam setelah tiga hari?\n   A. Raja-raja di Pulau Jawa  \n   B. Temenggung Merah Mato dan Temenggung Temuntan\n   C. Wanita cantik dengan rambut panjang  \n   D. Para ksatria Jambi \n   Jawaban: B  \n   Bobot: 1\n\n2. Apa yang harus diserahkan oleh Orang Kayo Hitam menurut adat di kampung Temenggung Merah Mato?\n   A. Emas tujuh lesung  \n   B. Pedang empat belas  \n   C. Kuda delapan puluh\n   D. Gajah satu ekor\n   Jawaban: A  \n   Bobot: 2\n\n3. Siapa yang memberi tempo kepada Orang Kayo Hitam untuk mencarikan adat tujuh lesung?\n   A. Temenggung Merah Mato \n   B. Temenggung Temuntan\n   C. Orang Kayo Hitam  \n   D. Raja-raja di Pulau Jawa\n   Jawaban: B  \n   Bobot: 1\n\n4. Apa yang dimaksud dengan \"adat mamanda\" dalam paragraf tersebut?\n   A. Adat orang tua Temenggung Merah Mato  \n   B. Adat kampung Temenggung Temuntan\n   C. Adat Jambi \n   D. Adat Pulau Jawa \n   Jawaban: A  \n   Bobot: 2\n\n5. Berapa lama tempo yang diberikan oleh Orang Kayo Hitam kepada Temenggung Temuntan untuk mencarikan adat tujuh lesung?\n   A. Tiga hari\n   B. Empat bulan\n   C. Enam bulan  \n   D. Tujuh tahun \n   Jawaban: C  \n   Bobot: 2', 'multiple_choice', 5, '2025-07-07 03:01:13', '2025-07-07 03:01:13'),
(200, 1635, 24, '### Paragraf:\nSetelah pertarungan itu Orang kayo Hitam pun mencuri \ndengar dari obrolan beberapa orang di kampung tersebut \nbahwa wanita yang memiliki rambut sangat panjang di \nkampung tersebut ialah Tuan Putri anak Temenggung Merah \nMato. Temenggung Merah Mato ternyata memiliki dua orang \nanak. Satu orang laki-laki, namanya Raden Kuning Magat \nDialam. Satu orang lagi perempuan, namanya Tuan Puti Mayang \nMangurai.\n\n### Soal Isian:\n\n1. Siapa yang punya rambut sangat panjang di kampung tersebut?\n   Jawaban: Tuan Putri  \n   Bobot: 3\n\n2. Siapa orang tua Tuan Putri?  \n   Jawaban: Temenggung Merah Mato  \n   Bobot: 4\n\n3. Berapakah banyak anak yang dikandung oleh Temenggung Merah Mato?\n   Jawaban: Dua orang  \n   Bobot: 5\n\n4. Apa nama perempuan anak Temenggung Merah Mato?  \n   Jawaban: Tuan Puti Mayang Mangurai  \n   Bobot: 3\n\n5. Siapa laki-laki dari anak-anak Temenggung Merah Mato?\n   Jawaban: Raden Kuning Magat Dialam  \n   Bobot: 4', 'essay', 5, '2025-07-07 03:07:59', '2025-07-07 03:07:59'),
(201, 1635, 25, '### Paragraf:\n\"Setelah semuanya terwujud, baginda raja melangkahkan kakinya menuju tempat tinggal putri jin dan ayahnya. Di-perlihatkannya istana megah yang berhasil dibangunnya. Perabotan di dalamnya juga lengkap sehingga putri jin sangat bahagia. Karena semua permintaan terpenuhi, putri jin pun bersedia menikah dengan baginda raja.\"\n\n### Soal Pilihan Ganda:\n1. Bagaimana reaksi putri jin ketika melihat istana yang dibangun oleh baginda raja?\n   A. Putri jin sangat sedih\n   B. Putri jin bahagia karena permintaannya terpenuhi\n   C. Putri jin tidak peduli dengan istana\n   D. Putri jin kecewa karena istana tidak sesuai keinginannya  \n   Jawaban: B  \n   Bobot: 1\n\n2. Apa yang dilakukan oleh baginda raja setelah permintaan putri jin terpenuhi?\n   A. Baginda menolak memenuhi permintaan putri jin\n   B. Baginda membenci putri jin\n   C. Baginda melangkahkan kakinya menuju tempat tinggal putri jin dan ayahnya\n   D. Baginda meninggalkan istana yang dibangunnya  \n   Jawaban: C  \n   Bobot: 1\n\n3. Apa yang menjadi alasan putri jin bersedia menikah dengan baginda raja?\n   A. Putri jin mencintai baginda raja\n   B. Semua permintaannya terpenuhi\n   C. Putri jin tidak memiliki pilihan lain\n   D. Baginda raja menjanjikan kekayaan yang banyak  \n   Jawaban: B  \n   Bobot: 1\n\n4. Apa yang dilakukan oleh baginda raja dan putri jin setelah pernikahan?\n   A. Mereka tinggal bersama di istana\n   B. Mereka tidak pernah bertemu lagi\n   C. Putri jin hidup bahagia dengan ayahnya\n   D. Baginda raja meninggalkan putri jin  \n   Jawaban: A  \n   Bobot: 1\n\n5. Apa yang menjadi akhir dari cerita tentang baginda raja dan putri jin?\n   A. Mereka hidup bahagia bersama\n   B. Putri jin jatuh cinta dengan ayahnya\n   C. Baginda raja meninggalkan istana\n   D. Permaisuri yang sebenarnya telah melahirkan  \n   Jawaban: A  \n   Bobot: 1', 'multiple_choice', 5, '2025-07-07 03:11:15', '2025-07-07 03:11:15'),
(202, 1635, 25, '### Paragraf:\nRaja Datu Pejanggiq telah berpindah ke hutan Lengkukun dan tinggal bersama Putri Jin yang cantik. Setelah beberapa bulan pernikahan mereka, Putri Jin hamil tujuh bulan dan raja sangat bahagia. Raja masih tidak mengingat permaisuri dan putra mahkota di istana.\n\n### Soal Isian:\n\n1. Siapa yang tinggal bersama raja Datu Pejanggiq di hutan Lengkukun?  \n   Jawaban: Putri Jin  \n   Bobot: 3\n\n2. Berapakah bulan kehamilan Putri Jin ketika itu?  \n   Jawaban: Tujuh bulan  \n   Bobot: 4\n\n3. Siapa yang tinggal di istana sementara raja Datu Pejanggiq pergi ke hutan Lengkukun?  \n   Jawaban: Permaisuri Putri Mas Dewi Kencana dan putra mahkota  \n   Bobot: 5', 'essay', 7, '2025-07-07 03:17:15', '2025-07-07 03:17:15'),
(203, 1635, 20, '**Paragraf:**\n\"Hari belum terlalu terik ketika Ratu Malika melenggangkan kakinya bersama Dayang Biru menuju ke tempat penyelenggaraan pesta adat.\"\n\n**Soal Pilihan Ganda:**\n\n1. Siapa yang berjalan kaki dari istana dan menyapa orang-orang di jalanan?\n   A. Ratu Malika\n   B. Dayang Biru\n   C. Sang raja pamit kepada permaisuri.\n   D. Kakek berambut putih\n   Jawaban: A\n   Bobot: 1\n\n2. Apa yang dilakukan Dayang Biru sebelum tiba di tempat penyelenggaraan pesta adat?\n   A. Membeli buah kepayang untuk obat paman\n   B. Berbelanja di pasar\n   C. Mengunjungi kampung\n   D. Menghadiri acara pesta adat\n   Jawaban: A\n   Bobot: 1\n\n3. Si kakek itu mengatakan apa yang harus dilakukan Ratu Malika agar dapat memiliki anak?\n   A. Mengerahkan seluruh daya dan upaya\n   B. Mencari seekor penyu hijau di laut Bangka\n   C. Berjalan-jalan untuk melepas kepenatan\n   D. Menghadiri acara pesta adat\n   Jawaban: B\n   Bobot: 2', 'multiple_choice', 5, '2025-08-05 02:32:55', '2025-08-05 02:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `literacy_materials`
--

CREATE TABLE `literacy_materials` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `literacy_materials`
--

INSERT INTO `literacy_materials` (`id`, `user_id`, `title`, `description`, `file_path`, `created_at`, `updated_at`) VALUES
(20, 1650, 'Asal Usul Tanjung Penyusuk', 'Cerita rakyat tentang bagaimana Tanjung Penyusuk mendapatkan namanya dan nilai-nilai kebaikan dari masyarakat setempat.', 'literacy_materials/Asal Usul Tanjung Penyusuk.pdf', '2025-05-29 08:17:56', '2025-05-29 08:17:56'),
(21, 1650, 'Mahmud dan Sawah Ajaib', 'Kisah seorang anak bernama Mahmud yang menemukan sawah ajaib dan belajar pentingnya kerja keras dan kejujuran.', 'literacy_materials/Mahmud dan Sawah Ajaib.pdf', '2025-05-29 08:18:28', '2025-05-29 08:18:28'),
(22, 1650, 'Kisah Dua Putri dan Si Raja Ular', 'Dongeng tentang dua putri yang menghadapi ujian dari Raja Ular, dengan pesan moral tentang kebaikan hati dan kesetiaan.', 'literacy_materials/SD-Kisah_Dua_Putri_dan_Si_Raja_Ular.pdf', '2025-05-29 08:19:23', '2025-05-29 08:19:23'),
(23, 1650, 'Bau Wangi Tarumenyan', 'Legenda asal usul bau harum dari Desa Tarumenyan, yang mengajarkan arti dari pengorbanan dan cinta sejati.', 'literacy_materials/SMP_Bau Wangi Tarumenyan.pdf', '2025-05-29 08:20:35', '2025-05-29 08:20:35'),
(24, 1650, 'Kumpulan Cerita Rakyat Jambi', '1. Orang Kayo Hitam “Silsilah Keturunan”\r\nMenceritakan asal-usul keturunan Orang Kayo Hitam sebagai tokoh penting di Jambi.\r\n\r\n2. Orang Kayo Hitam “Sang Pemberani”\r\nMengisahkan keberanian Orang Kayo Hitam dalam menghadapi berbagai tantangan.\r\n\r\n3. Orang Kayo Hitam “Siginjai Keris Sang Rajo”\r\nCerita tentang keris sakti milik Orang Kayo Hitam yang menjadi lambang kekuasaan.\r\n\r\n4. Orang Kayo Hitam “Asal-usul Tanah Pilih Negeri Jambi”\r\nMenjelaskan bagaimana Tanah Pilih dipilih sebagai pusat kerajaan Jambi.\r\n\r\n5. Putri Reno Pinang Masak\r\nKisah putri cantik dan bijak yang disukai oleh rakyatnya.\r\n\r\nDan masih banyak lagi', 'literacy_materials/2021-BUKU KUMPULAN CERITA RAKYAT JAMBI.pdf', '2025-05-29 08:34:22', '2025-05-29 08:38:54'),
(25, 1650, 'Kumpulan Cerita Rakyat Lombok', 'Berisi lima cerita rakyat dari Lombok, termasuk Datu Pejanggiq, Selendang Bidadari, dan Putri Mandalika.', 'literacy_materials/Kumpulan Cerita Rakyat Lombok.pdf', '2025-05-29 08:45:21', '2025-05-29 08:45:35'),
(34, 1669, 'Bukit Batu Suli', 'Buku cerita buku batu suli', 'literacy_materials/Bukit Batu Suli.pdf', '2025-07-01 05:45:55', '2025-07-01 05:45:55');

-- --------------------------------------------------------

--
-- Table structure for table `literacy_options`
--

CREATE TABLE `literacy_options` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `option_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  `score` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `literacy_options`
--

INSERT INTO `literacy_options` (`id`, `question_id`, `option_text`, `is_correct`, `score`, `created_at`, `updated_at`) VALUES
(227, 99, 'Atap rumah yang hanya bertahan setahun saja', 0, 0, '2025-06-21 02:57:34', '2025-06-21 02:57:34'),
(228, 99, 'Atap rumah yang memerlukan ganti setiap dua tahun sekali', 0, 0, '2025-06-21 02:57:34', '2025-06-22 07:14:55'),
(229, 99, 'Atap rumah yang sangat sederhana dibandingkan atap rumah biasa', 0, 0, '2025-06-21 02:57:34', '2025-06-21 02:57:34'),
(230, 99, 'Atap rumah yang terbuat dari bahan daun kelapa dan bambu', 1, 2, '2025-06-21 02:57:34', '2025-06-22 07:14:55'),
(231, 100, 'Lem Mahmud', 0, 0, '2025-06-21 02:58:36', '2025-06-21 05:08:02'),
(232, 100, 'Anak Lem Mahmud', 0, 0, '2025-06-21 02:58:36', '2025-06-21 05:08:02'),
(233, 100, 'Da Limah', 1, 2, '2025-06-21 02:58:36', '2025-06-22 08:16:56'),
(234, 100, 'Tetangga Lem Mahmud', 0, 0, '2025-06-21 02:58:36', '2025-06-21 05:08:02'),
(235, 101, 'Daun kelapa dan bambu', 1, 2, '2025-06-21 02:59:45', '2025-06-22 08:16:44'),
(236, 101, 'Genteng dan semen', 0, 0, '2025-06-21 02:59:45', '2025-06-21 05:10:53'),
(237, 101, 'Plastik dan kayu', 0, 0, '2025-06-21 02:59:45', '2025-06-21 05:10:53'),
(238, 101, 'Pelepah pisang dan jerami', 0, 0, '2025-06-21 02:59:45', '2025-06-21 05:10:53'),
(239, 102, 'Lem Mahmud', 0, 0, '2025-06-21 03:00:48', '2025-06-21 05:12:01'),
(240, 102, 'Da Limah', 1, 2, '2025-06-21 03:00:48', '2025-06-21 05:12:01'),
(241, 102, 'Anak mereka', 0, 0, '2025-06-21 03:00:48', '2025-06-21 05:12:01'),
(242, 102, 'Tukang kayu', 0, 0, '2025-06-21 03:00:48', '2025-06-21 05:12:01'),
(243, 103, 'Mereka sama-sama mengganti anyaman daun kelapa yang lama', 0, 0, '2025-06-21 03:01:56', '2025-06-21 03:01:56'),
(244, 103, 'Istri menganyam atap dari daun kelapa kering, sedangkan suami mendirikannya di atas gubuk', 1, 2, '2025-06-21 03:01:56', '2025-06-22 08:16:31'),
(245, 103, 'Atap rumah dibuat oleh siapa saja yang tinggal didalamnya tanpa ada hubungan yang spesifik', 0, 0, '2025-06-21 03:01:56', '2025-06-21 03:01:56'),
(246, 103, 'Suami mengganti atap yang lama dengan menggunakan anyaman daun kelapa baru', 0, 0, '2025-06-21 03:01:56', '2025-06-21 03:01:56'),
(247, 104, 'Datu Pejanggiq', 1, 2, '2025-06-21 03:07:32', '2025-06-22 08:15:45'),
(248, 104, 'Patih Batu Bangka', 0, 0, '2025-06-21 03:07:32', '2025-06-21 03:07:32'),
(249, 104, 'Putri Mas Dewi Kencana', 0, 0, '2025-06-21 03:07:32', '2025-06-21 03:07:32'),
(250, 104, 'Lelaki jabut', 0, 0, '2025-06-21 03:07:32', '2025-06-21 03:07:32'),
(251, 105, 'Kulitnya hitam', 0, 0, '2025-06-21 03:08:37', '2025-06-21 03:08:37'),
(252, 105, 'Kulitnya putih kekuningan', 1, 2, '2025-06-21 03:08:37', '2025-06-22 08:15:52'),
(253, 105, 'Rambutnya panjang', 0, 0, '2025-06-21 03:08:37', '2025-06-21 03:08:37'),
(254, 105, 'Matanya besar', 0, 0, '2025-06-21 03:08:37', '2025-06-21 03:08:37'),
(255, 106, 'Ia selalu memakai mahkota emas', 0, 0, '2025-06-21 03:09:44', '2025-06-21 05:19:28'),
(256, 106, 'Karena kulitnya putih kekuningan', 1, 2, '2025-06-21 03:09:44', '2025-06-22 08:15:59'),
(257, 106, 'Ia selalu berjalan bersama Patih Batu Bangka', 0, 0, '2025-06-21 03:09:44', '2025-06-21 05:19:28'),
(258, 106, 'Ia tinggal di hutan yang sunyi', 0, 0, '2025-06-21 03:09:44', '2025-06-21 05:19:28'),
(259, 107, 'Ia suka berburu di hutan', 0, 0, '2025-06-21 03:10:43', '2025-06-21 05:22:00'),
(260, 107, 'Ia sangat adil dan bijaksana', 1, 2, '2025-06-21 03:10:43', '2025-06-22 08:16:05'),
(261, 107, 'Ia tinggal bersama Patih Batu Bangka', 0, 0, '2025-06-21 03:10:43', '2025-06-21 05:22:00'),
(262, 107, 'Ia suka menguji rakyatnya', 0, 0, '2025-06-21 03:10:43', '2025-06-21 05:22:00'),
(263, 108, 'Sombong', 0, 0, '2025-06-21 03:11:57', '2025-06-21 05:25:08'),
(264, 108, 'Pandai mengambil keputusan', 1, 2, '2025-06-21 03:11:57', '2025-06-22 08:18:07'),
(265, 108, 'Mudah marah', 0, 0, '2025-06-21 03:11:57', '2025-06-21 05:25:08'),
(266, 108, 'Tidak suka berbicara', 0, 0, '2025-06-21 03:11:57', '2025-06-21 05:25:08'),
(267, 109, 'Ya', 1, 2, '2025-06-21 03:22:12', '2025-06-22 08:17:38'),
(268, 109, 'Tidak', 0, 0, '2025-06-21 03:22:12', '2025-06-21 03:22:12'),
(269, 109, 'Mungkin saja', 0, 0, '2025-06-21 03:22:12', '2025-06-21 03:22:12'),
(270, 109, 'Pasti tidak', 0, 0, '2025-06-21 03:22:12', '2025-06-21 03:22:12'),
(271, 110, 'Hutan, tebing perbukitan, bangunan yang tidak terawat', 1, 2, '2025-06-21 03:23:30', '2025-06-22 08:16:16'),
(272, 110, 'Hutan dan kolam', 0, 0, '2025-06-21 03:23:30', '2025-06-21 03:23:30'),
(273, 110, 'Tebing, pohon, danau', 0, 0, '2025-06-21 03:23:30', '2025-06-21 03:23:30'),
(274, 110, 'Hutan', 0, 0, '2025-06-21 03:23:30', '2025-06-21 03:23:30'),
(275, 111, 'Air', 1, 2, '2025-06-21 03:25:29', '2025-06-21 03:25:29'),
(276, 111, 'Sinar matahari', 0, 0, '2025-06-21 03:25:29', '2025-06-21 03:25:29'),
(277, 111, 'Udara kering', 0, 0, '2025-06-21 03:25:29', '2025-06-21 03:25:29'),
(278, 111, 'Tanah lembap', 0, 0, '2025-06-21 03:25:29', '2025-06-21 03:25:29'),
(279, 112, 'Tempat lembap seperti hutan dan sela-sela bangunan', 1, 2, '2025-06-21 03:26:28', '2025-06-22 08:15:32'),
(280, 112, 'Gurun pasir yang panas', 0, 0, '2025-06-21 03:26:28', '2025-06-21 05:13:12'),
(281, 112, 'Puncak gunung salju', 0, 0, '2025-06-21 03:26:28', '2025-06-21 05:13:12'),
(282, 112, 'Rumah yang bersih dan terang', 0, 0, '2025-06-21 03:26:28', '2025-06-21 05:13:12'),
(283, 113, 'Di bawah genteng', 0, 0, '2025-06-21 03:27:19', '2025-06-21 05:37:40'),
(284, 113, 'Di sela-sela bangunan', 1, 2, '2025-06-21 03:27:19', '2025-06-22 08:15:23'),
(285, 113, 'Di balik pintu', 0, 0, '2025-06-21 03:27:19', '2025-06-21 05:37:40'),
(286, 113, 'Di atas jendela', 0, 0, '2025-06-21 03:27:19', '2025-06-21 05:37:40');

-- --------------------------------------------------------

--
-- Table structure for table `literacy_questions`
--

CREATE TABLE `literacy_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `material_id` bigint UNSIGNED NOT NULL,
  `question_text` text NOT NULL,
  `type` enum('multiple_choice','essay') NOT NULL,
  `essay_answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `essay_score` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `literacy_questions`
--

INSERT INTO `literacy_questions` (`id`, `material_id`, `question_text`, `type`, `essay_answer`, `essay_score`, `created_at`, `updated_at`) VALUES
(94, 24, 'Menurut cerita, apa permintaan Ratu Mataram kepada ahli nujum?', 'essay', 'Menanyakan cara membunuh Orang Kayo Hitam', 4, '2025-06-21 02:37:08', '2025-06-21 05:13:56'),
(95, 24, 'Tuliskan syarat membunuh Orang Kayo Hitam menurut ahli nujum!', 'essay', 'Syaratnya terlalu berat karena Orang Kayo Hitam sangat sakti', 4, '2025-06-21 02:38:34', '2025-06-21 05:14:36'),
(96, 24, 'Apa arti kata “sakti” dalam kalimat ‘Orang Kayo Hitam memang terlalu sakti’? (Tuliskan sinonimnya)', 'essay', 'hebat, kuat', 4, '2025-06-21 02:39:24', '2025-06-21 05:34:26'),
(97, 24, 'Bagaimana sikap ahli nujum saat menjawab pertanyaan Ratu Mataram?', 'essay', 'Memohon ampun atau dengan hormat', 5, '2025-06-21 02:39:52', '2025-06-22 07:04:52'),
(98, 24, 'Apa gelar kehormatan yang digunakan ahli nujum saat menjawab Ratu?', 'essay', 'Yang Mulia', 3, '2025-06-21 02:42:57', '2025-06-21 02:42:57'),
(99, 21, 'Pada akhir pernyataan, apa yang dimaksud dengan atap daun kelapa?', 'multiple_choice', NULL, NULL, '2025-06-21 02:57:33', '2025-06-21 02:57:33'),
(100, 21, 'Siapa yang membuat atap rumah dari daun kelapa?', 'multiple_choice', NULL, NULL, '2025-06-21 02:58:36', '2025-06-21 05:08:02'),
(101, 21, 'Apa bahan yang digunakan untuk membuat atap rumah Lem Mahmud?', 'multiple_choice', NULL, NULL, '2025-06-21 02:59:45', '2025-06-21 05:10:53'),
(102, 21, 'Siapa yang membuat anyaman daun kelapa untuk atap rumah?', 'multiple_choice', NULL, NULL, '2025-06-21 03:00:48', '2025-06-21 05:12:01'),
(103, 21, 'Bagaimana hubungan antara Lem Mahmud dan istri, Da Limah dalam membuat atap rumah?', 'multiple_choice', NULL, NULL, '2025-06-21 03:01:56', '2025-06-21 03:01:56'),
(104, 25, 'Siapa nama raja yang terkenal adil dan bijaksana di negerinya?', 'multiple_choice', NULL, NULL, '2025-06-21 03:07:32', '2025-06-21 03:07:32'),
(105, 25, 'Apa keistimewaan kulit raja yang disebutkan dalam paragraf?', 'multiple_choice', NULL, NULL, '2025-06-21 03:08:37', '2025-06-21 03:08:37'),
(106, 25, 'Apa yang membuat Baginda Raja Datu Pejanggiq mudah dikenali oleh rakyatnya?', 'multiple_choice', NULL, NULL, '2025-06-21 03:09:44', '2025-06-21 05:19:28'),
(107, 25, 'Apa yang membuat Baginda Raja Datu Pejanggiq terkenal di negerinya?', 'multiple_choice', NULL, NULL, '2025-06-21 03:10:43', '2025-06-21 05:22:00'),
(108, 25, 'Apa arti kata \"bijaksana\" pada kalimat: “Baginda raja ini sangat terkenal adil dan bijaksana di negerinya”?', 'multiple_choice', NULL, NULL, '2025-06-21 03:11:57', '2025-06-21 05:25:08'),
(109, 22, 'Apakah pakis ditemukan di tempat-tempat tersebut?', 'multiple_choice', NULL, NULL, '2025-06-21 03:22:12', '2025-06-21 03:22:12'),
(110, 22, 'Di mana pakis banyak ditemukan?', 'multiple_choice', NULL, NULL, '2025-06-21 03:23:30', '2025-06-21 03:23:30'),
(111, 22, 'Apa yang perlu dipenuhi oleh tumbuhan paku agar tetap bertahan hidup?', 'multiple_choice', NULL, NULL, '2025-06-21 03:25:29', '2025-06-21 03:25:29'),
(112, 22, 'Pakis bisa hidup di tempat seperti...', 'multiple_choice', NULL, NULL, '2025-06-21 03:26:28', '2025-06-21 05:13:12'),
(113, 22, 'Pakis dapat tumbuh di bangunan yang tidak terawat, tepatnya di bagian...?', 'multiple_choice', NULL, NULL, '2025-06-21 03:27:19', '2025-06-21 06:56:36');

-- --------------------------------------------------------

--
-- Table structure for table `literacy_story_texts`
--

CREATE TABLE `literacy_story_texts` (
  `id` bigint NOT NULL,
  `material_id` bigint UNSIGNED NOT NULL,
  `story_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `literacy_story_texts`
--

INSERT INTO `literacy_story_texts` (`id`, `material_id`, `story_text`, `created_at`, `updated_at`) VALUES
(7, 20, 'Baginda Hasyim merupakan keturunan ketujuh dari silsilah Sultan Usman Hamidi, penguasa wilayah Bangka yang sangat terkenal seantero nusantara. Sejak diangkat menjadi raja dan memerintah negeri Bangka Utara, Baginda Hasyim mengutamakan sikap arif bijaksana.', '2025-06-21 02:26:36', '2025-06-21 02:26:36'),
(8, 23, 'Raja Dalem Solo memiliki tiga putra dan satu putri yang sangat tampan dan cantik. Suatu hari ketika sedang duduk di taman keputren bersama dayangnya, tiba-tiba Putri Keempat Dalem Solo berteriak dan terpekik.', '2025-06-21 02:27:19', '2025-06-21 02:27:19'),
(9, 24, 'Kemudian, Ratu Mataram memanggil ahli nujum negeri, “wahai ahli nujum, apa kira-kira yang dapat digunakan untuk membunuh Orang Kayo Hitam?” Jawab ahli nujum, “ampun Yang Mulia, Orang Kayo Hitam memang terlalu sakti. Kalaupun ada yang dapat membunuhnya, syaratnya terlalu berat.', '2025-06-21 02:33:43', '2025-06-21 02:34:33'),
(10, 21, 'Kehidupan Lem Mahmud dan istri, Da Limah sangat sederhana. Mereka tinggal di sebuah gubuk tua yang hampir rubuh. Gubuk yang mereka tempati berdindingkan pelepah rumbia dan beralaskan tanah liat yang sudah mengeras. Atapnya daun kelapa kering yang dianyam pada sebilah bambu. Da Limah sendiri yang menganyamnya.', '2025-06-21 02:56:23', '2025-06-21 02:56:23'),
(11, 25, 'Pada zaman dahulu, baginda raja ini sangat terkenal adil dan bijaksana di negerinya, namanya Datu Pejanggiq. Selain sangat berani, baginda raja ini juga sakti mandraguna. Postur tubuhnya gagah berwibawa dan yang menjadikan baginda raja ini mudah dikenal adalah karena kulitnya putih kekuningan.', '2025-06-21 03:06:29', '2025-06-21 03:06:29'),
(12, 22, 'Pakis termasuk tumbuhan paku. Pakis banyak ditemukan di hutan yang lembab. Selain di hutan, pakis juga bisa ditemukan di tebing perbukitan, merayap pada batang pohon atau batuan, di dalam kolam atau danau, serta di sela-sela bangunan yang tidak terawat.', '2025-06-21 03:20:41', '2025-06-21 03:20:41'),
(14, 34, 'Puruk Sanukui ini adalah sebuah bukit yang sangat tinggi dan curam. Di sekitar puruk ini banyak tumbuh pepohonan yang sangat besar dan rimbun. Berbagai macam tanaman dan binatang ada di dalamnya', '2025-07-01 05:51:31', '2025-07-01 05:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher` enum('admin','teacher','student') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uplink` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_id` bigint DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `db_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `teacher`, `remember_token`, `uplink`, `created_at`, `updated_at`, `google_id`, `role`, `db_username`) VALUES
(1577, 'Student1', 'student1@iclop.com', NULL, '$2y$10$NYw4qiHg3jq.CLJzZHxft.XfSN1r4qZFQuvHYp7EtlBNEl29vOR0y', 'student', NULL, 1576, '2023-07-05 08:19:54', '2023-07-05 08:19:54', NULL, 'student', NULL),
(1578, 'admin iclop', 'admin@iclop.org', NULL, '$2y$10$OdJkvDas1L51XQK9JJvuPON19rLsU9gwZbAHMPnrBFCMyRa6kF7tG', 'teacher', NULL, 0, '2023-07-05 08:21:48', '2023-07-05 08:21:48', NULL, 'admin', NULL),
(1579, 'Nabilah Argyanti Ardyningrum', 'nargyanti@gmail.com', NULL, '$2y$10$hs9h2D7hY7C0lQCQZIklEeB9iyi76TNWiqRX8bVk3GZEAsPhah4TO', 'student', NULL, 1576, '2023-07-05 21:00:48', '2023-07-05 21:00:48', NULL, 'student', NULL),
(1580, 'Udjir', 'amaludjir@gmail.com', NULL, '$2y$10$OdJkvDas1L51XQK9JJvuPON19rLsU9gwZbAHMPnrBFCMyRa6kF7tG', 'student', NULL, 0, '2024-03-17 08:29:18', '2024-03-17 08:29:18', NULL, 'student', NULL),
(1582, 'admin all', 'admin@gmail.com', NULL, '$2y$10$MdexzAXsDjRg1xBVJCrOO.BoKvvcCkO8Xiu1avFc9bQ004JsucSTm', 'student', NULL, 0, '2024-04-25 23:31:37', '2024-04-25 23:31:37', NULL, 'admin', NULL),
(1586, 'febri syawaldi', 'febrisyawaldi5@gmail.com', NULL, '', 'student', NULL, 0, '2024-05-06 04:26:44', '2024-05-24 08:31:06', 9223372036854775807, 'student', NULL),
(1588, 'Ahmad Abid', 'abid@gmail.com', NULL, '$2y$10$SfqYMtfms8ts.Bq/CtF8EuTYLbsbsSpLGfYavwl4OLGgF1CyNFWZa', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1591, 'Ika Yuniasti', 'ika@gmail.com', NULL, '$2y$10$DpaeduUM3yXZG.URb80uLeVImpt4toNyUeG6Du8AWmGQeOgDz69kO', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1592, 'Indah Khoirun Nisak', 'nisak@gmail.com', NULL, '$2y$10$pco.l8NXD9VZx6PJpf7YtOvVujV89iCeXWduaTN9Hm8wPISiI6AtG', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1593, 'Irba Adika Jaya', 'irba@gmail.com', NULL, '$2y$10$1bwRsjUvRRUhDnZa1UXGlOFN7A5IUIYpe2JA3AkuoSqZ6vEMcKCL6', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1594, 'Jasmin Salsabila', 'jasmin@gmail.com', NULL, '$2y$10$9OQIsaXzEQYFdL96Y/B.LOWmmRJczTqxM2fsZfmuOAiltBWF.xrhy', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1595, 'Farah Zulfa Hamidah', 'zulfafara1@gmail.com', NULL, '$2y$10$dz0/qKvZwiKGYAgKn.j2jembjlOFKgP/udGlsJDBZpv9GH5QhmvEG', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1596, 'Nabila Laila', 'bila@gmail.com', NULL, '$2y$10$B8P/eLs8/TF4AiubxIQ.GOK5yN.LuhpIS52OlflRbB55a12HaC0n2', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1597, 'nadhifah', 'nad@gmail.com', NULL, '$2y$10$fU9/EGUol/imC4qcWTLOwe2CyxFf9CVH/Tk3TbXqMVlt3ohWs95US', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1598, 'rafiqoh', 'raf@gmail.com', NULL, '$2y$10$I/3iFNo3a/Bm5WQgnuFLw.Oxns9srLc0p/kKOxX.SFbSPhsFW7li6', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1599, 'Rofika', 'rof@gmail.com', NULL, '$2y$10$6QSPwwnbfMlr/gjX1lG7A.UwNwgTI5aSktzXEqVKPmsXJQ74BodMe', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1600, 'Rosa Fitri', 'rosa@gmail.com', NULL, '$2y$10$yrnXoSzMcIs5xEKTNO6v/ebQ18P32is5REXk7hRQ0c/WBTUQu1N5O', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1601, 'Achmad Wibawa', 'wibi@gmail.com', NULL, '$2y$10$TEgp9SflftIfdruu8XF..e5wQhy81yU0P.tulRH6r5IEPzv9jYx9C', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1602, 'Maulana Rosandri', 'maul@gmail.com', NULL, '$2y$10$vVU67Kp/Kl6Fl450kr/ocO1dkCNak/tl9YVJnIe9Lyl9lRTdTEziy', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1604, 'Ahmad Thariq', 'eriq@gmail.com', NULL, '$2y$10$SffHR6IJJBkOu5DU1jAohe9q8Zvtdp9yiEjz.8.XKRgMX519r/OPW', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1605, 'Adika Ahmad', 'dika@gmail.com', NULL, '$2y$10$1qoFiLZMusYsr9tWlBAt9e3pIx5L7LFPR6..sNod6YMvgfE.OOEEG', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1606, 'Andi Mushawwir', 'awi@gmail.com', NULL, '$2y$10$tvcbEzfjjQNQ/UNgPaEnIORo4s9J/LI4Ldx4SWUZgVs2ZfFLJElO2', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1607, 'Annisa Fitri', 'anisa@gmail.com', NULL, '$2y$10$13yH8125x5aD7..w9Sw2EOt5/HqIUX2YID2NYuscCysho5Tva1qAa', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1608, 'Dewangga', 'angga@gmail.com', NULL, '$2y$10$0Y/NrYxkYZBBOkeAdC7SPOgfgyf1D0MXblAzM2eJutJmUW7Zlw.2S', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1610, 'Nurlaili', 'nur@gmail.com', NULL, '$2y$10$XbsviCz6usdmOPyFn1rL0eeCWWJsBHuorlygBqgQBZCcKRQu0amA6', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1611, 'Raditya Catur', 'catur@gmail.com', NULL, '$2y$10$S8KpuMIGTvq0.MEAetJQROuKlNq81IJUG4P8Tj5P7fRHBZ8KDtj72', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1612, 'Rizky Mubarok', 'rizky@gmail.com', NULL, '$2y$10$fawTSSK95sgppplDtlNjbe/J2athO3uksaYEwd1IATkvh/zeRCbuW', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1613, 'Rony', 'rony@gmail.com', NULL, '$2y$10$E16da3dTSZm8gS2aSViDyOnrGgUawI5YeLomhuuer2rA9vTuKCHzy', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1614, 'Yanu', 'yanu@gmail.com', NULL, '$2y$10$UuP4tdkUX0uQpAzAT9kKhuqkRlOpMD72mohOVhJ4dGhV5WZEI3sym', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1615, 'Qalbi', 'qalbi@gmail.com', NULL, '$2y$10$h00BRSxLwtUEESNaKUT9yuWEgrQ.GF8CBzo.FistQBGgQ55ddoOXi', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1616, 'Aria', 'aria@gmail.com', NULL, '$2y$10$G3J7MzgLNuzAIeIYBklQo.yMdpohwt3aOPjfw0q8YM7.4iYCDrm2q', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1617, 'Aida Millati', 'aida@gmail.com', NULL, '$2y$10$MY/LwOCqMjHvT3FLxoIPh.oEAkk3e.tU1T/jIXeqIYxtoujxXgPhi', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1618, 'Izzatun Nauly', 'izza@gmail.com', NULL, '$2y$10$BBxafRbQWZDsHQs2DdlIxOh2wRNPViJInlNf63tw/LsX37.mSCYKG', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1619, 'Yoby Ryaian', 'yoby@gmail.com', NULL, '$2y$10$trkekfPEwLopfnFe7Ks3NOOJGnIWzoftCCB37N9eTu11xzOVg/YFC', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1620, 'Hilda', 'hilda@gmail.com', NULL, '$2y$10$dcHr0ElS3cR3PliPxI7LyeRNAp9/AbAj7ViO8J9bsEiTTDd80Nyr2', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1621, 'Rabiatul', 'rabiatul@gmail.com', NULL, '$2y$10$0zB9LtzsJaGgZ83UzC4/Ae1ZJXbGTzAQbBQbwbY6h.hYW3sJHWpke', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1622, 'Muamar Qadafi', 'dafa@gmail.com', NULL, '$2y$10$bqVF8bmPox1okiq7Z3EMC.7KXYpR96GHKRAU6SaYS4obOZf.LEM0a', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1623, 'Nico', 'nico@gmail.com', NULL, '$2y$10$q8ycKzPlUtCVJMXPSBp0HuQ6sp0KOwO4E0nuJ420Kv.4OfPcMujh2', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1624, 'Dani', 'dani@gmail.com', NULL, '$2y$10$xDgTomx6m1Ne/ydAPCorj.F4IdP22mwKQbPDLvYHFUXVqCtch8KhK', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1625, 'Alfarizi', 'fariz@gmail.com', NULL, '$2y$10$xMm/2EKQnbHJDkK63o3TSeOd3Q.Gmwb5suZTAsDJzwzwSBHaV9qH2', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1626, 'Putri', 'putri@gmail.com', NULL, '$2y$10$qPCG.vsGaesHUzU.E.pfSO6BTwzybJ1n.HqZl..cCxH7lABPfT99C', 'student', NULL, 0, NULL, NULL, NULL, 'student', NULL),
(1627, 'Akhmad Ramadhani', 'rama@gmail.com', NULL, '$2y$10$C435A/bD7ZnW2V9zmmamyOvAyG2VL70yZ1Girazudf5BNQaHnBRSW', 'student', NULL, 1627, NULL, NULL, NULL, 'student', NULL),
(1628, 'Amelia Marshanda', 'amel@gmail.com', NULL, '$2y$10$Yc9eRNXsUUA5dmcNgxK8iesRfrVlHNrWZeMB6JgrTXiX4YfR9G3QS', 'student', NULL, 1628, NULL, NULL, NULL, 'student', NULL),
(1629, 'Moch Fajrul Fala', 'fajrul31@gmail.com', NULL, '$2y$10$Plg43WKCrPuyFLyNywChNOAoTdOpTjMMYQm2xkF.b36UwG5pIFeZa', 'student', NULL, 1629, NULL, NULL, NULL, 'student', NULL),
(1630, 'komang', 'komang14@gmail.com', NULL, '$2y$10$VyBtQFrpLNgOhLIx9R3LguD/4yS4F3uecIoq81u8..WjO6YgiUiMC', 'admin', NULL, 0, '2024-07-29 01:21:53', '2024-07-29 01:21:53', NULL, 'student', NULL),
(1631, 'riko', 'riko@gmail.com', NULL, '$2y$10$yp9TBxm.KbGnzs/c/irene4G2Ey/O21d3uAkAzvaMVf6OZ/zZZOem', 'admin', NULL, 0, '2025-02-11 03:55:18', '2025-02-11 03:55:18', NULL, 'student', NULL),
(1632, 'rika', 'rika@gmail.com', NULL, '$2y$10$srEEK5TMshS4BNcsAJnMJOsri25dASVt4YuDQODmllsVdRaSiEVUe', 'admin', NULL, 0, '2025-02-11 03:56:37', '2025-02-11 03:56:37', NULL, 'teacher', NULL),
(1633, 'ani', 'ani@gmail.com', NULL, '$2y$10$CzaOApsWjep.DuFlmRzSVu0gdx1Ap27GT1lPAMWaAQ/hMZKByCpHy', 'admin', NULL, 0, '2025-02-26 07:20:39', '2025-02-26 07:20:39', NULL, 'teacher', NULL),
(1634, 'doni', 'doni@gmail.com', NULL, '$2y$10$nLdGzLn0KlfTO1hjKarQS.ByHu2Avu9zkJ46jYOYsOxxAfwiO8ew2', 'admin', NULL, 0, '2025-03-05 03:38:37', '2025-03-05 03:38:37', NULL, 'student', NULL),
(1635, 'hani', 'hani@gmail.com', NULL, '$2y$10$g4jy4zmovDQozDqM4zW5EOYx.wcNz0/mka.YF1m/qgVUHUC.HGyeu', 'admin', NULL, 0, '2025-03-05 03:38:56', '2025-03-05 03:38:56', NULL, 'teacher', NULL),
(1639, 'Diko', 'diko@gmail.com', NULL, '$2y$10$MFnJ5Vty1iM987gCLEUYve7SKWmOQBidhslyjWGJnkBt6rHmKQRZC', 'admin', NULL, 0, '2025-03-10 05:56:45', '2025-03-10 05:56:45', NULL, 'student', NULL),
(1641, 'Viko', 'viko@gmail.com', NULL, '$2y$10$7C.o4KNn9wUXVM6ZRAANXuzKtRjUC0Bgq5x.KZICESFFQ3QRVplXO', 'admin', NULL, 0, '2025-03-23 05:53:51', '2025-03-23 05:53:51', NULL, 'student', NULL),
(1642, 'Niko', 'niko@gmail.com', NULL, '$2y$10$TzkAoZ.gr7sz94AHFFbp2.x6S7smE6DScnGuUKL7DaFHkW2wGG1Mu', 'admin', NULL, 0, '2025-04-02 03:16:21', '2025-04-02 03:16:21', NULL, 'student', NULL),
(1643, 'Tiko', 'tiko@gmail.com', NULL, '$2y$10$AD7xzpdJfcnOyHHHFu0LEuGvEqVPpcElfnJH77bcsp3vecfy.cRm6', 'admin', NULL, 0, '2025-04-09 01:22:30', '2025-04-09 01:22:30', NULL, 'student', NULL),
(1644, 'Andi', 'andi@gmail.com', NULL, '$2y$10$Ev/j0kryOr.j8qZvHGwxdeQxE8sHMhHhIOXAUE52xv8rf2IDLEBeW', 'admin', NULL, 0, '2025-04-09 01:23:16', '2025-04-09 01:23:16', NULL, 'student', NULL),
(1645, 'Mozy', 'mozy@gmail.com', NULL, '$2y$10$dxCCqFwEgtOlB0x.aG.F0e3DJXA/Eg4Oeq.78Wx74Ij.GeoiqUILu', 'admin', NULL, 0, '2025-04-10 03:19:04', '2025-04-10 03:19:04', NULL, 'student', NULL),
(1646, 'Vina', 'vina@gmail.com', NULL, '$2y$10$ZVroJyhMcKbmMKq2hzzg1OV6XaIMhMHdLiVQbKM0t9s5Cuy.u5Pqm', 'admin', NULL, 0, '2025-04-11 01:38:19', '2025-04-11 01:38:19', NULL, 'student', NULL),
(1647, 'Ciko', 'ciko@gmail.com', NULL, '$2y$10$CYHanYFl0aYjg5PBR3BVfuehAvpxNQROL9l/Ku79Ffodx5yHTcmbe', 'admin', NULL, 0, '2025-04-12 01:45:45', '2025-04-12 01:45:45', NULL, 'student', NULL),
(1648, 'Reki', 'reki@gmail.com', NULL, '$2y$10$RXEksAy7Cxw23v/ghmf07ucbje1IZ1H4CaipHhKerXLYNSXYUvEQy', 'admin', NULL, 0, '2025-04-14 07:06:54', '2025-04-14 07:06:54', NULL, 'student', NULL),
(1649, 'Indah', 'indah@gmail.com', NULL, '$2y$10$JLOREZmzlZMYwY55lGBcNOlzDRPZV46.B/19RHuoRUmbjzQSmvn9C', 'admin', NULL, 0, '2025-04-27 00:44:37', '2025-04-27 00:44:37', NULL, 'teacher', NULL),
(1650, 'Boni', 'boni@gmail.com', NULL, '$2y$10$bXCnl0PXCprTZZyiaGp84epIjGi607uRcjE.4WtlFVmNlTkAxE0L6', 'admin', NULL, 0, '2025-05-21 07:18:28', '2025-05-21 07:18:28', NULL, 'teacher', NULL),
(1651, 'Nita', 'nita@gmail.com', NULL, '$2y$10$M/ZVf9Rje4FaxOoquizHyulIJHQ/3U6jTwsmz9P8Z50OnFRpIkn2G', 'admin', NULL, 0, '2025-05-24 04:17:07', '2025-05-24 04:17:07', NULL, 'student', NULL),
(1652, 'Dinda', 'dinda@gmail.com', NULL, '$2y$10$1iJtLVASS1n8R.RgHUqep.Cc4kzYvv2nrKZrK5cfOz.wkAtKl1bNa', 'admin', NULL, 0, '2025-05-31 04:01:41', '2025-05-31 04:01:41', NULL, 'student', NULL),
(1655, 'Zeva', 'zeva@gmail.com', NULL, '$2y$10$BNun6fW6bH2ecf5svtTAAOga6Sn8wZs0I/0yoYj6ah7pNQ/UStAIW', 'admin', NULL, 0, '2025-06-01 05:45:45', '2025-06-01 05:45:45', NULL, 'student', NULL),
(1656, 'Nisa', 'nisa@gmail.com', NULL, '$2y$10$9v2Dm.P7qqm/PdHESLEU3eqeberbvdIUV8wcVsqwa3SbxgGfLER5G', 'admin', NULL, 0, '2025-06-13 12:20:02', '2025-06-13 12:20:02', NULL, 'student', NULL),
(1658, 'Sari', 'sari@gmail.com', NULL, '$2y$10$EMRxqWzhPc9jMuTiovtD5ujCiM5JsuayjKMtDHA63heXL/PR5gRa.', 'admin', NULL, 0, '2025-06-21 07:12:58', '2025-06-21 07:12:58', NULL, 'student', NULL),
(1659, 'Luna', 'luna@gmail.com', NULL, '$2y$10$tqLnptpJ3WPMDYfi/TFDYeYz3KBg62DiHT7oexH3CglM2T7640ggW', 'admin', NULL, 0, '2025-06-22 10:29:53', '2025-06-22 10:29:53', NULL, 'student', NULL),
(1660, 'Aubri', 'aubri@gmail.com', NULL, '$2y$10$Mm8jOemZcMuLUQyVB1J/Yet5o42zZ3PQjeYauRM63ywSTULTUpfbe', 'admin', NULL, 0, '2025-06-22 10:30:11', '2025-06-22 10:30:11', NULL, 'student', NULL),
(1661, 'Daffa', 'daffa@gmail.com', NULL, '$2y$10$26bOWGkDA4bkHdUWEZDULundcAY8pPEciX/Rl7CMgzzeQXJaB.kCu', 'admin', NULL, 0, '2025-06-22 10:30:40', '2025-06-22 10:30:40', NULL, 'student', NULL),
(1662, 'Kanaya', 'kanaya@gmail.com', NULL, '$2y$10$/v3Rbf6TJXbM5sNvyCKIPecZ53sAAjJc937UgaGzjKBbqVOcEcN1K', 'admin', NULL, 0, '2025-06-22 10:31:09', '2025-06-22 10:31:09', NULL, 'student', NULL),
(1663, 'Chusna', 'chusna@gmail.com', NULL, '$2y$10$l.kFJDhuIrR2jE02NIKfAunAaQTr2v6ukfmb2hW/I2RzD2SCoLevG', 'admin', NULL, 0, '2025-06-22 10:31:31', '2025-06-22 10:31:31', NULL, 'student', NULL),
(1664, 'Alyssa', 'alyssa@gmail.com', NULL, '$2y$10$Ye4MkUtzCwcFJflVMW7nSusm43P/wJIr/RivHxky0lxgEFwNbtlSK', 'admin', NULL, 0, '2025-06-22 10:31:56', '2025-06-22 10:31:56', NULL, 'student', NULL),
(1665, 'Mathilda', 'mathilda@gmail.com', NULL, '$2y$10$o5imb9t2Wx7EGNarIh/ccO34BMzemKoj0.YnWpYv8CIYtDO87hDVC', 'admin', NULL, 0, '2025-06-22 10:32:12', '2025-06-22 10:32:12', NULL, 'student', NULL),
(1666, 'Dhiwq', 'dhiwq@gmail.com', NULL, '$2y$10$aywIVvO3MOcKFcVXoeqz1.WOJYzSETZDfL.4hYjUyK/CRrXI4J6xq', 'admin', NULL, 0, '2025-06-22 10:32:50', '2025-06-22 10:32:50', NULL, 'student', NULL),
(1667, 'Ghaniyah', 'ghaniyah@gmail.com', NULL, '$2y$10$R1SggkHFlHFoZiwgnknuaebzP6auI8xw1c4PF3uZMu0RTP3fRbK6q', 'admin', NULL, 0, '2025-06-22 10:33:26', '2025-06-22 10:33:26', NULL, 'student', NULL),
(1668, 'Alkirom', 'alkirom@gmail.com', NULL, '$2y$10$O9FYlgz6OyjfAFrVLjEP4.knbsDevJKtIyaUCr2zftKLlBhYiirBC', 'admin', NULL, 0, '2025-06-22 10:33:37', '2025-06-22 10:33:37', NULL, 'student', NULL),
(1669, 'Intan', 'intan@gmail.com', NULL, '$2y$10$GrRAigj49Y.6Aab.p2NYpeY8TWPG0tFJTUZsTRc6wjr9RhGZ.s8VW', 'admin', NULL, 0, '2025-07-01 05:43:08', '2025-07-01 05:43:08', NULL, 'teacher', NULL),
(1670, 'roni', 'roni@gmail.com', NULL, '$2y$10$ixOBOy81fsDp8llstmGmzOw5Rp52Hd.hQzA1dEcFCEd2/zq0hsawS', 'admin', NULL, 0, '2025-07-01 05:44:39', '2025-07-01 05:44:39', NULL, 'student', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `literacy_answers`
--
ALTER TABLE `literacy_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `fk_literacy_answers_option` (`option_id`),
  ADD KEY `fk_answers_assessments` (`assessment_id`);

--
-- Indexes for table `literacy_assessments`
--
ALTER TABLE `literacy_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_literacy_assessments_user` (`user_id`);

--
-- Indexes for table `literacy_generated_texts`
--
ALTER TABLE `literacy_generated_texts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_material_id` (`material_id`);

--
-- Indexes for table `literacy_materials`
--
ALTER TABLE `literacy_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`user_id`);

--
-- Indexes for table `literacy_options`
--
ALTER TABLE `literacy_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `literacy_questions`
--
ALTER TABLE `literacy_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_material_id_2` (`material_id`);

--
-- Indexes for table `literacy_story_texts`
--
ALTER TABLE `literacy_story_texts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_material_id_3` (`material_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `literacy_answers`
--
ALTER TABLE `literacy_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=891;

--
-- AUTO_INCREMENT for table `literacy_assessments`
--
ALTER TABLE `literacy_assessments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=645;

--
-- AUTO_INCREMENT for table `literacy_generated_texts`
--
ALTER TABLE `literacy_generated_texts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `literacy_materials`
--
ALTER TABLE `literacy_materials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `literacy_options`
--
ALTER TABLE `literacy_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT for table `literacy_questions`
--
ALTER TABLE `literacy_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `literacy_story_texts`
--
ALTER TABLE `literacy_story_texts`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1671;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `literacy_answers`
--
ALTER TABLE `literacy_answers`
  ADD CONSTRAINT `fk_answers_assessments` FOREIGN KEY (`assessment_id`) REFERENCES `literacy_assessments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_answers_questions` FOREIGN KEY (`question_id`) REFERENCES `literacy_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_literacy_answers_option` FOREIGN KEY (`option_id`) REFERENCES `literacy_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `literacy_assessments`
--
ALTER TABLE `literacy_assessments`
  ADD CONSTRAINT `fk_literacy_assessments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `literacy_generated_texts`
--
ALTER TABLE `literacy_generated_texts`
  ADD CONSTRAINT `fk_material_id` FOREIGN KEY (`material_id`) REFERENCES `literacy_materials` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `literacy_materials`
--
ALTER TABLE `literacy_materials`
  ADD CONSTRAINT `fk_materials_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `literacy_options`
--
ALTER TABLE `literacy_options`
  ADD CONSTRAINT `literacy_options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `literacy_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `literacy_questions`
--
ALTER TABLE `literacy_questions`
  ADD CONSTRAINT `fk_material_id_2` FOREIGN KEY (`material_id`) REFERENCES `literacy_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `literacy_story_texts`
--
ALTER TABLE `literacy_story_texts`
  ADD CONSTRAINT `fk_material_id_3` FOREIGN KEY (`material_id`) REFERENCES `literacy_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

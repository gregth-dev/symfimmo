-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 05 juin 2020 à 22:53
-- Version du serveur :  8.0.18
-- Version de PHP :  7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `agenceimmo`
--

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200526214250', '2020-05-26 21:44:04'),
('20200526215228', '2020-05-26 21:52:39'),
('20200529134141', '2020-05-29 13:41:54'),
('20200529221558', '2020-05-29 22:16:17'),
('20200529230323', '2020-05-29 23:03:58'),
('20200529231054', '2020-05-29 23:11:03'),
('20200529231545', '2020-05-29 23:15:52'),
('20200601125307', '2020-06-01 12:53:37'),
('20200601130023', '2020-06-01 13:00:46'),
('20200601132313', '2020-06-01 13:23:20'),
('20200602002316', '2020-06-02 00:23:41');

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `option`
--

INSERT INTO `option` (`id`, `name`) VALUES
(1, 'Adapté PMR'),
(2, 'Ascenceur'),
(3, 'Balcon'),
(4, 'Garage');

-- --------------------------------------------------------

--
-- Structure de la table `picture`
--

DROP TABLE IF EXISTS `picture`;
CREATE TABLE IF NOT EXISTS `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_16DB4F89549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `picture`
--

INSERT INTO `picture` (`id`, `property_id`, `filename`) VALUES
(5, 110, '5ed50e70d519e176832711.jpg'),
(10, 110, '5ed592de5ea5d974883340.jpg'),
(12, 110, '5ed592de604c3067002564.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `surface` int(11) NOT NULL,
  `rooms` int(11) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `heat` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `title`, `description`, `surface`, `rooms`, `bedrooms`, `floor`, `price`, `heat`, `city`, `address`, `postal_code`, `sold`, `created_at`, `updated_at`, `lat`, `lng`) VALUES
(110, 'fuga assumenda nulla', 'Blanditiis qui doloremque totam possimus ut asperiores. Dolores aut ut quia sunt. Voluptas velit voluptatem et.', 193, 10, 2, 7, 299109, 3, 'Lauzerville', '1 Chemin de la Bergerie, Lauzerville, Occitanie, France', '31650', 0, '2020-05-27 04:39:22', '2020-05-30 16:03:39', 43.5564, 1.56603),
(111, 'hic sunt ea', 'At nihil sint magnam. Accusantium sint quia et accusantium quis enim modi qui. Itaque repellat molestiae aut qui veniam.', 236, 6, 3, 7, 897746, 3, 'Montpellier', '5 Avenue du Pont-Trinquât, Montpellier, Occitanie, France', '34070', 0, '2020-05-27 16:18:06', '2020-05-30 15:37:14', 43.5983, 3.8908),
(112, 'impedit iure temporibus', 'Id beatae saepe enim quasi voluptates. Deleniti perspiciatis voluptates dolorem. Et laudantium sed similique vel quo.', 338, 3, 3, 5, 348663, 0, 'Saint-Étienne-la-Thillaye', 'Chemin de la Barberie, Saint-Étienne-la-Thillaye, Normandie, France', '14950', 0, '2020-05-23 19:41:37', '2020-05-30 15:40:22', 49.2955, 0.118405),
(113, 'amet et accusantium', 'Assumenda ut quis et aliquam ipsam velit. Et hic distinctio cumque ut et. Deserunt nisi voluptate non et.', 164, 9, 4, 15, 172696, 1, 'Legendre', '344, rue Agnès Langlois\n71 133 Perez', '84 676', 0, '2020-05-24 22:24:44', '0000-00-00 00:00:00', 0, 0),
(114, 'voluptate provident autem', 'Consequatur in dolorem non dolor voluptatem. Distinctio neque non quia maxime quas. Consequatur voluptas quia aut quaerat et.', 271, 2, 2, 1, 545427, 3, 'OllivierBourg', '34, chemin Guillot26 990 Samson-les-Bains', '36053', 0, '2020-05-29 15:53:53', '2020-05-30 15:39:16', 0, 0),
(115, 'eligendi eos architecto', 'Et perferendis voluptates officiis pariatur expedita atque incidunt. Nam dolorem commodi incidunt rem. A beatae corporis ab voluptatem sunt et aspernatur dignissimos.', 195, 4, 4, 0, 146461, 3, 'Gautier', '45, rue de Georges\n63054 Nicolas', '19 831', 0, '2020-05-27 15:53:32', '0000-00-00 00:00:00', 0, 0),
(116, 'qui commodi totam', 'Ullam nostrum maiores ut in in non. Beatae repellat sed aut velit quia ut dolore magni. Odit ad rerum deleniti officia.', 133, 10, 1, 14, 997550, 1, 'Berger', 'impasse de Bodin\n15 036 Schmitt', '49 818', 0, '2020-05-24 11:28:53', '0000-00-00 00:00:00', 0, 0),
(117, 'similique quia consectetur', 'Quia ut minima dicta dolorem ea et deserunt. Dolore et hic perspiciatis deleniti. Soluta velit ullam in vitae enim aut.', 126, 4, 4, 5, 657969, 1, 'LombardVille', '827, avenue Catherine Petitjean89878 Bouvet-sur-Mer', '03365', 0, '2020-05-27 03:17:41', '2020-05-30 15:41:43', 0, 0),
(118, 'maiores rem ratione', 'Ipsa dolores ipsam dolores et sint voluptas est. Ab consequatur vel accusamus minus quos et. Iure consequatur expedita possimus corrupti quia omnis.', 194, 7, 3, 10, 390417, 3, 'Le Goff-sur-Ollivier', '14, place de Roussel\n56584 Gaillardboeuf', '34 241', 0, '2020-05-27 20:50:20', '0000-00-00 00:00:00', 0, 0),
(119, 'non ut aut', 'Dolor molestiae voluptatem id qui vel at. Quos quidem autem eos inventore. Quia aut et voluptatem sed.', 191, 5, 2, 15, 793399, 2, 'Julien-sur-Boyer', '54, rue Laurence Durand\n61 881 Rousseau', '57 296', 0, '2020-05-28 11:30:15', '0000-00-00 00:00:00', 0, 0),
(120, 'odit dolor accusamus', 'Et inventore facilis reiciendis asperiores laboriosam. Quo voluptas consectetur iste quia quis cum commodi. Explicabo earum voluptatem dolorum.', 152, 9, 2, 8, 319364, 2, 'Bonnet', '31, rue Marthe Ramos\n30 447 Michaud', '88674', 0, '2020-05-25 11:19:09', '0000-00-00 00:00:00', 0, 0),
(121, 'soluta occaecati nihil', 'Necessitatibus pariatur et voluptates quia culpa quod pariatur quod. Tenetur odio facilis accusantium et ea qui. Quae harum vero perferendis ut dolor.', 315, 7, 1, 11, 503251, 1, 'Berger', '6, avenue de Dupre\n24 067 Pons', '44 693', 0, '2020-05-25 03:32:39', '0000-00-00 00:00:00', 0, 0),
(122, 'porro vel iste', 'Sunt dolores doloremque velit alias similique suscipit perferendis. Autem magnam assumenda dolore quia quaerat. Non commodi vitae maiores suscipit sint.', 241, 9, 3, 14, 829959, 1, 'Maurice', 'rue Geneviève Carlier\n17 632 Maillotboeuf', '88192', 0, '2020-05-26 06:47:35', '0000-00-00 00:00:00', 0, 0),
(123, 'ducimus veniam odit', 'Molestiae sunt minima voluptates dolores culpa corporis. Ut reprehenderit repellendus ut omnis. Velit est ab et et expedita doloribus velit consequatur.', 238, 9, 3, 2, 579992, 2, 'Poulain', '88, rue Roger Faure\n88396 Boyer', '93 928', 0, '2020-05-24 01:29:29', '0000-00-00 00:00:00', 0, 0),
(124, 'reiciendis et autem', 'Alias eaque illum ut necessitatibus repudiandae sint dolorum libero. Provident corporis nisi nulla ut accusantium sed omnis. Illo aut vel quo ex non molestiae sed.', 241, 2, 2, 10, 863780, 0, 'Vallet', '2, avenue de Traore\n20 998 Blondeldan', '10385', 0, '2020-05-29 11:58:11', '0000-00-00 00:00:00', 0, 0),
(125, 'veniam vel animi', 'Qui unde quae ut. Error possimus molestiae cum quas ut. Iusto quo aut eius ducimus veniam et aut.', 180, 9, 2, 15, 287353, 2, 'Vasseur', '58, rue Blot\n89246 Teixeira', '73937', 0, '2020-05-27 18:00:02', '0000-00-00 00:00:00', 0, 0),
(126, 'doloremque minus eaque', 'Recusandae ut voluptas consequatur tenetur quisquam iusto natus. Doloremque dolorem corporis rerum consequatur sed. Aperiam enim et sapiente qui voluptatum provident.', 312, 9, 3, 11, 414422, 2, 'Besnard', '79, rue de Gay\n39039 Rodriguez-les-Bains', '27251', 0, '2020-05-26 01:16:42', '0000-00-00 00:00:00', 0, 0),
(127, 'et eius placeat', 'Temporibus sint quidem cum perspiciatis ut corporis ducimus dolorum. Quos nesciunt non praesentium et. Et est omnis et fuga voluptate qui.', 129, 6, 3, 1, 653729, 2, 'GeorgesBourg', '27, impasse Sébastien Tanguy\n39 525 Hamon-sur-Louis', '13 462', 0, '2020-05-29 07:14:53', '0000-00-00 00:00:00', 0, 0),
(128, 'minus iure fuga', 'Saepe reprehenderit reiciendis voluptate porro exercitationem error deleniti. Veniam asperiores aspernatur maiores perspiciatis. Enim eaque amet asperiores optio totam non eaque in.', 286, 9, 4, 6, 894513, 1, 'Collet', '725, impasse Rolland\n85 902 Lecoq-les-Bains', '41 108', 0, '2020-05-29 07:42:23', '0000-00-00 00:00:00', 0, 0),
(129, 'molestiae nam ad', 'Magni dignissimos alias recusandae qui cum. Quos quae doloribus provident magnam placeat qui. Qui esse excepturi hic sunt.', 137, 2, 4, 1, 325004, 2, 'Pages', '3, rue Valérie Lebrun\n99 627 Bourgeois-la-Forêt', '54 346', 0, '2020-05-28 15:35:44', '0000-00-00 00:00:00', 0, 0),
(130, 'totam facere voluptate', 'Consequatur eos ut consequuntur maxime et illo ea ad. Eaque in rerum id et. Provident aut reiciendis sit totam sequi ducimus.', 263, 10, 4, 11, 398263, 3, 'Lambert', '30, boulevard Garcia\n16 197 PagesVille', '79 719', 0, '2020-05-26 01:54:19', '0000-00-00 00:00:00', 0, 0),
(131, 'sapiente qui aut', 'Eveniet qui dolorum sapiente illo. Reprehenderit ex numquam nostrum iure. Voluptatem velit qui molestiae aut quia minima dolorem.', 234, 3, 1, 15, 402581, 2, 'Gomez', '994, avenue Frédérique Rossi\n59293 Perret', '66 496', 0, '2020-05-26 20:57:17', '0000-00-00 00:00:00', 0, 0),
(132, 'quia architecto et', 'Et asperiores aut quibusdam voluptas quos aspernatur. Ducimus error doloremque similique eos esse sequi magni sint. Assumenda eligendi dolorum commodi fugiat natus voluptate voluptate.', 266, 4, 1, 0, 407019, 2, 'Blanchard', '86, rue Océane Rodriguez\n07 639 Grenier', '81662', 0, '2020-05-25 04:37:19', '0000-00-00 00:00:00', 0, 0),
(133, 'aut sit iure', 'Alias reiciendis hic sapiente excepturi perferendis. Voluptas reprehenderit sapiente in. Sint quo dignissimos fugiat voluptates qui sed.', 335, 3, 4, 10, 62395, 1, 'Mendes', '52, impasse Pasquier\n24978 Lamy-sur-Moreno', '15 316', 0, '2020-05-29 11:41:22', '0000-00-00 00:00:00', 0, 0),
(134, 'in et qui', 'Eaque minima quos voluptatum qui a fugit. Molestiae qui beatae officiis magnam officia. Et quo qui a neque et.', 297, 5, 4, 5, 718198, 0, 'Roussetnec', '52, boulevard Nicole Guilbert\n19951 Robin', '92 866', 0, '2020-05-23 23:36:00', '0000-00-00 00:00:00', 0, 0),
(135, 'eos nobis asperiores', 'Ut et sunt adipisci voluptatem. Quia doloremque repudiandae et. Consequatur corporis magni earum doloremque ratione nostrum.', 95, 2, 3, 1, 718777, 3, 'Muller-sur-Benard', '34, rue Juliette Bonneau\n93057 Gonzalez-la-Forêt', '45 387', 0, '2020-05-25 02:07:36', '0000-00-00 00:00:00', 0, 0),
(136, 'dolores est labore', 'Dicta inventore voluptas enim pariatur est deserunt placeat. Ipsum aut provident a ut eos aut. Quo maiores velit beatae pariatur quidem aliquam expedita.', 198, 10, 1, 10, 246993, 1, 'Delorme-les-Bains', '405, place de Benoit\n10 494 Lopes', '97009', 0, '2020-05-25 12:37:45', '0000-00-00 00:00:00', 0, 0),
(137, 'et est laboriosam', 'Illo ad aut ea ipsam est ipsa et recusandae. Id minus est voluptatibus iusto. Consequuntur assumenda aliquam laudantium sed iusto.', 49, 5, 3, 3, 744721, 3, 'Chauvet', 'impasse Vallet\n41240 Le Goff', '59959', 0, '2020-05-27 03:38:30', '0000-00-00 00:00:00', 0, 0),
(138, 'possimus adipisci enim', 'Eveniet est ipsam culpa mollitia repudiandae. Laborum eius animi voluptas aut voluptatem sunt. Sit facilis mollitia recusandae ex sed quibusdam et.', 224, 7, 2, 12, 358645, 2, 'Daniel-les-Bains', '394, boulevard Bertrand Gaillard\n40952 Pereiraboeuf', '57 211', 0, '2020-05-27 09:58:30', '0000-00-00 00:00:00', 0, 0),
(139, 'qui modi atque', 'Assumenda architecto nihil tenetur. Et temporibus sit dolorem expedita dolorem quos debitis. Eum dignissimos voluptatum sint voluptatum aspernatur iure cumque.', 157, 6, 1, 1, 171853, 0, 'LebonVille', '44, avenue Robert Sanchez\n80794 Ferreira', '26353', 0, '2020-05-25 09:39:56', '0000-00-00 00:00:00', 0, 0),
(140, 'pariatur aut nihil', 'Omnis ut et deleniti deserunt iusto qui iste. Quia officia ipsam laudantium deserunt. Eos minus deserunt alias voluptatem at distinctio.', 170, 4, 1, 14, 720008, 3, 'Duhamel', '74, rue de Delmas\n69537 Klein', '69 234', 0, '2020-05-26 16:52:35', '0000-00-00 00:00:00', 0, 0),
(141, 'officia expedita unde', 'Qui eum accusantium vel voluptatem minus. Est doloribus aliquam nobis quas ut dolor nisi. Similique fugiat quidem optio tempore.', 112, 7, 2, 2, 524249, 1, 'Laurent-les-Bains', '33, boulevard de Guillou\n86409 VerdierVille', '74846', 0, '2020-05-27 20:42:22', '0000-00-00 00:00:00', 0, 0),
(142, 'ipsum veritatis eos', 'Ullam ipsa reprehenderit accusamus dolores. Ut totam qui voluptatem eius facere. Nihil omnis illo et numquam facilis omnis.', 201, 9, 3, 12, 598011, 0, 'Denis', '34, boulevard de Roussel\n84658 Marin', '95 008', 0, '2020-05-29 16:22:36', '0000-00-00 00:00:00', 0, 0),
(143, 'exercitationem impedit ab', 'Possimus et et nihil rerum rerum. Et deleniti aut fuga at eius est consequatur delectus. Minus laudantium assumenda dolores quo.', 323, 9, 1, 10, 256382, 0, 'Charrierboeuf', '43, impasse de Masse\n91780 PerrotBourg', '82970', 0, '2020-05-29 00:53:19', '0000-00-00 00:00:00', 0, 0),
(144, 'animi occaecati sunt', 'Pariatur a sit rerum eum nisi. Aut accusantium praesentium et rerum. Aut culpa voluptatem ad dolorum laboriosam qui culpa.', 129, 3, 1, 7, 627372, 0, 'Hamon', '38, rue Giraud\n84017 Martins', '45408', 0, '2020-05-26 02:09:38', '0000-00-00 00:00:00', 0, 0),
(145, 'quam et quis', 'Omnis ullam eos consequatur nihil a numquam illum. Praesentium incidunt necessitatibus ea est. Corporis iste officia nulla nihil et veritatis distinctio.', 332, 2, 3, 11, 673089, 0, 'Prevost', 'impasse Josette Lefebvre\n01 456 Fabre-sur-Fleury', '28 460', 0, '2020-05-29 07:03:23', '0000-00-00 00:00:00', 0, 0),
(146, 'cumque assumenda quasi', 'Quis doloribus perspiciatis officia nam assumenda dolore atque provident. Molestiae reprehenderit cum sint. Quo expedita ut aut facere voluptate.', 237, 10, 2, 3, 756447, 3, 'Tessier-sur-Barbier', '6, chemin Arthur Chauveau\n83 766 Lefevre', '66965', 0, '2020-05-24 06:45:34', '0000-00-00 00:00:00', 0, 0),
(147, 'eos aspernatur laborum', 'Rerum impedit aut explicabo voluptatem. Quod vel ea accusantium culpa animi sunt quis voluptas. Dolore dignissimos adipisci repellat maxime nobis.', 314, 4, 1, 3, 147610, 3, 'Arnaudnec', '62, chemin Noel\n11 760 Leroux', '94888', 0, '2020-05-28 14:00:08', '0000-00-00 00:00:00', 0, 0),
(148, 'id optio dolorum', 'Eum modi asperiores tenetur id vel. Ea rerum in mollitia voluptate fugiat maxime et possimus. Ipsum commodi qui velit necessitatibus quo numquam.', 247, 9, 1, 15, 835264, 1, 'Dubois-sur-Vallee', '89, boulevard Tanguy\n60869 Grenier', '94797', 0, '2020-05-28 01:01:59', '0000-00-00 00:00:00', 0, 0),
(149, 'ut aperiam eum', 'Nemo repellendus qui similique soluta alias. Porro laboriosam quisquam repellendus explicabo commodi. Quaerat quo voluptatum quisquam quod ipsa dolore.', 326, 5, 2, 13, 743631, 0, 'Guyon', '41, place Marc Bailly\n04739 Lopes-sur-Paul', '43 587', 0, '2020-05-28 03:15:40', '0000-00-00 00:00:00', 0, 0),
(150, 'distinctio magnam repellendus', 'Et ut expedita velit quas perferendis. Accusantium blanditiis ipsum numquam. Et culpa ut quis exercitationem molestiae.', 335, 10, 4, 3, 783882, 0, 'Caron-sur-Weber', '11, impasse Sabine Brun\n10 940 DelaunayVille', '01686', 0, '2020-05-24 01:59:30', '0000-00-00 00:00:00', 0, 0),
(151, 'dolores ab perspiciatis', 'Earum distinctio rerum quibusdam ut laboriosam aut sit qui. Earum id est ut exercitationem. Dolor saepe non quis at et unde porro.', 222, 4, 3, 14, 688660, 3, 'Blanchard', '94, avenue Gérard Gimenez\n25 248 Albert-sur-Ramos', '42621', 0, '2020-05-29 04:09:14', '0000-00-00 00:00:00', 0, 0),
(152, 'quibusdam aut ut', 'Explicabo numquam in voluptas fugit officiis vel. Et accusamus quae nostrum a. Atque id in id non reprehenderit sapiente placeat ut.', 325, 8, 3, 15, 957418, 2, 'Chauvet-sur-Mer', '309, avenue de Arnaud\n65914 Labbe', '82173', 0, '2020-05-28 23:51:10', '0000-00-00 00:00:00', 0, 0),
(153, 'sed et dolores', 'Ratione asperiores quaerat impedit ut quo et. Consequuntur autem ipsa rerum ipsam sequi soluta voluptas est. Libero est sed maxime nihil quia rerum sunt itaque.', 331, 7, 3, 7, 117941, 2, 'Ribeiro-sur-Mer', '786, chemin Sophie Etienne\n62941 Pinto', '43776', 0, '2020-05-24 12:03:50', '0000-00-00 00:00:00', 0, 0),
(154, 'nostrum quod voluptatum', 'Sint tenetur eum eveniet sed quo itaque non. Et consequatur ea sed sint odio temporibus tempora. Non sint ipsum in aut veritatis.', 89, 3, 2, 2, 162367, 0, 'Marechal', '59, rue Giraud\n04 701 Rodrigues-sur-Mer', '06918', 0, '2020-05-29 15:47:50', '0000-00-00 00:00:00', 0, 0),
(155, 'molestias doloremque debitis', 'Qui eum voluptatem officia vel. Ut sit dolores dolorem repellat officiis repellendus explicabo id. Qui cumque labore harum repellat ut perferendis iure.', 188, 9, 2, 3, 530216, 3, 'Pierre', '434, place Faivre\n75 495 ClercVille', '45125', 0, '2020-05-25 07:29:51', '0000-00-00 00:00:00', 0, 0),
(156, 'soluta assumenda laudantium', 'Sit libero animi maxime commodi voluptatem praesentium. Et quia deserunt aut natus numquam nihil nostrum. Rerum doloribus nisi possimus est consequuntur consectetur.', 85, 6, 2, 5, 446932, 3, 'Gaillarddan', '7, impasse de Charrier\n48 677 Barbier', '73806', 0, '2020-05-26 18:26:48', '0000-00-00 00:00:00', 0, 0),
(157, 'vel est unde', 'Perspiciatis voluptatum enim dolor rerum eaque ratione. Nostrum eum totam nulla enim incidunt. Id accusantium amet molestias fuga repudiandae.', 335, 1, 4, 10, 84275, 3, 'Besson', 'avenue Laetitia Le Roux\n29886 Guibert-sur-Guillot', '35 967', 0, '2020-05-24 03:43:20', '0000-00-00 00:00:00', 0, 0),
(158, 'eum sint quo', 'Assumenda nostrum iusto repellendus mollitia sit. Ex ut optio aut ad dicta molestiae adipisci. Hic itaque sed molestiae.', 235, 1, 1, 15, 987768, 1, 'Barbe', 'place Margot Besnard\n21 552 Sauvagedan', '30964', 0, '2020-05-28 14:34:39', '0000-00-00 00:00:00', 0, 0),
(159, 'aut consectetur numquam', 'Minus deserunt aliquam voluptatibus sequi est eaque dolor. Dolore quo ratione nostrum nam consequatur recusandae qui. Facere labore eveniet assumenda optio facilis.', 46, 8, 4, 9, 648145, 3, 'Charles-la-Forêt', '718, place de Perrin\n72 679 Chretien', '44302', 0, '2020-05-27 13:17:55', '0000-00-00 00:00:00', 0, 0),
(160, 'voluptatum quibusdam aspernatur', 'Modi porro sit ea ipsam quas. Sit aut praesentium autem architecto. Praesentium quos omnis iusto sed saepe.', 21, 5, 2, 2, 292295, 0, 'Wagner-sur-Laporte', '4, impasse de Couturier\n13225 Devaux', '93 074', 0, '2020-05-27 18:16:59', '0000-00-00 00:00:00', 0, 0),
(161, 'ipsa modi qui', 'Ut est id fugit amet deleniti quasi harum. Quod accusantium rerum fuga dicta sed est quia. Non vitae sit corporis sapiente ullam occaecati minus.', 294, 7, 1, 5, 768021, 2, 'Guyon', 'boulevard de Valette\n25189 Pons-sur-Mary', '50 035', 0, '2020-05-29 06:22:41', '0000-00-00 00:00:00', 0, 0),
(162, 'aperiam aspernatur provident', 'Quia deserunt nemo corrupti qui temporibus fugit expedita quas. Magnam delectus itaque enim totam. Quas consequatur quam illum aut tempore.', 234, 5, 4, 1, 541486, 3, 'Barthelemyboeuf', '46, boulevard Nath Riviere\n56 794 BernardBourg', '57826', 0, '2020-05-27 03:34:27', '0000-00-00 00:00:00', 0, 0),
(163, 'quo qui et', 'Dolor qui eveniet quia est. Dolore natus illum eum quas explicabo et perspiciatis. Magni ut quod et enim debitis.', 248, 8, 2, 14, 349194, 2, 'Robin-les-Bains', '88, rue Gilbert Renault\n48 442 RibeiroVille', '64 454', 0, '2020-05-25 19:30:20', '0000-00-00 00:00:00', 0, 0),
(164, 'quia totam iste', 'Aspernatur sint cupiditate quis ea sed voluptatibus quisquam. Mollitia voluptas commodi enim architecto aliquam voluptatibus nemo. Eveniet dolorem ad adipisci aut voluptatem beatae eos.', 139, 5, 1, 2, 603460, 2, 'Moreno-la-Forêt', '11, avenue de Royer\n53 930 Faivre-sur-Guyon', '93 521', 0, '2020-05-26 08:46:30', '0000-00-00 00:00:00', 0, 0),
(165, 'vero et aut', 'Similique voluptatem qui delectus neque quaerat voluptatem a. Aut ut et qui modi expedita sit. Vero placeat distinctio voluptas totam aliquid magni.', 94, 1, 3, 9, 574355, 0, 'RiviereBourg', '16, avenue de Cousin\n48 294 Hoarau-sur-Barbier', '96166', 0, '2020-05-28 23:02:19', '0000-00-00 00:00:00', 0, 0),
(166, 'vel est velit', 'Quos ipsam accusantium sit sed odit alias eos quisquam. Non eum perferendis velit et amet eos quae sequi. Dolore alias et illum possimus.', 264, 4, 2, 15, 317996, 1, 'Humbert', '4, rue Martine Labbe\n95 605 Fleury', '20 106', 0, '2020-05-27 02:56:01', '0000-00-00 00:00:00', 0, 0),
(167, 'molestiae et impedit', 'In unde vel quam incidunt cumque laudantium. Nihil sit ullam facilis odio eum laboriosam dicta qui. At aperiam eligendi rem dolores eum explicabo.', 65, 4, 4, 9, 848993, 1, 'Marty', '11, rue de Camus\n49930 Langlois-la-Forêt', '29147', 0, '2020-05-25 03:38:31', '0000-00-00 00:00:00', 0, 0),
(168, 'sed quia rerum', 'Saepe saepe sint voluptatem. Alias voluptate a sit laudantium. Voluptatem est assumenda iusto ut.', 302, 7, 1, 15, 459039, 3, 'Nguyendan', '93, rue de Boulay\n22 556 Loiseaudan', '92174', 0, '2020-05-27 02:05:23', '0000-00-00 00:00:00', 0, 0),
(169, 'sunt voluptatem consectetur', 'Quo praesentium rem consequuntur est eos officia quos quae. Enim id tempora quasi debitis officiis eos. Porro ad deleniti quia est ut animi voluptas doloremque.', 324, 4, 1, 8, 364582, 0, 'Becker', '7, impasse Dupre\n10 984 Martineznec', '39 753', 0, '2020-05-29 12:33:29', '0000-00-00 00:00:00', 0, 0),
(170, 'delectus impedit minima', 'Modi hic vero laudantium voluptas ex non. Incidunt labore aliquam non placeat iste voluptas et. Ea cumque exercitationem ea.', 266, 6, 4, 6, 669218, 2, 'Normand', '69, boulevard de Dubois\n45439 Pottier-sur-Bodin', '76617', 0, '2020-05-27 02:14:02', '0000-00-00 00:00:00', 0, 0),
(171, 'asperiores reprehenderit aut', 'Est itaque id modi illum. Architecto quo quia voluptatem natus magni officiis. A tempora ipsa ea voluptate placeat doloribus.', 168, 3, 4, 0, 182988, 0, 'Duhamel-les-Bains', '79, boulevard de Auger\n00 812 Marques-sur-Parent', '08 406', 0, '2020-05-24 22:11:59', '0000-00-00 00:00:00', 0, 0),
(172, 'qui corrupti adipisci', 'Quis et debitis accusantium veniam autem repudiandae rem. Vitae ut perspiciatis sed. Ut dignissimos quam itaque vel aut excepturi.', 170, 1, 1, 0, 782005, 3, 'Petitjean-sur-Pereira', '93, boulevard Jules Humbert\n97 898 Benard', '72 033', 0, '2020-05-29 14:29:30', '0000-00-00 00:00:00', 0, 0),
(173, 'ducimus neque ea', 'In provident iste aut tenetur ea. Voluptatibus vitae recusandae excepturi dolor laborum enim. Et architecto ducimus ipsum repellat qui dignissimos rerum aut.', 235, 8, 4, 2, 729117, 0, 'VasseurVille', 'place Martins\n18 104 Bonneau-les-Bains', '38 252', 0, '2020-05-25 06:05:11', '0000-00-00 00:00:00', 0, 0),
(174, 'molestiae ab possimus', 'Voluptatem minus non enim eum autem quod. Cumque et dolorem ut cupiditate cupiditate exercitationem. Voluptas laboriosam consequatur aspernatur harum velit aspernatur.', 177, 7, 2, 6, 372576, 1, 'Brun', '83, boulevard de Vidal\n50 149 GuichardBourg', '43017', 0, '2020-05-28 15:10:54', '0000-00-00 00:00:00', 0, 0),
(175, 'soluta quasi deserunt', 'Quos accusantium dolor quibusdam sit animi. Ullam enim qui praesentium omnis quidem rerum. Quia pariatur repudiandae eligendi sit doloremque.', 340, 6, 2, 14, 477230, 2, 'Roche', '11, rue de Lefevre\n40 051 Perez', '49 944', 0, '2020-05-25 00:58:17', '0000-00-00 00:00:00', 0, 0),
(176, 'aspernatur temporibus ut', 'Alias rerum omnis recusandae et ex libero aspernatur. Quaerat adipisci consectetur soluta nobis vel eius. Laboriosam reprehenderit ratione aliquam iure.', 227, 9, 2, 8, 883153, 3, 'OlivierBourg', '14, rue Blin\n89567 Allainboeuf', '92745', 0, '2020-05-24 06:20:22', '0000-00-00 00:00:00', 0, 0),
(177, 'earum earum dicta', 'Perspiciatis pariatur sed tempora. Et qui placeat et quidem laboriosam. Omnis tenetur veniam optio porro ex est.', 270, 5, 4, 8, 212027, 2, 'Reynaud', 'rue Bourgeois\n95376 Leclercq-sur-Mer', '70 965', 0, '2020-05-26 09:05:44', '0000-00-00 00:00:00', 0, 0),
(178, 'magni expedita molestias', 'Dolor et vel ut porro ut occaecati. Libero doloremque quod possimus iusto eos doloremque. Sed aperiam exercitationem blanditiis.', 144, 4, 3, 8, 731432, 1, 'Jacques-sur-Gregoire', '4, boulevard Pénélope Leblanc\n32 751 Brunelboeuf', '43 476', 0, '2020-05-28 17:46:26', '0000-00-00 00:00:00', 0, 0),
(179, 'cupiditate ea deleniti', 'Itaque necessitatibus debitis deleniti aliquid animi ut ab. Dignissimos expedita non asperiores eos eos corrupti sunt. Iure numquam nulla assumenda voluptate quia aut fuga.', 49, 3, 3, 0, 746908, 2, 'Joseph', '35, rue de Barbier\n27 210 Mahe', '11638', 0, '2020-05-24 12:48:35', '0000-00-00 00:00:00', 0, 0),
(180, 'voluptas blanditiis et', 'Possimus ipsam itaque quam quis facilis voluptate. Nisi iste eos voluptatum et omnis. Ipsa eos excepturi quod facere.', 236, 4, 1, 3, 454158, 1, 'Chevalier', '74, rue Mendes\n39 338 Bodin', '76 692', 0, '2020-05-25 23:33:50', '0000-00-00 00:00:00', 0, 0),
(181, 'et cumque est', 'Harum dolores voluptas quo corrupti quam. Autem iusto vel saepe omnis et quis aut. Tempore accusantium dolor in qui.', 209, 10, 4, 14, 972041, 3, 'Ferrand', '4, rue Neveu\n61 937 Brunelboeuf', '61227', 0, '2020-05-26 03:28:48', '0000-00-00 00:00:00', 0, 0),
(182, 'odio rerum ipsum', 'Sed nemo nostrum debitis. Sequi et tempore aliquid adipisci. Illo repellat quia veritatis soluta.', 96, 10, 1, 7, 636945, 3, 'Simon', '27, rue Aubry\n69 934 Ferreiranec', '45 360', 0, '2020-05-26 20:16:43', '0000-00-00 00:00:00', 0, 0),
(183, 'ratione sint quod', 'Delectus aut ut non. Fugit quia commodi ut id nesciunt accusamus. Amet velit ad expedita natus error distinctio voluptatem.', 227, 6, 3, 14, 379752, 3, 'Gay', '27, rue Le Goff\n33 088 Lucasnec', '32126', 0, '2020-05-24 21:21:22', '0000-00-00 00:00:00', 0, 0),
(184, 'quisquam vero eos', 'Earum sequi nam dolorem ut. Quaerat fugit quis illo id quia aliquam possimus. Autem voluptatem laboriosam neque est quibusdam temporibus eveniet.', 77, 8, 2, 10, 741611, 3, 'Pineau', '1, place Buisson\n31 710 Henry', '42 159', 0, '2020-05-24 18:47:39', '0000-00-00 00:00:00', 0, 0),
(185, 'sunt debitis eum', 'Illum expedita sapiente et consequuntur at sint. Amet aut deserunt omnis soluta molestiae. Magnam totam earum accusamus nisi sunt autem accusantium.', 146, 3, 3, 13, 605701, 1, 'Guilbert', '975, rue de Carre\n77872 Robin-sur-Ollivier', '12 280', 0, '2020-05-27 07:04:14', '0000-00-00 00:00:00', 0, 0),
(186, 'deserunt dicta voluptatem', 'Ut eius mollitia suscipit consectetur. Molestiae pariatur vitae ad aut quis. Omnis expedita ad tempora sunt qui est.', 162, 3, 3, 13, 424244, 3, 'Monnier', '95, place de Hoareau\n74612 Colin', '95554', 0, '2020-05-28 16:15:17', '0000-00-00 00:00:00', 0, 0),
(187, 'nostrum ea ex', 'Expedita placeat adipisci vel ipsum. Minima dolorem sequi est quis earum. Aut deserunt accusamus soluta perferendis aspernatur consequuntur.', 29, 8, 2, 9, 425265, 1, 'Lebon-la-Forêt', '25, impasse Andrée Ramos\n91 048 Fernandezdan', '57 332', 0, '2020-05-29 12:24:51', '0000-00-00 00:00:00', 0, 0),
(188, 'suscipit occaecati doloribus', 'Omnis fugiat doloremque officia. Dolorem quisquam necessitatibus occaecati atque impedit sed. Iste et ut magnam illum quasi provident quis.', 306, 6, 1, 8, 876061, 0, 'Cohen-la-Forêt', '6, rue Roussel\n88 115 Delorme', '56588', 0, '2020-05-28 05:38:30', '0000-00-00 00:00:00', 0, 0),
(189, 'eum et enim', 'Temporibus veritatis rem debitis autem. Reprehenderit ex aut voluptatem veritatis ab. Qui sit porro blanditiis ut quas officia dolore.', 211, 6, 3, 15, 849228, 0, 'Le Gall', '9, place Lebrun\n86 789 Diallo-sur-Breton', '45430', 0, '2020-05-28 15:04:08', '0000-00-00 00:00:00', 0, 0),
(190, 'vel nihil quia', 'Sunt provident suscipit doloribus corrupti omnis voluptas quasi. Qui id incidunt facere similique asperiores quos porro expedita. Dolores aut non velit quia temporibus autem.', 224, 5, 4, 11, 374047, 1, 'Rocher', 'impasse de Lebreton\n70018 Clerc', '69 962', 0, '2020-05-29 10:22:42', '0000-00-00 00:00:00', 0, 0),
(191, 'neque et quaerat', 'Ab velit voluptatem omnis voluptatem velit. Quo quas nihil est omnis beatae minima. Eos sapiente id porro veniam repudiandae voluptates esse.', 259, 7, 1, 0, 143542, 1, 'Remy', '694, rue de Jacquet\n14787 Seguinboeuf', '23 124', 0, '2020-05-24 16:07:37', '0000-00-00 00:00:00', 0, 0),
(192, 'veniam odio sed', 'Voluptatem dolorem tempora sed rerum maxime ut. Necessitatibus culpa vel labore illum quo nihil magnam eveniet. Inventore dolorem amet aut sed iure.', 124, 6, 3, 11, 157932, 2, 'Fauredan', '40, avenue Frédérique Moreno\n17 471 Chretien', '26325', 0, '2020-05-25 19:07:03', '0000-00-00 00:00:00', 0, 0),
(193, 'blanditiis qui minus', 'Itaque eum itaque eaque qui doloribus qui maxime ea. In sit tenetur maxime veniam aut inventore illo eius. Illum eum quasi eaque nam.', 134, 8, 3, 12, 709667, 0, 'Denis', '6, boulevard Alix Lemaire\n83 144 Boucher', '97 014', 0, '2020-05-24 23:13:23', '0000-00-00 00:00:00', 0, 0),
(194, 'qui earum qui', 'Veritatis aliquid voluptatem tenetur blanditiis aut. Assumenda necessitatibus illo earum quisquam ipsum beatae. Repudiandae maiores vitae ducimus.', 68, 4, 2, 1, 52358, 2, 'Neveu', '63, impasse de Lucas\n31487 Lopes', '63 805', 0, '2020-05-25 01:01:15', '0000-00-00 00:00:00', 0, 0),
(195, 'omnis praesentium est', 'Molestias necessitatibus et esse doloremque temporibus praesentium aut. Omnis nostrum ea soluta quaerat dolor veniam. Sed et tempore aspernatur.', 86, 8, 3, 8, 906780, 0, 'Petit-sur-Pasquier', '48, rue de Delattre\n97289 Lucasnec', '31516', 0, '2020-05-27 22:51:28', '0000-00-00 00:00:00', 0, 0),
(196, 'et deleniti magni', 'Error doloribus consequuntur eum voluptatem ut voluptatem neque. Repellendus qui ut aut occaecati veniam dolor harum. Ut excepturi hic rerum dolore nobis exercitationem delectus.', 279, 7, 2, 5, 220953, 3, 'Guyot', '84, rue de Mallet\n52 439 Dufour', '67 581', 0, '2020-05-27 00:46:13', '0000-00-00 00:00:00', 0, 0),
(197, 'qui esse eos', 'Nesciunt eius hic asperiores voluptas. Vitae neque omnis possimus maxime cupiditate aut. Et velit in unde suscipit est.', 252, 9, 3, 11, 350081, 3, 'Lefevre', '199, avenue Clement\n47458 Georges-sur-Da Silva', '54677', 0, '2020-05-27 01:45:47', '0000-00-00 00:00:00', 0, 0),
(198, 'repudiandae et dolor', 'Voluptatem delectus accusamus nihil. Ad optio qui ipsam rerum. Eligendi quia est dolor qui eum.', 238, 3, 4, 8, 130581, 3, 'Bodin', '71, place de Blondel\n62 519 FaureVille', '35 332', 0, '2020-05-25 14:31:38', '0000-00-00 00:00:00', 0, 0),
(199, 'doloremque reprehenderit similique', 'Similique inventore nesciunt architecto quibusdam qui quis porro eaque. Libero perferendis voluptate sint. Necessitatibus veritatis quas sit illo aliquam adipisci.', 92, 8, 3, 4, 230380, 1, 'Clement', '876, boulevard Alice Collet\n72 793 Pinto', '38944', 0, '2020-05-26 14:55:30', '0000-00-00 00:00:00', 0, 0),
(200, 'non non sit', 'Inventore et qui eos molestiae nam sunt. Sint omnis voluptatem tempore officia. Accusamus sapiente laudantium odio dolorum sed consectetur.', 331, 7, 3, 10, 565055, 2, 'Duhamel', '815, chemin de Andre\n13 400 Potier', '93287', 0, '2020-05-24 09:31:04', '0000-00-00 00:00:00', 0, 0),
(201, 'omnis rem minima', 'Ut aperiam minus quia qui doloremque. Optio est dicta provident quod iste. Et a assumenda necessitatibus repellendus autem.', 77, 3, 3, 2, 958988, 0, 'Auger', 'place de Ramos\n52353 ChevalierBourg', '13149', 0, '2020-05-29 00:24:35', '0000-00-00 00:00:00', 0, 0),
(202, 'consequatur impedit sunt', 'Tempora cumque ipsum sed harum. Delectus eveniet porro aut culpa. Maiores sed velit fugit assumenda omnis et.', 204, 7, 1, 8, 865467, 0, 'Gillet', '37, boulevard Catherine Dos Santos\n55730 De Oliveira-sur-Mer', '79 950', 0, '2020-05-26 21:44:37', '0000-00-00 00:00:00', 0, 0),
(203, 'voluptatem est quae', 'Aut quia quo cumque voluptatibus commodi reprehenderit. Ducimus totam et optio itaque aliquam. Distinctio non quasi et velit iure itaque fugiat.', 246, 10, 3, 1, 562350, 2, 'Guibert', '256, avenue Blot\n77 818 Vincent', '55873', 0, '2020-05-25 20:23:18', '0000-00-00 00:00:00', 0, 0),
(204, 'quam quia perspiciatis', 'Quae quam odio quia fugiat et ab molestias. Quidem aspernatur temporibus animi sed natus. Vel numquam in perspiciatis id voluptatem vitae ut.', 66, 7, 2, 14, 919820, 1, 'CouturierBourg', '12, avenue Marion\n70 388 Lagarde', '03628', 0, '2020-05-27 04:03:27', '0000-00-00 00:00:00', 0, 0),
(205, 'molestiae ut unde', 'Non repellendus voluptatem aut porro. Non minus adipisci dolores dignissimos. Consequatur doloremque fugit est.', 303, 2, 3, 10, 58199, 3, 'Delannoynec', '9, boulevard Blot\n62 774 Martins', '01 808', 0, '2020-05-27 03:23:09', '0000-00-00 00:00:00', 0, 0),
(206, 'ad consequatur minima', 'Fugit nulla fuga quidem at occaecati itaque. Nulla sed aliquam et et. Vel ut id et saepe est qui.', 208, 9, 4, 7, 179451, 0, 'Albert', '54, chemin Gonzalez\n87506 Vincent', '88482', 0, '2020-05-28 05:05:30', '0000-00-00 00:00:00', 0, 0),
(207, 'itaque architecto odio', 'Optio velit earum rerum repellendus natus expedita ut corporis. Perspiciatis odio qui molestiae aliquid. Eum maxime consequatur sint fugit.', 226, 3, 1, 1, 906119, 0, 'Nguyen', '7, boulevard Jérôme Brunel\n31174 Leconte', '90 842', 0, '2020-05-24 03:51:31', '0000-00-00 00:00:00', 0, 0),
(208, 'amet necessitatibus sint', 'Et ea pariatur eum. Voluptates dolorem velit qui reprehenderit. Consequuntur velit architecto quis sit ut.', 43, 8, 4, 4, 768701, 3, 'Rodriguezboeuf', '24, avenue de Le Goff\n00 817 Robin-la-Forêt', '54 878', 0, '2020-05-24 13:09:21', '0000-00-00 00:00:00', 0, 0),
(209, 'reprehenderit commodi voluptatem', 'Cum soluta provident facilis omnis sapiente sit. Sit quo dolore porro repellat. Tenetur animi placeat sint sit.', 83, 9, 4, 15, 855952, 0, 'Poulainboeuf', '42, avenue de Leveque\n78 802 Peron', '62543', 0, '2020-05-28 06:00:44', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `property_option`
--

DROP TABLE IF EXISTS `property_option`;
CREATE TABLE IF NOT EXISTS `property_option` (
  `property_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`property_id`,`option_id`),
  KEY `IDX_24F16FCC549213EC` (`property_id`),
  KEY `IDX_24F16FCCA7C41D6F` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property_option`
--

INSERT INTO `property_option` (`property_id`, `option_id`) VALUES
(110, 1),
(110, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(3, 'demo', '$argon2id$v=19$m=65536,t=4,p=1$Lmw5YVhKdHBkdzhHTmdadw$hRvAIh8BKW9MTUrNWPJPDPsWXBmDNUAcmGDK5VicZOA');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `FK_16DB4F89549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`);

--
-- Contraintes pour la table `property_option`
--
ALTER TABLE `property_option`
  ADD CONSTRAINT `FK_24F16FCC549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_24F16FCCA7C41D6F` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

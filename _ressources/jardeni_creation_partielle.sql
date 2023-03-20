-- 
-- Base de données MySql Jardeni (partielle)

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `cou_id` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cou_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE KEY `alpha2` (`cou_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `cus_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cus_lastname` varchar(50) NOT NULL,
  `cus_firstname` varchar(50) NOT NULL,
  `cus_address` varchar(150) NOT NULL,
  `cus_zipcode` varchar(5) NOT NULL,
  `cus_city` varchar(50) NOT NULL,
  `cus_countries_id` char(2) NOT NULL,
  `cus_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cus_phone` int UNSIGNED NOT NULL,
  `cus_password` varchar(60) NOT NULL,
  `cus_add_date` datetime NOT NULL,
  `cus_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cus_id`),
  KEY `ibfk_customers_countries` (`cus_countries_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_superior_id` int UNSIGNED DEFAULT NULL,
  `emp_pos_id` int UNSIGNED NOT NULL,
  `emp_lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_zipcode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_phone` int UNSIGNED NOT NULL,
  `emp_salary` int UNSIGNED DEFAULT NULL,
  `emp_enter_date` date NOT NULL,
  `emp_gender` char(1) NOT NULL,
  `emp_children` tinyint NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `emp_superior_id` (`emp_superior_id`),
  KEY `emp_pos_id` (`emp_pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `ord_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ord_order_date` date NOT NULL,
  `ord_payment_date` date DEFAULT NULL,
  `ord_ship_date` date DEFAULT NULL,
  `ord_reception_date` date DEFAULT NULL,
  `ord_status` varchar(25) NOT NULL,
  `ord_cus_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `ord_cus_id` (`ord_cus_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `pos_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pos_libelle` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `pro_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pro_cat_id` int UNSIGNED NOT NULL,
  `pro_price` decimal(7,2) NOT NULL,
  `pro_ref` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_ean` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pro_stock` int UNSIGNED NOT NULL,
  `pro_stock_alert` int UNSIGNED NOT NULL,
  `pro_color` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_publish` tinyint(1) NOT NULL,
  `pro_sup_id` int UNSIGNED NOT NULL,
  `pro_add_date` datetime NOT NULL,
  `pro_update_date` datetime DEFAULT NULL,
  `pro_picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `pro_sup_id` (`pro_sup_id`) USING BTREE,
  KEY `pro_cat_id` (`pro_cat_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `sup_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_countries_id` char(2) NOT NULL,
  `sup_address` varchar(150) NOT NULL,
  `sup_zipcode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_contact` varchar(100) NOT NULL,
  `sup_phone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_mail` varchar(75) NOT NULL,
  PRIMARY KEY (`sup_id`),
  KEY `sup_countries_id` (`sup_countries_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
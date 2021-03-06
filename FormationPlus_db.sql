-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 06, 2021 at 04:49 PM
-- Server version: 8.0.23
-- PHP Version: 7.3.24-(to be removed in future macOS)

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FormationPlus_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Attestation`
--

CREATE TABLE `Attestation` (
  `idAttestation` int NOT NULL,
  `etudiant` int DEFAULT NULL,
  `convention` int DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Attestation`
--

INSERT INTO `Attestation` (`idAttestation`, `etudiant`, `convention`, `message`) VALUES
(2, 1, 4, 'Bonjour Schrute Dwight,\r\n    \r\nVous avez suivi 40 heures de formation chez FormationPlus.\r\nPouvez-vous nous retourner ce mail avec la pièce jointe signée.\r\n    \r\nCordialement,\r\n\r\nFormationPlus'),
(3, 4, 3, 'Bonjour Beesly Pam,\r\n    \r\nVous avez suivi 40 heures de formation chez FormationPlus.\r\nPouvez-vous nous retourner ce mail avec la pièce jointe signée.\r\n    \r\nCordialement,\r\n\r\nFormationPlus');

-- --------------------------------------------------------

--
-- Table structure for table `Convention`
--

CREATE TABLE `Convention` (
  `idConvention` int NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `nbHeur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Convention`
--

INSERT INTO `Convention` (`idConvention`, `nom`, `nbHeur`) VALUES
(1, 'Anglais', 30),
(2, 'Maths', 20),
(3, 'Chimie', 40),
(4, 'Physique', 40),
(5, 'Espagnol', 20),
(6, 'Informatique', 50);

-- --------------------------------------------------------

--
-- Table structure for table `Etudiant`
--

CREATE TABLE `Etudiant` (
  `idEtudiant` int NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `mail` varchar(60) DEFAULT NULL,
  `convention` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Etudiant`
--

INSERT INTO `Etudiant` (`idEtudiant`, `nom`, `prenom`, `mail`, `convention`) VALUES
(1, 'Schrute', 'Dwight', 'dwight.schrute@gmail.com', 4),
(2, 'Halpert', 'Jim', 'jim.halpert@gmail.com', 6),
(3, 'Scott', 'Michael', 'michael.scott@gmail.com', 1),
(4, 'Beesly', 'Pam', 'pam.beesly@gmail.com', 3),
(5, 'Howard', 'Ryan', 'ryan.howard@gmail.com', 5),
(6, 'Kapoor', 'Kelly', 'kelly.kapoor@gmail.com', 1),
(7, 'Hudson', 'Stanley', 'stanley.hudson@gmail.com', 2),
(8, 'Levinson', 'Jan', 'jan.levinson@gmail.com', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Attestation`
--
ALTER TABLE `Attestation`
  ADD PRIMARY KEY (`idAttestation`),
  ADD KEY `etudiant` (`etudiant`),
  ADD KEY `convention` (`convention`);

--
-- Indexes for table `Convention`
--
ALTER TABLE `Convention`
  ADD PRIMARY KEY (`idConvention`);

--
-- Indexes for table `Etudiant`
--
ALTER TABLE `Etudiant`
  ADD PRIMARY KEY (`idEtudiant`),
  ADD KEY `convention` (`convention`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Attestation`
--
ALTER TABLE `Attestation`
  MODIFY `idAttestation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Attestation`
--
ALTER TABLE `Attestation`
  ADD CONSTRAINT `attestation_ibfk_1` FOREIGN KEY (`etudiant`) REFERENCES `Etudiant` (`idEtudiant`) ON DELETE SET NULL,
  ADD CONSTRAINT `attestation_ibfk_2` FOREIGN KEY (`convention`) REFERENCES `Convention` (`idConvention`) ON DELETE SET NULL;

--
-- Constraints for table `Etudiant`
--
ALTER TABLE `Etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`convention`) REFERENCES `Convention` (`idConvention`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

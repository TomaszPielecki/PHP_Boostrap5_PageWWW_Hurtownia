-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Wrz 2022, 04:38
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `hurtownia_art_spoz`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adress`
--

CREATE TABLE `adress` (
  `ida` int(11) NOT NULL,
  `miejscowosc` varchar(45) NOT NULL,
  `region` varchar(45) NOT NULL,
  `kod_pocztowy` char(10) NOT NULL,
  `ulica` varchar(45) NOT NULL,
  `nr_budynku` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hurtownia`
--

CREATE TABLE `hurtownia` (
  `nazwa` varchar(45) NOT NULL,
  `nip` char(10) NOT NULL,
  `miasto` varchar(50) NOT NULL,
  `ulica` varchar(50) NOT NULL,
  `nr_budynku` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kontakt`
--

CREATE TABLE `kontakt` (
  `idk` int(11) NOT NULL,
  `nr_telefonu` varchar(45) NOT NULL,
  `fax` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `www` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pozzam`
--

CREATE TABLE `pozzam` (
  `idpz` int(11) NOT NULL,
  `towary` varchar(40) DEFAULT NULL,
  `pozycja` varchar(40) DEFAULT NULL,
  `ilosc` varchar(40) DEFAULT NULL,
  `zam_idzam` int(200) NOT NULL,
  `zam_hurtownia_nazwa` varchar(45) NOT NULL,
  `zam_sklep_nip` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sklep`
--

CREATE TABLE `sklep` (
  `nip` char(10) NOT NULL,
  `nazwa_sklepu` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `adress_ida` int(11) NOT NULL,
  `kontakt_idk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `towary`
--

CREATE TABLE `towary` (
  `idt` int(11) NOT NULL,
  `producent` varchar(45) DEFAULT NULL,
  `rodzaj` varchar(45) DEFAULT NULL,
  `opis_towaru` text DEFAULT NULL,
  `cenna_towaru_netto` decimal(10,2) UNSIGNED NOT NULL,
  `cenna_brutto_towaru` decimal(10,2) UNSIGNED NOT NULL,
  `procent_vat_aktualnie` decimal(8,2) UNSIGNED NOT NULL,
  `kod_towaru` varchar(30) DEFAULT NULL,
  `ilosc` varchar(30) DEFAULT NULL,
  `miara` varchar(30) DEFAULT NULL,
  `pozzam_idpz` int(11) NOT NULL,
  `pozzam_zam_idzam` int(11) NOT NULL,
  `pozzam_zam_hurtownia_nazwa` varchar(45) NOT NULL,
  `pozzam_zam_sklep_nip` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zam`
--

CREATE TABLE `zam` (
  `idzam` int(11) NOT NULL,
  `data_zlozenia_zamowienia` date DEFAULT NULL,
  `data_przyjecia_zamowienia` date DEFAULT NULL,
  `realizacja` char(1) DEFAULT NULL,
  `data_wysylki` date DEFAULT NULL,
  `dostawa` varchar(45) DEFAULT NULL,
  `hurtownia_nazwa` varchar(45) NOT NULL,
  `sklep_nip` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`ida`);

--
-- Indeksy dla tabeli `hurtownia`
--
ALTER TABLE `hurtownia`
  ADD PRIMARY KEY (`nazwa`);

--
-- Indeksy dla tabeli `kontakt`
--
ALTER TABLE `kontakt`
  ADD PRIMARY KEY (`idk`);

--
-- Indeksy dla tabeli `pozzam`
--
ALTER TABLE `pozzam`
  ADD PRIMARY KEY (`idpz`);

--
-- Indeksy dla tabeli `sklep`
--
ALTER TABLE `sklep`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `kontakt_idk` (`kontakt_idk`),
  ADD KEY `adress_ida` (`adress_ida`);

--
-- Indeksy dla tabeli `towary`
--
ALTER TABLE `towary`
  ADD PRIMARY KEY (`idt`);

--
-- Indeksy dla tabeli `zam`
--
ALTER TABLE `zam`
  ADD PRIMARY KEY (`idzam`),
  ADD KEY `sklep_nip` (`sklep_nip`),
  ADD KEY `hurtownia_nazwa` (`hurtownia_nazwa`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `adress`
--
ALTER TABLE `adress`
  MODIFY `ida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `kontakt`
--
ALTER TABLE `kontakt`
  MODIFY `idk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pozzam`
--
ALTER TABLE `pozzam`
  MODIFY `idpz` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `towary`
--
ALTER TABLE `towary`
  MODIFY `idt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zam`
--
ALTER TABLE `zam`
  MODIFY `idzam` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `sklep`
--
ALTER TABLE `sklep`
  ADD CONSTRAINT `adress_ida` FOREIGN KEY (`adress_ida`) REFERENCES `adress` (`ida`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kontakt_idk` FOREIGN KEY (`kontakt_idk`) REFERENCES `kontakt` (`idk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `zam`
--
ALTER TABLE `zam`
  ADD CONSTRAINT `hurtownia_nazwa` FOREIGN KEY (`hurtownia_nazwa`) REFERENCES `hurtownia` (`nazwa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sklep_nip` FOREIGN KEY (`sklep_nip`) REFERENCES `sklep` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

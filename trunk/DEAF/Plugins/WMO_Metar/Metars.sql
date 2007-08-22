CREATE TABLE `Metars` (
  `ReportDate` date NOT NULL default '0000-00-00',
  `TimeOfReport` time NOT NULL default '00:00:00',
  `StationID` char(4) NOT NULL default '',
  `ReportType` enum('METAR','SPECI') NOT NULL default 'METAR',
  `IsCorrection` tinyint(1) NOT NULL default '0',
  `WindSpeed` float default NULL,
  `WindGust` float default NULL,
  `WindDir` smallint(5) unsigned default NULL,
  `Visibility` float default NULL,
  `Temperature` float default NULL,
  `DewPoint` float default NULL,
  `AltimeterSetting` smallint(5) unsigned default NULL,
  `StationPressure` smallint(5) unsigned default NULL,
  `IsAuto` tinyint(1) NOT NULL default '0',
  `IsWindDirVariable` tinyint(1) NOT NULL default '0',
  `IsCAVOK` tinyint(1) NOT NULL default '0',
  `IsPrecip` tinyint(1) NOT NULL default '0',
  KEY `StationIndx` (`ReportDate`, `StationID`),
  KEY `StationID` (`StationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
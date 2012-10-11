CREATE TABLE `mccampaigns` (
  `oxid` char(32) NOT NULL,
  `campaign` char(32) NOT NULL,
  `template` varchar(255) NOT NULL,
  `plaintemplate` varchar(255) NOT NULL,
  PRIMARY KEY  (`oxid`)
);

CREATE TABLE `mccampaignoptions` (
  `oxid` char(32) NOT NULL,
  `campaign` char(32) NOT NULL,
  `ident` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `type` char(32) NOT NULL,
  PRIMARY KEY  (`oxid`)
);
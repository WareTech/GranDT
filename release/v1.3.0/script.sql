CREATE TABLE `claim` 
(
	`id` bigint(20) NOT NULL auto_increment,
	`version` bigint(20) NOT NULL default '0',
	`title` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	`target` integer(1) NOT NULL,
	`priority` integer(1) NOT NULL,
	`user` bigint(20) NOT NULL,
	`date` date NOT NULL,
	`state` integer(1) NOT NULL,
	PRIMARY KEY  (`id`),
	KEY `FK_Claim_user` (`user`),
	CONSTRAINT `FK_Claim_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
);

INSERT INTO `access` VALUES ('18', '0', 'ClaimList.jsp!delete', 'Eliminar reclamo');


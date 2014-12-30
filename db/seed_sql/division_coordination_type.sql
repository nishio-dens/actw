SET FOREIGN_KEY_CHECKS=0;
BEGIN;
DELETE FROM `division_coordination_types`;
INSERT INTO `division_coordination_types` (`id`, `name`, `division_type`)
VALUES
(1, 'RSS', 'rss'),
(2, 'Github', 'github'),
(3, 'Qiita', 'qiita')
;
COMMIT;
SET FOREIGN_KEY_CHECKS=1;

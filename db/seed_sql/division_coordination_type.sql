SET FOREIGN_KEY_CHECKS=0;
BEGIN;
DELETE FROM `division_coordination_types`;
INSERT INTO `division_coordination_types` (`id`, `name`)
VALUES
  (1, 'RSS'),
  (2, 'Github'),
  (3, 'Qiita')
;
COMMIT;
SET FOREIGN_KEY_CHECKS=1;

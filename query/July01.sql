USE emotion_in_jira;
-- SELECT `id` FROM `user` WHERE `gender`='male';
-- -- SELECT * FROM issue_report WHERE `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
-- Queries that we will need 
-- SELECT COUNT(*) AS `CNT` FROM issue_report WHERE `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='male') ;
-- -- SELECT COUNT(*) FROM issue_report WHERE `priority`='Minor' AND `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
-- SELECT COUNT(*) FROM issue_report WHERE `priority`='Major' AND `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
-- SELECT COUNT(*) FROM issue_report WHERE `priority`='Blocker' AND `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
-- SELECT COUNT(*) FROM issue_report WHERE `priority`='Critical' AND `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
-- SELECT COUNT(*) FROM issue_report WHERE `priority`='Trivial' AND `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
-- SELECT COUNT(*) FROM issue_report WHERE `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='male') AND `type`='Bug' AND `priority`='Major';
-- SELECT COUNT(*) FROM issue_report WHERE `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='male') AND `type`='Bug' AND `priority`='Minor'; 
-- SELECT COUNT(*) AS `CNT` FROM issue_report WHERE `reporter_id`=579;
-- SELECT COUNT(*) FROM `user`;
-- SELECT COUNT(*) AS `CNT` FROM issue_report WHERE `reporter_id`=579 AND `type`='Bug' AND `priority`='Critical';
-- SELECT * FROM issue_report ;
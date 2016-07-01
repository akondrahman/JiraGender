USE emotion_in_jira;
-- SELECT `id` FROM `user` WHERE `gender`='female';
-- SELECT * FROM issue_report WHERE `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
-- Queries that we will need 
-- SELECT COUNT(*) FROM issue_report WHERE `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female') ;
SELECT COUNT(*) FROM issue_report WHERE `assignee_id` IN (SELECT `id` FROM `user` WHERE `gender`='male') ; 
-- SELECT COUNT(*) FROM issue_report WHERE `priority`='Minor' AND `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
-- SELECT COUNT(*) FROM issue_report WHERE `priority`='Major' AND `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
-- SELECT COUNT(*) FROM issue_report WHERE `priority`='Blocker' AND `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
-- SELECT COUNT(*) FROM issue_report WHERE `priority`='Critical' AND `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
-- SELECT COUNT(*) FROM issue_report WHERE `priority`='Trivial' AND `reporter_id` IN (SELECT `id` FROM `user` WHERE `gender`='female');
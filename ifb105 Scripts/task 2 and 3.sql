show databases;
USE treasurehunters;
show tables;
select * From badge;
select * From phonenumber;
select * From player;
select * From playerprogress;
select * From playertreasure; 
select * From purchase; 
select * From quest; 
select * From store; 
select * From treasure; 

##assesment code 
#Q.1 Write a query to list the name (first and last), date of birth, gender and email of players who
#live in Sunnybank or Sunnybank Hills.



SELECT firstname,lastname,dob,gender,email 
FROM player 
WHERE suburb =  'Sunnybank Hills' or suburb = 'Sunnybank';

#Q.2 Write a query to find out how much each player has spent across all stores. Your output should
#be sorted by username in descending order.

SELECT username, SUM(cost) 
FROM purchase 
GROUP BY username
ORDER BY username Desc;

#Q.3 Write a query that lists the username and phone number(s) of the oldest player. Note that you
#must use subqueries for this query.


SELECT * 
FROM phonenumber
WHERE username IN 
(SELECT username 
FROM player 
GROUP BY creationDateTime 
ORDER BY creationDateTime DESC) LIMIT 1;

# Q.4 Write a query that lists all of the badges. If the badge has been purchased include the first
#name, last name and email address of the player(s) who have purchased said badge. Sort the
#list based on the badge name followed by first name then last name in ascending order.


SELECT ac.firstName,ac.lastName,ac.email,ab.badgeID,aa.badgeName
FROM player as ac, purchase AS ab, badge AS aa
WHERE ab.badgeID = aa.badgeID AND ab.username = ac.username
ORDER BY badgename,firstName,lastName ASC;
 

# Q.5 List the number of quests embarked upon by each player with progress status ‘complete’ for
#the treasures that are of the type 'common'. 

 
SELECT Count(ab.username),ab.username
FROM playerprogress AS ab, treasure AS aa 
WHERE ab.questID =aa.questID AND aa.TYPE='common' AND progress = 'complete'
GROUP BY ab.username
ORDER BY ab.username;


#Create index 

#didn't specify whether it wanted it unique or not so I just did it standard 


CREATE INDEX idx_web 
ON treasure(webpage);

#Create View

CREATE VIEW progress44 AS 
SELECT pl.firstName,pl.lastName, pl.creationDateTime
FROM player AS pl, playerprogress AS pp
WHERE 'complete' NOT IN (pp.progress)
GROUP BY pl.username;
SELECT * FROM progress44;

##################################TASK 3################################################

# Q.1 Write an INSERT command to insert a row into badge table. The badge is called ‘Fools
#Gold’ and the description should be ‘Trickiest trickster in all the seas’.


LOCK TABLES `badge` WRITE;
INSERT INTO `badge` (badgeName, badgeDescription) VALUES
('Fools Gold','Trickiest trickster in all the seas');
UNLOCK TABLES;

# Q.2 Write a DELETE command to remove all the rows from the player progress table for which
#progress is inactive.


SET SQL_SAFE_UPDATES = 0;
DELETE FROM `playerprogress` 
wHERE progress = 'inactive';

# Q.3 Write an UPDATE comment to change the address of all players with the last name ‘Smith’
#who live at ‘180 Zelda Street, Linkburb’ to ’72 Evergreen Terrace,Springfield’.

SET SQL_SAFE_UPDATES = 0;
UPDATE player 
SET streetName  = 'Evergreen Terrace', streetNumber = 72, suburb = 'Springfield' 
WHERE lastName = 'Smith' AND streetNumber = 180 AND streetName = 'Zelda Street' AND suburb = 'Linkburb';




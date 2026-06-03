--1
SELECT u.full_name,e.title,e.start_date
FROM Users u
JOIN Registrations r ON u.user_id=r.user_id
JOIN Events e ON e.event_id=r.event_id
WHERE e.status='upcoming'
AND u.city=e.city
ORDER BY e.start_date;
--2
SELECT e.title,AVG(f.rating) avg_rating
FROM Events e
JOIN Feedback f ON e.event_id=f.event_id
GROUP BY e.event_id
HAVING COUNT(*)>=10
ORDER BY avg_rating DESC;
--3
SELECT *
FROM Users
WHERE user_id NOT IN
(
SELECT DISTINCT user_id
FROM Registrations
WHERE registration_date>=CURDATE()-INTERVAL 90 DAY
);
--4
SELECT event_id,COUNT(*) total_sessions
FROM Sessions
WHERE TIME(start_time)>='10:00:00'
AND TIME(end_time)<='12:00:00'
GROUP BY event_id;
--5
SELECT u.city,
COUNT(DISTINCT r.user_id) registrations
FROM Users u
JOIN Registrations r
ON u.user_id=r.user_id
GROUP BY u.city
ORDER BY registrations DESC
LIMIT 5;
--6
SELECT e.title,
COUNT(r.resource_id) total_resources
FROM Events e
LEFT JOIN Resources r
ON e.event_id=r.event_id
GROUP BY e.event_id;
--7
SELECT u.full_name,
f.comments,
e.title
FROM Feedback f
JOIN Users u ON u.user_id=f.user_id
JOIN Events e ON e.event_id=f.event_id
WHERE f.rating<3;
--8
SELECT e.title,
COUNT(s.session_id) sessions
FROM Events e
LEFT JOIN Sessions s
ON e.event_id=s.event_id
WHERE e.status='upcoming'
GROUP BY e.event_id;
--9
SELECT u.full_name,
e.status,
COUNT(*) total_events
FROM Events e
JOIN Users u
ON e.organizer_id=u.user_id
GROUP BY u.full_name,e.status;
--10
SELECT e.title
FROM Events e
JOIN Registrations r
ON e.event_id=r.event_id
LEFT JOIN Feedback f
ON e.event_id=f.event_id
WHERE f.feedback_id IS NULL;
--11
SELECT registration_date,
COUNT(*) users_count
FROM Users
GROUP BY registration_date;
--12
SELECT e.title,
COUNT(s.session_id) total_sessions
FROM Events e
JOIN Sessions s
ON e.event_id=s.event_id
GROUP BY e.event_id
ORDER BY total_sessions DESC;
--13
SELECT e.city,
AVG(f.rating) avg_rating
FROM Events e
JOIN Feedback f
ON e.event_id=f.event_id
GROUP BY e.city;
--14
SELECT e.title,
COUNT(r.registration_id) total_registrations
FROM Events e
JOIN Registrations r
ON e.event_id=r.event_id
GROUP BY e.event_id
ORDER BY total_registrations DESC
LIMIT 3;
--15
SELECT s1.event_id,
s1.title,
s2.title
FROM Sessions s1
JOIN Sessions s2
ON s1.event_id=s2.event_id
AND s1.session_id<s2.session_id
AND s1.end_time>s2.start_time;
--16
SELECT *
FROM Users u
WHERE u.registration_date>=CURDATE()-INTERVAL 30 DAY
AND NOT EXISTS
(
SELECT 1
FROM Registrations r
WHERE r.user_id=u.user_id
);
--17
SELECT speaker_name,
COUNT(*) total_sessions
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(*)>1;
--18
SELECT e.title
FROM Events e
LEFT JOIN Resources r
ON e.event_id=r.event_id
WHERE r.resource_id IS NULL;
--19
SELECT e.title,
COUNT(DISTINCT r.registration_id) registrations,
AVG(f.rating) avg_rating
FROM Events e
LEFT JOIN Registrations r
ON e.event_id=r.event_id
LEFT JOIN Feedback f
ON e.event_id=f.event_id
WHERE e.status='completed'
GROUP BY e.event_id;
--20
SELECT u.full_name,
COUNT(DISTINCT r.event_id) attended_events,
COUNT(DISTINCT f.feedback_id) feedbacks
FROM Users u
LEFT JOIN Registrations r
ON u.user_id=r.user_id
LEFT JOIN Feedback f
ON u.user_id=f.user_id
GROUP BY u.user_id;
--21
SELECT u.full_name,
COUNT(*) feedback_count
FROM Feedback f
JOIN Users u
ON u.user_id=f.user_id
GROUP BY u.user_id
ORDER BY feedback_count DESC
LIMIT 5;
--22
SELECT user_id,event_id,
COUNT(*) duplicates
FROM Registrations
GROUP BY user_id,event_id
HAVING COUNT(*)>1;
--23
SELECT YEAR(registration_date) yr,
MONTH(registration_date) mn,
COUNT(*) total
FROM Registrations
GROUP BY YEAR(registration_date),
MONTH(registration_date);
--24
SELECT event_id,
AVG(TIMESTAMPDIFF(MINUTE,start_time,end_time))
avg_duration
FROM Sessions
GROUP BY event_id;
--25
SELECT e.title
FROM Events e
LEFT JOIN Sessions s
ON e.event_id=s.event_id
WHERE s.session_id IS NULL;






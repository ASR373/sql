/*

List the top 3 users who accumulated the most sessions. Include only the user who had more streaming sessions than viewing. Return the user_id, number of streaming sessions, and number of viewing sessions.

*/


select user_id,
count(case when session_type = 'streamer' then 1 end) as cos,
count(case when session_type = 'viewer' then 1 end) as cov
from twitch_sessions
group by 1
having count(case when session_type = 'streamer' then 1 end) > count(case when session_type = 'viewer' then 1 end) and count(case when session_type = 'streamer' then 1 end) > 0 and
    count(case when session_type = 'viewer' then 1 end) > 0


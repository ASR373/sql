select user_id,
count(case when session_type = 'streamer' then 1 end) as cos,
count(case when session_type = 'viewer' then 1 end) as cov
from twitch_sessions
group by 1
having count(case when session_type = 'streamer' then 1 end) > count(case when session_type = 'viewer' then 1 end) and count(case when session_type = 'streamer' then 1 end) > 0 and
    count(case when session_type = 'viewer' then 1 end) > 0


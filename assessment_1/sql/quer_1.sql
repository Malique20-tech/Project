-- Create segment of course score [100-85], [85-70], [70-60], [<60] and count number of students under those segments for all courses, column to display also are course and teacher's name

WITH ScoreSegments AS (
    SELECT
        s.sid,
        s.cid,
        s.score,
        c.name AS course_name,
        t.name AS teacher_name,
        CASE
            WHEN s.score >= 85 THEN '[100-85]'
            WHEN s.score >= 70 THEN '[85-70]'
            WHEN s.score >= 60 THEN '[70-60]'
            ELSE '[<60]'
        END AS score_segment
    FROM Score s
    JOIN Course c ON s.cid = c.name
    JOIN Teacher t ON c.tid = t.tid
)
SELECT
    course_name,
    teacher_name,
    score_segment,
    COUNT(DISTINCT sid) AS num_students
FROM ScoreSegments
GROUP BY course_name, teacher_name, score_segment
ORDER BY course_name, teacher_name, score_segment DESC;

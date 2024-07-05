--  Show top 3 highest in scoring from each course and display column course name, student name and student score.

WITH RankedScores AS (
    SELECT
        s.sid,
        s.cid,
        s.score,
        ROW_NUMBER() OVER (PARTITION BY s.cid ORDER BY s.score DESC) AS rank
    FROM Score s
)
SELECT
    c.name AS course_name,
    st.name AS student_name,
    rs.score AS student_score
FROM RankedScores rs
JOIN Course c ON rs.cid = c.name
JOIN STudent st ON rs.sid = st.sid
WHERE rs.rank <= 3
ORDER BY course_name, student_score DESC;

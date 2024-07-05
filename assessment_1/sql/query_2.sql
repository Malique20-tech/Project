-- Display student name, gender and score where student has the same score but in different course.
SELECT
    s1.sid AS student_id,
    st.name AS student_name,
    st.gender AS student_gender,
    s1.score AS score,
    c1.name AS course1,
    c2.name AS course2
FROM Score s1
JOIN Score s2 ON s1.sid = s2.sid AND s1.score = s2.score AND s1.cid <> s2.cid
JOIN STudent st ON s1.sid = st.sid
JOIN Course c1 ON s1.cid = c1.name
JOIN Course c2 ON s2.cid = c2.name
ORDER BY student_id, score DESC, course1, course2;

CREATE TABLE Score (
    sid INTEGER,
    cid TEXT,
    score INTEGER,
    create_dt DATETIME,
    PRIMARY KEY (sid, cid),
    FOREIGN KEY (sid) REFERENCES STudent(sid),
    FOREIGN KEY (cid) REFERENCES Course(name)  
);
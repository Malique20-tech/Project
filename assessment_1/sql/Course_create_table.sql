CREATE TABLE Course (
    cid INTEGER PRIMARY KEY,
    name TEXT,
    tid INTEGER,
    create_dt DATETIME,
    update_dt DATETIME,
    FOREIGN KEY (tid) REFERENCES Teacher(tid)
);
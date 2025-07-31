create database sanitation_dashboard ;
show databases;
use sanitation_dashboard ;

CREATE TABLE toilet_locations (
    toilet_id VARCHAR(10) PRIMARY KEY,
    location VARCHAR(100),
    ward_no INT,
    install_date DATE,
    toilet_type VARCHAR(20)
);
select * from toilet_locations;

CREATE TABLE daily_usage (
    record_id INT PRIMARY KEY,
    toilet_id VARCHAR(10),
    date DATE,
    total_users INT,
    male_users INT,
    female_users INT,
    disabled_users INT
);

select * from daily_usage;


CREATE TABLE cleanliness_feedback (
    feedback_id VARCHAR(10) PRIMARY KEY,
    toilet_id VARCHAR(10),
    date DATE,
    `rating (1-5)` INT,
    issues_reported VARCHAR(255)
);

Drop table cleanliness_feedback;
select * from cleanliness_feedback;

CREATE TABLE maintenance_schedule (
    maintenance_id VARCHAR(10),
    toilet_id VARCHAR(10),
    date_scheduled DATE,
    status VARCHAR(20)
);
Drop table Maintenance_schedule ;
Select * from Maintenance_schedule;

SELECT 
    t.location, 
    AVG(d.total_users) AS avg_daily_users, 
    AVG(f.`rating (1-5)`) AS avg_rating
FROM toilet_locations t
JOIN daily_usage d ON t.toilet_id = d.toilet_id
LEFT JOIN cleanliness_feedback f ON t.toilet_id = f.toilet_id AND d.date = f.date
GROUP BY t.location;
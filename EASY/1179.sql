DROP TABLE IF EXISTS Department;

Create table If Not Exists Department (id int, revenue int, month varchar(5));
Truncate table Department;
insert into Department (id, revenue, month) values ('1', '8000', 'Jan');
insert into Department (id, revenue, month) values ('2', '9000', 'Jan');
insert into Department (id, revenue, month) values ('3', '10000', 'Feb');
insert into Department (id, revenue, month) values ('1', '7000', 'Feb');
insert into Department (id, revenue, month) values ('1', '6000', 'Mar');

SELECT * FROM Department;

-- 1179. Reformat Department Table

SELECT id, 
        MAX(CASE WHEN month = 'Jan' THEN revenue ELSE 0 END) AS Jan_revenue,
        MAX(CASE WHEN month = 'Feb' THEN revenue ELSE 0 END) AS Feb_revenue,
        MAX(CASE WHEN month = 'Mar' THEN revenue ELSE 0 END) AS Mar_revenue,
        MAX(CASE WHEN month = 'Apr' THEN revenue ELSE 0 END) AS Apr_revenue,
        MAX(CASE WHEN month = 'May' THEN revenue ELSE 0 END) AS May_revenue,
        MAX(CASE WHEN month = 'Jun' THEN revenue ELSE 0 END) AS Jun_revenue,
        MAX(CASE WHEN month = 'Jul' THEN revenue ELSE 0 END) AS Jul_revenue,
        MAX(CASE WHEN month = 'Aug' THEN revenue ELSE 0 END) AS Aug_revenue,
        MAX(CASE WHEN month = 'Sep' THEN revenue ELSE 0 END) AS Sep_revenue,
        MAX(CASE WHEN month = 'Oct' THEN revenue ELSE 0 END) AS Oct_revenue,
        MAX(CASE WHEN month = 'Nov' THEN revenue ELSE 0 END) AS Nov_revenue,
        MAX(CASE WHEN month = 'Dec' THEN revenue ELSE 0 END) AS Dec_revenue
FROM Department
GROUP BY id
ORDER BY id
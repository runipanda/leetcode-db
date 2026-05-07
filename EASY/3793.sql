DROP TABLE IF EXISTS prompts;

CREATE TABLE if not exists prompts (
    user_id INT,
    prompt VARCHAR(255),
    tokens INT
);

Truncate table prompts;

insert into prompts (user_id, prompt, tokens) values ('1', 'Write a blog outline', '120');
insert into prompts (user_id, prompt, tokens) values ('1', 'Generate SQL query', '80');
insert into prompts (user_id, prompt, tokens) values ('1', 'Summarize an article', '200');
insert into prompts (user_id, prompt, tokens) values ('2', 'Create resume bullet', '60');
insert into prompts (user_id, prompt, tokens) values ('2', 'Improve LinkedIn bio', '70');
insert into prompts (user_id, prompt, tokens) values ('3', 'Explain neural networks', '300');
insert into prompts (user_id, prompt, tokens) values ('3', 'Generate interview Q&A', '250');
insert into prompts (user_id, prompt, tokens) values ('3', 'Write cover letter', '180');
insert into prompts (user_id, prompt, tokens) values ('3', 'Optimize Python code', '220');

SELECT * FROM prompts;

-- 3793. Find Users with High Token Usage

-- find prompts more than 3

WITH cte AS( 
    SELECT user_id, COUNT(prompt) AS prompt_count,
        ROUND(SUM(tokens)/COUNT(prompt),2) AS avg_tokens
    FROM prompts
    GROUP BY user_id
    HAVING COUNT(prompt) >= 3)

SELECT p.user_id,
       cte.prompt_count,
       cte.avg_tokens
FROM prompts p
JOIN cte 
ON p.user_id = cte.user_id
WHERE p.tokens > cte.avg_tokens
GROUP BY p.user_id, cte.prompt_count, cte.avg_tokens
ORDER BY cte.avg_tokens DESC, p.user_id
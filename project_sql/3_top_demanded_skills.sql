/* 
Questions: What are the most in_demand skills for Data Analyst?
- Join job postings to inner join table similar query 2
- Identify the top 5 in_demand skills for a data analst
- Focus on all job postings
- Why? Retrieves the top 5 skills with the highes demand in the job marktet, 
    providing insights into the most valuable skills for job seekers.
*/


SELECT 
    skills,  
    count(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = 'True'
GROUP BY
    skills
 ORDER BY
    demand_count DESC
limit
5
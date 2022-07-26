-- QUESTION 1:

SELECT users.id, users.name, cities.name AS city FROM users 
JOIN cities ON users."cityId" = cities.id 
WHERE cities.name = 'Rio de Janeiro';

-- QUESTION 2:

SELECT testimonials.id, testimonials.message, "u1".name AS writer, "u2".name AS recipient FROM testimonials 
JOIN users "u1" ON "u1".id = testimonials."writerId" 
JOIN users "u2" ON "u2".id = testimonials."recipientId";

-- QUESTION 3:

SELECT users.id, users.name, courses.name AS course, schools.name AS school, educations."endDate" FROM educations 
JOIN users ON users.id = educations."userId" 
JOIN courses ON courses.id = educations."courseId" 
JOIN schools ON schools.id = educations."schoolId" 
WHERE educations.status = 'finished' AND users.id = '30';

-- QUESTION 4:

SELECT experiences."userId" AS id, users.name, roles.name AS role, companies.name AS company, experiences."startDate" FROM experiences 
JOIN users ON users.id = experiences."userId" 
JOIN roles ON roles.id = experiences."roleId" 
JOIN companies ON companies.id = experiences."companyId" 
WHERE experiences."userId" = '50' AND experiences."endDate" IS NULL;

-- BONUS

SELECT s.id AS id, s.name AS school, c.name AS course, co.name AS company, r.name AS role
FROM educations e
JOIN schools s ON e."schoolId" = s.id
JOIN courses c ON e."courseId" = c.id
JOIN users u ON e."userId" = u.id
JOIN applicants a ON a."userId" = u.id
JOIN jobs j ON a."jobId" = j.id
JOIN companies co ON j."companyId" = co.id
JOIN roles r ON j."roleId" = r.id
WHERE co.id = 10
AND r.name = 'Software Engineer'
AND j.active = true;

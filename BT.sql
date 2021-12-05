select * from teacher where gender = "f";

select * from class where time like "%7%";

select * from teacher as tc
left join teachingclass as tcc on tcc.teacherId = tc.id
left join class c on c.id = tcc.classId
where tc.gender = "f" and c.time like "%7%";

-- Tim tat ca lop hoc co nhieu hon mot hoc sinh
select class.name, count(*) as student_number from class
left join registerclass on registerclass.classId = class.id
left join student on registerclass.studentId = student.id
group by class.name
having student_number > 1;
;

-- tinh chat luong trung binh tung giao vien
select teacher.id, teacher.name,Round(Sum(class.quality)/Count(class.id),1) as tc_quality from teacher
left join teachingclass on teachingclass.teacherId = teacher.id
left join class on teachingclass.classID = class.id
group by teacher.id, teacher.name
ORDER BY tc_quality DESC;
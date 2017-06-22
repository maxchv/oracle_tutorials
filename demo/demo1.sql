create table student
(
    id integer primary key,
    "name" varchar2(255) not null,
    age int not null
);

-- Последовательность для автоинкремента
create sequence student_sequence start WITH 1 increment by 1;
-- student_sequence.nextval

create or replace trigger auto_increment_student
before insert on student
for each row
begin
    if :new.id is null then
        select student_sequence.nextval into :new.id from dual;
    end if;
end;

insert into student(id, "name", age) values(1,'Петя', 18);
select student_sequence.nextval from dual;

select * from student;

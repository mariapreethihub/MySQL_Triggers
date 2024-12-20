--CREATING DATABASE SCHOOLS
create database Schools;
use Schools;

1.CREATE A TABLE NAMED TEACHERS WITH FIELDS ID,NAME,SUBJECT,EXPERIENCE AND SALARY AND INSERT 8 ROWS

create table Teachers(
Id int Primary key auto_increment,
Name varchar(20),
Subject varchar(20),
Experience int,
Salary decimal(10,2));

--INSERTING VALUES INTO TABLE TEACHERS

insert into Teachers(Name,Subject,Experience,Salary) values
('Swetha Kujur','Hindi',12,55000),
('Shobana R','Mathematics',10,48000),
('Krithika','Science',9,42000),
('Kaviya P R','Scince',5,35000),
('Jasmin Judy','Mathematics',10,45000),
('Aswathy Mathew','English',11,45000),
('Sugapriya M','Mathematics',5,38000),
('Kala K','Hindi',8,41000);
  
  select * from Teachers;
  
  2.CREATE A BEFORE INSERT TRIGGER NAMED before_insert_teacher THAT WILL RAISE AN ERROR 
  “salary cannot be negative” IF THE SALARY INSERTED TO THE TABLE IS LESS THAN ZERO.
  DELIMITER //
  create trigger before_insert_teacher
  BEFORE INSERT ON Teachers
  FOR EACH ROW
  BEGIN
  if new.Salary<0 then
  signal sqlstate '45000' set message_text='Salary cannot be negative';
  end if;
  END;
  //
  DELIMITER ;
  SHOW triggers;
  insert into Teachers(Name,Subject,Experience,Salary) values('Vani K','Hindi',8,-1);
  select * from Teachers;
  
  3.Create an after insert trigger named after_insert_teacher that inserts a row with 
  teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted 
  to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, 
  timestamp -> time at which the new row has got inserted.
  
  create table teacher_log(teacher_id int, action varchar(20),time_stamp TIME);
  
  DELIMITER //
  create trigger after_insert_trigger
  AFTER INSERT ON Teachers
  FOR EACH ROW
  BEGIN
  insert into teacher_log(teacher_id,action,time_stamp)
  values(NEW.Id,'Insert',now());
  END;
  //
  DELIMITER ;
  SHOW TRIGGERS;
insert into Teachers(Name,Subject,Experience,Salary) values
('Selvam','English',20,75000);
 select * from Teachers;
 select * from teacher_log;
 
  4. Create a before delete trigger that will raise an error when you try to delete
  a row that has experience greater than 10 years.
  DELIMITER //
  create trigger before_delete_trigger
  BEFORE DELETE ON Teachers
  FOR EACH ROW
  BEGIN
  if OLD.Experience>10 then
  signal sqlstate '45000' set message_text="Experience more than 10years.Deletion not permitted.";
  end if;
  END;
  //
  DELIMITER //
  show triggers;
 delete from Teachers where Id=6;
 select * from Teachers;
 select * from teacher_log;
 
  5. Create an after delete trigger that will insert a row to teacher_log table when
  that row is deleted from teacher table.
  DELIMITER //
  create trigger after_delete_trigger
  AFTER DELETE ON Teachers
  FOR EACH ROW
  BEGIN
   insert into teacher_log(teacher_id,action,time_stamp)
  values(old.Id,'Delete',now());
  END;
  //
  DELIMITER //
   SHOW triggers;
select * from Teachers;
select * from teacher_log;
delete from Teachers where Id=3;
  

DROP DATABASE SCHOOLS;
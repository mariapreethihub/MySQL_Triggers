**MySQL_Triggers**

      Trigger is a database objectthat automatically execute in response to specific database events, such as insert, 
      update, or delete operations on a table.They are special stored procedures.

**Syntax for Creating a Trigger:**

     DELIMITER //
     CREATE TRIGGER trigger_name
     {BEFORE | AFTER} {INSERT | UPDATE | DELETE}
     ON table_name
     FOR EACH ROW
     BEGIN
     -- SQL statements to execute
     END;
     DELIMITER ;

**Types of Trigger :**

     1.Before Trigger- A before trigger is executed before the event such as insert,update,delete is applied to the table.
     2.After Trigger- After trigger is executed after the event such as insert,update,delete is applied to the table.

**Application and uses of Triggers**

    Triggers are commonly used to  validate input data,E-commerce platform.Healthcare system,Banking system etc.
   


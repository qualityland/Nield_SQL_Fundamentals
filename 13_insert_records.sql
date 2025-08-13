INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME)
VALUES ('Thomas', 'Nield');

SELECT * FROM ATTENDEE;

INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME, PHONE, EMAIL, VIP)
VALUES ('Jon', 'Skeeter', 4802185842,'john.skeeter@rex.net', 1),
  ('Sam','Scala', 2156783401,'sam.scala@gmail.com', 0),
  ('Brittany','Fisher', 5932857296,'brittany.fisher@outlook.com', 0);
  
  
SELECT * FROM ATTENDEE;

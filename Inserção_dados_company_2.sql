-- Inserção de dados no company_2


INSERT INTO employee VALUES ('Marcelo','B','Smith',123456789,'1965-01-09','731-Fondren-Houston-TX','M',30000,NULL,5),
                            ('Roberto','T','Wong',333445555,'1955-12-08','638-Voss-Houston-TX','M',40000,123456789,5),
                            ('Aline','J','Zelaya',999887777,'1968-01-19','3321-Castle-Spring-TX','F',25000,333445555,4),
                            ('Jessica','S','Wallace',987654321,'1941-06-20','291-Berry-Bellaire-TX','F',43000,NULL,4),
                            ('Raimundo','K','Narayan',666884444,'1962-09-15','975-Fire-Oak-Humble-TX','M',38000,987654321,5),
                            ('Joelma','A','English',453453453,'1972-07-31','5631-Rice-Houston-TX','F',25000,987654321,5),
                            ('André','V','Jabbar',987987987,'1969-03-29','980-Dallas-Houston-TX','M',25000,123456789,4),
                            ('Jaime','E','Borg',888665555,'1937-11-10','450-Stone-Houston-TX','M',55000,333445555,1);



INSERT INTO dependent VALUES (333445555,'Ana','F','1986-04-05','Daughter'),
                             (333445555, 'Theodoro','M','1983-10-25','Son'),
                             (333445555,'Jussara','F','1958-05-03','Spouse'),
                             (987654321,'Bruno','M','1942-02-28','Spouse'),
                             (123456789,'Micael','M','1988-01-04','Son'),
                             (123456789,'Ana','F','1988-12-30','Daughter'),
                             (123456789,'Eliza','F','1967-05-05','Spouse');



INSERT INTO department VALUES ('Research',5,333445555,'1988-05-22'),
                               ('Administration',4,987654321,'1995-01-01'),
                               ('Headquarters',1,888665555,'1981-06-19');


                               
INSERT INTO dept_locations VALUES (1,'Houston'),
                                  (4,'Stafford'),
                                  (5,'Bellaire'),
                                  (5,'Sugarland'),
                                  (5,'Houston');


                                  
INSERT INTO project VALUES ('ProductX',1,'Bellaire',5),
                           ('ProductY',2,'Sugarland',5),
                           ('ProductZ',3,'Houston',5),
                           ('Computerization',10,'Stafford',4),
                           ('Reorganization',20,'Houston',1),
                           ('Newbenefits',30,'Stafford',4);


                           
INSERT INTO works_on VALUES (123456789,1,32.5),
                            (123456789,2,7.5),
                            (666884444,3,40.0),
                            (453453453,1,20.0),
                            (453453453,2,20.0),
                            (333445555,2,10.0),
                            (333445555,3,10.0),
                            (333445555,10,10.0),
                            (333445555,20,10.0),
                            (999887777,30,30.0),
                            (999887777,10,10.0),
                            (987987987,10,35.0),
                            (987987987,30,5.0),
                            (987654321,30,20.0),
                            (987654321,20,15.0),
                            (888665555,20,0.0);
                            
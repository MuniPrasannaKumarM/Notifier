create database notifier;
use notifier;
create table userdetails (name varchar(1000),username varchar(200), mobile varchar(100),email varchar(200), password varchar(100));
select * from userdetails;
drop table userdetails;
create table notebooks(notebookname varchar(200),notes int,email varchar(100));
insert into notebooks values("nptel",3,"m.muniprasanna@gmail.com");
insert into notebooks values("personal",5,"m.muniprasanna@gmail.com");
insert into notebooks values("class",6,"m.muniprasanna@gmail.com");
select * from notebooks;
drop table notebooks;
create table notes(email varchar(1000) , notename varchar(1000), notebookname varchar(1000),
 startdate varchar(200), enddate varchar(200), remainderdate varchar(200), status varchar(200), tag varchar(200), description varchar(10000));
INSERT INTO notes VALUES ( 'm.muniprasanna@gmail.com', 'Backend', 'Virtusa Material', '2021-02-17', '2021-02-20', '2021-02-19', 'Not Started', 'private', 'Start backend process');
INSERT INTO notes VALUES ( 'm.muniprasanna@gmail.com', 'Cognitive Radio','Semester 8',  '2021-02-21', '2021-02-24', '2021-02-23', 'Not Started', 'public', 'Start preparing for CR exam');
INSERT INTO notes VALUES ( 'm.muniprasanna@gmail.com','NRA', 'Semester 8',  '2021-02-26', '2021-02-27', '2021-02-26', 'Not Started', 'private', 'Start preparing for NRA');
insert into notes values ( 'm.muniprasanna@gmail.com', 'FrontEnd','Virtusa Material', '2021-02-17', '2021-02-20', '2021-02-19', 'Not Started', 'public', 'Start doing Front End ');
insert into notes values ( 'm.muniprasanna@gmail.com', 'FrontEnd omplete','Virtusa Material', '2021-05-10', '2021-05-20', '2021-05-10', ' Started', 'private', 'Going to Complete');
 select * from notes;
 drop table notes;
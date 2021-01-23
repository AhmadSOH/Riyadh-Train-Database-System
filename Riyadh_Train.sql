drop database `Riyadh_Train`;
create database `Riyadh_Train`;

use `Riyadh_Train`;

create table `train_station`(
    `s_num` int not null,
    `s_name` varchar(50) not null,
    `train_time` time not null,
    `location` varchar(50),
    primary key (`s_num`)
);
insert into `train_station` values (601,'king abdullah',133000,'Al Oad');
insert into `train_station` values (907,'king fahad',153000,'Al Dreiah');
insert into `train_station` values (208,'king khaled',183000,'Al Olia');
insert into `train_station` values (502,'king faisal',203000,'king saud university');
insert into `train_station` values (103,'king Abdulaziz',223000,'Al Malaz');

create table `passenger`(
    `ssn` int(11) not null,
    `name` varchar(50) not null,
    `s_num_fk1` int not null,
    primary key(`ssn`),
    FOREIGN KEY (`s_num_fk1`) REFERENCES `train_station` (`s_num`)
);
insert into `passenger` values (101023,'elisa ',103);
insert into `passenger` values (202034,'jeniffer ',601);
insert into `passenger` values (303045,'alex ',907);
insert into `passenger` values (404056,'jenna ',208);
insert into `passenger` values (505067,'alison ',502);

create table `passcard`(
    `psn` int(6) not null,
    `balance` int(5) not null,
    `date` varchar(20) not null,
    `ssn_fk` int(7) not null,
    `s_num_fk2` int not null,
    primary key(`psn`),
    FOREIGN KEY (`s_num_fk2`) REFERENCES `train_station` (`s_num`),
    FOREIGN KEY (`ssn_fk`) REFERENCES `passenger` (`ssn`)
);
insert into `passcard` values (12345,100,'2020-12-23',101023,103);
insert into `passcard` values (23456,45,'2020-10-10',202034,601);
insert into `passcard` values (34567,310,'2019-11-15',303045,907);
insert into `passcard` values (45678,50,'2021-04-25',404056,208);
insert into `passcard` values (56789,220,'2024-06-14',505067,502);

create table `facilities`( 
    `fac_num` int(5) not null,
    `fac_name` varchar(30) not null,
    `s_num_fk3` int not null,
    
    primary key(`fac_num`),
    FOREIGN KEY (`s_num_fk3`) REFERENCES `train_station` (`s_num`) 
);
insert into `facilities` values (1102,'bathroom',601);
insert into `facilities` values (2015,'makeup store',103);
insert into `facilities` values (1211,'minimart',208);
insert into `facilities` values (7845,'phone accesory',907);
insert into `facilities` values (3120,'waiting benches',907);

create table `route`(
    `route_num` int(4) not null,
    
    primary key(`route_num`)
);
insert into `route` values (101);
insert into `route` values (202);
insert into `route` values (303);
insert into `route` values (404);
insert into `route` values (505);

create table `train`(
    `train_id` int(5) not null,
    `type` varchar(30) not null,
    `nb_seats` int(4) not null,
    `route_num_fk` int not null,
    
    primary key(`train_id`),
    FOREIGN KEY (`route_num_fk`) REFERENCES `route` (`route_num`) 
);
insert into `train` values (1100,'bathroom',110,101);
insert into `train` values (2200,'magnatic',120,202);
insert into `train` values (3300,'rail',150,303);
insert into `train` values (4400,'rail',120,404);
insert into `train` values (5500,'waiting benches',150,505);

create table `arrival`(
    `s_num_fk4` int not null,
    `train_id_fk` int(5) not null,
    `arrival_time` time not null,
    
    primary key (`s_num_fk4`,`train_id_fk`),
    FOREIGN KEY (`s_num_fk4`) REFERENCES `train_station` (`s_num`),
    FOREIGN KEY (`train_id_fk`) REFERENCES `train` (`train_id`) 
);
insert into `arrival` values (502,1100,133120);
insert into `arrival` values (103,4400,152954);
insert into `arrival` values (601,3300,181521);
insert into `arrival` values (907,5500,221054);
insert into `arrival` values (208,2200,192812);

create table `location`(
    `location` varchar(30) not null,
    `s_num_fk5` int not null,
    
    primary key (`location`,`s_num_fk5`),
    FOREIGN KEY (`s_num_fk5`) REFERENCES `train_station` (`s_num`)
);
insert into `location` values ('Mala St',103);
insert into `location` values ('Oad St',601);
insert into `location` values ('Olia St',208);
insert into `location` values ('Deriah St',907);
insert into `location` values ('king saud university',502);

create table `connects`(
    `route_num_fk2` int(5) not null,
    `s_num_fk6` int not null,
    
    primary key (`route_num_fk2`,`s_num_fk6`),
    FOREIGN KEY (`s_num_fk6`) REFERENCES `train_station` (`s_num`),
    FOREIGN KEY (`route_num_fk2`) REFERENCES `route` (`route_num`)
);
insert into `connects` values (101,103);
insert into `connects` values (505,601);
insert into `connects` values (303,208);
insert into `connects` values (202,907);
insert into `connects` values (404,502);
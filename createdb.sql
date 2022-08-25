create table Department(

Department_ID integer not null primary key,
Department_Name varchar(255)


);





create table Employee(

ID integer not null primary key,
Phone_Number varchar(11) not null,
Employee_Name varchar(50),
Employee_Surname varchar(50),
Employee_Gender varchar(1),
Employee_Mail varchar(255),
Employee_Salary numeric(10,2),
Birth_Date Date,
Birth_Place varchar(255),
Job_Starting_Date Date,
Status varchar(255),
Marriage_Status varchar(4),
AGI_Type varchar(255),
AGI numeric(6,2),
Total_Salary numeric(10,2),
DepartmentID integer,
foreign key(DepartmentID) references Department(Department_ID)


);



create table Shift(

Shift_No integer not null primary key,
Starting_Time varchar(11),
End_Time varchar(11),
Hours integer not null,
Dept_ID integer,
Emp_ID integer,
foreign key(Emp_ID) references Employee(ID),
foreign key(Dept_ID) references Department(Department_ID)


);


create table Device(

Device_ID varchar(3) not null primary key,
Device_Name varchar(255),
Employee_ID integer,
foreign key(Employee_ID) references Employee(ID)



);


create table Child(

Child_Name varchar(255),
Child_Surname varchar(255),
Child_Gender varchar(1),
Child_Birthdate Date,
Personal_ID integer,
foreign key(Personal_ID) references Employee(ID)


);


create table Leaves(

Leaves_ID integer not null primary key,
Leave_Reason varchar(255),
Start_Date Date,
End_Date Date,
Employee_ID integer,
foreign key(Employee_ID) references Employee(ID)


);

create table Address(

Address_ID varchar(4) not null primary key,
Country varchar(255),
City varchar(255),
District varchar(255),
Postal_Code varchar(5),
Address_Text varchar(255),
User_ID integer,
foreign key(User_ID) references Employee(ID)


);


create table Project(

Project_No varchar(3) not null primary key,
Project_Name varchar(255),
Starting_Date Date,
Due_Date Date,
DepartmentID integer,
foreign key(DepartmentID) references Department(Department_ID)


);

---------------------------------------------------------------------------------------------
insert into Department(department_id,department_name)
values 
(100,'IT'),
(200, 'Human Resources'),
(300, 'Accounting'),
(400, 'Security'),
(500, 'Administrative Affairs'),
(600, 'AR-GE'),
(700, 'Public Relations'),
(800, 'Purchasing and Sales'),
(900, 'Shipping'),
(1000, 'Medical'),
(1100, 'Support');


-- If employee has a child, regardless of the salary, he/she gets 250 TL for each child.
-- If salary is less than 3000 TL, a married person gets 400 TL and a single person gets 300 TL. If he/she has a child he/she also benefits from the first conditon.
-- If he/she is son of martry, regardless of the salary, he/she gets 1000 TL for each child.





insert into Employee(ID,phone_number,employee_name,employee_surname,employee_gender,employee_mail,employee_salary,birth_date,birth_place,job_starting_date,status,marriage_status,agi_type,agi,total_salary,departmentid)
values 
(1, 05054723211, 'Mehmet','Öz','M','mehmet.oz@hotmail.com',7000, '1960-06-11', 'Cleveland', '2012-03-10', 'Doctor','yes', '-', 0, 7000, 1000),
(2, 05382662346, 'Ayþe','Yýlmaz','F','ayse.yilmaz@hotmail.com',3000, '1991-03-21', 'Ýstanbul', '2016-09-24', 'Nurse','yes', 'Two Children', 500, 3500, 1000),
(3, 05651002323, 'Elif','Can','F','elif.can@hotmail.com',3000, '1978-07-05', 'Ýzmir', '2013-05-11', 'Nurse','yes', '-', 0, 3000, 1000),

(4, 05371994544, 'Ahmet','Aslan','M','ahmet.aslan@hotmail.com',5000 ,'1988-02-15', 'Ankara', '2017-06-11', 'Computer Engineer','yes', '-', 0, 5000, 100),
(5, 05252062734, 'Ýrem','Deniz','F','irem.deniz@hotmail.com',3000,'1983-01-14', 'Mersin', '2019-04-19', 'Industrial Engineer','yes', 'Two Children', 500, 3500, 100),
(6, 05126569899, 'Enes', 'Kaya', 'M','enes.kaya@hotmail.com', 6000, '1984-02-15', 'Antalya', '2014-05-15', 'Computer Engineer','yes', '-', 0, 6000, 100), 
(7,05611616116, 'Haydar','Dinçer','M','haydar.dincer@hotmail.com',6500,'1968/06/07','Adana','2013/08/04','Computer Engineer','yes','One Child',250,6750,100),
(8,05411911118, 'Semih','Þentürk','M','semih.senturk@hotmail.com',5000,'1988/09/17','Samsun','2016/11/14','Electrics-Electronics Engineer','yes','Two Children',500,5500,100),
(9,05311821218, 'Talha','Özcan','M','talha.ozcan@hotmail.com',5000,'1992/09/12','Isparta','2018/10/11','Computer Engineer',null,'-',0,5000,100),
(10,05211821218, 'Fatih','Terim','M','fatih.terim@hotmail.com',4500,'1995/09/12','Artvin','2019/12/10','Software Engineer','no','-',0,4500,100),



(11, 05227862366, 'Zeynep', 'Aydýn', 'F','zeynep.aydin@hotmail.com', 4500, '1989-10-15', 'Antalya', '2018-12-09', 'Director','yes', '-', 0, 4500, 200),
(12, 05011992349, 'Ayça', 'Kaya', 'F', 'ayca.kaya@hotmail.com',3500, '1995-01-27', 'Ýstanbul', '2021-11-26', 'Assistant','yes', 'Two Children', 500, 4000, 200),

(13, 05346454532, 'Arda', 'Ata', 'M','arda.ata@hotmail.com', 2500, '1991-05-20', 'Zonguldak', '2015-08-03', 'Assistant','yes', 'Martry Child-Low Salary', 1400, 3900, 900),
(14, 05753434651, 'Hakan', 'Yýldýrým','M','hakan.yildirim@hotmail.com', 4500, '1985-09-12', 'Ankara', '2011-02-03', 'Director','yes', '-', 0, 4500, 900),

(15, 05387771224, 'Hande','Ak','F','hande.ak@hotmail.com',2999, '1983-04-03', 'Çankýrý', '2020-08-03', 'Guard','yes', 'Two Children', 900, 3899, 400),
(16, 05456664639, 'Hakan','Ertuðrul','M','hakan.ertugrul@hotmail.com',3500, '1980-09-09', 'Çankýrý', '2019-05-05', 'Security Guard','no', '-', 0, 3500, 400),
(17, 05100256789, 'Erol','Bulut','M','erol.bulut@hotmail.com',5500, '1985-09-09', 'Malatya', '2019-10-05', 'Security Guard','no', '-', 0, 5500, 400),


(18, 05057532365, 'Aykut','Suyur','M','aykut.suyur@hotmail.com' ,4000, '1965-07-10', 'Tunceli', '2014-05-11', 'Accountant','yes', '-', 0, 4000, 300),
(19, 05052505561, 'Zeki','Biricikoglu','M','zeki.biricikoglu@hotmail.com',11000, '1963-03-11', 'Trabzon', '2015-09-10', 'Analyst','yes', '-', 0, 11000, 300),
(20, 05057565464, 'Abdurrahman','Güneþdoðdu','M', 'abdurrahman.gunesdogdu@hotmail.com  ', 7065, '1968-04-05', 'Þanlýurfa', '2016-07-03', 'Lawyer','yes', '-', 0, 7065, 300),
(21, 05058506560, 'Çiðdem','Karadayý','F','cigdem.karadayý@hotmail.com ',5225, '1969-01-03', 'Mersin', '2017-02-04', 'Financial Management','yes', '-', 0, 5225, 300),
(22, 05352545860, 'Gülsüm','Bikeç','F', 'gulsum.bikec@hotmail.com ',7200, '1970-05-01', 'Ýstanbul', '2013-08-03', 'Lawyer','yes', '-', 0, 7200, 300),


(23, 05053657002, 'Nazlý','Örnek','F', 'nazlý.ornek@hotmail.com ', 8000, '1970-05-01', 'Ýstanbul', '2019-08-04', 'Manager','yes', '-', 0, 8000, 500),
(24, 05053320021, 'Ezgi','Bütüncü','F','ezgi.butuncu@hotmail.com ', 8000, '1972-03-03', 'Ýstanbul', '2012-05-02', 'Manager','yes', 'One Child', 250, 8250, 500),
(25, 05053320995, 'Anýl','Güldü','M','anil.guldu@hotmail.com', 7500, '1990-05-01', 'Adana', '2018-07-04', 'Lawyer','no', '-', 0, 7500, 500),
(26, 05053320853, 'Emine','Tokur','F','emine.tokur@hotmail.com ',5000, '1999-06-06', 'Trabzon', '2019-08-04', 'Branch Officer','no', '-', 0, 5000, 500),
(27, 05053320127, 'Ali','Ýncecik','M', 'ali.incecik@hotmail.com', 4720, '1993-07-03', 'Rize', '2015-05-02', 'special assistant','no', '-', 0, 4720, 500),

(28, 05223315294, 'Enes','Bayraktar','M', 'enes.bayraktar@hotmail.com', 7000, '1981-05-06', 'Düzce', '2012-09-04', 'Copywriter','yes', '-', 0, 7000, 700),
(29, 05325636457, 'Ahmet','Özsoy','M', 'ahmet.ozsoy@hotmail.com', 6100, '1962-01-03', 'Erzurum', '2014-05-02', 'PR specialist','no', '-', 0, 6100, 700),
(30, 05432235657, 'Osman','Gündüz','M', 'osman.gunduz@hotmail.com', 6500, '1967-05-03', 'Artvin', '2015-07-01', 'Social Media Manager','no', '-', 0, 6500, 700),
(31, 05317658654, 'Selinay','Aydýn','F', 'selinay.aydýn@hotmail.com', 6430, '1999-08-03', 'Ankara', '2019-08-04', 'Branch Officer','yes', 'One Child', 250, 6680, 700),
(32, 05346364598, 'Sevda','Akçan','F','sevda.akcan@hotmail.com', 5500, '1995-06-08', 'Ýzmir', '2018-01-02', 'Spokesperson','yes', 'Two Children', 500, 6000, 700),

(33, 05351129021, 'Ali','Kemal','M','ali.kemal@hotmail.com',6500, '1966-05-09', 'Trabzon', '2016-01-11', 'Electrical Engineer','no', '-', 0, 6500, 600),
(34, 05361219132, 'Mustafa','Yardým','M','mustafa.yardim@hotmail.com',8000, '1959-03-08', 'Ankara', '2000-02-10', 'Mechanical Engineer','yes', '-', 0, 8000, 600),


(35, 05396399945, 'Filiz','Çelik','F','filiz.celik@hotmail.com',4000, '1981-04-03', 'Ýzmir', '2020-08-03', 'Chef','yes', 'One Child', 250, 4250, 1100),
(36, 05385288834, 'Kaan','Yýldýran','M','kaan.yildiran@hotmail.com',2990, '1990-06-06', 'Bursa', '2020-08-03', 'Assistant Chief','no', 'Low Salary', 300, 3290, 1100),
(37, 05374177723, 'Ezgi','Erkmen','F','ezgi.erkmen@hotmail.com',2700, '1993-02-02', 'Kars', '1989-03-10', 'Cleaner','yes', 'Low Salary', 400, 3100, 1100),
(38, 05364165539, 'Bahadýr','Doðan','M','bahadir.dogan@hotmail.com',3000, '1990-01-01', 'Yozgat', '2000-03-11', 'Waiter','yes', '-', 0, 3000, 1100),


(39, 05687671324, 'Aleyna','Aktürk','F','aleyna.akturk@hotmail.com',2999, '1987-02-03', 'Afyon', '2021-08-23', 'Purchase Responsible','yes', 'Two Children', 900, 3899, 800),
(40, 05457664939, 'Cihangir','Pekmezci','M','cihangir.pekmezci@hotmail.com',3500, '1992-04-11', 'Giresun', '2016-05-05', 'Sales Responsible','no', '-', 0, 3500, 800);




insert into device (device_id, device_name, employee_id)
values
('A00','Lenova Idea 100',1),
('A01','Dell Inspiron 3567',4),
('A02','HP 17-AK009NT',5),
('A03','HP 250 G6',6),
('A04','Lenovo V310-15ISK',7),
('A05','Lenovo V110-15IKB',10),
('A06','HP 15-BW050NT',13),
('A07','Acer Aspire A315-51-5773',14),
('A08','Asus X540UB-GO072',16),
('A09','Asus VivoBook 15 X505BP-BR019',18),
('A10','HP 320 G7',19),
('A11','Lenovo V410-15ILS',23),
('A12','Lenovo V210-15IMS',24),
('A13','Acer Aspire A100',25),
('A14','Dell NewBook 200',28),
('A15','HP 270 G8',29),
('A16', 'Casper A5',11),
('A17', 'Asus X400',12);


insert into project(project_no,project_name,starting_date,due_date,departmentid)
values
('P00', 'MXC Radar Systems','2018-05-20','2021-06-10',600),
('P01', 'Network Systems','2015-11-09','2016-04-12',100),
('P02', 'CATS E/O Cameras','2019-10-18','2021-12-13',600),
('P03', 'Traditional Marketing','2014-06-19','2014-10-21',700),
('P04', 'ULAQ','2020-06-10','2021-05-09',600),
('P05', 'Marketing & PR Collaboration','2017-04-11','2018-06-09',700),
('P06', 'Crisis Communication','2012-02-16','2014-03-17',500),
('P07', 'Unmanned Aviation','2017-07-19','2019-03-11',600),
('P08', 'Wide Area Surveillance System','2016-07-28','2019-02-21',600),
('P09', 'Helicopter Electronic Warfare Self Protection System','2018-06-25','2022-09-27',600),
('P10', 'Human Resources Processes and Procedures','2011-06-15','2011-11-27',200);




insert into address (address_id,country,city,district,postal_code,address_text,user_id)
values
('AD1','Türkiye','Ankara','Çankaya','06530','Ankara/Çankaya/06530',1),
('AD2','Türkiye','Ankara','Çankaya','06530','Ankara/Çankaya/06530',2),
('AD3','Türkiye','Ankara','Mamak','06620','Ankara/Mamak/06620',3),
('AD4','Türkiye','Ankara','Mamak','06620','Ankara/Mamak/06620',4),
('AD5','Türkiye','Ankara','Keçiören','06300','Ankara/Keçiören/06300',5),
('AD6','Türkiye','Ankara','Pursaklar','06145','Ankara/Pursaklar/06145',6),
('AD7','Türkiye','Ankara','Mamak','06200','Ankara/Mamak/06200',7),
('AD8','Türkiye','Ankara','Çankaya','06530','Ankara/Çankaya/06530',8),
('AD9','Türkiye','Ankara','Keçiören','06300','Ankara/Keçiören/06300',9),
('AD10','Türkiye','Ankara','Çankaya','06530','Ankara/Çankaya/06530',10),
('AD11','Türkiye','Ankara','Çankaya','06530','Ankara/Çankaya/06530',11),
('AD12','Türkiye','Ankara','Pursaklar','06145','Ankara/Pursaklar/06145',12),
('AD13','Türkiye','Ankara','Çankaya','06530','Ankara/Çankaya/06530',13),

('AD14','Türkiye','Ankara','Çankaya','06530','Ankara/Çankaya/06530',14),
('AD15','Türkiye','Ankara','Kýzýlcahamam','06890','Ankara/Kýzýlcahamam/06890',15),
('AD16','Türkiye','Ankara','Kýzýlcahamam','06890','Ankara/Kýzýlcahamam/06890',16),
('AD17','Türkiye','Ankara','Mamak','06620','Ankara/Mamak/06620',17),
('AD18','Türkiye','Ankara','Keçiören','06300','Ankara/Keçiören/06300',18),

('AD19','Türkiye','Ankara','Altýndað','06080','Ankara/Altýndað/06080',19),
('AD20','Türkiye','Ankara','Yenimahalle','06560','Ankara/Yenimahalle/06560',20),
('AD21','Türkiye','Ankara','Çankaya','06530','Ankara/Çankaya/06530',21),
('AD22','Türkiye','Ankara','Akyurt','06750','Ankara/Akyurt/06750',22),
('AD23','Türkiye','Ankara','Bala','06726','Ankara/Bala/06726',23),
('AD24','Türkiye','Ankara','Ayaþ','06710','Ankara/Ayaþ/06710',24),
('AD25','Türkiye','Ankara','Çamlýdere','06740','Ankara/Çamlýdere/06740',25),
('AD26','Türkiye','Ankara','Çubuk','06760','Ankara/Çubuk/06760',26),
('AD27','Türkiye','Ankara','Elmadað','06780','Ankara/Elmadað/06780',27),
('AD28','Türkiye','Ankara','Gölbaþý','06830','Ankara/Gölbaþý/06830',28),
('AD29','Türkiye','Ankara','Güdül','06842','Ankara/Güdül/06842',29),
('AD30','Türkiye','Ankara','Haymana','06860','Ankara/Haymana/06860',30),
('AD31','Türkiye','Ankara','Kalecik','06870','Ankara/Kalecik/06870',31),
('AD32','Türkiye','Ankara','Kazan','06980','Ankara/Kazan/06980',32),
('AD33','Türkiye','Ankara','Keçiören','06300','Ankara/Keçiören/06300',33),
('AD34','Türkiye','Ankara','Kýzýlcahamam','06890','Ankara/Kýzýlcahamam/06890',34),
('AD35','Türkiye','Ankara','Mamak','06620','Ankara/Mamak/06620',35),
('AD36','Türkiye','Ankara','Nallýhan','06922','Ankara/Nallýhan/06922',36),
('AD37','Türkiye','Ankara','Kazan','06980','Ankara/Kazan/06980',37),
('AD38','Türkiye','Ankara','Keçiören','06300','Ankara/Keçiören/06300',38),
('AD39','Türkiye','Ankara','Kýzýlcahamam','06890','Ankara/Kýzýlcahamam/06890',39),
('AD40','Türkiye','Ankara','Mamak','06620','Ankara/Mamak/06620',40);



 
insert into leaves(leaves_id,leave_reason,start_date,end_date,employee_id)
values
(101,'Maternity','2018/05/12','2018/11/12',2),
(102,'Maternity','2020/07/16','2021/01/16',5),
(103,'Maternity','2020/11/15','2021/05/15',11),
(104,'Maternity','2015/04/18','2015/10/18',19),
(105,'Maternity','2020/03/17','2020/09/17',26),
(106,'Maternity','2019/06/20','2019/12/20',27),
(107,'Maternity','2021/01/25','2021/07/25',30),
(108,'COVID19', '2020/09/11', '2020/09/25',4),
(109,'COVID19', '2021/03/05', '2021/03/19',13),
(110,'Maternity', '2019/04/12', '2019/12/11',20),
(111,'Work Accident', '2017/08/15', '2017/10/02',28),
(112, 'Maternity','2018/06/14','2021/07/12',24);




insert into child(personal_id ,child_name,child_surname,child_gender,child_birthdate)
values
(2,'Ali','Yýlmaz','M','2018/11/08'),
(5,'Fatma','Deniz','F','2021/01/06'),
(7,'Ebru','Dinçer','F','2021/01/09'),
(8,'Atakan','Þentürk','M','2021/01/11'),
(15,'Berat','Ak','M','2021/05/05'),
(19,'Melih','Bütüncü','M','2015/10/06'),
(26,'Baþar','Aydýn', 'M', '2020/09/12' ),
(30, 'Gamze','Çelik', 'F', '2021/07/16'),
(29, 'Faruk','Yardým', 'M', '1989/02/12'),
(12, 'Melike','Ertuðrul', 'F', '1980/09/22'),
(24, 'Pelin','Özsoy', 'F', '1985/11/23'),
(11, 'Efecan','Aydýn', 'M', '2016/10/29');


insert into shift(shift_no,starting_time,end_time,hours,dept_id,emp_id)
values
(500, '07.00','10.00',5,100,4),
(501, '10.00','13.00',4,100,5),
(502, '13.00','16.00',4,100,6),
(503, '16.00','19.00',4,100,7),
(504, '19.00','22.00',4,100,8),
(505, '22.00','01.00',4,100,9),
(506, '01.00','04.00',4,100,10),


(507, '08.00','16.00',8,200,11),
(508, '17.00','22.00',5,200,12),

(509, '07.00','10.00',3,300,18),
(510, '10.00','13.00',3,300,19),
(511, '13.00','16.00',3,300,20),
(512, '16.00','19.00',3,300,21),
(513, '19.00','22.00',3,300,22),


(514, '00.00','08.00',8,400,15),
(515, '08.00','16.00',8,400,16),
(516, '16.00','00.00',8,400,17),

(517, '07.00','10.00',3,500,23),
(518, '10.00','13.00',3,500,24),
(519, '13.00','16.00',3,500,25),
(520, '16.00','19.00',3,500,26),
(521, '19.00','22.00',3,500,27),

(522, '09.00','17.00',8,600,33),
(523, '18.00','00.00',6,600,34),

(524, '07.00','11.00',4,700,28),
(525, '11.00','15.00',4,700,29),
(526, '15.00','19.00',4,700,30),
(527, '19.00','23.00',4,700,31),
(528, '23.00','03.00',4,700,32),

(529, '08.00','12.00',4,800,39),
(530, '13.00','17.00',4,800,40),

(531, '00.00','12.00',12,900,13),
(532, '12.00','00.00',12,900,14),

(533, '08.00','14.00',6,1000,1),
(534, '14.00','21.00',7,1000,2),
(535, '21.00','04.00',7,1000,3),

(536, '00.00','06.00',6,1100,35),
(537, '06.00','12.00',6,1100,36),
(538, '12.00','18.00',6,1100,37),
(539, '18.00','00.00',6,1100,38);


update employee
set employee_salary = employee_salary * 1.05 , total_salary = total_salary *1.05
where id=1;

select *
from employee
where id=1;

update department 
set department_name = 'Information Technologies'
where department_id = 100;

select *
from department
where department_id =100;


update project
set due_date = '2021/08/01'
where project_no = 'P00';

select *
from project
where project_no = 'P00';


update address 
set district = 'Pursaklar', postal_code = '06145', address_text = 'Ankara/Pursaklar/06145'
where address_id = 'AD1';

select *
from address
where address_id = 'AD1';


update leaves
set end_date = '2021/03/01'
where leaves_id = 102;

select *
from leaves 
where leaves_id = 102;


update device
set device_name = '2020 MacBook Pro'
where device_id = 'A04';

select *
from device
where device_id = 'A04';

update shift
set end_time = '01.00', hours = 8
where shift_no = 504;

select *
from shift
where shift_no = 504;


update child
set child_name = 'Yasin'
where personal_id = 7;

select *
from child
where personal_id =7;


delete from shift
where shift_no = 501;

select *
from shift;


delete from child
where personal_id = 5;

select *
from child;


delete from device
where device_id = 'A02';

select *
from device;

delete from address
where address_id ='AD5';

select *
from address ;

insert into department(department_id,department_name)
values
(1200,'Temporary Department');

select *
from department;


insert into project(project_no ,project_name,starting_date,due_date,departmentid)
values
('P11', 'Temporary Project','1969-12-31','1969-12-31',1200);

select *
from project;

delete from project 
where project_no = 'P11';


delete from department 
where department_id = 1200;


delete from leaves 
where leaves_id = 102;

select *
from leaves ;


delete from employee
where id=5;

select *
from employee;


alter table device add device_type varchar(255);

select *
from device;

update device 
set device_type = 'Computer';

alter table device drop device_type;

select *
from device;


create view Employee_View as
select id, phone_number ,employee_name , employee_surname ,employee_gender
from employee;


insert into Employee_View(id,phone_number,employee_name, employee_surname, employee_gender)
values
(61,05991378994,'Arda','Geniþgörür','M'),
(62,05326618765,'Mehmet','Dargörür','M');


select *
from Employee_View;

delete from employee_view where id =62;

update employee_view  set phone_number = 05334445556
where id = 61;

select *
from Employee_View;










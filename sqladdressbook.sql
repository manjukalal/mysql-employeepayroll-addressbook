addressbookservice


//UC1 Creating database as AddessBookService

mysql> create database AddressBookService;
Query OK, 1 row affected (0.12 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| addressbookservice |
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (0.00 sec)

mysql> use addressbookservice;
Database changed

-------------------------------------------------------------------------------------------------------------------------------------
//UC2 Creating table as AddressBook with attributes


create table AddressBook(
     firstname varchar(50) not null,
     lastname varchar(50) not null,
     address varchar(100) not null,
     city varchar(50) not null,
     state varchar(50) not null,
     zip int not null,
     phonenumber double not null,
     email varchar(100) not null);
	 uery OK, 0 rows affected (2.29 sec)

mysql> desc AddressBook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstname   | varchar(50)  | NO   |     | NULL    |       |
| lastname    | varchar(50)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| city        | varchar(50)  | NO   |     | NULL    |       |
| state       | varchar(50)  | NO   |     | NULL    |       |
| zip         | int          | NO   |     | NULL    |       |
| phonenumber | double       | NO   |     | NULL    |       |
| email       | varchar(100) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.13 sec)

------------------------------------------------------------------------------------------------------------------------------------

//UC3 inserting new Contacts to AddressBook table

mysql> insert into AddressBook(firstname,lastname,address,city,state,zip,phonenumber,email) values('manju','kalal','hpt','hospet','KA',583201,8748856526,'manjukalal1496@gmail.com');
Query OK, 1 row affected (0.55 sec)


mysql> insert into AddressBook(firstname,lastname,address,city,state,zip,phonenumber,email) values('hari','motekar','dwd','dharwad','KA',5802001,9591956526,'hari123@gmail.com');
Query OK, 1 row affected (0.12 sec)

mysql>  insert into AddressBook(firstname,lastname,address,city,state,zip,phonenumber,email) values('srikanth','gdg','kpl','koppal','KA',5438977,8799865467,'srikanthgdg@gmail.com');
Query OK, 1 row affected (0.07 sec)


mysql> select * from AddressBook;
+-----------+----------+---------+---------+-------+---------+-------------+--------------------------+
| firstname | lastname | address | city    | state | zip     | phonenumber | email                    |
+-----------+----------+---------+---------+-------+---------+-------------+--------------------------+
| manju     | kalal    | hpt     | hospet  | KA    |  583201 |  8748856526 | manjukalal1496@gmail.com |
| hari      | motekar  | dwd     | dharwad | KA    | 5802001 |  9591956526 | hari123@gmail.com        |
| srikanth  | gdg      | kpl     | koppal  | KA    | 5438977 |  8799865467 | srikanthgdg@gmail.com    |
+-----------+----------+---------+---------+-------+---------+-------------+--------------------------+
3 rows in set (0.00 sec)


--------------------------------------------------------------------------------------------------------------------------------------------------------------------

//UC4 editing the existing contact by their firstname


mysql> update Addressbook set lastname='prabhukar' where firstname='manju';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Addressbook;
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+
| firstname | lastname  | address | city    | state | zip     | phonenumber | email                    |
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+
| manju     | prabhukar | hpt     | hospet  | KA    |  583201 |  8748856526 | manjukalal1496@gmail.com |
| hari      | motekar   | dwd     | dharwad | KA    | 5802001 |  9591956526 | hari123@gmail.com        |
| srikanth  | gdg       | kpl     | koppal  | KA    | 5438977 |  8799865467 | srikanthgdg@gmail.com    |
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+
3 rows in set (0.00 sec)


--------------------------------------------------------------------------------------------------------------------------------------
UC5 -deleting the contact by their lastname

mysql> delete from Addressbook where lastname='gdg';
Query OK, 1 row affected (0.13 sec)

mysql> select *from addressbook;
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+
| firstname | lastname  | address | city    | state | zip     | phonenumber | email                    |
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+
| manju     | prabhukar | hpt     | hospet  | KA    |  583201 |  8748856526 | manjukalal1496@gmail.com |
| hari      | motekar   | dwd     | dharwad | KA    | 5802001 |  9591956526 | hari123@gmail.com        |
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+
2 rows in set (0.00 sec)


-------------------------------------------------------------------------------------------------------------------------------------------------

// UC6 retrieving the contact by city or state


 select * from Addressbook where city='hospet' or state = 'KA';
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+
| firstname | lastname  | address | city    | state | zip     | phonenumber | email                    |
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+
| manju     | prabhukar | hpt     | hospet  | KA    |  583201 |  8748856526 | manjukalal1496@gmail.com |
| hari      | motekar   | dwd     | dharwad | KA    | 5802001 |  9591956526 | hari123@gmail.com        |
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+
2 rows in set (0.00 sec)


------------------------------------------------------------------------------------------------------------------------------------------------------

// UC7 size of addressbook by city and state


mysql> select count(firstname) from Addressbook where city='hospet';
+------------------+
| count(firstname) |
+------------------+
|                1 |
+------------------+
1 row in set (0.00 sec)

mysql> select count(firstname) from Addressbook where state='KA';
+------------------+
| count(firstname) |
+------------------+
|                2 |
+------------------+
1 row in set (0.00 sec)

---------------------------------------------------------------------------------------------------------------------------------------------------------------

// UC8 sorting the name alphbetically for given city

mysql> select firstname,city from Addressbook order by city;
+-----------+---------+
| firstname | city    |
+-----------+---------+
| hari      | dharwad |
| manju     | hospet  |
+-----------+---------+
2 rows in set (0.05 sec)


---------------------------------------------------------------------------------------------------------------------------------------------------------------

// UC9- altering the table with addressbook name and contact type

mysql>  alter table Addressbook add bookname varchar(50) not null,add contacttype varchar(50) not null;
Query OK, 0 rows affected (0.29 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  desc Addressbook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstname   | varchar(50)  | NO   |     | NULL    |       |
| lastname    | varchar(50)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| city        | varchar(50)  | NO   |     | NULL    |       |
| state       | varchar(50)  | NO   |     | NULL    |       |
| zip         | int          | NO   |     | NULL    |       |
| phonenumber | double       | NO   |     | NULL    |       |
| email       | varchar(100) | NO   |     | NULL    |       |
| bookname    | varchar(50)  | NO   |     | NULL    |       |
| contacttype | varchar(50)  | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
10 rows in set (0.00 sec)

mysql>  update Addressbook set bookname ='A great man',contacttype ='friend' where lastname='motekar';
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select *from addressbook;
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+-------------+-------------+
| firstname | lastname  | address | city    | state | zip     | phonenumber | email                    | bookname    | contacttype |
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+-------------+-------------+
| manju     | prabhukar | hpt     | hospet  | KA    |  583201 |  8748856526 | manjukalal1496@gmail.com |             |             |
| hari      | motekar   | dwd     | dharwad | KA    | 5802001 |  9591956526 | hari123@gmail.com        | A great man | friend      |
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+-------------+-------------+
2 rows in set (0.00 sec)


mysql>  select * from Addressbook where contacttype='friend';
+-----------+----------+---------+---------+-------+---------+-------------+-------------------+-------------+-------------+
| firstname | lastname | address | city    | state | zip     | phonenumber | email             | bookname    | contacttype |
+-----------+----------+---------+---------+-------+---------+-------------+-------------------+-------------+-------------+
| hari      | motekar  | dwd     | dharwad | KA    | 5802001 |  9591956526 | hari123@gmail.com | A great man | friend      |
+-----------+----------+---------+---------+-------+---------+-------------+-------------------+-------------+-------------+
1 row in set (0.00 sec)


-------------------------------------------------------------------------------------------------------------------------------------------------------------

//UC10 ability to get count of contacts by contacttype

mysql>  select count(firstname) from Addressbook where contacttype='friend';
+------------------+
| count(firstname) |
+------------------+
|                1 |
+------------------+
1 row in set (0.00 sec)


-------------------------------------------------------------------------------------------------------------------------------------------------------------

//UC11 ability to add person to friend and family

mysql> update Addressbook set bookname ='A great man',contacttype ='family' where lastname='motekar';
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select *from addressbook;
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+-------------+-------------+
| firstname | lastname  | address | city    | state | zip     | phonenumber | email                    | bookname    | contacttype |
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+-------------+-------------+
| manju     | prabhukar | hpt     | hospet  | KA    |  583201 |  8748856526 | manjukalal1496@gmail.com |             |             |
| hari      | motekar   | dwd     | dharwad | KA    | 5802001 |  9591956526 | hari123@gmail.com        | A great man | family      |
+-----------+-----------+---------+---------+-------+---------+-------------+--------------------------+-------------+-------------+
2 rows in set (0.00 sec)







































































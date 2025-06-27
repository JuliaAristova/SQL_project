CREATE TABLE cruise_customers(
 cruise_customer_id  NUMBER PRIMARY KEY,
 first_name          VARCHAR2(20),
 last_name           VARCHAR2(20)
);

INSERT INTO cruise_customers VALUES (1, 'Anna', 'Smith');
INSERT INTO cruise_customers VALUES (2, 'John', 'Slovensky');
INSERT INTO cruise_customers VALUES (3, 'Peter', 'Douglas');

CREATE TABLE contact_emails(
 contact_email_id  NUMBER(4) Primary Key,
 cruise_customer_id Number References cruise_customers (cruise_customer_id),
 email_address  VARCHAR2(90),
 email_type   VARCHAR2(10),
 status  VARCHAR(10)
);

Insert into contact_emails VALUES (1, 1, 'anna.smith@gmail.com', 'home','valid');
Insert into contact_emails VALUES (2, 2, 'John.slovensky@gmail.com', 'home','valid');
Insert into contact_emails VALUES (3, 3, 'peter.douglas@gmail.com', 'home','valid');

CREATE TABLE online_subscribers(
 online_subscirber_id  NUMBER PRIMARY KEY,
 sub_date		DATE,
 email  VARCHAR2(90),
 firstname          VARCHAR2(20),
 lastname           VARCHAR2(20),
 company	    VARCHAR2(30)
);

INSERT INTO online_subscribers VALUES (1, SYSDATE, 'potter77@yandex.com', 'Harry', 'Potter', 'Gryffindor Co.');
INSERT INTO online_subscribers VALUES (2, SYSDATE, 'Ron1234@yandex.com', 'Ron', 'Wizard', 'Miracle Corp');
INSERT INTO online_subscribers VALUES (3, SYSDATE, 'anna.smith@gmail.com', 'Anna', 'Smith', 'Apple');


select contact_email_id, email_address
from contact_emails
where status = 'valid'
UNION
select online_subscirber_id, email
from online_subscribers;

select email_address
from contact_emails
where status = 'valid'
UNION
select email
from online_subscribers
order by email_address;

select email_address
from contact_emails
where status = 'valid'
UNION ALL
select email
from online_subscribers
order by email_address;

select email_address
from contact_emails
where status = 'valid'
INTERSECT
select email
from online_subscribers
order by email_address;

select email_address
from contact_emails
where status = 'valid'
MINUS
select email
from online_subscribers
order by email_address;

select email
from online_subscribers
MINUS
select email_address
from contact_emails
where status = 'valid'
order by email;

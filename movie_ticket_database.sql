--this table stores data related to a movie name,movie time in which screen it is being played and tictet price
create table movie_info(sno number(2),movie_name varchar2(20),screen_name varchar2(20),
movie_time varchar2(10),ticket_price number(4)); 

--the values are inserted in movie_info table for movie details
insert into movie_info VALUES(1,'RRR','SCREEN-1','10:30 AM',110);
insert into movie_info VALUES(2,'RRR','SCREEN-2','1:30 PM',90);
insert into movie_info VALUES(3,'BAAHUBALI-2','SCREEN-1','4:30 PM',110);
insert into movie_info VALUES(4,'BAAHUBALI-2','SCREEN-2','9:30 PM',90);

--this table stores data related to booked tickets from a cinema hall for a movie.
create table booked_tickets(booking_id number(10),buyer_name varchar2(20),phone_num number(11),movie_name varchar2(20),
movie_screen varchar2(10),movie_time varchar2(10));

--this sequence related to booking_id's for customers
create sequence bookingid_seq start with 1000 increment by 3;

COMMIT;


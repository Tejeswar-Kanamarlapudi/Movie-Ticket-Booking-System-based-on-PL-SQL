--in these package contains procedures such as showmovie_details,ticket_insert,delete_ticket,book_ticket,cancel ticket
--by using these package we can keep procedures together
create or replace package movie_ticket is
    procedure showmovie_details;
    procedure ticket_insert(
        pname         booked_tickets.buyer_name%type,
        p_phonenum    booked_tickets.phone_num%type,
        pmovie_name   booked_tickets.movie_name%type,
        pmovie_screen booked_tickets.movie_screen%type,
        pmovie_time   booked_tickets.movie_time%type
    );
    procedure delete_ticket(
        p_bookid       booked_tickets.booking_id%type,
        pname1         booked_tickets.buyer_name%type,
        p_phonenum1    booked_tickets.phone_num%type
    );
    procedure book_ticket(
        option_val number,
        name_val booked_tickets.buyer_name%type,
        phone_val booked_tickets.phone_num%type,
        num_val number
    );
    procedure cancel_ticket(
    bookid_valu booked_tickets.booking_id%type,
    name_valu booked_tickets.buyer_name%type,
    ph_num_valu booked_tickets.phone_num%type
    );
end movie_ticket;
/

create or replace package body movie_ticket is

--it was a procedure to show movie details,in these procedure we show movie details by using cursors.
procedure showmovie_details is
    mv_name movie_info.movie_name%type;
    mv_screen movie_info.screen_name%type;
    mv_time movie_info.movie_time%type;
    tick_pric movie_info.ticket_price%type;
    
    cursor show_moviedetails is
    select movie_name,screen_name,movie_time,ticket_price from movie_info
    where sno<20;
begin
    open show_moviedetails;
    loop
        fetch show_moviedetails into mv_name,mv_screen,mv_time,tick_pric;
        exit when show_moviedetails%NOTFOUND;
        dbms_output.put_line('The '||mv_name||' movie was playing in '
        ||mv_screen||' on '||mv_time||' with the price of '||tick_pric||'Rs');
    end loop;
    close show_moviedetails;
end;

--With these procedure we can insert the ticket row when the customer buy the ticket
procedure ticket_insert
(
pname         booked_tickets.buyer_name%type,
p_phonenum    booked_tickets.phone_num%type,
pmovie_name   booked_tickets.movie_name%type,
pmovie_screen booked_tickets.movie_screen%type,
pmovie_time   booked_tickets.movie_time%type
)
as
begin
    insert into booked_tickets(booking_id,buyer_name,phone_num,movie_name,movie_screen,
    movie_time) values(bookingid_seq.nextval,pname,p_phonenum,pmovie_name,pmovie_screen,pmovie_time);
    dbms_output.put_line('Your booking id is '||bookingid_seq.nextval);
    commit;
end;

--With these procedure we can delete the ticket row when the customer cancel the ticket
procedure delete_ticket
(
    p_bookid       booked_tickets.booking_id%type,
    pname1         booked_tickets.buyer_name%type,
    p_phonenum1    booked_tickets.phone_num%type
)
as
begin
    delete from booked_tickets
    where buyer_name = pname1 and phone_num = p_phonenum1 and booking_id=p_bookid;
    dbms_output.put_line('Your ticket(s) was succuessfully cancelled');
    commit;
end;

--In these procedure contains functions and loops which helps to book ticket for user which price,movie,time and screen they choose
procedure book_ticket(option_val number,name_val booked_tickets.buyer_name%type,
phone_val booked_tickets.phone_num%type,num_val number) is
flag_val boolean := true;

begin
    dbms_output.put_line('Select your movie which you want to book through the above options');
    while flag_val loop
         for i_val in 1..num_val loop
            if option_val = 1 then
                ticket_insert(name_val,phone_val,'RRR','SCREEN-1','10:30 AM');
                --dbms_output.put_line('Your ticket was successfully booked');
            elsif option_val = 2 then
                ticket_insert(name_val,phone_val,'RRR','SCREEN-2','1:30 PM');
                --dbms_output.put_line('Your ticket was successfully booked');
            elsif option_val = 3 then
                ticket_insert(name_val,phone_val,'BAAHUBALI-2','SCREEN-1','4:30 PM');
                --dbms_output.put_line('Your ticket was successfully booked');
            elsif option_val = 4 then 
                ticket_insert(name_val,phone_val,'BAAHUBALI-2','SCREEN-2','9:30 PM');
                --dbms_output.put_line('Your ticket was successfully booked');
            else
                dbms_output.put_line('You selected wrong option');
            end if;
         end loop;
         dbms_output.put_line('Your ticket(s) was successfully booked');
        flag_val := false;
    end loop;
end;

--these procedure deletes the row and helpful when customer (or) buyer wants to cancel their tickets
procedure cancel_ticket(bookid_valu booked_tickets.booking_id%type,name_valu booked_tickets.buyer_name%type,ph_num_valu booked_tickets.phone_num%type) is
begin
    delete_ticket(bookid_valu,name_valu,ph_num_valu);
end;

end movie_ticket;
/


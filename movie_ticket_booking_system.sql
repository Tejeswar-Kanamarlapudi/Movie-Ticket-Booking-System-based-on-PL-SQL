---                 Simple Movie Ticket Booking System For One Theatre


set serveroutput on;


--                  BUY TICKET
/*
run the below block to buy the tickets
options will be displayed in ouput to choose which movie you want to buy
it will ask to enter number 1 to buy the ticket
if you enter any other number it simply says wrong option and you enterd details doesn't strore
after choose to buy it asks movie option which are starting dispalyed in output 
enter option which movie ticket and movie screen you want to buy in theatre
enter your name,phone number and how many tickets you want;
after it will display your ticket booking_id's and Your ticket(s) was successfully booked
*/
declare
l_option number;
l_name varchar2(20);
l_phone_num number;
l_no_of_tickets number;
choose_val number(1);
begin
    choose_val := &enter_option_1_to_buy_tickets;
    if choose_val=1 then
        movie_ticket.showmovie_details;
        l_option := &enter_your_option;
        l_name := &enter_your_name_in_single_quotes;
        l_phone_num := &enter_your_phone_number;
        l_no_of_tickets := &enter_no_of_tickets_you_want;
        movie_ticket.book_ticket(l_option,l_name,l_phone_num,l_no_of_tickets);
    else
        dbms_output.put_line('Please enter number 1 as option to buy tickets');
    end if;
end;
/


--             CANCEL TICKET
/*
run the below block to cancel the tickets
it will ask to enter number 2 to cancel the ticket
if you enter any other number it simply says wrong option and you enterd details doesn't strore
after choose to cancel it asks your name and phone number and booking_id
enter your name,phone number,book_id correctly otherwise tickets didn't cancel
if you enter correctly it shows Your ticket(s) was succuessfully cancelled
*/
declare
l_bookid number(10);
l_name varchar2(20);
l_phone_num number;
choose_val number(1);
begin
    choose_val := &enter_option_2_to_cancel_tickets;
    if choose_val=2 then
        l_bookid := &enter_your_bookingid;
        l_name := &enter_your_name_in_single_quotes;
        l_phone_num := &enter_your_phone_number;
        movie_ticket.cancel_ticket(l_bookid,l_name,l_phone_num);
    else
        dbms_output.put_line('Please enter number 2 as option for cancel tickets');
    end if;
end;
/



 

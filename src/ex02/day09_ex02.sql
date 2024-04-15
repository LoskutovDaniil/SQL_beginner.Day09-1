create table if not exists person_audit
(created timestamp with time zone not null default CURRENT_TIMESTAMP,
 type_event char(1) not null default 'I',
 row_id bigint not null,
 name varchar,
 age integer,
 gender varchar,
 address varchar,
 constraint ch_type_event CHECK (type_event IN('I', 'U', 'D'))
 );

create or replace function fnc_trg_person_delete_audit()
returns trigger as 
$$
  begin
    insert into person_audit(type_event, row_id, name, age, gender, address) values
    ('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    return new;
  end;
$$
language 'plpgsql';

create trigger trg_person_delete_audit after
delete
on person
for each row
execute procedure fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;
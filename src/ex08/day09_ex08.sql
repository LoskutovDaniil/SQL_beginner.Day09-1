create or replace function fnc_fibonacci(fib numeric  default 10)
returns numeric as
$$
declare
 a numeric;
 b numeric;
 c numeric;
begin
 a := 0;
 b := 1;
 if fib = 0 then
  return b;
 end if;
 for counter in 2..fib loop
  c := a + b;
  a := b;
  b := c;
    end loop;
 return b;
end;
$$
language 'plpgsql';
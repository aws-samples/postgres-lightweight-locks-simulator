create or replace function update_order(_range bigint)
returns text as $$
declare
  t1 timestamp;
  t2 timestamp;
  _age interval;
  _id bigint;
  rand integer;
  __range integer;
  rs text default 'Updated IDs';
  t text default '';
  v_idemp text default '';
  v_idemp1 text default '';
  rec_dels record;
  _updated_at_l timestamp;
  _updated_at_h timestamp;
  _text_updated_at_l text;
  _text_updated_at_h text;
  cursor_order cursor(_id bigint,_updated_at_l timestamp,_updated_at_h timestamp) 
                 for select id,int_notnull_1,int_notnull_2,int_notnull_3
                 from orders
                 where updated_at > _updated_at_l and  updated_at < _updated_at_h
                 and int_notnull_1 < 3
                 for update skip locked
                 limit 1;
begin
  _updated_at_l := NOW() - _range * interval '1 second';
  _updated_at_h := NOW() + _range * interval '1 second';
  open cursor_order(_id,_updated_at_l,_updated_at_h);
  loop
    select floor(random() * 10000 + 1)::int into rand;
    SELECT md5(RANDOM()::TEXT) into v_idemp;
    SELECT md5(RANDOM()::TEXT) into v_idemp1;
    --raise notice 'start to populate the cursor';
    select NOW() into t1;
    fetch cursor_order into rec_dels;	
    exit when not found;
    --raise notice 'finished to populate the cursor';
    select NOW() into t2;
    select age(t2,t1) into _age;
    --raise notice 'time taken is %',_age;
    update orders
    set updated_at=NOW(),timestamp_null_1=NOW(),timestamp_null_2=NOW(),timestamp_null_3=NOW(),timestamp_null_4=NOW(),timestamp_null_5=NOW(),timestamp_null_6=NOW(),timestamp_null_7=NOW(),timestamp_null_8=NOW(),timestamp_null_9=NOW(),timestamp_null_10=NOW(),timestamp_null_11=NOW(),timestamp_null_12=NOW(),timestamp_null_13=NOW(),timestamp_null_14=NOW(),timestamp_null_15=NOW(),timestamp_null_16=NOW(),timestamp_null_17=NOW(),timestamp_null_18=NOW(),timestamp_null_19=NOW(),timestamp_null_20=NOW(),timestamp_null_21=NOW(),timestamp_null_22=NOW(),int_notnull_1=int_notnull_1+1
    where id=rec_dels.id;
    rs:=rs||':'||rec_dels.id;    
  end loop;
  close cursor_order;
  return rs;
end; $$

language plpgsql;

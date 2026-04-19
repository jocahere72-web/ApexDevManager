
  CREATE OR REPLACE EDITIONABLE TRIGGER "TEMP_JSON_RCBO_PRTAL_IU"
  for insert or update on temp_json_rcbo_prtal
  compound trigger
before each row is
begin
if inserting then
if :new.id_temp_json_rcbo_prtal is null then
:new.id_temp_json_rcbo_prtal := sq_temp_json_rcbo_prtal.nextval;
end if;
end if;
end before each row;
end temp_json_rcbo_prtal_IU;


/
ALTER TRIGGER "TEMP_JSON_RCBO_PRTAL_IU" ENABLE;


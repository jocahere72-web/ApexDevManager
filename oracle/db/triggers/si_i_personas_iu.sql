
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_I_PERSONAS_IU"
  for insert or update on si_i_personas
  compound trigger
before each row is
begin
if inserting then
:new.id_prsna := sq_si_i_personas.nextval;
end if;
end before each row;
end si_i_personas_iu;





/
ALTER TRIGGER "SI_I_PERSONAS_IU" ENABLE;


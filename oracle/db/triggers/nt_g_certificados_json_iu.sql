
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_CERTIFICADOS_JSON_IU"
  before insert or update on NT_G_CERTIFICADOS_JSON
  for each row
begin
  if inserting then
    if :new.id_nt_crtfcdo_json is null then
      :new.id_nt_crtfcdo_json := SQ_NT_G_CERTIFICADOS_JSON.nextval;
    end if;
  end if;
end NT_G_CERTIFICADOS_JSON_IU;


/
ALTER TRIGGER "NT_G_CERTIFICADOS_JSON_IU" ENABLE;


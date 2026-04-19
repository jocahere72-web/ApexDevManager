
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_INTERMEDIA_DIAN_IU"
before insert on gi_g_intermedia_dian
for each row
declare
d             number;
begin

  if inserting then

    if :new.id_intrmdia_dian is null then
      d := sq_gi_g_intermedia_dian.nextval();
      :new.id_intrmdia_dian := d;
    end if;

  end if;
end ;




/
ALTER TRIGGER "GI_G_INTERMEDIA_DIAN_IU" ENABLE;


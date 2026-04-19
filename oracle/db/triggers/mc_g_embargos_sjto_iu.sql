
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_G_EMBARGOS_SJTO_IU"
  for insert on mc_g_embargos_sjto
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_embrgos_sjto is null then
        :new.id_embrgos_sjto := SQ_MC_G_EMBARGOS_SJTO.Nextval;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "MC_G_EMBARGOS_SJTO_IU" ENABLE;


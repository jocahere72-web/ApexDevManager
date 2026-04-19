
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_G_CONFECAMARAS_SJTO_LTE_IU"
  for insert on ws_g_confecamaras_sjto_lte
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_cnfcmra_sjto_lte is null then
        d := sq_ws_g_confecamaras_sjto_lte.nextval();
        :new.id_cnfcmra_sjto_lte := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_G_CONFECAMARAS_SJTO_LTE_IU" ENABLE;


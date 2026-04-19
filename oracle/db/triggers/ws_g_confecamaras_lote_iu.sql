
  CREATE OR REPLACE EDITIONABLE TRIGGER "WS_G_CONFECAMARAS_LOTE_IU"
  for insert on ws_g_confecamaras_lote
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_cnfcmra_lte is null then
        d := sq_ws_g_confecamaras_lote.nextval();
        :new.id_cnfcmra_lte := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "WS_G_CONFECAMARAS_LOTE_IU" ENABLE;


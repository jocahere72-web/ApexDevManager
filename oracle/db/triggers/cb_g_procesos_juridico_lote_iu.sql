
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PROCESOS_JURIDICO_LOTE_IU"
  for insert or update on cb_g_procesos_juridico_lote
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcso_jrdco_lte is null then
        :new.id_prcso_jrdco_lte := SQ_CB_G_PROCESOS_JURIDICO_LOTE.NEXTVAL;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_G_PROCESOS_JURIDICO_LOTE_IU" ENABLE;


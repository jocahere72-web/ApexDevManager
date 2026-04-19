
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PRCSOS_JRDCO_LTE_DTLLE_IU"
  for insert or update on cb_g_procesos_jrdco_lte_dtlle
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcso_jrdco_lte_dtlle is null then
        :new.id_prcso_jrdco_lte_dtlle := SQ_CB_G_PROCESOS_JRDCO_LTE_DTLLE.NEXTVAL;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_G_PRCSOS_JRDCO_LTE_DTLLE_IU" ENABLE;


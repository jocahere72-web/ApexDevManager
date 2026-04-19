
  CREATE OR REPLACE EDITIONABLE TRIGGER "CB_G_PRCSS_SM_SJTO_INXSTNTE_IU"
  for insert on cb_g_prcss_sm_sjto_inxstnte
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prcsos_smu_sjto_inxstnte is null then
        d := sq_cb_g_prcss_sm_sjto_inxstnte.nextval();
        :new.id_prcsos_smu_sjto_inxstnte := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "CB_G_PRCSS_SM_SJTO_INXSTNTE_IU" ENABLE;


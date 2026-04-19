
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PREDIOS_ESTRTO_LMT_IMP_IU"
  for insert on gi_d_predios_estrto_lmt_imp
  compound trigger
  d number;
  before each row is
  begin
    if inserting then
      d := sq_gi_d_predios_estrto_lmt_imp.nextval;
      :new.id_prdio_est_lmt_imp := d;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GI_D_PREDIOS_ESTRTO_LMT_IMP_IU" ENABLE;


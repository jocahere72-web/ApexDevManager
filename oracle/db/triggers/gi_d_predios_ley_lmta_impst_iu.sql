
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PREDIOS_LEY_LMTA_IMPST_IU"
  for insert on gi_d_predios_ley_lmta_impst
  compound trigger
  d number;
  before each row is
  begin
    if inserting then
      d := sq_gi_d_predios_ley_lmta_impst.nextval;
      :new.id_prdio_ley_lim_imp := d;
            :new.fcha_rgstro := sysdate;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GI_D_PREDIOS_LEY_LMTA_IMPST_IU" ENABLE;


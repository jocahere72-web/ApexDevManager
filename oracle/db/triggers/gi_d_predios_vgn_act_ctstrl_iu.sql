
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_PREDIOS_VGN_ACT_CTSTRL_IU"
  for insert on gi_d_predios_vgn_act_ctstrl
  compound trigger
  d number;
  before each row is
  begin
    if inserting then
      d := sq_gi_d_predios_vgn_act_ctstrl.nextval;
      :new.id_prdio_vgn_act_cts := d;
            :new.fcha_rgstro := sysdate;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GI_D_PREDIOS_VGN_ACT_CTSTRL_IU" ENABLE;


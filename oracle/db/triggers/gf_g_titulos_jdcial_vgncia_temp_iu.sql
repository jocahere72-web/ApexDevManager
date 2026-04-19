
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_TITULOS_JDCIAL_VGNCIA_TEMP_IU"
  for insert or update on gf_g_titulos_jdcial_vgncia_temp
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_ttlo_jdcial_vgncia_tmp is null then
        :new.id_ttlo_jdcial_vgncia_tmp := sq_gf_g_titulos_jdcial_vgncia_temp.nextval;
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "GF_G_TITULOS_JDCIAL_VGNCIA_TEMP_IU" ENABLE;


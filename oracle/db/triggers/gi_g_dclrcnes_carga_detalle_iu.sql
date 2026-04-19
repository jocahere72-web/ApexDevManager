
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DCLRCNES_CARGA_DETALLE_IU"
  for insert on gi_g_dclrcnes_carga_detalle
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_dclrcnes_crga_dtlle is null then
        d := sq_gi_g_dclrcnes_carga_detalle.nextval;
        :new.id_dclrcnes_crga_dtlle := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GI_G_DCLRCNES_CARGA_DETALLE_IU" ENABLE;



  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DCLRCNES_CRGA_IU"
  for insert on gi_g_dclrcnes_crga
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_dclrcnes_crga is null then
        d := sq_gi_g_dclrcnes_crga.nextval;
        :new.id_dclrcnes_crga := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GI_G_DCLRCNES_CRGA_IU" ENABLE;


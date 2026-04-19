
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_NOVEDADES_PRDIO_CRGUE_IU"
  for insert on si_g_novedades_prdio_crgue
  compound trigger
  d   number;
  before each row is
  begin
    if inserting then
      d := sq_si_g_novedades_prdio_crgue.nextval;
      :new.id_nvdad_prdio_crgue  := d;
    end if;
  end before each row;
end;



/
ALTER TRIGGER "SI_G_NOVEDADES_PRDIO_CRGUE_IU" ENABLE;


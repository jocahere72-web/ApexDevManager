
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_NOVEDADES_PRDIO_RSUMEN_IU"
  for insert on si_g_novedades_prdio_rsumen
  compound trigger
  d   number;
  before each row is
  begin
    if inserting then
      d := sq_si_g_novedades_prdio_rsumen.nextval;
      :new.id_nvdad_prdio_rsmen  := d;
    end if;
  end before each row;
end;



/
ALTER TRIGGER "SI_G_NOVEDADES_PRDIO_RSUMEN_IU" ENABLE;


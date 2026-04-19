
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_REPORTES_IMPRESION_IU"
  for insert on gn_g_reportes_impresion
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_rprte_imprsion is null then
        d := sq_gn_g_reportes_impresion.nextval;
        :new.id_rprte_imprsion := d;
        :new.fcha_rgstro := systimestamp;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GN_G_REPORTES_IMPRESION_IU" ENABLE;



  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_DOCUMENTOS_AD_VEHICULO_IU"
  for insert or update on re_g_documentos_ad_vehiculo
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_dcmnto_ad_vhclo is null then

        d := sq_re_g_documentos_ad_vehiculo.nextval;
        :new.id_dcmnto_ad_vhclo := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "RE_G_DOCUMENTOS_AD_VEHICULO_IU" ENABLE;


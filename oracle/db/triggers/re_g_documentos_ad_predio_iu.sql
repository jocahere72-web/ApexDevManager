
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_DOCUMENTOS_AD_PREDIO_IU"
  for insert or update on re_g_documentos_ad_predio
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_dcmnto_ad_prdio is null then

        d := sq_re_g_documentos_ad_predio.nextval;
        :new.id_dcmnto_ad_prdio := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "RE_G_DOCUMENTOS_AD_PREDIO_IU" ENABLE;


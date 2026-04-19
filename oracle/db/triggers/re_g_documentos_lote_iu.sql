
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_DOCUMENTOS_LOTE_IU"
  for insert or update on re_g_documentos_lote
  compound trigger
  d number;
    v_vlor_ttal number;

  before each row is
  begin
    if inserting then
      if :new.id_dcmnto_lte is null then
        d := sq_re_g_documentos_lote.nextval;
        :new.id_dcmnto_lte := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "RE_G_DOCUMENTOS_LOTE_IU" ENABLE;



  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_REGENERAR_ACTOS_TRAZA_IU"
  for insert or update on gn_g_regenerar_actos_traza
  compound trigger
    before each row is
    begin
    if inserting then
      if :new.id_rgnrar_acto is null then
        :new.id_rgnrar_acto := sq_gn_g_regenerar_actos_traza.nextval();
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "GN_G_REGENERAR_ACTOS_TRAZA_IU" ENABLE;


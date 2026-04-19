
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_COLA_PTCNES_RGNRA_ACTO_IU"
  for insert or update on gn_g_cola_ptcnes_rgnra_acto
  compound trigger
    before each row is
    begin
    if inserting then
      if :new.id_peticion is null then
        :new.id_peticion := sq_gn_g_cola_ptcnes_rgnra_acto.nextval();
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "GN_G_COLA_PTCNES_RGNRA_ACTO_IU" ENABLE;


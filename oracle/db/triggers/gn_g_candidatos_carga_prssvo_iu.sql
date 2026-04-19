
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_G_CANDIDATOS_CARGA_PRSSVO_IU"
  for insert on GN_G_CANDIDATOS_CARGA_PRSSVO
    compound trigger
    d number;
    before each row is
    begin
    if inserting then
      if :new.id_cnddto_crga_prssvo is null then
      d := sq_gn_g_candidatos_carga_prssvo.nextval();
      :new.id_cnddto_crga_prssvo := d;
      :new.fcha_rgstro := systimestamp;
      end if;
    end if;
  end before each row;
end;
/
ALTER TRIGGER "GN_G_CANDIDATOS_CARGA_PRSSVO_IU" ENABLE;


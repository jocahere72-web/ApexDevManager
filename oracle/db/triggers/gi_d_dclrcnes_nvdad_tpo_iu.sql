
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_DCLRCNES_NVDAD_TPO_IU"
  for insert or update on gi_d_dclrcnes_nvdad_tpo
  compound trigger  d number;

  before each row is
  begin
    if inserting then
      if :new.id_nvdad_tpo is null then
        d                 := sq_gi_d_dclrcnes_nvdad_tpo.nextval();
        :new.id_nvdad_tpo := d;
      end if;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "GI_D_DCLRCNES_NVDAD_TPO_IU" ENABLE;



  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_NOVEDADES_PREDIAL_T5_IU"
  for insert on si_g_novedades_predial_t5
  compound trigger

  before each row is
  begin
    if inserting then
      :new.id_nvdad_prdial_t5 := sq_si_g_novedades_predial_t5.nextval;
    end if;
  end before each row;
end;



/
ALTER TRIGGER "SI_G_NOVEDADES_PREDIAL_T5_IU" ENABLE;


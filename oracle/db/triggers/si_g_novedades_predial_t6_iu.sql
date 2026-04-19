
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_NOVEDADES_PREDIAL_T6_IU"
  for insert on si_g_novedades_predial_t6
  compound trigger

  before each row is
  begin
    if inserting then
      :new.id_nvdad_prdial_t6 := sq_si_g_novedades_predial_t6.nextval;
    end if;
  end before each row;
end;



/
ALTER TRIGGER "SI_G_NOVEDADES_PREDIAL_T6_IU" ENABLE;


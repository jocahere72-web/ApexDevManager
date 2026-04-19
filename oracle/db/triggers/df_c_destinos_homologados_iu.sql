
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_DESTINOS_HOMOLOGADOS_IU"
  for insert on df_c_destinos_homologados
  compound trigger

  before each row is
  begin
    if inserting then
      :new.id_dstno_hmlgdo := sq_df_c_destinos_homologados.nextval;
    end if;
  end before each row;
end;


/
ALTER TRIGGER "DF_C_DESTINOS_HOMOLOGADOS_IU" ENABLE;


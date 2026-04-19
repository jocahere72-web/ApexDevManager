
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_C_NOVDAD_PRRZCION_PREDIO_IU"
for insert on df_c_novdad_prrzcion_predio
compound trigger
    d   number;
	before each row is
    begin
        if inserting then
            select nvl(max(id_nvdad_prdio) + 1, 1) into d from df_c_novdad_prrzcion_predio;
            :new.id_nvdad_prdio := d;
        end if;
    end before each row;
end df_c_novdad_prrzcion_predio_iu;


/
ALTER TRIGGER "DF_C_NOVDAD_PRRZCION_PREDIO_IU" ENABLE;


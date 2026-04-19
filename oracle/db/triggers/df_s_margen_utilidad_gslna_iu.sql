
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_MARGEN_UTILIDAD_GSLNA_IU"
  for insert or update on df_s_margen_utilidad_gslna
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_mrgen_utldad_gslna := sq_df_s_margen_utilidad_gslna.nextval;
		end if;
	end before each row;
end df_s_margen_utilidad_gslna_iu;




/
ALTER TRIGGER "DF_S_MARGEN_UTILIDAD_GSLNA_IU" ENABLE;



  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_SANCIONES_IU"
  for insert or update on gi_d_sanciones
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_sncion := sq_gi_d_sanciones.nextval;
		end if;
	end before each row;

end gi_d_sanciones_iu;






/
ALTER TRIGGER "GI_D_SANCIONES_IU" ENABLE;



  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FORMULARIOS_INSTRUCTIVO_IU"
for insert or update on gi_d_formularios_instructivo
compound trigger
	before each row is
	begin
		if inserting then
			:new.id_frmlrio_instrctvo := sq_gi_d_frmulrs_instrctvo.nextval;
		end if;
	end before each row;
end gi_d_formularios_instructivo_iu;




/
ALTER TRIGGER "GI_D_FORMULARIOS_INSTRUCTIVO_IU" ENABLE;


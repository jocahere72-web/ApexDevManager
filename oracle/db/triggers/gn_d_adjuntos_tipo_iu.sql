
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_ADJUNTOS_TIPO_IU"
	for insert on gn_d_adjuntos_tipo
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_adjnto_tpo is null then
				:new.id_adjnto_tpo := sq_gn_d_adjuntos_tipo.nextval;
			end if;
		end if;
	end before each row;

end gn_d_adjuntos_tipo_iu;


/
ALTER TRIGGER "GN_D_ADJUNTOS_TIPO_IU" ENABLE;


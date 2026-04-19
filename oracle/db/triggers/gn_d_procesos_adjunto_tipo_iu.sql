
  CREATE OR REPLACE EDITIONABLE TRIGGER "GN_D_PROCESOS_ADJUNTO_TIPO_IU"
	for insert on gn_d_procesos_adjunto_tipo
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_prcsos_adjnto_tpo is null then
				:new.id_prcsos_adjnto_tpo := sq_gn_d_procesos_adjunto_tipo.nextval;
			end if;
		end if;
	end before each row;

end gn_d_procesos_adjunto_tipo_iu;


/
ALTER TRIGGER "GN_D_PROCESOS_ADJUNTO_TIPO_IU" ENABLE;



  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_TIPOS_DESTINO_ENTIDAD_IU"
	for insert or update on mc_d_tipos_destino_entidad
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_tpos_dstno_entdad is null then

				select nvl(max(id_tpos_dstno_entdad)+1, 1) into d
				  from mc_d_tipos_destino_entidad;
				:new.id_tpos_dstno_entdad := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_TIPOS_DESTINO_ENTIDAD_IU" ENABLE;


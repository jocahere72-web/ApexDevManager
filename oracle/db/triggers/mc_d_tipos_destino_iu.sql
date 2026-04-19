
  CREATE OR REPLACE EDITIONABLE TRIGGER "MC_D_TIPOS_DESTINO_IU"
	for insert or update on mc_d_Tipos_destino
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_tpos_dstno is null then

				select nvl(max(id_tpos_dstno)+1, 1) into d
				  from mc_d_Tipos_destino;
				:new.id_tpos_dstno := d;

			end if;
		end if;
	end before each row;
end;





/
ALTER TRIGGER "MC_D_TIPOS_DESTINO_IU" ENABLE;


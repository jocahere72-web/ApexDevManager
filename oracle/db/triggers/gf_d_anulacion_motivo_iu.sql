
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_ANULACION_MOTIVO_IU"
	for insert or update on gf_d_anulacion_motivo
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_mtvo_anlcn is null then

				select nvl(max(id_mtvo_anlcn)+1, 1) into d
				  from gf_d_anulacion_motivo;
				:new.id_mtvo_anlcn := d;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_D_ANULACION_MOTIVO_IU" ENABLE;



  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_SALDOS_FVOR_MTVO_AJSTE_IU"
	for insert or update on gf_d_saldos_fvor_mtvo_ajste
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_sldo_fvor_mtvo_ajste is null then

				select nvl(max(id_sldo_fvor_mtvo_ajste)+1, 1) into d
				  from gf_d_saldos_fvor_mtvo_ajste;
				:new.id_sldo_fvor_mtvo_ajste := d;

			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GF_D_SALDOS_FVOR_MTVO_AJSTE_IU" ENABLE;


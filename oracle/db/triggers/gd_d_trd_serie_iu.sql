
  CREATE OR REPLACE EDITIONABLE TRIGGER "GD_D_TRD_SERIE_IU"
	for insert or update on gd_d_trd_serie
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_trd_srie is null then
				select nvl( max(id_trd_srie), 0 ) + 1  into d
				from gd_d_trd_serie;
				:new.id_trd_srie := d;
			end if;
		end if;

        :new.indcdor_dspccion_ct := nvl(:new.indcdor_dspccion_ct,'N');
		:new.indcdor_dspccion_e  := nvl(:new.indcdor_dspccion_e ,'N');
		:new.indcdor_dspccion_s  := nvl(:new.indcdor_dspccion_s ,'N');
		:new.indcdor_dspccion_md := nvl(:new.indcdor_dspccion_md,'N');

	end before each row;
end gd_d_trd_serie_iu;






/
ALTER TRIGGER "GD_D_TRD_SERIE_IU" ENABLE;


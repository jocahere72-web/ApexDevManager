
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_DTRMNCNES_FCHA_VNCMNTO_IU"
	for insert or update on gi_g_dtrmncnes_fcha_vncmnto
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_dtrmncion_fcha_vncmnto is null then
			:new.id_dtrmncion_fcha_vncmnto := sq_gi_g_dtrmncnes_fcha_vncmnto.nextval;
			end if;
		end if;
	end before each row;
end;







/
ALTER TRIGGER "GI_G_DTRMNCNES_FCHA_VNCMNTO_IU" ENABLE;


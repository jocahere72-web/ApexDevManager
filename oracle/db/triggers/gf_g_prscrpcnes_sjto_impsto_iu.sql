
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_PRSCRPCNES_SJTO_IMPSTO_IU"
  for insert or update on gf_g_prscrpcnes_sjto_impsto
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_prscrpcion_sjto_impsto := sq_gf_g_prscrpcnes_sjto_impsto.nextval;
		end if;
	end before each row;
end gf_g_prscrpcnes_sjto_impsto_iu;






/
ALTER TRIGGER "GF_G_PRSCRPCNES_SJTO_IMPSTO_IU" ENABLE;


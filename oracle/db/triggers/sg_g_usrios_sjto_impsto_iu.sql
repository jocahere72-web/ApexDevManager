
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_USRIOS_SJTO_IMPSTO_IU"
  for insert or update on sg_g_usrios_sjto_impsto
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_usrios_sjto_impsto := sq_sg_g_usrios_sjto_impsto.nextval;
			:new.fcha_dgta := systimestamp;
		elsif updating then
			:new.fcha_mdfca := systimestamp;
		end if;
	end before each row;
end sg_g_usrios_sjto_impsto_iu;





/
ALTER TRIGGER "SG_G_USRIOS_SJTO_IMPSTO_IU" ENABLE;


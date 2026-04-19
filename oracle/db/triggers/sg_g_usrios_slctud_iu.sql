
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_USRIOS_SLCTUD_IU"
  for insert or update on sg_g_usrios_slctud
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_usrio_slctud := sq_sg_g_usrios_slctud.nextval;
			:new.user_dgta := user;
			:new.fcha_dgta := systimestamp;
		elsif updating then
			:new.user_mdfca := user;
			:new.fcha_mdfca := systimestamp;
		end if;
	end before each row;
end sg_g_usrios_slctud_iu;





/
ALTER TRIGGER "SG_G_USRIOS_SLCTUD_IU" ENABLE;


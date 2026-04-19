
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_CNTRTOS_TPO_IMPSTO_ACT_IU"
  for insert or update on df_i_cntrtos_tpo_impsto_act
  compound trigger
	before each row is
	begin
		if inserting then
			:new.id_cntrto_tpo_impsto_acto := sq_df_i_cntrtos_tpo_impsto_act.nextval;
		end if;
	end before each row;
end df_i_cntrtos_tpo_impsto_act_iu;




/
ALTER TRIGGER "DF_I_CNTRTOS_TPO_IMPSTO_ACT_IU" ENABLE;


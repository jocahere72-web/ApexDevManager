
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_GRUPOS_ACTO_IMPSTO_ACT_IU"
for insert or update on df_i_grupos_acto_impsto_act
	compound trigger
	before each row is
	begin
		if inserting then
			:new.id_grpo_acto_imps_acto := sq_df_i_grupos_acto_impsto_act.nextval;
		end if;
	end before each row;
end df_i_grupos_acto_impsto_act_iu;



/
ALTER TRIGGER "DF_I_GRUPOS_ACTO_IMPSTO_ACT_IU" ENABLE;


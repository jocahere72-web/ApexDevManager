
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_S_HMLGCNES_TRMTE_CTSTROPRO_IU"
	for insert on df_s_hmlgcnes_trmte_ctstropro
	compound trigger

	before each row is
	begin
		if inserting then
			if :new.id_trmte_ctstropro is null then
				:new.id_trmte_ctstropro  := sq_df_s_hmlgcnes_trmte_ctstrpr.nextval;
			end if;
		end if;
	end before each row;
end;
/
ALTER TRIGGER "DF_S_HMLGCNES_TRMTE_CTSTROPRO_IU" ENABLE;


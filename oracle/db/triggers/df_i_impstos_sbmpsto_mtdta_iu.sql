
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_IMPSTOS_SBMPSTO_MTDTA_IU"
	for insert or update on df_i_impstos_sbmpsto_mtdta
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_impsto_sbmpsto_mtdta is null then

				select nvl(max(id_impsto_sbmpsto_mtdta)+1, 1) into d
				  from df_i_impstos_sbmpsto_mtdta;
				:new.id_impsto_sbmpsto_mtdta := d;

			end if;
		end if;
	end before each row;
end;






/
ALTER TRIGGER "DF_I_IMPSTOS_SBMPSTO_MTDTA_IU" ENABLE;


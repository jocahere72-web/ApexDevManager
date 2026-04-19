
  CREATE OR REPLACE EDITIONABLE TRIGGER "PQ_G_SLCTDES_MTVO_SJT_IMPST_IU"
	for insert or update on pq_g_slctdes_mtvo_sjt_impst
	compound trigger
	d number;

	before each row is
	begin
		if inserting then
			if :new.id_slctud_mtvo_sjto_impsto is null then
				d := sq_pq_g_slctdes_mtvo_sjt_impst.nextval;
				:new.id_slctud_mtvo_sjto_impsto := d;
			end if;
		end if;
	end before each row;
end;



/
ALTER TRIGGER "PQ_G_SLCTDES_MTVO_SJT_IMPST_IU" ENABLE;


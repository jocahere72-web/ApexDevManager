
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_CAUSALES_RECHAZO_IU"
for insert or update on df_i_causales_rechazo
compound trigger
d number;

before each row is
begin
	if inserting then
		if :new.id_csal_rchzo is null then

			select nvl(max(id_csal_rchzo)+1, 1) into d
			  from df_i_causales_rechazo;
			:new.id_csal_rchzo := d;
		end if;
	end if;
end before each row;
end;



/
ALTER TRIGGER "DF_I_CAUSALES_RECHAZO_IU" ENABLE;


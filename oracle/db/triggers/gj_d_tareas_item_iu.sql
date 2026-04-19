
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_D_TAREAS_ITEM_IU"
  for insert or update on gj_d_tareas_item
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_trea_item is null then
  			d := sq_gj_d_tareas_item.nextval();
  			:new.id_trea_item := d;
  		end if;
  	end if;
  end before each row;
end gj_d_tareas_item_iu;


/
ALTER TRIGGER "GJ_D_TAREAS_ITEM_IU" ENABLE;


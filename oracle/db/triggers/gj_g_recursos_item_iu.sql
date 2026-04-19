
  CREATE OR REPLACE EDITIONABLE TRIGGER "GJ_G_RECURSOS_ITEM_IU"
  for insert or update on gj_g_recursos_item
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_rcrso_item is null then
  			d := sq_gj_g_recursos_item.nextval();
  			:new.id_rcrso_item := d;
  		end if;
  	end if;
  end before each row;
end gj_g_recursos_item_iu;


/
ALTER TRIGGER "GJ_G_RECURSOS_ITEM_IU" ENABLE;


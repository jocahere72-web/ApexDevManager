
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_PRESENTACION_PERSONAL_IU"
  for insert or update on nt_g_presentacion_personal
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_prsntcion_prsnal is null then
  			select nvl( max(id_prsntcion_prsnal), 0 ) + 1  into d
  			from nt_g_presentacion_personal;
  			:new.id_prsntcion_prsnal := d;
  		end if;
  	end if;
  end before each row;
end nt_g_presentacion_personal_iu;








/
ALTER TRIGGER "NT_G_PRESENTACION_PERSONAL_IU" ENABLE;



  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_D_CAUSALES_ENTIDAD_IU"
  for insert or update on nt_d_causales_entidad
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_csal_entdad is null then
  			select nvl( max(id_csal_entdad), 0 ) + 1  into d
  			from nt_d_causales_entidad;
  			:new.id_csal_entdad := d;
  		end if;
  	end if;
  end before each row;
end nt_d_causales_entidad_iu;








/
ALTER TRIGGER "NT_D_CAUSALES_ENTIDAD_IU" ENABLE;


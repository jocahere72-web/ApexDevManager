
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_CORREO_CERTIFICADO_IU"
  for insert or update on nt_g_correo_certificado
  compound trigger
  d number;

  before each row is
  begin
  	if inserting then
  		if :new.id_crreo_certificado is null then
  			select nvl( max(id_crreo_certificado), 0 ) + 1  into d
  			from nt_g_correo_certificado;
  			:new.id_crreo_certificado := d;
  		end if;
  	end if;
  end before each row;
end nt_g_correo_certificado_iu;








/
ALTER TRIGGER "NT_G_CORREO_CERTIFICADO_IU" ENABLE;


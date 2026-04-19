
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_PERFILES_BOTON_IU"
for insert or update on sg_g_perfiles_boton

compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prfil_bton is null then
        select nvl( max(id_prfil_bton), 0 ) + 1  into d
        from sg_g_perfiles_boton;
        :new.id_prfil_bton := d;
      end if;

    end if;
  end before each row;

end;









/
ALTER TRIGGER "SG_G_PERFILES_BOTON_IU" ENABLE;


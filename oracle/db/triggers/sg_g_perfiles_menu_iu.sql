
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_PERFILES_MENU_IU"
  for insert or update on sg_g_perfiles_menu

compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prfil_mnu is null then
        select nvl( max(id_prfil_mnu), 0 ) + 1  into d
        from sg_g_perfiles_menu;
        :new.id_prfil_mnu := d;
      end if;

    end if;
  end before each row;

end;









/
ALTER TRIGGER "SG_G_PERFILES_MENU_IU" ENABLE;


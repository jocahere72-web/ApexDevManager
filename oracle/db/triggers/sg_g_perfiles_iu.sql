
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_PERFILES_IU"
  for insert or update on sg_g_perfiles

compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prfil is null then
        select nvl( max(id_prfil), 0 ) + 1  into d
        from sg_g_perfiles;
        :new.id_prfil := d;
      end if;

    end if;
  end before each row;

end;









/
ALTER TRIGGER "SG_G_PERFILES_IU" ENABLE;


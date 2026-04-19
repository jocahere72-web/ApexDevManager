
  CREATE OR REPLACE EDITIONABLE TRIGGER "SG_G_PERFILES_REGION_IU"
  for insert or update on sg_g_perfiles_region

compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_prfil_rgion is null then
        select nvl( max(id_prfil_rgion), 0 ) + 1  into d
        from sg_g_perfiles_region;
        :new.id_prfil_rgion := d;
      end if;

    end if;
  end before each row;

end;









/
ALTER TRIGGER "SG_G_PERFILES_REGION_IU" ENABLE;


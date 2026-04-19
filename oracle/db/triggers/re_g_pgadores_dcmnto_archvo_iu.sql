
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_PGADORES_DCMNTO_ARCHVO_IU"
  for insert on re_g_pgadores_dcmnto_archvo
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_pgdor_dcmnto_archvo is null then
        d := sq_re_g_pgadores_dcmnto_archvo.nextval();
        :new.id_pgdor_dcmnto_archvo := d;
        :new.fcha_rgstro := systimestamp;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "RE_G_PGADORES_DCMNTO_ARCHVO_IU" ENABLE;


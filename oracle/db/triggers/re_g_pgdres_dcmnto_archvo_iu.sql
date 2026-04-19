
  CREATE OR REPLACE EDITIONABLE TRIGGER "RE_G_PGDRES_DCMNTO_ARCHVO_IU"
  for insert on re_g_pgdres_dcmnto_archvo
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_pgdor_dcmnto_archvo is null then
        d := sq_re_g_pgdres_dcmnto_archvo.nextval();
        :new.id_pgdor_dcmnto_archvo := d;
      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "RE_G_PGDRES_DCMNTO_ARCHVO_IU" ENABLE;


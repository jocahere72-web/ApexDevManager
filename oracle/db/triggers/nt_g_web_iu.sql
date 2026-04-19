
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_WEB_IU"
  for insert or update on nt_g_web
  compound trigger
    before each row is
        begin
            if inserting then
                if :new.id_env_web is null then
                    :new.id_env_web := sq_nt_g_web.nextval;
                end if;
            end if;
        end before each row;
    end;


/
ALTER TRIGGER "NT_G_WEB_IU" ENABLE;


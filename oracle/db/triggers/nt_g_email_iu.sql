
  CREATE OR REPLACE EDITIONABLE TRIGGER "NT_G_EMAIL_IU"
     for insert or update on nt_g_email
     compound trigger
     before each row is
        begin
            if inserting then
                if :new.id_eml_pntual is null then
                    :new.id_eml_pntual := sq_nt_g_email.nextval;
                end if;
            end if;
        end before each row;
    end;


/
ALTER TRIGGER "NT_G_EMAIL_IU" ENABLE;


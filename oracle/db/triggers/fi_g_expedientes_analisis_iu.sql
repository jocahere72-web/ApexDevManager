
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_EXPEDIENTES_ANALISIS_IU"
for insert or update on fi_g_expedientes_analisis
compound trigger
d number;
before each row is
begin
if inserting then
    if :new.id_expdnte_anlsis is null then

        d := sq_fi_g_expedientes_analisis.nextval();
        :new.id_expdnte_anlsis := d;
    end if;
end if;
end before each row;
end;


/
ALTER TRIGGER "FI_G_EXPEDIENTES_ANALISIS_IU" ENABLE;


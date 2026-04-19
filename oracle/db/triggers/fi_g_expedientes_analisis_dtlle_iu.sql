
  CREATE OR REPLACE EDITIONABLE TRIGGER "FI_G_EXPEDIENTES_ANALISIS_DTLLE_IU"
for insert or update on fi_g_expndnts_anlsis_dtlle
compound trigger
d number;
before each row is
begin
if inserting then
	if :new.id_expdnte_anlsis_dtll is null then

		d := sq_fi_g_expndntes_anlss_dtlle.nextval();
		:new.id_expdnte_anlsis_dtll := d;
	end if;
end if;
end before each row;
end;



/
ALTER TRIGGER "FI_G_EXPEDIENTES_ANALISIS_DTLLE_IU" ENABLE;


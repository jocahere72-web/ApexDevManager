
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_PLSVLIA_DTLLE_OFCIO_IU"

 for insert or update on GI_G_PLSVLIA_DTLLE_OFCIO compound trigger

	d number;

	before each row is
	begin
		if inserting then
			if :new.ID_PLSVLIA_DTLLE_OFCIO is null then

				select nvl(max(ID_PLSVLIA_DTLLE_OFCIO)+1, 1) into d from GI_G_PLSVLIA_DTLLE_OFCIO;
				:new.ID_PLSVLIA_DTLLE_OFCIO := d;

			end if;
		end if;
	end before each row;
END;





/
ALTER TRIGGER "GI_G_PLSVLIA_DTLLE_OFCIO_IU" ENABLE;


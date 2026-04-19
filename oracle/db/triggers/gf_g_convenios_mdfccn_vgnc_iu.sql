
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_CONVENIOS_MDFCCN_VGNC_IU"

  for insert or update on gf_g_convenios_mdfccn_vgnc
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_cnvnio_mdfccn_vgncia is null then

        d := sq_gf_g_convenios_mdfccn_vgnc.nextval;
        :new.id_cnvnio_mdfccn_vgncia := d;

      end if;
    end if;
  end before each row;
end;




/
ALTER TRIGGER "GF_G_CONVENIOS_MDFCCN_VGNC_IU" ENABLE;


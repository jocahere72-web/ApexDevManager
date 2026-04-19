
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_G_SLDOS_FVR_DCMN_OBSRVCN_IU"
  for insert or update on gf_g_sldos_fvr_dcmn_obsrvcn
  compound trigger
  d number;

  before each row is
  begin
    if inserting then
      if :new.id_sldos_fvr_dcmn_obsrvcn is null then

        d := sq_gf_g_sldos_fvr_dcmn_obsrvcn.nextval;
        :new.id_sldos_fvr_dcmn_obsrvcn := d;

      end if;
    end if;
  end before each row;
end;



/
ALTER TRIGGER "GF_G_SLDOS_FVR_DCMN_OBSRVCN_IU" ENABLE;


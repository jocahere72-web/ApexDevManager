
  CREATE OR REPLACE EDITIONABLE TRIGGER "DF_I_CNCPTO_BNCOS_CNTA_IU"
    for insert on df_i_cncpto_bncos_cnta
    compound trigger
    d number;



    before each row is
    begin
        if inserting then
            if :new.id_cncpto_bnc_cta is null then
                d := sq_df_i_cncpto_bncos_cnta.nextval;
                :new.id_cncpto_bnc_cta := d;
            end if;
        end if;
    end before each row;
end;



/
ALTER TRIGGER "DF_I_CNCPTO_BNCOS_CNTA_IU" ENABLE;


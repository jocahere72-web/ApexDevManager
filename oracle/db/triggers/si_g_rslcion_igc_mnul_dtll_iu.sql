
  CREATE OR REPLACE EDITIONABLE TRIGGER "SI_G_RSLCION_IGC_MNUL_DTLL_IU"
  for insert or update on si_g_rslcion_igac_mnual_dtlle
  compound trigger
  d      number;
  v_tipo   varchar2(500);
    v_error  exception;
    before each row is
    begin
        if inserting then
            if :new.id_rslcion_igac_mnual_dtlle is null then
                d := sq_si_g_rslcion_igc_mnul_dtll.nextval;
                :new.id_rslcion_igac_mnual_dtlle := d;
            end if;

      if ( :new.cncla_inscrbe = 'I' and  :new.fcha_ingrso is null ) then
          v_tipo := 'Debe Ingreasar Fecha de Vigencia Fiscal Para Incribe';
        raise v_error;
      end if;
        end if;
    exception
        when v_error then
        raise_application_error(-20001, v_tipo);
    end before each row;
end;




/
ALTER TRIGGER "SI_G_RSLCION_IGC_MNUL_DTLL_IU" ENABLE;


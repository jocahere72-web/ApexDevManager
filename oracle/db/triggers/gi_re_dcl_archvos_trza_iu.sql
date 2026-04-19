
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_RE_DCL_ARCHVOS_TRZA_IU"
    for insert or update on gi_re_dcl_archvos_trza
    compound trigger
    d number;

    before each row is
    begin
        if inserting then
            if  :new.id_dcl_arc is null then
                :new.id_dcl_arc := sq_gi_re_dcl_archvos_trza.nextval;
                :new.usrnme_dgta := sys_context('APEX$SESSION','app_user');
                :new.fcha_dgta := systimestamp;
            end if;
        end if;

        if updating then
            -- Se actualiza la tabla de gi_re_dclrcnes_arhvos
            :new.usrnme_mdfca := sys_context('APEX$SESSION','app_user');
            :new.fcha_mdfca := systimestamp;
        end if;
    end before each row;
end;


/
ALTER TRIGGER "GI_RE_DCL_ARCHVOS_TRZA_IU" ENABLE;


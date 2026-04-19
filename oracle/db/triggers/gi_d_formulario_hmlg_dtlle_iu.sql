
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_D_FORMULARIO_HMLG_DTLLE_IU"
	for insert or update on gi_d_formulario_hmlg_dtlle
	compound trigger
	d number;
    v_dscrpcion_rgion varchar2(1000);
    v_dscrpcion_atrbto varchar2(1000);

	before each row is
	begin
        begin
            select a.dscrpcion into v_dscrpcion_rgion
              from gi_d_formularios_region a
             where a.id_frmlrio_rgion = :new.id_frmlrio_rgion_orgn;
        exception
            when others then
                 v_dscrpcion_rgion  := null;
        end;
        if v_dscrpcion_rgion is not null then
           begin
                select a.dscrpcion into v_dscrpcion_atrbto
                  from gi_d_frmlrios_rgion_atrbto a
                 where a.id_frmlrio_rgion = :new.id_frmlrio_rgion_orgn
                   and a.id_frmlrio_rgion_atrbto = :new.id_frmlrio_rgion_atrbto_orgn;
            exception
                when others then
                     v_dscrpcion_atrbto  := null;
            end;
        end if;
		if inserting then
			if :new.id_frmlrio_hmlgcion_dtlle is null then
				d := sq_gi_d_formulario_hmlg_dtlle.nextval();
				:new.id_frmlrio_hmlgcion_dtlle := d;
                :new.dscrpcion_rgion_orgn   := v_dscrpcion_rgion;
                :new.dscrpcion_atrbto_orgn  := v_dscrpcion_atrbto;
			end if;
        elsif updating then
            :new.dscrpcion_rgion_orgn   := v_dscrpcion_rgion;
            :new.dscrpcion_atrbto_orgn  := v_dscrpcion_atrbto;
		end if;
	end before each row;
end;


/
ALTER TRIGGER "GI_D_FORMULARIO_HMLG_DTLLE_IU" ENABLE;


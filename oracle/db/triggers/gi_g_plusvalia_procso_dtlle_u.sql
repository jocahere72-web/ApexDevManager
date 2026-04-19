
  CREATE OR REPLACE EDITIONABLE TRIGGER "GI_G_PLUSVALIA_PROCSO_DTLLE_U"
  for update of cdgo_prdial, area_objto, mtrcla_inmblria, prptrio, vlor_p1, vlor_p2, drccion on gi_g_plusvalia_procso_dtlle
  compound trigger  v_tipo varchar2(30);
  v_error exception;
  v_id_plsvlia_adtria number;
  before each row is
  begin

    if updating then

      if (:new.cdgo_prdial is null) then
        v_tipo := 'Referencia Catastral';
        raise v_error;
      elsif (:new.area_objto is null) then
        v_tipo := 'Area Objeto';
        raise v_error;
      elsif (:new.mtrcla_inmblria is null) then
        v_tipo := 'Matricula Inmobiliaria';
        raise v_error;
      elsif (:new.prptrio is null) then
        v_tipo := 'Propietario';
        raise v_error;
      elsif (:new.vlor_p1 is null) then
        v_tipo := 'Valro P1';
        raise v_error;
      elsif (:new.vlor_p2 is null) then
        v_tipo := 'Valor P2';
        raise v_error;
      elsif (:new.drccion is null) then
        v_tipo := 'Direccion';
        raise v_error;
      end if;

      -- Guarda auditoria de lo actualizado
      select nvl(max(id_plsvlia_adtria) + 1, 1)
        into v_id_plsvlia_adtria
        from gi_g_plusvalia_auditoria;

      insert into gi_g_plusvalia_auditoria
        (id_plsvlia_adtria,
         id_plsvlia_dtlle,
         id_prcso_plsvlia,
         cdgo_prdial

        ,
         area_objto,
         mtrcla_inmblria,
         prptrio,
         vlor_p1,
         vlor_p2,
         area,
         clsfccion_zna,
         cmna,
         drccion,
         hcho_gnrdor,
         prdio_fra_estdio,
         vlor_plsvlia,
         vlor_ttal_plsvlia,
         vlor_plsvlia_actlzda,
         user_mdfca,
         fcha_mdfca)
      values
        (v_id_plsvlia_adtria,
         :old.id_plsvlia_dtlle,
         :old.id_prcso_plsvlia,
         :old.cdgo_prdial,
         :old.area_objto,
         :old.mtrcla_inmblria,
         :old.prptrio,
         :old.vlor_p1,
         :old.vlor_p2,
         :old.area,
         :old.clsfccion_zna,
         :old.cmna,
         :old.drccion,
         :old.hcho_gnrdor,
         :old.prdio_fra_estdio,
         :old.vlor_plsvlia,
         :old.vlor_ttal_plsvlia,
         :old.vlor_plsvlia_actlzda,
         coalesce(sys_context('APEX$SESSION', 'app_user'),
                  regexp_substr(sys_context('userenv', 'client_identifier'),
                                '^[^:]*'),
                  sys_context('userenv', 'session_user')),
         systimestamp);
    end if;
  exception
    when v_error then
      raise_application_error(-20001,
                              'Campo ' || v_tipo || ' no puede ser vacio');
  end before each row;
end;




/
ALTER TRIGGER "GI_G_PLUSVALIA_PROCSO_DTLLE_U" ENABLE;


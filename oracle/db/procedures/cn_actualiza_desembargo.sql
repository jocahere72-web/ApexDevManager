
  CREATE OR REPLACE EDITIONABLE PROCEDURE "CN_ACTUALIZA_DESEMBARGO" (P_RFRNCIA      VARCHAR2,
                                                    P_FCHA_RSLCION DATE,
                                                    P_NMRO_RSLCION NUMBER) is
  v_cdgo_clnte          number := 23001;
  v_id_impsto           number := 230011; -- Impuesto
  v_idntfccion          varchar2(50) := P_RFRNCIA; --Colocar la identificacion
  v_id_csles_dsmbrgo    number := 2; --COLOCAR ID DE LA CAUSAL QUE SE HIZO
  v_fcha_slctud         date := P_FCHA_RSLCION; -- Colocar fecha del Desembargo
  v_id_dsmbrgo_slctud   number; -- ID de la solicitud de desembargo
  v_id_dsmbrgos_rslcion number; -- ID de la resolución de desembargo

  --RESOLUCION
  v_id_acto_resol            number; -- ID Acto relacionado con la resolución
  v_id_dcmnto_resol          number; -- ID Documento
  v_nmro_acto_rslcion        number := P_NMRO_RSLCION; -- Colocar Numero resolucion
  v_file_name_rslcion        varchar2(50) := '-2024-' ||
                                             v_nmro_acto_rslcion || '.pdf'; -- Colocar el nombre del pdf
  v_nmro_acto_dsplay_rslcion varchar2(50) := '-2024-' ||
                                             v_nmro_acto_rslcion; -- Colocar el numero
  v_file_bfile               varchar2(50) := 'MCT-2024-' ||
                                             v_nmro_acto_rslcion || '.pdf';

  --OFICIO
  v_id_acto_ofcio          number; -- ID Acto para el oficio de desembargo
  v_id_dcmnto_ofcio        number; -- ID Documento
  v_nmro_acto_ofcio        number := v_nmro_acto_rslcion; -- Colocar Numero oficio de desembargo
  v_file_name_ofcio        varchar2(50) := '-2024-' || v_nmro_acto_rslcion ||
                                           '.pdf'; -- Colocar el nombre del pdf
  v_nmro_acto_dsplay_ofcio varchar2(50) := '-2024-' || v_nmro_acto_rslcion; -- Colocar el numero
  V_file_bfile_ofcio       varchar2(50) := 'MCT-2024-' ||
                                           v_nmro_acto_rslcion || '.pdf';

begin

  select d.id_dsmbrgo_slctud,
         e.id_dsmbrgos_rslcion,
         g.id_acto,
         g.id_dcmnto,
         i.id_acto,
         i.id_dcmnto
    into v_id_dsmbrgo_slctud,
         v_id_dsmbrgos_rslcion,
         v_id_acto_resol,
         v_id_dcmnto_resol,
         v_id_acto_ofcio,
         v_id_dcmnto_ofcio

    from genesys.v_mc_g_embargos_cartera a
    join genesys.mc_g_embargos_resolucion b
      on b.id_embrgos_crtra = a.id_embrgos_crtra
    join genesys.mc_g_desembargos_cartera c
      on a.id_embrgos_crtra = c.id_embrgos_crtra
    join genesys.mc_g_desembargos_solicitud d
      on b.id_embrgos_rslcion = d.id_embrgos_rslcion
    join genesys.mc_g_desembargos_resolucion e
      on e.id_dsmbrgos_rslcion = c.id_dsmbrgos_rslcion
    join genesys.mc_g_desembargos_oficio f
      on f.id_dsmbrgos_rslcion = e.id_dsmbrgos_rslcion
    join genesys.gn_g_actos g
      on g.id_acto = e.id_acto
    join genesys.gn_g_actos i
      on i.id_acto = f.id_acto
   where a.idntfccion = v_idntfccion --'0101000004860003000000000'
   group by d.id_dsmbrgo_slctud,
            e.id_dsmbrgos_rslcion,
            g.id_acto,
            g.id_dcmnto,
            i.id_acto,
            i.id_dcmnto;

  -- Actualizar la tabla MC_G_DESEMBARGOS_SOLICITUD
  UPDATE mc_g_desembargos_solicitud
     SET id_csles_dsmbrgo = v_id_csles_dsmbrgo, -- Causal de pago
         fcha_slctud      = v_fcha_slctud -- Fecha actual, cambia si deseas una fecha específica
   WHERE id_dsmbrgo_slctud = v_id_dsmbrgo_slctud;

  -- Verificar si se actualizó la tabla MC_G_DESEMBARGOS_SOLICITUD
  dbms_output.put_line('Actualización de MC_G_DESEMBARGOS_SOLICITUD completada.');

  -- Actualizar la tabla MC_G_DESEMBARGOS_OFICIO
  update mc_g_desembargos_oficio
     set fcha_acto = v_FCHA_SLCTUD, -- Cambiar la fecha
         nmro_acto = v_nmro_acto_ofcio -- Número de acto, cambia por el valor que necesites
   where id_acto = v_id_acto_ofcio;

  -- Verificar si se actualizó la tabla MC_G_DESEMBARGOS_OFICIO
  dbms_output.put_line('Actualización de MC_G_DESEMBARGOS_OFICIO completada.');

  -- Actualizar la tabla MC_G_DESEMBARGOS_RESOLUCION
  update mc_g_desembargos_resolucion
     set id_csles_dsmbrgo = v_ID_CSLES_DSMBRGO, -- Causal de pago
         fcha_acto        = v_FCHA_SLCTUD, -- Cambiar la fecha
         nmro_acto        = v_nmro_acto_rslcion -- Número de acto, cambia por el valor que necesites
   where id_dsmbrgos_rslcion = v_id_dsmbrgos_rslcion;

  -- Verificar si se actualizó la tabla MC_G_DESEMBARGOS_RESOLUCION
  dbms_output.put_line('Actualización de MC_G_DESEMBARGOS_RESOLUCION completada.');

  -- Actualizar la tabla GN_G_ACTOS (utilizando ID_ACTO desde MC_G_DESEMBARGOS_RESOLUCION)
  update gn_g_actos
     set nmro_acto        = v_nmro_acto_rslcion, -- Nuevo número de acto
         nmro_acto_dsplay = v_nmro_acto_dsplay_rslcion, -- Nuevo número de acto para mostrar
         fcha             = v_fcha_slctud -- Fecha del acto
   where id_acto = v_id_acto_resol;

  -- Verificar si se actualizó la tabla GN_G_ACTOS para la RESOLUCION
  dbms_output.put_line('Actualización de GN_G_ACTOS para la RESOLUCION completada.');

  -- Actualizar la tabla GN_G_ACTOS (utilizando ID_ACTO desde MC_G_DESEMBARGOS_OFICIO)
  update gn_g_actos
     set nmro_acto        = v_nmro_acto_ofcio, -- Nuevo número de acto
         nmro_acto_dsplay = v_nmro_acto_dsplay_ofcio, -- Nuevo número de acto para mostrar
         fcha             = v_fcha_slctud -- Fecha del acto
   where id_acto = v_id_acto_ofcio;

  -- Verificar si se actualizó la tabla GN_G_ACTOS para el OFICIO
  dbms_output.put_line('Actualización de GN_G_ACTOS para el OFICIO completada.');

  -- Actualizar la tabla GD_G_DOCUMENTOS para DESEMBARGOS_RESOLUCION
  update gd_g_documentos
     set file_name  = v_file_name_rslcion, -- Nombre de archivo
         file_bfile = bfilename('RESOLUCIONES_DESEMBARGO', V_file_bfile), -- Ruta del archivo
         fcha       = v_fcha_slctud -- Fecha actual, cambia si necesitas otra fecha
   where id_dcmnto = v_id_dcmnto_resol;

  -- Verificar si se actualizó la tabla GD_G_DOCUMENTOS para DESEMBARGOS_RESOLUCION
  dbms_output.put_line('Actualización de GD_G_DOCUMENTOS  para la RESOLUCION completada.');

  -- Actualizar la tabla GD_G_DOCUMENTOS para DESEMBARGOS_OFICIO
  update gd_g_documentos
     set file_name  = v_file_name_ofcio, -- Nombre de archivo
         file_bfile = bfilename('OFICIOS_DESEMBARGO', V_file_bfile_ofcio), -- Ruta del archivo
         fcha       = v_fcha_slctud -- Fecha actual, cambia si necesitas otra fecha
   where id_dcmnto = v_id_dcmnto_ofcio;

  -- Verificar si se actualizó la tabla GD_G_DOCUMENTOS para DESEMBARGOS_OFICIO
  dbms_output.put_line('Actualización de GD_G_DOCUMENTOS para el OFICIO completada.');

  commit; -- Confirmar cambios
exception
  when others then
    rollback; -- Deshacer cambios en caso de error
    dbms_output.put_line('Error: ' || sqlerrm || ' Código: ' || sqlcode);
end CN_ACTUALIZA_DESEMBARGO;
/


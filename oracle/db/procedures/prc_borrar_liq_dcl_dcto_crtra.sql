
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_BORRAR_LIQ_DCL_DCTO_CRTRA" (p_nmro_cnsctvo number,
                                                          o_mensaje      out varchar2) is

  cursor c1 is
    select a.id_sjto_impsto,
           a.id_lqdcion,
           a.id_dclrcion,
           c.id_rcdo,
           c.id_rcdo_cntrol
      from gi_g_declaraciones a
      join gi_d_dclrcnes_vgncias_frmlr b
        on b.id_dclrcion_vgncia_frmlrio = a.id_dclrcion_vgncia_frmlrio
      left join re_g_recaudos c
        on c.cdgo_rcdo_orgn_tpo = 'DL'
       and c.id_orgen = a.id_dclrcion
     where b.id_frmlrio = 784
       and (a.nmro_cnsctvo = p_nmro_cnsctvo or p_nmro_cnsctvo is null)
       and to_char(c.fcha_apliccion, 'YYYYMMDD') =  /*between '20221014' and*/
       '20221104' and c.id_usrio_aplco = 230017
     order by a.id_sjto_impsto;

begin

  for r1 in c1 loop
    begin
      delete from gi_g_liquidaciones_concepto
       where id_lqdcion = r1.id_lqdcion;

      delete from gi_g_declaraciones_detalle
       where id_dclrcion = r1.id_dclrcion;

      delete from gi_g_declaraciones a where id_dclrcion = r1.id_dclrcion;

      delete from gi_g_liquidaciones t where t.id_lqdcion = r1.id_lqdcion;

      delete from re_g_recaudos where id_rcdo_cntrol = r1.id_rcdo_cntrol;

      delete from re_g_recaudos_control t
       where t.id_rcdo_cntrol = r1.id_rcdo_cntrol;

      delete from gf_g_movimientos_detalle a
       where a.cdgo_mvmnto_orgn = 'LQ'
         and a.id_orgen = r1.id_lqdcion;

      delete from gf_g_movimientos_detalle a
       where a.cdgo_mvmnto_orgn = 'RE'
         and a.id_orgen = r1.id_rcdo;

       delete from gf_g_mvmntos_cncpto_cnslddo a
        where a.id_orgen = r1.id_dclrcion;

      delete from gf_g_movimientos_financiero d
       where d.cdgo_mvmnto_orgn = 'DL'
         and d.id_orgen = r1.id_dclrcion;

      pkg_gf_movimientos_financiero.prc_ac_concepto_consolidado(p_cdgo_clnte     => 23001,
                                                                p_id_sjto_impsto => r1.id_sjto_impsto);
      commit;

    exception
      when others then
        o_mensaje := 'Error procesando ' || r1.id_sjto_impsto ||
                     ' - Error: ' || sqlerrm;
        rollback;
        raise;
    end;
  end loop;

  o_mensaje := ' LA ELIMINACION SE EJECUTO CORRECTAMENTE';
end prc_borrar_liq_dcl_dcto_crtra;
/



  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_RG_RELIQUIDA_AD_VEHICULO" (p_id_sjto_impsto   in number,
                                                         o_cdgo_vhclo_mrca  out varchar2,
                                                         o_id_vhclo_lnea    out number,
                                                         o_clndrje          out number,
                                                         o_id_categoria     out number,
                                                         o_mdlo             out number,
                                                         o_clase            out varchar2) is

/*cursor c1(r_id_sjto_impsto number) is
select j.id_impsto,j.id_impsto_sbmpsto,j.id_sjto_impsto from gi_i_liquidacion_2022 j
                        where j.aprobado = 'N'  and j.id_sjto_impsto = r_id_sjto_impsto /*2967917;*/


cursor c2(r_id_impsto number,r_id_impsto_sbmpsto number,r_id_sjto_impsto number,r_vgncia number) is
select lk.id_lqdcion from gi_g_liquidaciones lk
                     where lk.id_impsto = r_id_impsto  and
                           lk.id_impsto_sbmpsto = r_id_impsto_sbmpsto and
                           lk.id_sjto_impsto  =  r_id_sjto_impsto and
                           lk.vgncia    = r_vgncia;


cursor c3(r_id_lqdcion number) is
select jh.cdgo_vhclo_mrca,jh.id_vhclo_lnea,jh.clndrje,jh.cdgo_vhclo_clse,jh.mdlo from gi_g_liquidaciones_ad_vehclo jh
         where jh.id_lqdcion =  r_id_lqdcion;


cursor c3_1(r_cdgo_vhclo_clse in varchar2,r_vgncia number) is
select hj.id_vhclo_clse_ctgria from df_s_vehiculos_clase_ctgria hj
        where hj.cdgo_vhclo_clse = r_cdgo_vhclo_clse and hj.vgncia = r_vgncia;



cursor c4(r_cdgo_vhclo_mrca varchar2,r_id_vhclo_lnea number,r_vgncia number,r_clndrje number,r_id_vhclo_clse_ctgria number) is
select * from df_s_vehiculos_grupo li
        where  li.cdgo_vhclo_mrca = r_cdgo_vhclo_mrca and
               li.id_vhclo_lnea = r_id_vhclo_lnea and
               li.vgncia = r_vgncia and
               li.id_vhclo_clse_ctgria = r_id_vhclo_clse_ctgria and
               r_clndrje between li.clndrje_dsde and li.clndrje_hsta;



    v_id_impsto          number;
    v_id_impsto_sbmpsto  number;
    v_id_sjto_impsto     number;
    v_id_lqdcion         number;

     v_cdgo_vhclo_mrca  varchar2(60);
     v_clase            varchar2(60);
     v_id_vhclo_lnea    number;
     v_clndrje          number;
     v_id_categoria     number;
     v_mdlo             number;
begin

 --for r1 in c1(p_id_sjto_impsto) loop
    v_id_impsto          :=230017;  /*r1.id_impsto; */
    v_id_impsto_sbmpsto  :=2300177;                    /* r1.id_impsto_sbmpsto;*/
    v_id_sjto_impsto     :=p_id_sjto_impsto;                  /*r1.id_sjto_impsto; */

      for r2 in c2(v_id_impsto,v_id_impsto_sbmpsto,v_id_sjto_impsto,2021) loop
        v_id_lqdcion := r2.id_lqdcion;
        end loop;

       for r3 in c3(v_id_lqdcion) loop
          v_cdgo_vhclo_mrca  := r3.cdgo_vhclo_mrca;
          v_id_vhclo_lnea    := r3.id_vhclo_lnea;
          v_clndrje          := r3.clndrje;
          v_clase            := r3.cdgo_vhclo_clse ;
          v_mdlo             := r3.mdlo;
         end loop;

         for r3_1 in c3_1(v_clase,2022) loop
           v_id_categoria:= r3_1.id_vhclo_clse_ctgria;
           end loop;

      for r4 in c4(v_cdgo_vhclo_mrca,v_id_vhclo_lnea,2022,v_clndrje,v_id_categoria)loop
          v_cdgo_vhclo_mrca  := r4.cdgo_vhclo_mrca;
          v_id_vhclo_lnea    := r4.id_vhclo_lnea;
          v_clndrje          := r4.clndrje_dsde;
          v_id_categoria     := r4.id_vhclo_clse_ctgria;
        end loop;

        o_cdgo_vhclo_mrca := v_cdgo_vhclo_mrca;
        o_id_vhclo_lnea   := v_id_vhclo_lnea;
        o_clndrje         := v_clndrje;
        o_id_categoria    := v_id_categoria;
        o_mdlo            := v_mdlo;
        o_clase           := v_clase;
 -- end loop;


end prc_rg_reliquida_ad_vehiculo;
/


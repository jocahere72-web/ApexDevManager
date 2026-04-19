
  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_RG_RELIQUIDA_GRUPO" is

  cursor c1 is
    select * from tmp02 t;


  cursor c2(r_grop in number, r_vgncia in number) is
    select x.id_vhclo_clse_ctgria
      from df_s_vehiculos_clase_ctgria x
     where (x.cdgo_vhclo_clse, x.cdgo_vhclo_ctgtria) in
           (select j.cdgo_vhclo_clse, j.cdgo_vhclo_ctgtria
              from df_s_vehiculos_grupo lo
              join df_s_vehiculos_clase_ctgria j
                on j.id_vhclo_clse_ctgria = lo.id_vhclo_clse_ctgria
             where lo.grpo = r_grop)
       and x.vgncia = r_vgncia;



  cursor c3(r_group in number) is
  select * from df_s_vehiculos_grupo lo
  where lo.grpo = r_group;

  cursor c4(r_vgncia          in number,
            r_cdgo_vhclo_mrca in varchar2,
            r_id_vhclo_lnea   in varchar2,
            r_cilindraje      in number,
            r_catergoria      in number) is
    select *
      from df_s_vehiculos_grupo li
     where li.vgncia = r_vgncia
       and li.cdgo_vhclo_mrca = r_cdgo_vhclo_mrca
       and li.id_vhclo_lnea = r_id_vhclo_lnea
       and r_cilindraje between li.clndrje_dsde and li.clndrje_hsta
       and li.id_vhclo_clse_ctgria = r_catergoria;

  v_id                   number;
  v_id_vhclo_clse_ctgria number;
  v_vgncia               number;
  v_cdgo_vhclo_mrca      varchar2(60);
  v_id_vhclo_lnea  number;
  v_cilindraje     number;
  v_grpo           number;
  v_cpacdad        number;

  v_cdgo_vhclo_srvcio    varchar2(60);
  v_cdgo_vhclo_oprcion   varchar2(60);
  v_cdgo_vhclo_crrcria   varchar2(60);
  v_cdgo_grpo_tax        varchar2(60);
  v_error                varchar2(100);
begin

  v_vgncia := to_number(to_char(sysdate, 'yyyy'));
   v_id:= null;
  for r1 in c1 loop

    v_id := r1.idn;


  for r2 in c2(v_id, v_vgncia) loop
    v_id_vhclo_clse_ctgria := r2.id_vhclo_clse_ctgria;
  end loop;

  for r3 in c3(v_id) loop
  v_cdgo_vhclo_mrca     := r3.cdgo_vhclo_mrca;
  v_id_vhclo_lnea       := r3.id_vhclo_lnea;
  v_cilindraje          := r3.clndrje_dsde;
  v_cpacdad             := r3.cpcdad_dsde;
  v_cdgo_vhclo_srvcio   := r3.cdgo_vhclo_srvcio;
  v_cdgo_vhclo_oprcion  := r3.cdgo_vhclo_oprcion;
  v_cdgo_vhclo_crrcria  := r3.cdgo_vhclo_crrcria;
  v_grpo                := r3.grpo;
  v_cdgo_grpo_tax       := r3.cdgo_grpo_tax;
  end loop;

  for r4 in c4(v_vgncia,v_cdgo_vhclo_mrca,v_id_vhclo_lnea,v_cilindraje,v_id_vhclo_clse_ctgria) loop
   v_grpo := r4.grpo;
  v_cdgo_vhclo_mrca     := r4.cdgo_vhclo_mrca;
  v_id_vhclo_lnea       := r4.id_vhclo_lnea;
  v_cilindraje          := r4.clndrje_dsde;
  v_cpacdad             := r4.cpcdad_dsde;
  v_cdgo_vhclo_srvcio   := r4.cdgo_vhclo_srvcio;
  v_cdgo_vhclo_oprcion  := r4.cdgo_vhclo_oprcion;
  v_cdgo_vhclo_crrcria  := r4.cdgo_vhclo_crrcria;
  v_grpo                := r4.grpo;
  v_cdgo_grpo_tax       := r4.cdgo_grpo_tax;
 end loop;

  begin
insert into df_s_vehiculos_grupo
  ( vgncia, id_vhclo_clse_ctgria, cdgo_vhclo_mrca, id_vhclo_lnea, clndrje_dsde, clndrje_hsta, cpcdad_dsde, cpcdad_hsta, cdgo_vhclo_srvcio, cdgo_vhclo_oprcion, cdgo_vhclo_crrcria, grpo, cdgo_grpo_tax)
values
  ( v_vgncia, v_id_vhclo_clse_ctgria, v_cdgo_vhclo_mrca, v_id_vhclo_lnea, v_cilindraje, v_cilindraje, v_cpacdad, v_cpacdad, v_cdgo_vhclo_srvcio, v_cdgo_vhclo_oprcion, v_cdgo_vhclo_crrcria, v_id, v_cdgo_grpo_tax);

exception
  when others then
   v_error:= 'error al insertar df_s_vehiculos_grupo'|| sqlerrm;
  end;
end loop;


end prc_rg_reliquida_grupo;
/



  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRC_CO_DCLRCNES_VLOR_GSTION" (p_cdgo_clnte						in	number,
									  p_id_dclrcion						in	number default null,
									  o_valor_gestion					out	json_array_t,
									  o_cdgo_rspsta						out	number,
									  o_mnsje_rspsta					out	varchar2) as
	v_nl			number;
	v_json		    clob;
    txt_cdo_brra    clob;
    cdo_brra        clob;
    v_vlor          clob;
	begin
		o_cdgo_rspsta :=	0;
		o_valor_gestion := json_array_t();

		begin
			for c_dclrcion_dtlle in (select  a.id_frmlrio_rgion,
											 a.id_frmlrio_rgion_atrbto,
											 a.fla,
											 a.orden,
											 a.vlor,
                                             a.vlor_dsplay
									 from    gi_g_declaraciones_detalle  a
									 where   exists(select   1
												    from     gi_g_declaraciones  b
												    where    b.id_dclrcion   =   p_id_dclrcion
												    and      b.id_dclrcion   =   a.id_dclrcion)
									 order by a.orden)
			loop
				v_json := json_object(key 'ID'							value			'RGN' || c_dclrcion_dtlle.id_frmlrio_rgion || 'ATR' || c_dclrcion_dtlle.id_frmlrio_rgion_atrbto || 'FLA' || c_dclrcion_dtlle.fla,
									  key 'ID_FRMLRIO_RGION'			value			c_dclrcion_dtlle.id_frmlrio_rgion,
									  key 'ID_FRMLRIO_RGION_ATRBTO'		value			c_dclrcion_dtlle.id_frmlrio_rgion_atrbto,
                                      key 'FLA'							value			c_dclrcion_dtlle.fla,
									  key 'ORDEN'						value			c_dclrcion_dtlle.orden,
									  key 'OLD'							value			c_dclrcion_dtlle.vlor,
                                      key 'DISPLAY'                     value           c_dclrcion_dtlle.vlor_dsplay );
				o_valor_gestion.append(JSON_OBJECT_T(v_json));
			end loop;
		exception
            when others then
                o_cdgo_rspsta	:= 20;
				return;
		end;

        begin
            select json_object('ID' value 'TXTCDOBRRA', 'OLD'  value pkgbarcode.funcadfac( null , null , null , a.nmro_cnsctvo , a.vlor_pago , a.fcha_prsntcion_pryctda , b.cdgo_ean , 'S' )) txto_cdgo_brra
                 , json_object('ID'  value 'CDOBRRA'  , 'OLD' value pkgbarcode.fungencod( 'EANUCC128' , pkgbarcode.funcadfac( null , null , null , a.nmro_cnsctvo , a.vlor_pago , a.fcha_prsntcion_pryctda , b.cdgo_ean , 'N' )) )cdgo_brra
              into txt_cdo_brra
                 , cdo_brra
              from gi_g_declaraciones a
              join df_i_impuestos_subimpuesto b
                on a.id_impsto_sbmpsto = b.id_impsto_sbmpsto
             where id_dclrcion = p_id_dclrcion;
             o_valor_gestion.append(JSON_OBJECT_T(txt_cdo_brra));
             o_valor_gestion.append(JSON_OBJECT_T(cdo_brra));
        exception
            when others then
                o_cdgo_rspsta	:= 30;
				return;
        end;

        for elm in (select cdgo_elmnto
                          , tpo_rtrno
                          , 'begin :r :=  pkg_gi_declaraciones_elemento.'
                          || replace(fncion , ':param2', chr(39)|| cdgo_elmnto || chr(39)) || '; end; 'as fncion
                       from v_gi_d_dclrcnes_rprte_elmnto
                      where cdgo_clnte = p_cdgo_clnte)
        loop
            execute immediate elm.fncion using out v_vlor, in p_id_dclrcion;
            v_json := json_object(key 'CDGO'  value elm.cdgo_elmnto,
                                  key 'VALUE' value v_vlor,
                                  key 'TPO'   value elm.tpo_rtrno );
            o_valor_gestion.append(JSON_OBJECT_T(v_json));
        end loop;




    end prc_co_dclrcnes_vlor_gstion;
/


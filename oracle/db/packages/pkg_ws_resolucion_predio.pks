
  CREATE OR REPLACE EDITIONABLE PACKAGE "PKG_WS_RESOLUCION_PREDIO" as

    /*
    Paquete que registra resoluciones suministradas a traves del servicio web expuesto por el proveedor CatastoPro
    Fecha Creación 20/02/2026
    Autor D. Baldovino
    Requrimiento 0028766: INTEGRACION CATASTOPRO (CATASTRO)
    */

    -- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    -- |                       VARIABLES GLOBALES                       |
    -- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    l_wallet  apex_190100.wwv_flow_security.t_wallet := apex_190100.wwv_flow_security.get_wallet;

    /*Funcion que consulta el valor de propiedad del servicio web*/
    function fnc_ob_propiedad_provedor(p_cdgo_clnte         in number,
                                       p_id_impsto          in number default null,
                                       p_id_impsto_sbmpsto  in number default null,
                                       p_id_prvdor          in number,
                                       p_cdgo_prpdad        in varchar2)

	return varchar2;

    /*UP que consulta resoluciones por lote (Rango de fecha) expuestas en el servicio WEB.*/
	procedure prc_co_resolucion_lte_ws(p_cdgo_clnte      in varchar2,
									   p_id_prvdor       in number,
									   p_llave			 in varchar2,
									   p_fcha_ini		 in varchar2,
									   p_fcha_fin	 	 in varchar2,
									   p_cdgo_dpto	 	 in varchar2,
									   p_cdgo_mncpio	 in varchar2,
									   o_mnsje_rspsta    out varchar2,
									   o_cdgo_rspsta     out number,
									   o_json_rspsta     out clob);

    /*UP que consulta resoluciones puntuales expuestas en el servicio WEB.*/
	procedure prc_co_resolucion_ws(p_cdgo_clnte      in varchar2,
                                   p_id_prvdor       in number,
								   p_llave			 in varchar2,
								   p_rslcion		 in varchar2,
								   p_anio_rslcion	 in varchar2,
								   p_cdgo_dpto	 	 in varchar2,
								   p_cdgo_mncpio	 in varchar2,
								   o_mnsje_rspsta    out varchar2,
								   o_cdgo_rspsta     out number,
								   o_json_rspsta     out clob);

    /*UP que consulta pdf de resolució puntual expuestas en el servicio WEB.*/
	procedure prc_co_pdf_resolucion_ws(p_cdgo_clnte      in varchar2,
									   p_id_prvdor       in number,
									   p_llave			 in varchar2,
									   p_rslcion		 in varchar2,
									   p_anio_rslcion	 in varchar2,
									   p_cdgo_dpto	 	 in varchar2,
									   p_cdgo_mncpio	 in varchar2,
									   o_mnsje_rspsta    out varchar2,
									   o_cdgo_rspsta     out number,
									   o_json_rspsta     out clob);

    /*UP que registra resoluciones capturadas del servicio en tabla de resoluciones*/
	procedure prc_rg_resolucion_msvo(p_cdgo_clnte	        in number,
                                     p_id_impsto            in number,
                                     p_id_impsto_sbmpsto    in number);

   /*UP que registra resoluciones capturadas del servicio en tabla de resoluciones puntual*/
	procedure prc_rg_resolucion_catastroPro(p_cdgo_clnte	  		in number,
											p_rslcion		  		in varchar2,
											p_json_rslcion	  		in clob,
											p_json_pdf        		in clob,
											p_id_rslcion_ctstopro	in number,
											o_mnsje_rspsta    		out varchar2,
											o_cdgo_rspsta     		out number);

   /*UP que pobla tablas de resluciones IGAC, en base a la información almacenada en tabla de resoluciones CATASTROPRO*/
    procedure prc_rg_resolucion_igac( p_cdgo_clnte    		in  df_s_clientes.cdgo_clnte%type
                                    , p_rslcion         	in  si_g_resolucion_ctstopro_dtlle.rslcion%type
                                    , p_rdccion         	in  si_g_resolucion_ctstopro_dtlle.rdccion%type
                                    , p_id_rslcion_CtstoPro in  si_g_resolucion_ctstopro_dtlle.id_rslcion_CtstoPro%type
                                    , o_cdgo_rspsta   		out number
                                    , o_mnsje_rspsta  		out varchar2 );

	/*Registrar en tabla y en Disco PDF de la resolución*/
	procedure prc_rg_resolucion_pdf(p_cdgo_clnte				in number,
									p_json_pdf					in clob,
									p_rslcion					in varchar2,
									o_mnsje_rspsta				out varchar2,
									o_cdgo_rspsta				out number,
									o_id_rsl_adjnto				out number);

    /*Consultar BLOB de sistemas externos para guardar docuemnto en disco*/
    procedure prc_co_adjntos_sstma_extrno ( p_cdgo_clnte        number,
                                            p_url               varchar2,
                                            o_blob              out blob,
                                            o_cdgo_rspsta       out number,
                                            o_mnsje_rspsta      out varchar2);

	/*Validar si la reoslución se debe aplicar manual*/
	procedure prc_vl_aplca_rslcion_mnal (p_cdgo_clnte       in number,
                                        p_rslcion           in si_g_resolucion_ctstopro_dtlle.rslcion%type,
                                        p_rdccion           in si_g_resolucion_ctstopro_dtlle.rdccion%type,
                                        p_clse_mtcion		in si_g_resolucion_igac_t1.clse_mtcion%type,
										p_tpo_trmte			in si_g_resolucion_igac_t1.tpo_trmte%type,
										o_mnsje_rspsta		out varchar2,
										o_aplcar_rslcion	out varchar2);

    /*UP que aplica masivamente resoluciones de capturadas del servicio de CATASTROPRO.*/
    procedure prc_ap_resolucion(p_cdgo_clnte            in number,
                                p_id_impsto             in number,
                                p_id_impsto_sbmpsto     in number,
								p_vgncia_actual     	in number,
                                p_id_usrio              in number default null) ;

end pkg_ws_resolucion_predio;
/


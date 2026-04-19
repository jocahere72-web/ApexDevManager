
  CREATE OR REPLACE EDITIONABLE TRIGGER "GF_D_CONVENIOS_TIPO_AD" for insert or update or delete on GF_D_CONVENIOS_TIPO compound trigger

					v_id_auditoria ad_g_audit_trail.id_auditoria%type;
					v_json varchar2(4000);
					v_tpo_oprcion   varchar2(1);
                    v_operacion     varchar2(50);
					after each row is
					begin
						--if inserting then
                            case true
                                when inserting then
                                    v_tpo_oprcion := 'I';
                                    v_operacion   := 'Inserción';
                                when updating then
                                    v_tpo_oprcion := 'U';
                                    v_operacion   := 'Actualización';
                                else
                                    v_tpo_oprcion := 'D';
                                    v_operacion   := 'Eliminación';
                            end case;
                            v_json := '{"operacion": "'|| v_operacion || '", "campos": [{"nmbre_cmpo": "ID_CNVNIO_TPO", "old": "' || :old.ID_CNVNIO_TPO || '", "new": "' || :new.ID_CNVNIO_TPO || '"},{"nmbre_cmpo": "CDGO_CLNTE", "old": "' || :old.CDGO_CLNTE || '", "new": "' || :new.CDGO_CLNTE || '"},{"nmbre_cmpo": "DSCRPCION", "old": "' || :old.DSCRPCION || '", "new": "' || :new.DSCRPCION || '"},{"nmbre_cmpo": "CDGO_SJTO_TPO", "old": "' || :old.CDGO_SJTO_TPO || '", "new": "' || :new.CDGO_SJTO_TPO || '"},{"nmbre_cmpo": "RNGO_VGNCIA", "old": "' || :old.RNGO_VGNCIA || '", "new": "' || :new.RNGO_VGNCIA || '"},{"nmbre_cmpo": "FCHA_LMTE_ELBRCION", "old": "' || :old.FCHA_LMTE_ELBRCION || '", "new": "' || :new.FCHA_LMTE_ELBRCION || '"},{"nmbre_cmpo": "NMRO_MXMO_CTAS", "old": "' || :old.NMRO_MXMO_CTAS || '", "new": "' || :new.NMRO_MXMO_CTAS || '"},{"nmbre_cmpo": "FCHA_MXMA_CTAS", "old": "' || :old.FCHA_MXMA_CTAS || '", "new": "' || :new.FCHA_MXMA_CTAS || '"},{"nmbre_cmpo": "INDCDOR_CLCLA_FNCCION", "old": "' || :old.INDCDOR_CLCLA_FNCCION || '", "new": "' || :new.INDCDOR_CLCLA_FNCCION || '"},{"nmbre_cmpo": "INDCDOR_CLCLA_FNCCN_SB_TTAL_K", "old": "' || :old.INDCDOR_CLCLA_FNCCN_SB_TTAL_K || '", "new": "' || :new.INDCDOR_CLCLA_FNCCN_SB_TTAL_K || '"},{"nmbre_cmpo": "INDCDOR_RQRE_GRNTIA", "old": "' || :old.INDCDOR_RQRE_GRNTIA || '", "new": "' || :new.INDCDOR_RQRE_GRNTIA || '"},{"nmbre_cmpo": "NMRO_CTA_MNMA_RQRE_GRNTIA", "old": "' || :old.NMRO_CTA_MNMA_RQRE_GRNTIA || '", "new": "' || :new.NMRO_CTA_MNMA_RQRE_GRNTIA || '"},{"nmbre_cmpo": "NMRO_UVT_MNMA_RQRE_GRNTIA", "old": "' || :old.NMRO_UVT_MNMA_RQRE_GRNTIA || '", "new": "' || :new.NMRO_UVT_MNMA_RQRE_GRNTIA || '"},{"nmbre_cmpo": "INDCDOR_EXGE_CTA_INCIAL", "old": "' || :old.INDCDOR_EXGE_CTA_INCIAL || '", "new": "' || :new.INDCDOR_EXGE_CTA_INCIAL || '"},{"nmbre_cmpo": "CTA_INCIAL_VGNCIA_CNVNIO", "old": "' || :old.CTA_INCIAL_VGNCIA_CNVNIO || '", "new": "' || :new.CTA_INCIAL_VGNCIA_CNVNIO || '"},{"nmbre_cmpo": "CTA_INCIAL_ABNO_TTAL_VGNCIA", "old": "' || :old.CTA_INCIAL_ABNO_TTAL_VGNCIA || '", "new": "' || :new.CTA_INCIAL_ABNO_TTAL_VGNCIA || '"},{"nmbre_cmpo": "CTA_INCIAL_PRCNTJE_VGNCIA", "old": "' || :old.CTA_INCIAL_PRCNTJE_VGNCIA || '", "new": "' || :new.CTA_INCIAL_PRCNTJE_VGNCIA || '"},{"nmbre_cmpo": "INDCDOR_LMTA_PRCNTJE", "old": "' || :old.INDCDOR_LMTA_PRCNTJE || '", "new": "' || :new.INDCDOR_LMTA_PRCNTJE || '"},{"nmbre_cmpo": "LMTA_PRCNTJE_MNMO", "old": "' || :old.LMTA_PRCNTJE_MNMO || '", "new": "' || :new.LMTA_PRCNTJE_MNMO || '"},{"nmbre_cmpo": "LMTA_PRCNTJE_MXMO", "old": "' || :old.LMTA_PRCNTJE_MXMO || '", "new": "' || :new.LMTA_PRCNTJE_MXMO || '"},{"nmbre_cmpo": "ID_DCRTO", "old": "' || :old.ID_DCRTO || '", "new": "' || :new.ID_DCRTO || '"},{"nmbre_cmpo": "ID_RVCTRIA_MTDO", "old": "' || :old.ID_RVCTRIA_MTDO || '", "new": "' || :new.ID_RVCTRIA_MTDO || '"},{"nmbre_cmpo": "INDCDOR_PRMTE_ADCCNAR_VGNCIA", "old": "' || :old.INDCDOR_PRMTE_ADCCNAR_VGNCIA || '", "new": "' || :new.INDCDOR_PRMTE_ADCCNAR_VGNCIA || '"},{"nmbre_cmpo": "NMRO_MXMO_ADCCNAR_VGNCIA", "old": "' || :old.NMRO_MXMO_ADCCNAR_VGNCIA || '", "new": "' || :new.NMRO_MXMO_ADCCNAR_VGNCIA || '"},{"nmbre_cmpo": "INDCDOR_PRMTE_MDFCAR_NMRO_CTA", "old": "' || :old.INDCDOR_PRMTE_MDFCAR_NMRO_CTA || '", "new": "' || :new.INDCDOR_PRMTE_MDFCAR_NMRO_CTA || '"},{"nmbre_cmpo": "INDCDOR_RVCTRIA_VGNCIA_FTRA", "old": "' || :old.INDCDOR_RVCTRIA_VGNCIA_FTRA || '", "new": "' || :new.INDCDOR_RVCTRIA_VGNCIA_FTRA || '"},{"nmbre_cmpo": "TSA_PRFRNCIAL_EA", "old": "' || :old.TSA_PRFRNCIAL_EA || '", "new": "' || :new.TSA_PRFRNCIAL_EA || '"},{"nmbre_cmpo": "INDCDOR_APLCA_DSCNTO", "old": "' || :old.INDCDOR_APLCA_DSCNTO || '", "new": "' || :new.INDCDOR_APLCA_DSCNTO || '"},{"nmbre_cmpo": "INDCDOR_GNRA_ACTO_CNVNIO", "old": "' || :old.INDCDOR_GNRA_ACTO_CNVNIO || '", "new": "' || :new.INDCDOR_GNRA_ACTO_CNVNIO || '"},{"nmbre_cmpo": "INDCDOR_VRFCA_DDA", "old": "' || :old.INDCDOR_VRFCA_DDA || '", "new": "' || :new.INDCDOR_VRFCA_DDA || '"},{"nmbre_cmpo": "RNGO_DDA_DSDE", "old": "' || :old.RNGO_DDA_DSDE || '", "new": "' || :new.RNGO_DDA_DSDE || '"},{"nmbre_cmpo": "RNGO_DDA_HSTA", "old": "' || :old.RNGO_DDA_HSTA || '", "new": "' || :new.RNGO_DDA_HSTA || '"},{"nmbre_cmpo": "ACTVO", "old": "' || :old.ACTVO || '", "new": "' || :new.ACTVO || '"},{"nmbre_cmpo": "ID_ACTO_TPO_CNVNIO", "old": "' || :old.ID_ACTO_TPO_CNVNIO || '", "new": "' || :new.ID_ACTO_TPO_CNVNIO || '"}]}';
							select nvl(max(id_auditoria)+1, 1) into v_id_auditoria from ad_g_audit_trail;

							insert into ad_g_audit_trail(
								  id_auditoria
								, nmbre_tbla
								, id_llve_prmria
								, tpo_oprcion
								, json
								, usrio
								, fecha
								, host
								, ip_address
								, server_host
								, os_user
								, terminal
								, authentication_method
								, proxy_user
								, proxy_userid)
							values(v_id_auditoria, 'GF_D_CONVENIOS_TIPO', nvl(:new.ID_CNVNIO_TPO, :old.ID_CNVNIO_TPO),
								 v_tpo_oprcion,
								 v_json,
								 coalesce( sys_context('APEX$SESSION','app_user'), regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*'), sys_context('userenv','session_user') ), systimestamp,
								 sys_context('userenv','host'),
								 sys_context('userenv','ip_address'),
								 sys_context('userenv','server_host'),
								 sys_context('userenv','os_user'),
								 sys_context('userenv','terminal'),
								 sys_context('userenv','authentication_method'),
								 sys_context('userenv','proxy_user'),
								 sys_context('userenv','proxy_userid') );

						--elsif updating then
						--	null;
						--end if;
					end after each row;

					end;




/
ALTER TRIGGER "GF_D_CONVENIOS_TIPO_AD" ENABLE;


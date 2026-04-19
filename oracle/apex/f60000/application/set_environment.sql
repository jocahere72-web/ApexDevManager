prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.03.31'
,p_release=>'19.1.0.00.15'
,p_default_workspace_id=>71778384177293184
,p_default_application_id=>60000
,p_default_owner=>'GENESYS'
);
end;
/
 
prompt APPLICATION 60000 - SEGURIDAD / AUDITORIA
--
-- Application Export:
--   Application:     60000
--   Name:            SEGURIDAD / AUDITORIA
--   Exported By:     GENESYS
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     248394942130614
--

-- Application Statistics:
--   Pages:                     29
--     Items:                  169
--     Computations:             1
--     Validations:             24
--     Processes:               57
--     Regions:                 85
--     Buttons:                 50
--     Dynamic Actions:         38
--   Shared Components:
--     Logic:
--       Items:                 13
--       Computations:           1
--     Navigation:
--       Lists:                  3
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         2
--       Authorization:          3
--     User Interface:
--       Themes:                 2
--       Templates:
--         Page:                18
--         Region:              31
--         Label:               12
--         List:                23
--         Popup LOV:            2
--         Calendar:             2
--         Breadcrumb:           2
--         Button:               6
--         Report:              19
--       LOVs:                  37
--       Shortcuts:              1
--       Plug-ins:               7
--     Globalization:
--     Reports:
--     E-Mail:
--   Supporting Objects:  Included


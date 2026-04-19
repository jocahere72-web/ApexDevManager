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
,p_default_application_id=>69000
,p_default_owner=>'GENESYS'
);
end;
/
 
prompt APPLICATION 69000 - GestiÃ³n de Novedades
--
-- Application Export:
--   Application:     69000
--   Name:            GestiÃ³n de Novedades
--   Exported By:     GENESYS
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     248394942130614
--

-- Application Statistics:
--   Pages:                     68
--     Items:                  624
--     Computations:            21
--     Validations:             66
--     Processes:              157
--     Regions:                343
--     Buttons:                104
--     Dynamic Actions:         92
--   Shared Components:
--     Logic:
--       Items:                 25
--       Processes:              1
--     Navigation:
--       Lists:                  6
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         3
--       Authorization:          4
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              15
--         Label:                7
--         List:                12
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:              10
--       LOVs:                  21
--       Shortcuts:              1
--       Plug-ins:              10
--     Globalization:
--     Reports:
--     E-Mail:
--   Supporting Objects:  Included


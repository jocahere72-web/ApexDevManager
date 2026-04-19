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
,p_default_application_id=>140000
,p_default_owner=>'GENESYS'
);
end;
/
 
prompt APPLICATION 140000 - Consulta General
--
-- Application Export:
--   Application:     140000
--   Name:            Consulta General
--   Exported By:     GENESYS
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     248394942130614
--

-- Application Statistics:
--   Pages:                     40
--     Items:                  106
--     Computations:             1
--     Processes:               10
--     Regions:                 77
--     Buttons:                 11
--     Dynamic Actions:          2
--   Shared Components:
--     Logic:
--       Items:                 25
--     Navigation:
--       Lists:                  4
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         3
--       Authorization:          3
--     User Interface:
--       Themes:                 2
--       Templates:
--         Page:                18
--         Region:              32
--         Label:               14
--         List:                24
--         Popup LOV:            2
--         Calendar:             2
--         Breadcrumb:           2
--         Button:               6
--         Report:              21
--       LOVs:                   3
--       Shortcuts:              1
--       Plug-ins:               2
--     Globalization:
--     Reports:
--     E-Mail:
--   Supporting Objects:  Included


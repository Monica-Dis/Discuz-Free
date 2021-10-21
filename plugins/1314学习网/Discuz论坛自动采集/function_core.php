<?php

function addon_collect_discuz_siteselect($_arg_0 = null, $_arg_1 = null, $_arg_2 = null, $_arg_3 = null)
{
	$_var_4 = '';
	$_var_4 = $_var_4 . ("<select class=\"siteid\" name=\"" . ($_arg_3 ? "newsiteid[]" : "siteid[" . $_arg_2 . "]") . "\"><option value=\"0\">" . lang("plugin/addon_collect_discuz", "slang_014") . "</option>");
	foreach ($_arg_0 as $_var_5 => $_var_6) {
		$_var_4 = $_var_4 . ("<option value=\"" . $_var_5 . "\" " . ($_var_5 == $_arg_1 ? "selected=\"selected\"" : '') . ">" . $_var_6 . "</option>");
	}
	$_var_4 = $_var_4 . ("</select>");
	return $_var_4;
}
function addon_collect_discuz_charsetselect($_arg_0 = null, $_arg_1 = null, $_arg_2 = null, $_arg_3 = null)
{
	$_var_4 = '';
	$_var_4 = $_var_4 . ("<select class=\"charset\" name=\"" . ($_arg_3 ? "newcharset[]" : "charset[" . $_arg_2 . "]") . "\"><option value=\"0\">" . lang("plugin/addon_collect_discuz", "slang_013") . "</option>");
	foreach ($_arg_0 as $_var_5 => $_var_6) {
		$_var_4 = $_var_4 . ("<option value=\"" . $_var_5 . "\" " . ($_var_5 == $_arg_1 ? "selected=\"selected\"" : '') . ">" . $_var_6 . "</option>");
	}
	$_var_4 = $_var_4 . ("</select>");
	return $_var_4;
}
function addon_collect_discuz_rulesselect($_arg_0 = null, $_arg_1 = null, $_arg_2 = null, $_arg_3 = null)
{
	$_var_4 = '';
	$_var_4 = $_var_4 . ("<select class=\"rules\" name=\"" . ($_arg_3 ? "newrules[]" : "rules[" . $_arg_2 . "]") . "\"><option value=\"0\">" . lang("plugin/addon_collect_discuz", "slang_012") . "</option>");
	foreach ($_arg_0 as $_var_5 => $_var_6) {
		$_var_4 = $_var_4 . ("<option value=\"" . $_var_5 . "\" " . ($_var_5 == $_arg_1 ? "selected=\"selected\"" : '') . ">" . $_var_6 . "</option>");
	}
	$_var_4 = $_var_4 . ("</select>");
	return $_var_4;
}
function addon_collect_discuz_posttypeselect($_arg_0 = null, $_arg_1 = null, $_arg_2 = null, $_arg_3 = null)
{
	$_var_4 = '';
	$_var_4 = $_var_4 . ("<select class=\"posttype\" name=\"" . ($_arg_3 ? "newposttype[]" : "posttype[" . $_arg_2 . "]") . "\" id=\"sortgroup_" . ($_arg_2 ? $_arg_2 : "new_{n}") . "\" onchange=\"onSortGroupChange(this, " . ($_arg_2 ? $_arg_2 : "\\'new_{n}\\'") . ")\"><option value=\"0\">" . lang("plugin/addon_collect_discuz", "slang_003") . "</option>");
	foreach ($_arg_0 as $_var_5 => $_var_6) {
		$_var_4 = $_var_4 . ("<option value=\"" . $_var_5 . "\" " . ($_var_5 == $_arg_1 ? "selected=\"selected\"" : '') . ">" . $_var_6 . "</option>");
	}
	$_var_4 = $_var_4 . ("</select>");
	return $_var_4;
}
function addon_collect_discuz_catidselect($_arg_0 = null, $_arg_1 = null, $_arg_2 = null, $_arg_3 = null, $_arg_4 = null)
{
	$_var_5 = '';
	$_var_5 = $_var_5 . ("<select class=\"catid\" name=\"" . ($_arg_3 ? "newcatid[]" : "catid[" . $_arg_2 . "]") . "\" id=\"sortsup_" . ($_arg_2 ? $_arg_2 : "new_{n}") . "\">");
	if ($_arg_4 == 2) {
		$_var_5 = $_var_5 . ("<option value=\"0\">" . lang("plugin/addon_collect_discuz", "slang_001") . "</option>");
		foreach ($_arg_0 as $_var_6) {
			$_var_5 = $_var_5 . ("<option value=\"" . $_var_6["catid"] . "\" " . ($_var_6["catid"] == $_arg_1 ? "selected=\"selected\"" : '') . ">" . $_var_6["catname"] . "</option>");
		}
	} else {
		if ($_arg_4 == 1) {
			$_var_5 = $_var_5 . ("<option value=\"\">" . lang("plugin/addon_collect_discuz", "slang_002") . "</option>" . forumselect(false, 0, $_arg_1, true));
		} else {
			if ($_arg_4 == 3) {
				$_var_5 = $_var_5 . ("<option value=\"\">" . lang("plugin/addon_collect_discuz", "slang_017") . "</option>" . addon_collect_discuz_groupselect($_arg_1));
			}
		}
	}
	$_var_5 = $_var_5 . ("</select>");
	return $_var_5;
}
function addon_collect_discuz_groupselect($_arg_0 = '')
{
	global $_G;
	$_var_2 = DB::fetch_all("SELECT fid, name FROM " . DB::table("forum_forum") . " WHERE status='3' AND type='sub' ORDER BY displayorder");
	$_var_3 = '';
	foreach ($_var_2 as $_var_4) {
		if ($_arg_0) {
			if (!is_array($_arg_0)) {
				$_var_5 = $_arg_0 == $_var_4["fid"] ? " selected" : '';
			} else {
				$_var_5 = in_array($_var_4["fid"], $_arg_0) ? " selected" : '';
			}
		}
		$_var_3 = $_var_3 . ("<option value=\"" . $_var_4["fid"] . "\"" . $_var_5 . ">" . dhtmlspecialchars(strip_tags($_var_4["name"])) . "</option>");
	}
	return $_var_3;
}
function addon_collect_discuz_check()
{
	$_var_0 = NULL;
}
function addon_collect_discuz_cleardir($_arg_0 = null)
{
}
function addon_collect_discuz_deltree($_arg_0 = null)
{
}
function addon_collect_discuz_validator()
{
}
	if (!defined("IN_DISCUZ")) {
		echo "{ADDONVAR:SiteID}";
		return 0;
	}
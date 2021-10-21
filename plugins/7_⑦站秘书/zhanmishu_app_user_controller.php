<?php
/**
 *      [HereEdu!] (C)2001-2099 hereEdu Inc
 *      This is NOT a freeware, use is subject to license terms
 *
 *      Author: zhanmishu.com $
 *      qq:87883395 $
 */
if(!defined('IN_DISCUZ')) {
    exit('Access Denied');
} 
/**
 * 
 */
class zhanmishu_app_user_controller extends zhanmishu_app_controller
{
    public function smsLogin($params = array()){
        $params['verify'] = $params['verify'];
        $params['code'] = $params['codeHash'];
        $params['mobile'] =  $params['mobile'];
        $params['cookieverify'] =  $params['cookieverify'];

        $smsVerify = $this->smsController()->loginVerify($params);
        if ($smsVerify['code'] < 0) {
            self::resultToJsonOutPut($smsVerify,'','',false);
        }
        loaducenter();
        $uid = $this->smsController()->mobileVerifyHander()->getuidbymobile($params['mobile']);
        if ($uid > 0) {
            if ($_GET['platform'] && ($params['openid'] || $params['unionid'])) {
                $this->_syncWechatInfo($params['openid'],$params['unionid'],$_GET['platform']);
            }
            global $_G;
            $ip=$_G['clientip'];
            $member = getuserbyuid($uid, 1);
            require_once libfile('function/member');
            $cookietime = 1296000;
            setloginstatus($member, $cookietime);
            C::t('common_member_status')->update($_G['uid'], array('lastip' => $_G['clientip'], 'lastvisit' =>TIMESTAMP, 'lastactivity' => TIMESTAMP));
        }
        $this->_userInfo();
    }

    /**
     * 用户关注接口
     * @Author    Lanya
     * @DateTime  2019-06-28
     * @QQ        87883395
     * @copyright [HereEdu!] (C)2001-2099  hereEdu Inc
     * @return    [type]     [description]
     */
    public function follow(){
        global $_G;
        $followuid = intval($_GET['fuid']);
        if (!$followuid) {
            $return = array(
                'msg'=>'fuid_error',
                'code'=>'-20003'
            );
            self::resultToJsonOutPut($return);
        }

        // 不能关注自己
        if($_G['uid'] == $followuid) {
            $return = array(
                'msg'=>'follow_not_follow_self',
                'code'=>'-20001'
            );
            self::resultToJsonOutPut($return);
            // showmessage('follow_not_follow_self');
        }
        $special = intval($_GET['special']) ? intval($_GET['special']) : 0;
        $followuser = getuserbyuid($followuid);
        $mutual = 0;
        $followed = C::t('home_follow')->fetch_by_uid_followuid($followuid, $_G['uid']);
        // 对方不允许你关注
        if(!empty($followed)) {
            if($followed['status'] == '-1') {
                $return = array(
                    'msg'=>'follow_other_unfollow',
                    'code'=>'-20002'
                );
                // showmessage('follow_other_unfollow');
            }
            $mutual = 1;
            C::t('home_follow')->update_by_uid_followuid($followuid, $_G['uid'], array('mutual'=>1));
        }
        $followed = C::t('home_follow')->fetch_by_uid_followuid($_G['uid'], $followuid);
        if(empty($followed)) {
            // 写入关注数据，更新数据
            $followdata = array(
                'uid' => $_G['uid'],
                'username' => $_G['username'],
                'followuid' => $followuid,
                'fusername' => $followuser['username'],
                'status' => 0,
                'mutual' => $mutual,
                'dateline' => TIMESTAMP
            );
            C::t('home_follow')->insert($followdata, false, true);
            C::t('common_member_count')->increase($_G['uid'], array('following' => 1));
            C::t('common_member_count')->increase($followuid, array('follower' => 1, 'newfollower' => 1));
            notification_add($followuid, 'follower', 'member_follow_add', array('count' => $count, 'from_id'=>$_G['uid'], 'from_idtype' => 'following'), 1);
        } elseif($special) {
            // 特殊关注
            $status = $special == 1 ? 1 : 0;
            C::t('home_follow')->update_by_uid_followuid($_G['uid'], $followuid, array('status'=>$status));
        } 
        $return = array(
            'msg'=>'follow_followed_ta',
            'code'=>'1'
        );
        self::resultToJsonOutPut($return);

    }

    /**
     * @Author    Lanya
     * @DateTime  2019-04-19
     * @QQ        87883395
     * @copyright [HereEdu!] (C)2001-2099 hereEdu       Inc
     * @param     string     $openid      [description]
     * @param     string     $unionid     [description]
     * @param     string     $type        [可接受参数为 'minapp','web','app' ]
     * @return    [type]                  [description]
     */
    public function _syncWechatInfo($openid = '',$unionid = '',$type = ''){
        global $_G;
        if ($type == 'web') {
            $type = '';
        }
        if (!in_array($type, array('','minapp','app'))) {
            return;
        }
        if (!is_file(DISCUZ_ROOT.'source/plugin/zhanmishu_wechat/source/class/zhanmishu_wechat_member.php')) {
            return;
        }else{
            C::import('zhanmishu_wechat_member','plugin/zhanmishu_wechat/source/class');
            zhanmishu_wechat_member::update_wechat_openid($_G['uid'],$openid, $unionid, $type);
        }

    }

    public function smsChangePassword($params = array()){
        $params['verify'] = $params['verify'];
        $params['code'] = $params['codeHash'];
        $params['mobile'] =  $params['mobile'];
        $params['cookieverify'] =  $params['cookieverify'];

        $smsVerify = $this->smsController()->passwordChangeVerify($params);
        if ($smsVerify['code'] < 0) {
            self::resultToJsonOutPut($smsVerify,'','',false);
        }
        loaducenter();
        $uid = $this->smsController()->smsHander()->getuidbymobile($params['mobile']);
        if ($uid > 0) {
            if ($_GET['platform'] && ($params['openid'] || $params['unionid'])) {
                $this->_syncWechatInfo($params['openid'],$params['unionid'],$_GET['platform']);
            }
            global $_G;
            $ip=$_G['clientip'];
            $member = getuserbyuid($uid, 1);
            require_once libfile('function/member');
            $cookietime = 1296000;
            setloginstatus($member, $cookietime);
            C::t('common_member_status')->update($_G['uid'], array('lastip' => $_G['clientip'], 'lastvisit' =>TIMESTAMP, 'lastactivity' => TIMESTAMP));
        }

        $action = array('modifyPassword'=>'1');
        $this->_userInfo($action);
    }

    public function smsRegister($params = array()){
        $params = zhanmishu_app_api::auto_charset_change($params,'UTF-8',CHARSET);
        $params['verify'] = $params['verify'];
        $params['code'] = $params['codeHash'];
        $params['mobile'] =  $params['mobile'];
        $params['username'] = $params['username'] ? $params['username'] : $this->appHander->get_rand_str(10);
        $params['password'] = $params['password'] ? $params['password'] : $this->appHander->get_rand_str(8);
        $params['nationcode'] = '';

        if ($params['mobile']) {
            $uid = $this->smsController()->smsHander()->getuidbymobile($params['mobile']);
            if ($uid) {
                return $this->smsLogin($params);
            }
        }

        $smsVerify = $this->smsController()->registerVerify($params);
        if ($smsVerify['code'] < 0) {
            self::resultToJsonOutPut($smsVerify,'','',false);
        }

        $smsHander = & $this->smsController()->smsHander();

        $smsHander->code = $params['codeHash'];
        $smsHander->verify = $params['verify'];
        $smsHander->cookieverify = $params['cookieverify'];
        $return = $smsHander->mobile_register($params);
        $action = array('modifyUsername'=> '1','modifyPassword'=>'1');

        $this->_userInfo($action);

    }

    public function userInfo(){
        return $this->_userInfo();
    }

    public function modifyUser($params){
        $params = zhanmishu_app_api::auto_charset_change($params,'UTF-8',CHARSET);
        global $_G;
        if (!$_G['uid']) {
            $return = array(
                'msg'=>'please_login',
                'code'=>'-10001'
            );
            self::resultToJsonOutPut($return);
        }else if (!$params['modifyToken']) {
            $return = array(
                'msg'=>'modify_token_is_required',
                'code'=>'-40001'
            );
            self::resultToJsonOutPut($return);
        }

        $jsonToken = authcode($params['modifyToken'],'DECODE',$_G['config']['security']['authkey']);
        $modify = json_decode($jsonToken,true);
        if (!$modify['uid'] || $modify['uid'] != $_G['uid']) {
            $return = array(
                'msg'=>'uid_error_or_not_exists',
                'code'=>'-40008'
            );
            self::resultToJsonOutPut($return);
        }
        if ($params['password'] && $modify['password']) {
            // modify password
            loaducenter();
            uc_user_edit($_G['username'],'',$params['password'],'',1,0,'');
        }
        if ($params['username'] && $modify['username']) {
            // modify username
            loaducenter();
            if ($check = uc_user_checkname($params['username']) < 0) {
                $return = array(
                    'msg'=>'username_error',
                    'code'=>'-4001'.$check
                );
                self::resultToJsonOutPut($return);
            }

            $oldname = $_G['username'];
            $this->changeUsername($oldname,$params['username']);
            $this->changeUcenterUsername($oldname,$params['username']);
            $_G['username'] = $params['username'];
        }
        $this->_userInfo();
    }

    public function login($params = array()){
        $params = zhanmishu_app_api::auto_charset_change($params,'UTF-8',CHARSET);

        $username = daddslashes($params['username']);
        $password = daddslashes($params['password']);
        $idhash = daddslashes($params['idhash']);
        $seccode = daddslashes($params['seccode']);

        if (!$username || !$password || !$idhash || !$seccode) {
            if (!$username) {
                $msg = lang('plugin/zhanmishu_app','username_is_required');
                $code = -20001;
            }else if (!$password) {
                $msg = lang('plugin/zhanmishu_app','password_is_required');
                $code = -20002;
            }else if (!$idhash) {
                $msg = lang('plugin/zhanmishu_app','idhash_is_required');
                $code = -20003;
            }

            // else if (!$seccode) {
            //     $msg = lang('plugin/zhanmishu_app','seccode_is_required');
            //     $code = -20004;
            // }

            $return = array(
                'msg'=>$msg,
                'code'=>$code
            );
            self::resultToJsonOutPut($return);
        }

        // if (!check_seccode($seccode,$idhash)) {
        //     $msg = lang('plugin/zhanmishu_app','seccode_is_error');
        //     $code = -20005;
        //     $return = array(
        //         'msg'=>$msg,
        //         'code'=>$code
        //     );
        //     self::resultToJsonOutPut($return);
        // }

        loaducenter();

        $result = uc_user_login($username,$password,0);
        if ($result[0] > 0) {
            if ($_GET['platform'] && ($params['openid'] || $params['unionid'])) {
                $this->_syncWechatInfo($params['openid'],$params['unionid'],$_GET['platform']);
            }
            $member = getuserbyuid($result[0], 1);
            require_once libfile('function/member');
            $cookietime = 1296000;
            setloginstatus($member, $cookietime);
            dsetcookie('lip', $_G['member']['lastip'].','.$_G['member']['lastvisit']);
            C::t('common_member_status')->update($_G['uid'], array('lastip' => $_G['clientip'], 'lastvisit' =>TIMESTAMP, 'lastactivity' => TIMESTAMP));
        }
        $this->_userInfo();
    }

    public function _userInfo($params = array()){
        global $_G;
        if ($_G['uid']) {
            $token = '';
            if (!is_file(DISCUZ_ROOT.'source/plugin/zhanmishu_wechat/source/class/zhanmishu_wechat_member.php')) {
                $code = '-10001';
                $msg = 'please_install_zhanmishu_wechat_plugin';
            }else{
                $msg = 'success';
                $code = '1';
                C::import('zhanmishu_wechat_member','plugin/zhanmishu_wechat/source/class');
                $token = zhanmishu_wechat_member::token_encode($_G['uid']);
            }
            
            //是否允许修改用户名或者密码
            if (!empty($params)) {
                $modify = array();
                if ($params['modifyUsername']) {
                    $modify['username'] = '1';
                }
                if ($params['modifyPassword']) {
                    $modify['password'] = '1';
                }
                if (!empty($modify)) {
                    $modify['uid'] = $_G['uid'];
                    $modifyToken = authcode(json_encode($modify), 'ENCODE', $_G['config']['security']['authkey']);
                }
            }
        }else{
            $msg = 'token_time_out';
            $code = '-10001';
        }
           
        $return = array(
            'member'=>array(
                'uid'=>$_G['uid'],
                'formhash'=>FORMHASH,
                'username'=>$_G['username'],
                'groupid'=>$_G['groupid'],
                'token'=>$token,
                'hash' => md5(substr(md5($_G['config']['security']['authkey']), 8).$_G['uid']),
                'avatar'=>avatar($_G['uid'], 'middle', true),
                'ismoderator' => $_G['forum']['ismoderator'],
                'readaccess' => $_G['group']['readaccess'],
                'notice' => array(
                    'newpm' => dintval($_G['member']['newpm']),
                    'newprompt' => dintval(($_G['member']['newprompt'] - $_G['member']['category_num']['mypost']) >= 0 ? ($_G['member']['newprompt'] - $_G['member']['category_num']['mypost']) : 0),
                    //'newmypost' => dintval($_G['member']['category_num']['mypost']),
                    'newmypost' => dintval($_G['member']['newprompt_num']['post']+$_G['member']['newprompt_num']['pcomment']),
                )
            ),
            'msg'=>$msg,
            'code'=>$code
        );

        if ($modifyToken) {
            $return['member']['modifyToken'] = $modifyToken;
        }

        $return['setting'] = $this->_setting();
        self::resultToJsonOutPut($return);
        
    }

    public function _setting($params = array()){
        // $setting = $this->appHander->GetFromCache('api_setting');
        // if (!empty($setting)) {
        //     return $setting;
        // }
        $setting = array();
        $config = $this->appHander->config;

        $setting['path'] = $config['path'];
        $setting['isSmsLogin'] = $config['isSmsLogin'];
        $setting['loginIndex'] = $config['loginIndex'];
        $setting['shareText']['title'] = $config['share_title'];
        $setting['shareText']['description'] = $config['share_description'];
        $setting['shareText']['icon'] = $this->appHander->auto_to_url($config['share_icon']);

        $setting['minappLoginLogo'] = $this->appHander->auto_to_url($config['minapp_login_logo']);
        $setting['indexLogo'] = $this->appHander->auto_to_url($config['index_logo']);
        $setting['creditCharge'] = $this->_CreditChargeSetting();
        $setting['video'] = $this->_videoSetting(array('selltype','vipbuyurl'));
        $setting['setting'] = $this->_chatSetting();
        $setting['userCenter'] = $this->_uCenterSetting();
        $setting['rewriterule'] = $this->_rewriteRule();

        $platform = $params['params'] ? $params['params'] : strtolower($_GET['platform']);
        if ($platform == 'app') {
            $setting['update'] = $this->_update();
            $setting['guideImg'] = $this->_guideImg();
        }

        // $this->appHander->writeToCache('api_setting',$setting);
        return $setting;
    }
    public function _rewriteRule(){
        global $_G;
        $rewriteRule = array();
        $rewriteRule['forum'] = $_G['setting']['rewriterule'];
        if ($this->_checkVideo()) {
            $rewriteRule['video'] = $this->videoHander()->GetFromCache('rewriteRule');
        }
        return $rewriteRule;
    }
    public function _guideImg(){
       $guideImg = $this->appHander->GetFromCache('guideImg');
       foreach ($guideImg as $key => $value) {
           $guideImg[$key]['image'] = $this->appHander->auto_to_url($value['image']);
       }
       return $guideImg;
    }

    public function _update($params = array()){
         $version = $this->appHander->GetFromCache('versionSetting');
         $currentVersion = $params['currentVersion'] ? $params['currentVersion'] : $_GET['currentVersion'];
         $currentType = $params['versionType'] ? $params['versionType'] : $_GET['versionType'];
         $maxRelease = array();
         $maxBeta = array();

         foreach ($version as $key => $value) {
             if ($value['type'] == '0' && version_compare($maxRelease['version'], $value['version']) < 0) {
                 $maxRelease = $value;
             }else if ($value['type'] == '1' && version_compare($maxRelease['version'], $value['version']) < 0) {
                 $maxBeta = $value;
             }
         }

         if ($currentType == '0' && version_compare($currentVersion, $maxRelease['version']) < 0) {
             // 低版本正式版，升级更高正式版
             return $maxRelease;
         }else if ($currentType == '1' && version_compare($currentVersion, $maxRelease['version']) < 0) {
             // 低版本测试版，升级高正式版
             return $maxRelease;
         }else if ($currentType == '1' && version_compare($currentVersion, $maxBeta['version']) < 0) {
             // 高版本测试版，升级更高版本测试版
             return $maxBeta;
         }
         return $maxRelease;
    }

    public function _uCenterSetting(){
        $uCenterSetting =  $this->appHander->GetFromCache('uCenterAdminMy');
        foreach ($uCenterSetting as $key => $value) {
            if ($value['urlType'] == '0') {
                $uCenterSetting[$key]['url'] = $this->appHander->auto_to_url($value['url']);
            }
            $uCenterSetting[$key]['image'] = $this->appHander->auto_to_url($value['image']);

        }
        $return = array();
        // 以groupid进行分组
        foreach ($uCenterSetting as $key => $value) {
            $groupid = $value['groupid'] ? $value['groupid'] : 0;
            $return[$groupid][] = $value;
        }
        foreach ($return as $key => $value) {
            $return[$key] = array_values($value);
        }

        return array_values($return);
    }

    public function _chatSetting(){
        $socket = array();
        $socket['appid']  = $this->appHander->config['socket_appid'];
        $socket['appkey'] = $this->appHander->config['socket_appkey'];
        $socket['url'] = $this->appHander->config['socket_url'] ? $this->appHander->config['socket_url'] : 'wss://socket.zhanmishu.com/chat/';

        if (!$socket['appid']) {
            $socket['appid'] = $this->appHander->GetFromCache('socket_appid');
            if (!$socket['appid']) {
                $socket['appid'] = TIMESTAMP;
                $this->appHander->writeToCache('socket_appid',$socket['appid']);
            }
        }

        $chat = array();
        $chat['socket'] = $socket;
        $chat['socket'] = $socket;

        $chat['redEnvelop']     = $this->appHander->auto_to_url('source/plugin/zhanmishu_app/template/images/red-envelope.png');
        $chat['redEnvelopChat'] = $this->appHander->auto_to_url('source/plugin/zhanmishu_app/template/images/red-envelope-chat.png');
        
        $chat['emoji'] = $this->appHander->GetFromCache('emoji');
        foreach ($chat['emoji'] as $key => $value) {
            $chat['emoji'][$key]['icon'] = $this->appHander->auto_to_url('source/plugin/zhanmishu_app/template/images/emoji/'.$value['icon']);
        }
        $chat['emoji'] = array_chunk($chat['emoji'], 24);

        return $chat;
    }
    public function _videoSetting($field = array()){
        if ($this->_checkVideo()) {
            $return = array();
            foreach ($field as $key => $value) {
                if ($value) {
                    $return[$value] = $this->videoHander()->config[$value];
                }
            }
            return $return;
        }
        return array();
    }

    public function _checkVideo(){
        if (is_file(DISCUZ_ROOT.'source/plugin/zhanmishu_video/source/class/zhanmishu_video.php')) {
            return true;
        }
        return false;      
    }

    public function _checkWechatPay(){
        if (is_file(DISCUZ_ROOT.'source/plugin/zhanmishu_wepay/source/class/zhanmishu_wepay.php')) {
            return true;
        }
        return false;
    }
    public function _checkCredits(){
        if (is_file(DISCUZ_ROOT.'/source/plugin/zhanmishu_credit/source/class/zhanmishu_credit.php')) {
            return true;
        }
        return false;
    }

    public function _CreditChargeSetting(){
        if ($this->_checkWechatPay() && $this->_checkWechatPay()) {
            return $this->creditHander()->config;
        }

        return array();
    }
    public function videoHander(){
        if ($this->_checkVideo()) {
            C::import('zhanmishu_course','plugin/zhanmishu_video/source/class');
            return new zhanmishu_course();
        }
        return false;
    }
    public function creditHander() {
        if (!$this->_checkCredits()) {
            return false;
        }
        include_once DISCUZ_ROOT.'./source/plugin/zhanmishu_credit/source/Autoloader.php';
        return  new zhanmishu_credit();

    }
    public function creditChargePayCheck($params = array()){
        $return = $this->creditHander()->check_ispay_byout_trade_no($params['out_trade_no'],true);
        self::resultToJsonOutPut($return);
    }
    public function creditCharge($params){
        global $_G;
        if (!$this->_checkCredits() || !$this->_checkWechatPay()) {
            $return = array('code'=>'-40001','msg'=>'wechat_or_credits_plugin_not_exists');
            self::resultToJsonOutPut($return);
        }

        $orderInfo = array();
        //积分ID
        $orderInfo['creditid'] = $params['creditid'] + 0;
        // 积分总价 (前端给的)
        $orderInfo['total_fee'] = $params['allprice'] + 0;
        // 充值积分总数量（不包含赠送）
        $orderInfo['num'] = $params['num'] + 0;
        $orderInfo['uid'] = $_G['uid'];

        // 生成订单，校验数据是否正确
        $orderInfo = $this->creditHander()->buyCredits($orderInfo); 

        //生成订单

        include_once DISCUZ_ROOT.'source/plugin/zhanmishu_wepay/source/function/api_function.php';
        $orderInfo['body'] = lang('plugin/zhanmishu_credit','credit_title');
        $orderInfo['body_intro'] = lang('plugin/zhanmishu_credit','credit_title');
        $orderInfo['total_fee'] = $orderInfo['total_fee'] / 100;
        $orderInfo['openId'] = $_GET['openid'];

        if ($_GET['platform'] == 'minapp') {
            $payType = 'wechat_app';
        }else{
            $payType = '';
        }
        if (!$orderInfo['openId']) {
            if (is_file(DISCUZ_ROOT.'source/plugin/zhanmishu_wechat/source/class/zhanmishu_wechat_member.php')) {
                C::import('zhanmishu_wechat_member','plugin/zhanmishu_wechat/source/class');
                $orderInfo['openId'] = zhanmishu_wechat_member::get_openid_by_uid($_G['uid'],$_GET['platform']);     
            }
        }
        $payInfo = zhanmishu_pay_api($orderInfo,'1',$payType);
        $return = array();
        $return['orderInfo'] = $orderInfo;
        $return['payInfo'] = $payInfo;
        self::resultToJsonOutPut($return);
    }

    public function smsController(){
        $smsController = new  zhanmishu_app_sms_controller($this->appHander);
        return $smsController;
    }
    public function changeUsername($oldname, $newname) {
        global $_G;
        $member = "";
        if(isset($_G['setting']['membersplit'])) {
            $member = DB::fetch_first("SELECT * FROM ".DB::table('common_member_archive')." WHERE username='$oldname'");
        } else {
            $member = DB::fetch_first("SELECT * FROM ".DB::table('common_member')." WHERE username='$oldname'");
        }

        if($member) {
            DB::query("UPDATE ".DB::table('common_adminnote')." SET admin='$newname' WHERE admin='$oldname'");
            DB::query("UPDATE ".DB::table('common_block')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('common_block_item')." SET title='$newname' WHERE title='$oldname'");
            DB::query("UPDATE ".DB::table('common_block_item_data')." SET title='$newname' WHERE title='$oldname'");
            DB::query("UPDATE ".DB::table('common_card_log')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('common_failedlogin')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('common_grouppm')." SET author='$newname' WHERE author='$oldname'");
            DB::query("UPDATE ".DB::table('common_invite')." SET fusername='$newname' WHERE fusername='$oldname'");
            if(isset($_G['setting']['membersplit'])) {
                DB::query("UPDATE ".DB::table('common_member_archive')." SET username='$newname' WHERE username='$oldname'");
            } else {
                DB::query("UPDATE ".DB::table('common_member')." SET username='$newname' WHERE username='$oldname'");
            }
            DB::query("UPDATE ".DB::table('common_member_security')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('common_member_validate')." SET admin='$newname' WHERE admin='$oldname'");
            DB::query("UPDATE ".DB::table('common_member_verify_info')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('common_member_security')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('common_mytask')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('common_report')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('common_session')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('common_word')." SET admin='$newname' WHERE admin='$oldname'");
            DB::query("UPDATE ".DB::table('forum_activityapply')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('forum_announcement')." SET author='$newname' WHERE author='$oldname'");
            DB::query("UPDATE ".DB::table('forum_collection')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('forum_collectioncomment')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('forum_collectionfollow')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('forum_collectionteamworker')." SET username='$newname' WHERE username='$oldname'");
            //  DB::query("UPDATE ".DB::table('forum_creditslog')." SET umpire='$newname' WHERE umpire='$oldname'");
            DB::query("UPDATE ".DB::table('forum_forumrecommend')." SET author='$newname' WHERE author='$oldname'");
            DB::query("UPDATE ".DB::table('forum_groupuser')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('forum_imagetype')." SET name='$newname' WHERE name='$oldname'");
            DB::query("UPDATE ".DB::table('forum_order')." SET buyer='$newname' WHERE buyer='$oldname'");
            DB::query("UPDATE ".DB::table('forum_order')." SET admin='$newname' WHERE admin='$oldname'");
            DB::query("UPDATE ".DB::table('forum_pollvoter')." SET username='$newname' WHERE username='$oldname'");
            $posttablename = C::t('forum_post')->getposttable(0);
            DB::query("UPDATE ".DB::table($posttablename)." SET author='$newname' WHERE author='$oldname'");
            DB::query("UPDATE ".DB::table('forum_postcomment')." SET author='$newname' WHERE author='$oldname'");
            DB::query("UPDATE ".DB::table('forum_promotion')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('forum_ratelog')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('forum_rsscache')." SET author='$newname' WHERE author='$oldname'");
            DB::query("UPDATE ".DB::table('forum_thread')." SET author='$newname' WHERE author='$oldname'");
            DB::query("UPDATE ".DB::table('forum_threadmod')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('forum_trade')." SET seller='$newname' WHERE seller='$oldname'");
            DB::query("UPDATE ".DB::table('forum_tradelog')." SET seller='$newname' WHERE seller='$oldname'");
            DB::query("UPDATE ".DB::table('forum_tradelog')." SET buyer='$newname' WHERE buyer='$oldname'");
            DB::query("UPDATE ".DB::table('forum_warning')." SET author='$newname' WHERE author='$oldname'");
            DB::query("UPDATE ".DB::table('home_album')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_blog')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_clickuser')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_comment')." SET author='$newname' WHERE author='$oldname'");
            DB::query("UPDATE ".DB::table('home_docomment')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_doing')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_feed')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_feed_app')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_follow')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_follow')." SET fusername='$newname' WHERE fusername='$oldname'");
            DB::query("UPDATE ".DB::table('home_follow_feed')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_follow_feed_archiver')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_friend')." SET fusername='$newname' WHERE fusername='$oldname'");
            DB::query("UPDATE ".DB::table('home_friend_request')." SET fusername='$newname' WHERE fusername='$oldname'");
            DB::query("UPDATE ".DB::table('home_notification')." SET author='$newname' WHERE author='$oldname'");
            DB::query("UPDATE ".DB::table('home_pic')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_poke')." SET fromusername='$newname' WHERE fromusername='$oldname'");
            DB::query("UPDATE ".DB::table('home_share')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_show')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_specialuser')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('home_visitor')." SET vusername='$newname' WHERE vusername='$oldname'");
            DB::query("UPDATE ".DB::table('home_specialuser')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('portal_article_title')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('portal_comment')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('portal_rsscache')." SET author='$newname' WHERE author='$oldname'");
            DB::query("UPDATE ".DB::table('portal_topic')." SET username='$newname' WHERE username='$oldname'");
            DB::query("UPDATE ".DB::table('portal_topic_pic')." SET username='$newname' WHERE username='$oldname'");
                
            $sets = C::t('common_setting')->fetch_all(array('threadtableids'), true);
            $threadtableids = $sets['threadtableids'] ? $sets['threadtableids'] : array();
            foreach($threadtableids as $tableid) {
                if(!$tableid) {
                    continue;
                }
                $thtablename = "forum_thread_$tableid";
                DB::query("UPDATE ".DB::table($thtablename)." SET author='$newname' WHERE author='$oldname'");
            }

            // 分表情况
            foreach(C::t('forum_post')->show_table() as $table) {
                list($tempkey, $tablename) = each($table);
                $tableid = substr($tablename, strrpos($tablename, '_') + 1);
                if(!preg_match('/^\d+$/', $tableid)) {
                    continue;
                }
                $pttablename = getposttable($tablename);
                DB::query("UPDATE ".DB::table($pttablename)." SET author='$newname' WHERE author='$oldname'");
            }

            if(!defined('DISCUZ_VERSION')) {
                require_once './source/discuz_version.php';
            }
            if(DISCUZ_VERSION == 'X3' || DISCUZ_VERSION == 'X3.1') {
                DB::query("UPDATE ".DB::table('forum_collection')." SET username='$newname' WHERE username='$oldname'");
                DB::query("UPDATE ".DB::table('forum_collectioncomment')." SET username='$newname' WHERE username='$oldname'");
                DB::query("UPDATE ".DB::table('forum_collectionfollow')." SET username='$newname' WHERE username='$oldname'");
                DB::query("UPDATE ".DB::table('forum_collectionteamworker')." SET username='$newname' WHERE username='$oldname'");
                DB::query("UPDATE ".DB::table('home_follow')." SET username='$newname' WHERE username='$oldname'");
                DB::query("UPDATE ".DB::table('home_follow')." SET username='$fusername' WHERE username='$fusername'");
                DB::query("UPDATE ".DB::table('home_follow_feed')." SET username='$newname' WHERE username='$oldname'");
                DB::query("UPDATE ".DB::table('home_follow_feed_archiver')." SET username='$newname' WHERE username='$oldname'");
            }
        }
        return $member;
    }

    public function changeUcenterUsername($oldname, $newname) {
        loaducenter();
        
        DB::query("UPDATE ".UC_DBTABLEPRE."admins SET username='$newname' WHERE username='$oldname'");
        DB::query("UPDATE ".UC_DBTABLEPRE."badwords SET admin='$newname' WHERE admin='$oldname'");
        DB::query("UPDATE ".UC_DBTABLEPRE."feeds SET username='$newname' WHERE username='$oldname'");
        DB::query("UPDATE ".UC_DBTABLEPRE."members SET username='$newname' WHERE username='$oldname'");
        DB::query("UPDATE ".UC_DBTABLEPRE."mergemembers SET username='$newname' WHERE username='$oldname'");
        DB::query("UPDATE ".UC_DBTABLEPRE."protectedmembers SET username='$newname' WHERE username='$oldname'");
    }

}
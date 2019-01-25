
--[[]]
vpnKey = '1'  --vpn等0 则是启用vpn 其它就是不启动vpn
starKey = '5' --星级选择0为5星，
AsoKey = '1' -- 0为aso模式
--]]


starKey = tonumber(starKey)
require("TSLib")
require("tsp")
require("Api")
require("yzm")

delay(2)

function iososver()
	ios = getOSVer()
	nLog(ios)
	ios_table = split(ios,'.')
	return tonumber(ios_table[1])
end
iosver = iososver()
toast("IOS"..iosver.."--ASO即将开始",2)
delay(2)

if iosver == 9 then
	local tsld = loadTSLibrary("aso.tsl") --库加载
	if tsld.status == 0 then --验证判断
		dialog("插件加载异常", 0)
		return
	end
	require("ascmd") --需要加载
	--以上代码请在脚本开头先调用验证加载，只需加载一次
end

--删除文件
function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end
apple_id_file = {
	'/var/mobile/Library/Accounts/Accounts3.sqlite',
	'/var/mobile/Library/Accounts/Accounts3.sqlite-shm',
	'/var/mobile/Library/Accounts/Accounts3.sqlite-wal',
}
function dell_apple()
	closeApp("com.apple.AppStore",1)
	mSleep(2000)
	for i,v in pairs(apple_id_file)do
		delFile(v)
	end
	os.execute("find /private/var/containers/Data/System/ -name updates.* | xargs rm -rf")
	os.execute("find /private/var/containers/Data/System/ -name appstored.* | xargs rm -rf")
	
	mSleep(500)
	os.execute("launchctl kickstart -k system/com.apple.appstored")
end

--设置插件置顶
function top(app_id)
	aso_path='/var/mobile/asoinsert.txt'
	writeFiles(aso_path,app_id)
	return true
end
-----加截完成----------------------------------------
init("0",0)
AppStore = 'com.apple.AppStore'

----------------------------------------系统参数---------------------------------
m = {}
--------------------------------全局参数-----------------------------------------------
m['灰']={{397,5,0x939394},{415,5,0x939394},{430,5,0x939394},{443,5,0x939394},}
--------------------------------登录判断区域-------------------------------------------------
m['iTunes与App']={{138,86,0x000000},{149,76,0xf6f6f8},{160,74,0x000000},{481,82,0xf6f6f7},
	{483,80,0x000000},{535,87,0x070707},{540,88,0xf6f6f8},}
m['ios9.0']={{541,87,0x070707},{541,88,0xf6f6f8},}
m.正在登录 = { 0x828282, "0|3|0xf9f9f9,8|2|0x828282,30|-2|0x828282", 90, 412, 454, 493, 496}
m.登录灰={ 0x8f8f8f, "0|2|0xffffff,8|6|0xffffff,8|8|0x8f8f8f,12|15|0xffffff,14|17|0x8f8f8f", 90, 11, 205, 110, 275}
m.AppleID = { 0x007aff, "4|0|0xffffff,8|0|0x007aff", 90, 128, 237, 142, 245}
m.登录={ 0x007aff, "17|1|0x007aff", 90, 22, 219, 65, 265}
m.密码={ 0xc7c7cd, "16|-5|0xc7c7cd,29|-5|0xd0d0d6", 90, 86, 333, 151, 400}
m.登录按钮={ 0x007aff, "17|-7|0xf9f9fa,37|-2|0x007aff", 90, 407, 409, 505, 473}
m.正在登录={ 0x828282, "0|3|0xf9f9f9,8|2|0x828282,30|-2|0x828282", 90, 412, 454, 493, 496} --弹窗登录灰色
m.注销 = { 0x007aff, "13|4|0xf5f5f5,20|1|0x007aff,28|-4|0x007aff", 90, 272, 572, 367, 649}
---------------------------------APP搜索区域-------------------------------------------------
m['搜索']={ 0x929292, "2|2|0x929292", 90, 438, 1065, 477, 1105}
m.搜索blue= { 0x007aff, "0|4|0x007aff", 90, 423, 1107, 469, 1135}
m['top-搜索']={ 0x8e8e93, "5|-1|0xe3e4e6,18|-1|0x909096", 95, 259, 65, 307, 107}
m['空格']={ 0x000000, "8|10|0x000000", 90, 244, 1062, 366, 1119}
m['搜']={ 0xffffff, "2|0|0x007aff", 90, 515, 1065, 603, 1112}
m['热门搜索']={{322,225,0xffffff},{323,225,0x090909},{357,234,0x000000},{383,225,0xffffff},
	{385,227,0x000000},{400,220,0x000000},{400,229,0xffffff},}
m.有结果={ 0x0080fc, "-26|-21|0x0080fc,-31|28|0x0080fc", 90, 473, 155, 639, 1037}
m.结果云={ 0x0080fc, "0|-1|0xffffff,-5|14|0x808080,6|14|0x7f7f7f", 90, 528, 162, 630, 306}
m.在搜索界面 = { 0x8e8e93, "-7|9|0x8e8e93,8|9|0x8e8e93,1|10|0xe4e5e7,0|16|0x8e8e93", 90, 572, 63, 617, 107}
m.AppPage={ 0x007aff, "-17|16|0x007aff,0|15|0xf9f9f9,1|32|0x007aff", 90, 8, 52, 50, 113}
m.详情页={ 0x007aff, "-18|20|0x007aff,17|-14|0xf9f9f9,19|-16|0x007aff", 90, 424, 29, 534, 126}
m.有应用={ 0x0080fc, 90, 469, 175, 630, 450}
m.有应用图版 = { 0x0080fc, "28|23|0x0080fc,-15|50|0x0080fc", 90, 509, 129, 615, 1019}
---------------------------------下载区域----------------------------------------------------
m.获取={ 0x0080fc, "-57|-1|0x0080fc,33|1|0x0080fc", 90, 497, 279, 623, 419}
m.安装={ 0x19ab20, "-22|-17|0x19ab20,-12|33|0x19ab20", 90, 498, 285, 622, 465}
m.打开={ 0x0080fc, "5|-3|0xffffff,27|-3|0x0080fc,-24|-1|0x0080fc,-35|0|0xffffff,-62|0|0x0080fc", 90, 490, 228, 630, 510}
m.正在下载={ 0x0080fc, "-1|0|0xffffff,15|15|0x0080fc,16|16|0xffffff,7|-18|0x0080fc,8|33|0x0080fc", 90, 511, 256, 632, 498}
m.正在转圈 = {  0x188dfd, 90, 509, 256, 633, 553}
m.云={ 0x0080fc, "0|27|0x0080fc,-5|14|0x808080,-1|14|0xffffff,6|14|0x7f7f7f", 90, 497, 279, 623, 519}
---------------------------------弹窗提示----------------------------------------------------
m.登录iTunes={ 0x070707, "-27|-9|0x000000,-27|8|0x000000,-58|-13|0x000000,-61|-7|0x000000,-80|-10|0x000000", 90, 368, 205, 461, 254}
m.十五分需要={ 0x040404, "0|1|0xf8f8f8,10|-8|0x000000,34|-1|0x000000,35|2|0xf8f8f8,31|4|0x000000", 90, 489, 440, 562, 485}
m.不再另外收费={ 0x000000, "-6|5|0x000000,0|29|0x000000,43|18|0x000000,53|4|0x000000,28|4|0x000000", 90, 436, 525, 513, 570}
m.无法连接到={ 0x000000, "3|1|0xf8f8f9,21|2|0x000000,76|12|0xf8f8f9,80|15|0x070707,131|8|0x000000,188|12|0xf9f9f9", 90, 303, 500, 512, 544}
m.验证失败={ 0x000000, "12|-4|0xf9f9f9,21|0|0x000000,24|7|0x010101,31|-6|0x000000,36|-3|0xf9f9f9,36|-1|0x000000", 90, 319, 475, 390, 519}
m.保存密码={ 0x000000, "27|0|0x000000,13|18|0x060606,43|9|0x000000,57|20|0x000000,46|20|0x000000", 90, 415, 460, 494, 506}
m.自动下载={ 0x000000, "5|4|0x000000,3|16|0xf9f9f9,-11|16|0x000000,-9|18|0x080808", 90, 511, 530, 552, 570}
m.购买过了={ 0x000000, "9|-4|0xf9f9f9,26|-4|0x000000,30|12|0x000000,35|16|0xf9f9f9,38|15|0x000000", 90, 436, 524, 508, 565}
m.无法下载项目={ 0x000000, "0|7|0xefefee,0|8|0x020202,-3|28|0x000000,17|23|0xefede9,18|28|0x010101", 80, 388, 481, 422, 519}
m.免费项目={ 0xf8f8f9, "3|-3|0x000000,8|-3|0xf8f8f9,9|-4|0x090909,49|18|0x000000,49|16|0xf7f7f9", 90, 411, 458, 515, 506}
m.自动下载={ 0x000000, "5|4|0x000000,3|16|0xf9f9f9,-11|16|0x000000,-9|18|0x080808", 90, 511, 530, 552, 570}
m['需要验证']={{385,470,0x000000},{380,473,0xf8f8f8},{486,674,0x007aff},{165,683,0x007aff},}
m.验证ID={0x000000, "36|0|0x000000,54|0|0x000000,53|26|0x000000,196|15|0x000000", 90, 205, 434, 433, 518}
m.帐户设置={{259,69,0x000000},{259,100,0xf6f6f8},{291,72,0x060606},{316,83,0xf6f6f7},{349,83,0x000000},{380,82,0x000000},}
m.帐户设置完成={ 0x007aff, "0|-3|0xf6f6f8,0|-5|0x067dff", 90, 562, 75, 612, 95}
m['unbale']={{91,444,0x0a0a0a},{371,444,0x000000},{546,460,0x000000},{326,697,0x007aff},{299,697,0x007aff},}
m['未过检']={{321,446,0x262626},{353,451,0x000000},{353,449,0xf9f9f9},{368,451,0x000000},{369,459,0x090909},}
m.简短的验证={ 0x000000, "0|2|0xe6e6e5,0|9|0x1d1d1d,1|20|0x000000,-13|0|0x000000", 90, 472, 440, 492, 609}
m.简短的验证继续={ 0x007aff, "0|-10|0x007aff", 90, 396, 604, 568, 712}
m.简短的验证出现验证码 ={ 0x000000, 90, 83, 150, 554, 262} 

m.蓝色提示={ 0x007aff, "0|7|0x007aff", 90, 138, 617, 477, 686}
m.蓝色提示2={ 0x007aff, "1|-3|0xf1f2f3", 90, 86, 400, 550, 751}
---------------------------------帐号处理区域------------------------------------------------
m.锁定={ 0x000000, "16|11|0x000000,50|10|0xf9f9f9,53|7|0x060606,84|17|0x000000,88|26|0x000000", 90, 333, 458, 452, 513}
m.帐号锁定={ 0x080808, "21|0|0x070707,14|6|0xf8f9f9,20|20|0x000000", 90, 528, 430, 555, 460}
m.禁用={ 0x000000, "-2|3|0xf9f9f9,15|0|0x000000,12|13|0x000000,12|15|0xf9f9f9,15|17|0x000000", 90, 368, 463, 410, 502}
m['停用']={{475,510,0x000000},{326,628,0x007aff},{315,512,0x0a0a0a},}
---------------------------------修改协议----------------------------------------------------
m.立即下载={ 0x000000, "17|-18|0xf3f3f4,28|-21|0x000000,52|-25|0x000000,54|3|0x000000,111|3|0x000000,131|-19|0x000000", 80, 
	239, 445, 390, 524}
m.协议更改={ 0x000000, "21|3|0xf9f9f9,23|1|0x000000,20|26|0x000000,59|5|0x000000,59|3|0xf9f9f9,61|1|0x000000", 90, 486, 441, 561, 486}
m['协议iTunesStore']={{224,84,0x000000},{235,76,0xf7f7f7},{237,75,0x000000},{356,78,0x000000},{417,87,0x070707},{417,88,0xf7f7f7},}
m.协议同意={ 0x007aff, "20|-2|0x007aff,29|0|0xf7f7f7,31|6|0x007aff", 90, 549, 1069, 626, 1113}
m.协议弹窗同意={ 0x007aff, "23|-5|0xf9f9f9,25|-7|0x007aff,9|6|0x007aff,9|7|0xf9f9f9,56|3|0x007aff", 90, 413, 625, 494, 671}
m.协议完成={ 0x007aff, "0|5|0x007aff,6|12|0x007aff,51|1|0x007aff", 90, 547, 60, 627, 109}
m['简短的验证界面']={{385,70,0x000000},{380,80,0xf9f9f9},{379,82,0x000000},{386,97,0x1e1e1e},}
---------------------------------协议修改--END-----------------------------------------------
m.评论={ 0x848484, "13|0|0x848484,34|-2|0x848484,38|9|0x848484", 90, 237, 368, 398, 555}
m.评论激活={ 0x848484, "160|4|0x848484,64|-18|0x848484,72|27|0x848484", 90, 230, 351, 407, 535}
m.五星灰={ 0x848484, "21|0|0x848484,41|0|0x848484,61|0|0x848484,80|0|0x848484", 90, 10, 617, 133, 1031}
m.撰写评论={ 0x0080fc, "21|-1|0x0080fc,46|9|0x0080fc,81|10|0x0080fc,113|11|0x0080fc", 90, 87, 471, 231, 1037}
m['撰写评论界面']={{258,86,0x000000},{311,84,0x000000},{343,86,0x000000},{380,97,0x000000},}
m.评论发送={ 0x007aff, "4|-5|0x007aff", 90, 565, 77, 622, 100}
m.创建昵称={ 0xc7c7cd, "21|-1|0xc7c7cd", 100, 239, 236, 316, 283}
m.评论标题={ 0xc7c7cd, "22|4|0xc7c7cd,39|-6|0xffffff,41|-3|0xc7c7cd", 98, 44, 248, 98, 277}
m.评论标题2={ 0xc7c7cd, "-1|-8|0xc7c7cd", 100, 62, 339, 98, 364}
m.评论内容={ 0xb2b2b2, "25|7|0xb2b2b2", 100, 10, 313, 249, 456}
m['评论完成'] = {{566,74,0x007aff},{573,72,0xf9f9f9},{574,72,0x007aff},{570,82,0xf9f9f9},{569,82,0x007aff},}

-------------------------------ios10区域---------------------------------------------
ios={}
ios['设置']={}
ios['设置']['登录界面']={{544,87,0x0c0c0d},{354,76,0xf5f5f7},}
ios['弹窗']={}
ios['弹窗']['需要登录']={ 0x000000, "121|3|0xf6f6f6,125|0|0x272727,116|28|0x000000,62|1|0x000000", 90, 253, 205, 386, 293}
ios['弹窗']['需要itunes']={ 0x000000, "0|-3|0xf4f3ee,0|-7|0x000000,195|9|0x0d0d0d,195|12|0xf8f8f8", 90, 259, 196, 458, 274}
ios['弹窗']['简短验证']={ 0x000000, "-22|7|0x000000,-4|2|0xf7f4f8,-6|2|0x000000,0|20|0x000000", 90, 465, 532, 491, 595}
ios['弹窗']['错误过多']={ 0x1c1c1c, "10|-3|0xf7f8f8,10|-6|0x030303,1|-22|0xf7f8f9,4|-22|0x000000,47|-27|0x000000", 90, 252, 198, 318, 500}
ios['弹窗']['此项目大于150m']={ 0x141414, "29|1|0xf7f7f7,29|0|0x141414,51|-6|0x171717,52|-6|0xf8f8f8,64|2|0x000000", 90, 278, 422, 345, 517}
ios['弹窗']['右边的好']={ 0x007aff, "-1|-21|0x007aff", 90, 364, 429, 564, 722}
ios['弹窗']['15分钟后']={ 0x1a1a1a, "-10|3|0xf8f8f8,-9|9|0x000000,-3|11|0x8c8c8c,-3|12|0x000000", 90, 525, 450, 541, 480}


ios['协议']={}
ios['协议']['验证界面']={{385,70,0x000000},{385,73,0xf9f9f9},{384,82,0x000000},{386,94,0xf9f9f9},}
ios['协议']['输入动态字符']={ 0xb6b6b6, "0|4|0xf9f9f9,0|10|0xb6b6b6", 90, 244, 324, 264, 360}
ios['协议']['下一页']={ 0x0d81ff, "-1|-1|0xf9f9f9,-1|-3|0x007aff", 90, 608, 66, 623, 104}
ios['协议']['右下完成']={ 0x007aff, "20|0|0x007aff", 90, 503, 460, 634, 696}

ios['APP']={}
ios['APP']['获取']={ 0x0080fc, "42|1|0x0080fc,-2|-22|0x0080fc,0|28|0x0080fc,40|-3|0xffffff", 90, 477, 262, 636, 550}
ios['APP']['打开']={ 0x0080fc, "-23|1|0xffffff,-23|2|0x0e86fd,-23|5|0xffffff,-53|5|0x0080fc,-55|5|0xffffff,-64|4|0xffffff", 90, 471, 231, 635, 547}

ios['评论']={}
ios['评论']['评论灰']={ 0x848484, "4|12|0x848484,0|21|0x848484,23|10|0x848484,18|10|0xffffff", 90, 225, 391, 414, 642}

-------------------------------评论部分--------------------------------------------
function beforeUserExit()
    close_VPN()
end

function CommentStar(starKey)
	if starKey == 0 then  --5星
		if isColor(459,159,0xb2b2b2)then
			click(459,159)
			return true
		end
	elseif starKey == 1 then --4星
		if isColor(388,160,0xb2b2b2)then
			click(388,160)
			return true
		end
	elseif starKey == 2 then --3星
		if isColor(  318,  160,0xb2b2b2)then
			click(  318,  160)
			return true
		end
	elseif starKey == 3 then --2星
		if isColor(  247,  160,0xb2b2b2)then
			click(  247,  160)
			return true
		end
	elseif starKey == 4 then --1星
		if isColor(  178,  160,0xb2b2b2)then
			click(  178,  160)
			return true
		end
	end
end

function Comment(title,content,user_name)
	outTime = os.time()
	setp = 1
	--starKey = math.random(0,1)
	while os.time()-outTime < 60 * 3 do
		if setp == 1 then
			if f_pic(m.评论激活,"评论激活")then
				if f_pic(m.撰写评论,'撰写评论') then
					setp = 2
				end
			elseif f_pic(m.五星灰,'五星灰')and f_pic(m.评论激活,"评论激活") then
				moveUp(314,841,318,746)
			elseif c_pic(m.评论,'点击评论')or c_pic(ios['评论']['评论灰'],'评论灰')then
			end
		elseif setp == 2 then
			if f_pic(m.评论发送,'评论发送')then
				setp = 3
			elseif c_pic(m.撰写评论,'撰写评论') then
			end
			
			nikename_do = true
			title_do = true
			content_do = true
			send_do = true
			
		elseif setp == 3 then
			if f_pic(m.评论激活,"评论激活") and f_pic(m.撰写评论,'撰写评论')then
				nLog('评论发送成功')
				return true
			elseif CommentStar(starKey)then  ---判断5星 为灰色则点击
				
			elseif nikename_do and c_pic(m.创建昵称,'创建昵称')then
				input(user_name)
				nikename_do = false
			elseif title_do and c_pic(m.评论标题,'标题')or c_pic(m.评论标题2,'标题') then
				input(title)
				title_do = false
			elseif content_do and c_pic(m.评论内容,'评论内容')then
				input(content)
				c_pic(m['空格'],'空格')
				content_do = false
			elseif send_do and c_pic(m.评论发送,'评论发送')then
				send_do = false
			end
		end
		mSleep(1000)
		other()
	end
	return false
end

function moveUp(x1,y1,x2,y2)
	touchDown(1, x1, y1);
	mSleep(30)
	for i = 0, math.abs(y1 - y2), 15 do
		touchMove(1, x1,y1-i); 
		mSleep(20);         
	end
	touchUp(1, x1, y1-math.abs(y1 - y2)); 
	mSleep(100)
end

function Rond()
	if f_pic(m.获取,'获取') or f_pic(ios['APP']['获取'],'ios10获取')then
		get_mun = get_mun or 0
		get_mun = get_mun + 1
		if get_mun > 50 then
			getApp = true
			installApp = true
			get_mun = 0
		end
	elseif f_pic(m.安装,'安装')then
	elseif f_p(m.正在转圈,"检测是否转圈")then
		if f_p({0xffffff,90,x+25,y,x+26,y+1},'中心白')then
			Ring = 1
			if f_p({0xffffff,90,x+23,y-26,x+25,y-24},'上蓝')then
				Ring = Ring + 1
			end
			if f_p({0xffffff,90,x+49,y-1,x+51,y+1},'右蓝')then
				Ring = Ring + 1
			end
			if f_p({0xffffff,90,x+23,y+24,x+26,y+26},'下蓝')then
				Ring = Ring + 1
			end
			if Ring >= 3 then
				return true
			end
		end
	end
end
function close_VPN()
	setVPNEnable(false)
	delay(2)
end
function VPN()
	init(0,0);
	out_time = os.time()
	while (true) do
		setVPNEnable(true)
		delay(2)
		flag = getVPNStatus()
		if flag.active then
			log("VPN 打开状态"..flag.status)
			if flag.status == '已连接' then
				return true
			end
		else
			log("VPN 关闭状态"..flag.status)
		end
	end
	if os.time() - out_time > 120 then
		return false
	end
end
function other()
	if done(m.灰,'有弹窗-进入错误处理')then
		delay(2)
		if f_pic(m.登录iTunes,'需要密码') or f_pic(ios['弹窗']['需要登录'],'需要登录')or f_pic(ios['弹窗']['需要itunes'],'10--登录') then--ok
			输入密码 = 输入密码 or 0
			if 输入密码 == 1 then
				delay(2)
				input(password)
				click(457,505)
				输入密码 = 0
			else
				click(177,488)		--不在购买页面时和评论时 取消输入密码
			end
		elseif f_pic(m.十五分需要,'十五分需要')or f_pic(ios['弹窗']['15分钟后'],'15分钟后')then       	--ok
			click(478,692)
		elseif f_pic(m.保存密码,'保存密码')then				--OK
			click(185,669)
		elseif f_pic(m.无法连接到,'无法连接到')then			--ok
			click(325,628)
			return true
		elseif f_pic(m.立即下载,'立即下载')then				--ok
			click(321,668)
		elseif f_pic(m.不再另外收费,'不再另外收费')then		--ok
			click(322,650)
		elseif done(m.未过检,"未过检")then					--未定
			click(198,685)
			errorAccount("未过检",0)
			return true
		elseif f_pic(m.无法下载项目,'无法下载项目')then		--ok
			click(191,651)
		elseif f_pic(m.协议更改,'协议更改')then				--ok
			click(461,691)
		elseif c_pic(m.协议弹窗同意,'协议弹窗同意')then		--ok
		elseif done(m['需要验证'],'需要验证')then				--ok
			click(446,665)
		elseif f_pic(m.简短的验证,"简短的验证") or f_pic(ios['弹窗']['简短验证'],'简短验证') then
			c_pic(m.简短的验证继续,"简短的验证继续")
		elseif f_pic(m.验证失败,'验证失败')then      			--ok
			click(321,652)
		----------------------------------------帐号封号处理-------------------------------------
		elseif c_pic(m.帐号锁定,'帐号锁定')then
			errorAccount('锁定',3)
			click(  322,  707)
			return true
		elseif f_pic(m.锁定,'锁定')then						--ok
			click(450,667)
			errorAccount('锁定',3)
			return true
		elseif f_pic(m.禁用,'禁用')then						--ok
			click(180,663)
			errorAccount('禁用',2)
			return true
		elseif f_pic(ios['弹窗']['错误过多'],'错误过多')then--ok
			click(320,666)
			errorAccount('错误过多',2)
			return true
		elseif done(m.停用,'停用')then						--ok
			click(327,632)
			errorAccount('停用',4)
			return true
		elseif f_pic(m.验证ID,'验证ID')then
			click(450,667)
			errorAccount('锁定',3)
			return true
		elseif f_pic(ios['弹窗']['此项目大于150m'],'此项目大于150m')then
			c_pic(ios['弹窗']['右边的好'],'右边的好')
		----------------------------------------帐号封号处理-------------------------------------
		elseif c_pic(m.蓝色提示,'蓝色提示')then				--待定
			ipaUninstall(app_id)
		elseif login_setp ~= 2 and c_pic(m.蓝色提示2,'蓝色提示2')then			--确定
			ipaUninstall(app_id)
------------------------------------帐号处理问题------------------------
		end
	else
		if done(m.协议iTunesStore,'协议iTunesStore')then
			c_pic(m.协议同意,'协议同意')
			c_pic(m.协议完成,'协议完成')
		elseif done(m.帐户设置,'帐户设置')then
			c_pic(m.帐户设置完成,'帐户设置完成')
		elseif done(m.简短的验证界面,'简短的验证界面') or done(ios['协议']['验证界面'],'简短的验证界面ios10') then
			
			打码计时 = os.time()
			截图 = true
			识别验证码 = false
			输入验证码 = false
			输入确定 = false
			输入次数 = 0
			
			while (done(m.简短的验证界面,'简短的验证界面') or done(ios['协议']['验证界面'],'简短的验证界面ios10')) do
				mSleep(1000 * 2)
				
				if 输入确定 then
					if c_pic(ios['协议']['下一页'],'下一页')then
						delay(10)
						输入次数 = 输入次数 + 1
						输入确定 = false
					end
				else
					if 输入次数 >= 2 then
						lzReportError(lz_username, lz_password, yzmid)		--报错
						log("yzm报错")
						return false
					elseif 输入次数 > 0 then
						lzReportError(lz_username, lz_password, yzmid)		--报错
						log("yzm报错")
						截图 = true
						输入确定 = false
					end
				end
				
				if 输入验证码 then
					if c_pic(ios['协议']['输入动态字符'],'输入动态字符')then
						input(apple_yzm)
						delay(1)
						c_pic(ios['协议']['右下完成'],'右下完成')
						输入验证码 = false
						输入确定 = true
					end
				end
				
				if 识别验证码 and lz_yzm() then
					if apple_yzm == nil then
						toast("验证码识别失败",1)
						lzReportError(lz_username, lz_password, yzmid)		--报错
						return true
					else
						log('识别完成一次')
						识别验证码 = false
						输入验证码 = true
					end
				end
				
				if 截图 then
					if f_p(m.简短的验证出现验证码,"验证码出现") then
						imgfile = lzScreen(82,180,557,295,1.0)
						mSleep(1000*2)
						截图 = false
						识别验证码 = true
						log('截图完成')
					end
				end
				
				getApp = true
				installApp = true
				
				if os.time()-打码计时 > 120 then
					log('识别超时')
					lzReportError(lz_username, lz_password, yzmid)
					closeX(AppStore)
					return true
				end
			end
		end
	end
end

function login()
	login_arr = {'启动设置','准备登录','查询网络','获取帐号','登录帐号'}
	login_setp = 1
	logout = 0
	out_time = os.time()
	超时 = 60 * 3
	open_one = true
	login_false_mun = 0
	
	while (true) do
		if login_setp == 1 then
			if done(m.iTunes与App,'iTunes与App')or done(m['ios9.0'],'ios9.0')or done(ios['设置']['登录界面'],'ios10登录界面')then
				login_setp = 2
			elseif open_one then
				openURL("prefs:root=STORE"); --打开登录界面
				toast('打开登录界面',1)
				delay(5)
				open_one = false
			end
		elseif login_setp == 2 then
			if logout == 0 and c_pic(m.AppleID,'已经登录')then
				logout = 1
			elseif f_pic(m.AppleID,'已经登录')then
				login_arr[2]='待注销帐号'
				if done(m.灰,'注销弹窗')and c_pic(m.注销,'注销')then
					login_arr[2]='注销帐号'
					delay(5)
				end
			elseif f_pic(m.登录,'找到登录')then
				login_setp = 3
			elseif done(m.灰,'注销弹窗')and c_pic(m.注销,'注销')then
				login_arr[2]='注销帐号'
				delay(5)
			end
			close_VPN()
		elseif login_setp == 3 then
			if vpnKey ~= '0' or VPN()then
				mSleep(1000 * 1)
				if getNetTime()>0 then
					login_setp = 5
				else
					toast('网络异常',5)
					delay(3)
				end
			end
		elseif login_setp == 5 then
			if f_pic(m.AppleID,'登录成功')then
				toast('登录成功',1)
				return true

			elseif c_pic(m.登录,'登录')then
				delay(3)
				input("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b")
				input(account)
				click(597,1095) --点击换行
				input(password)
				click(597,1095) --点击登录
				if c_pic(m.登录按钮,'登录按钮')then
					mSleep(1000*5)	--给5秒反应时间
				end

			elseif f_pic(m.密码,'密码')then
				click(165,437) --点击取消,由输入错误
				login_false_mun = login_false_mun + 1
				if login_false_mun > 4 then
					errorAccount('停用',4)
					return false
				end
			elseif f_pic(m.登录灰,'登录灰')or f_pic(m.正在登录,'正在登录,弹窗灰')then
				toast('正在登录',1)
				delay(3)
			end			
		end
		sotp = sotp or 0
		if sotp ~= login_setp then
			sotp = login_setp
			waitTimes = os.time()
		elseif sotp == login_setp then
			if os.time() - waitTimes > 超时 then
				closeX(frontAppBid())
				toast('登录超时,网络错误',1);
				mSleep(2000)
				return false
			end
		end
		if other()then
			return false
		end
		mSleep(1000)
	end
end

function search(keywords,image,app_id)
	打码 = true
	closeX(AppStore)
	delay(2)
	search_arr = {'打开STORE','输入关键词','下拉应用','购买页面'}
	search_setp = 1
	计时 = os.time()
	wait_mun = 60 * 3
	验证码界面 = 0
	输入密码 = 1
	
	while (true) do
		if search_setp == 1 then
			if iosver == 10 then	--如果是ios10 则采用插件
				top(image)
			else
				AppstoreTopApp(image)
			end
			
			if active(AppStore)then
				delay(2)
			elseif c_pic(m.搜索,'搜索')then
			elseif f_pic(m.搜索blue,'搜索-blue')then
				search_setp = 2
			end
		elseif search_setp == 2 then
			if f_pic(m.有结果,'有结果')or f_pic(m.结果云,'结果云')then
				search_setp = 3
				mSleep(1000)
			elseif c_pic(m['top-搜索'],'top-搜索')then
				input("\b\b\b\b\b\b\b\b\b\b\b\b")
				inputText(keywords)
			--	input(keywords)
				log(keywords)
				if c_pic(m['空格'],'空格')then
				--	input('\b')
				end
				c_pic(m['搜'],'搜')
				mSleep(3000)
			elseif c_pic(m['搜'],'搜')then
			end
			
		elseif search_setp == 3 then
			if f_pic(m.在搜索界面,'搜索界面')then
				if appstoreSearchApp(image,2500,30) >= 0 then
					mSleep(2000)
					if f_p(m.有应用,"有应用")then
						click(x-200,y)
						mSleep(2000)
						if f_pic(m.AppPage,'应用详细页面')then
							search_setp = 4
						end
					else
						moveUp(311,850,311,450) --如果超时向上滑动一下
					end
				end
			end
		
			getApp = true
			installApp = true
		
		elseif search_setp == 4 then
			if f_pic(m.云,'云')then
				toast('已经拥有',1)
				mSleep(1000)
				return true
			elseif f_pic(m.打开,'打开')then
				mSleep(2000)
				ipaUninstall(app_id)
				toast("卸载完成",10)
				closeX(AppStore)
			elseif c_pic(m.正在下载,'正在下载')then
				toast('正在下载',1)
				mSleep(5000)
		elseif getApp and (c_pic(m.获取,'获取')or c_pic(ios['APP']['获取'],'获取'))then
				toast('获取',1)
				getApp = false
			elseif installApp and c_pic(m.安装,'安装')then
				toast('安装',1)
				installApp = false
			elseif Rond() then
				toast('正在转圈',1)
				mSleep(1000)
			end
		end
		
		if AppStore ~= frontAppBid() then
			closeX(AppStore)
			return false
		end
		
		---------------------------------超时验证-----------------------
		sotp = sotp or 0
		if sotp ~= search_setp then
			sotp = search_setp
			waitTimes = os.time() -----------------换一个步骤就重新计时
			
		elseif sotp == search_setp then
			if os.time() - waitTimes > wait_mun then
				if Rond()then
					if f_p(m.正在转圈,'正在转圈')then
						click(x+25,y)
						mSleep(5000)
					end
				end
				closeX(AppStore)
				toast('下载超时~网络错误',5);
				mSleep(2000)
				ipaUninstall(app_id)
				delay(2)
			end
		end
		---------------------------------超时验证-----------------------
		if other()then
			return false
		end
		mSleep(1000)
	end
end

function search_ten(keywords,image,app_id)
	打码 = true
	closeX(AppStore)
	delay(2)
	search_setp = 1
	计时 = os.time()
	wait_mun = 60 * 3
	验证码界面 = 0
	输入密码 = 1
	
	while (true) do
		if search_setp == 1 then
			top(image)
			delay(2)
			if active(AppStore)then
				delay(2)
			elseif c_pic(m.搜索,'搜索')then
			elseif f_pic(m.搜索blue,'搜索-blue')then
				search_setp = 2
			end
		elseif search_setp == 2 then
			if f_pic(m.有结果,'有结果')or f_pic(m.结果云,'结果云')then
				search_setp = 3
				mSleep(1000)
			elseif c_pic(m['top-搜索'],'top-搜索')then
				input("\b\b\b\b\b\b\b\b\b\b\b\b")
				input(keywords)
				log(keywords)
				if c_pic(m['空格'],'空格')then
				--	input('\b')
				end
				c_pic(m['搜'],'搜')
				mSleep(3000)
			elseif c_pic(m['搜'],'搜')then
			end
			
		elseif search_setp == 3 then
			if f_pic(m.在搜索界面,'搜索界面')then
				if f_p(m.有应用,"有应用")then
					click(x-200,y)
					mSleep(2000)
					if f_pic(m.AppPage,'应用详细页面')then
						search_setp = 4
					end
				end
			end
			
			getApp = true
			installApp = true
		
		elseif search_setp == 4 then
			if f_pic(m.云,'云')then
				toast('已经拥有',1)
				mSleep(1000)
				return true
			elseif f_pic(m.打开,'打开') or f_pic(ios['APP']['打开'],'ios打开') then
				mSleep(2000)
				ipaUninstall(app_id)
				toast("卸载完成",10)
				closeX(AppStore)
			elseif c_pic(m.正在下载,'正在下载')then
				toast('正在下载',1)
				mSleep(5000)
		elseif getApp and (c_pic(m.获取,'获取')or c_pic(ios['APP']['获取'],'获取'))then
				toast('获取',1)
				getApp = false
			elseif installApp and c_pic(m.安装,'安装')then
				toast('安装',1)
				installApp = false
			elseif Rond() then
				--toast('正在转圈',1)
				mSleep(1000)
			end
		end
		
		if AppStore ~= frontAppBid() then
			closeX(AppStore)
			return false
		end
		
		---------------------------------超时验证-----------------------
		sotp = sotp or 0
		if sotp ~= search_setp then
			sotp = search_setp
			waitTimes = os.time() -----------------换一个步骤就重新计时
		elseif sotp == search_setp then
			if os.time() - waitTimes > wait_mun then
				if Rond()then
					if f_p(m.正在转圈,'正在转圈')then
						click(x+25,y)
						mSleep(5000)
					end
				end
				toast('下载超时',5);
				closeX(AppStore)
				mSleep(2000)
				ipaUninstall(app_id)
				delay(2)
				return false
			end
		end
		---------------------------------超时验证-----------------------
		if other()then
			return false
		end
		mSleep(1000)
	end
end

function open(image)
	delay(1)
	url = 'https://itunes.apple.com/cn/app/id'..image
	openURL(url)
	计时 = os.time()
	重试 = os.time()
	超时 = 60 * 1--30秒超时
	while os.time()-计时 < 超时 do
		mSleep(1000* 5)
		if f_pic(m.详情页,'详情页')then
			log('App详情页显示')
			mSleep(1000 * 1)
			return true
		end
		other()
		log('----openurl-----')
		if os.time()-重试 > 15 then
			closeX(AppStore)
			openURL(url)
			重试 = os.time()
		end
	end
end

function Get(app_id)
	search_setp = 4
	getApp = true
	installApp = true
	计时 = os.time()
	超时 = 5 * 60	--//5分钟超时

	while (os.time()-计时 < 超时) do
		if f_pic(m.云,'云')then
			toast('已经拥有',1)
			mSleep(1000)
			return true
		elseif f_pic(m.打开,'打开')then
			mSleep(1000)
			ipaUninstall(app_id)
			toast("卸载完成",10)
			closeX(AppStore)
			return false
		elseif c_pic(m.正在下载,'正在下载')then
			toast('正在下载',1)
			mSleep(5000)
		elseif getApp and (c_pic(m.获取,'获取')or c_pic(ios['APP']['获取'],'获取'))then
			--toast('获取',1)
			getApp = false
		elseif installApp and c_pic(m.安装,'安装')then
			toast('安装',1)
			installApp = false
		elseif Rond() then
			--toast('正在转圈',1)
			mSleep(1000)
		end
		
		if AppStore ~= frontAppBid() then
			return
		end
		
		---------------------------------超时验证-----------------------
		if other()then
			return false
		end
		mSleep(1000)
	end
end

function search_ASO(keywords,image,app_id)
	if iosver == 10 then
		if search_ten(keywords,image,app_id)then
			return true
		end
	else
		if search(keywords,image,app_id)then
			return true
		end
	end
end

验证码界面 = 0		--设置一个全局参数

function all()
while (true) do
	dell_apple()
	
	if GetTask()then

		re_start = 0
		if login()then
			for i,v in ipairs(data.tasks)do
				nLog('任务--'..i)
				keywords = v.keywords
				rank = v.rank
				image = v.image
				app_id = v.app_id
				if AsoKey == '0' then
					if search_ASO(keywords,image,app_id)then

						--//如果评论打开了 就启评论
						open_comments = v.open_comments
						if open_comments then
							user_name = v.user_name..myRand(7,2)
							title = v.comment.title..myRand(7,2)
							content = v.comment.content..myRand(7,2)

							if Comment(title,content,user_name)then
								successfull(v.app_name,v.task_id)
							else
								closeX(AppStore)
							end
						else
							successfull(v.app_name,v.task_id)
						end
					end
				elseif AsoKey == '1' then
					if open(image)then
						if Get(app_id)then
							--//如果评论打开了 就启评论
							open_comments = v.open_comments
							if open_comments then
								user_name = v.user_name..myRand(7,1)
								title = v.comment.title..myRand(7,1)
								content = v.comment.content..myRand(7,1)

								if Comment(title,content,user_name)then
									successfull(v.app_name,v.task_id)
								else
									closeX(AppStore)
								end
							else
								successfull(v.app_name,v.task_id)
							end
						end
					end
				end
				closeX(AppStore)
				if re_start == 1 then
					re_start = 0
					return false
				end
			end
		end
	else
		mSleep(1000*5)
	end
	close_VPN()
	if vpnKey == "2" then
		setAirplaneMode(true);  --打开飞行模式
		mSleep(1000*3)
		setAirplaneMode(false); --关闭飞行模式
		mSleep(1000*15)
	end
	
end
end

while (true) do
	local ret,errMessage = pcall(all)
	if ret then
	else
		dialog(errMessage, 60)
		mSleep(1000)
		closeApp(frontAppBid())
		mSleep(2000)
	end
end
-- 万国觉醒
-- main.lua  

-- Create By TouchSpriteStudio on 13:31:43   
-- Copyright © TouchSpriteStudio . All rights reserved.
--unlockDevice()
-- require("TSLib")
--require("tsp")

update__ = true
update__ = false

--res, code = http.request("http://ip.chinaz.com/getip.aspx");
--用http.get实现下载文件功能
function downFile(url, path)
	local sz = require("sz")
	local http = require("szocket.http")
	local url = "http://wenfree.cn/api/Public/idfa/?service=Git.Get&url="..url
	local res, code = http.request(url);
--	nLog(res)
    if code == 200 then
		local json = sz.json
		local data = json.decode(res)
		local body = data.data
        local file = io.open(path, "w+")
        if file then
            file:write(body)
            file:close()
            return status;
        else
            return -1;
        end
    else
        return status;
    end
end
--downFile("http://mu1234.applinzi.com/-reply.txt",
--"/User/Media/TouchSprite/lua/-reply.txt")

function delFile(path)--帮你玩平台禁用此函数
    os.execute("rm -rf "..path);
end

--检测指定文件是否存在
function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end

game_lua = {
    {"AWZ",'https://img.wenfree.cn/rok/AWZ.lua'},
	{"ZZBase64",'https://img.wenfree.cn/rok/ZZBase64.lua'},
	{"api",'https://img.wenfree.cn/rok/api.lua'},
	{"phone",'https://img.wenfree.cn/rok/phone.lua'},
	{"token",'https://img.wenfree.cn/rok/token.lua'},
	{"tsp",'https://img.wenfree.cn/rok/tsp.lua'},
	{"ui",'https://img.wenfree.cn/rok/ui.lua'},
	{"yzm",'https://img.wenfree.cn/rok/yzm.lua'},
	{"qu",'https://img.wenfree.cn/rok/qu.lua'},
	{"main",'https://img.wenfree.cn/rok/main.lua'},
	}


function get_(url)
	local sz = require("sz")
	local http = require("szocket.http")
	local res, code = http.request(url);
	if code == 200 then
		local json = sz.json
		if res ~= nil then
			return json.decode(res)
		end
	end
end

if update__ then

    t1=os.time();
    nLog(t1)
    for i,v in ipairs(game_lua)do
    	nLog(v[1])
    	nLog(v[2])
    	local path = "/User/Media/TouchSprite/lua/"..v[1]..".lua"
    	delFile(path)
    	downFile(v[2],path)
    	toast('下载->'..v[1],1)
    end
    nLog('end----->'..os.time()-t1)
    toast('更新完成')
    
end
	
__UI = {}
_UI = {}
require('tsp')
require('AWZ')
require('ui')
require('ZZBase64')
require("yzm")
require('api')
require('token')

init(1)
_app = {}
_app.bid = 'com.lilithgames.rok.ios.offical'




t={}
degree = 85


t['箭头向下'] = { 0xab4d21,"6|7|0xf0eca5,0|13|0xa15828,0|15|0xe9cb72,-11|50|0x687782,24|37|0xbbd3ea,4|86|0x596d84",degree,0,0,1334,750}
t['箭头向下']={0x687c8d, "0|0|0x687c8d,4|-62|0xb47d46,22|-28|0xc0d8ec,2|20|0x536778",90,0,0,1296,666}

t['箭头向左下'] = {0x5b6c7d, "0|0|0x5b6c7d,-19|21|0x4e5e67,46|-33|0xab6e3a,30|7|0xbcd5ef",90,12,0,600,604}

t['箭头向左下2'] = { 0x596d83,"17|-62|0xe8e9e8,39|-29|0xc3d7eb,16|-15|0x839db6,10|-21|0x576674,48|-51|0xf4edaa",degree,0,0,1334/2,750}
t['箭头向左下2']={0x5f7083, "0|0|0x5f7083,49|-22|0xaf7540,7|-23|0x99a19e,27|14|0xbed7ee,-27|22|0x516270",90,0,0,1334/2,750}

t['箭头向左上'] = { 0xa25228,"-7|-4|0xf6eaaa,-13|-15|0xd3c97f,-61|-62|0x647991,-58|-38|0xafc8e4,-47|-42|0x8ca6c0",degree,0,0,1334,750}
t['箭头向左上']={0x5f7183, "0|0|0x5f7183,25|4|0xa1a9a8,30|44|0xb47e47,-9|31|0xbfd9ed",90,58,44,274,327}

t['箭头向右'] = { 0xa15026,"8|-3|0xfdf4b3,19|-1|0xd9d08a,82|-3|0x677c96,63|-19|0xa9c4e4,41|-14|0xc2d8ec",degree,0,0,1334,750}
t['箭头向右']={0x5a6b7d, "0|0|0x5a6b7d,35|-6|0x526472,-20|-27|0xc0daeb,-52|-8|0xb9844b",degree,0,0,1334,750}

t['箭头向右2'] = { 0xa3542b,"9|-2|0xfff7b5,18|1|0xae834c,20|1|0xd3c97f,78|-1|0x687e94",degree,0,0,1334,750}
t['箭头向右-攻击'] = { 0xaf2f23,"184|67|0x820c0c,192|10|0x820c0c,-7|60|0x830b0b",degree,837,458,1065,543}
	
--事件
t['e-国家选择'] = {0xb67016, "0|0|0xb67016,-12|-1|0xffb200,-19|-507|0x000000,-1059|-481|0x000000",90,12,0,1312,604}
--1罗马，2德国，3不列直，4法兰西，5西班牙，6中国，7日本，8韩国，9阿拉伯，10奥斯曼，11拜占庭
t['e-国家选择-位置']={{552, 529, 0x4a2479},{477, 667, 0xf3bf9c},{664, 665, 0x965d42},{857, 662, 0xad4438},{1044, 663, 0x8e120e},{1232, 670, 0x957f77}}
	t['e-国家选择-位置-确定'] = { 0xffb000,"2|-8|0xb67016",degree,1061,498,1193,551}
t['e-服务器选择-继续按扭']={0xffaf00, "0|0|0xffaf00,-298|-602|0xffffff,-144|-592|0xeea442,-742|-594|0xf2a542",90,122,36,1262,716}
t['e-文明样式选择']={0xb67016, "0|0|0xb67016,-88|-13|0xfebc00,77|-10|0xffbc00,73|30|0xffa500",90,981,450,1256,552}

function _Evevnt()
	if d('e-国家选择')then
		if _UI.国家 > 7 then
			moveTo(1247,663,139,666,10)
			delay(2)
		end
		click(t['e-国家选择-位置'][_UI.国家][1],t['e-国家选择-位置'][_UI.国家][2],2)
		d('e-国家选择',true,1)
	elseif d('e-服务器选择-继续按扭') then
	   -- qu={631,663,670,685}
    --     __game.qu = ocr(qu[1],qu[2],qu[3],qu[4])
    --     local arr ={}
    --     arr['s']='Rok.token'
    --     arr['qu'] = __game.qu
    --     arr['token'] = __game.token
    --     _api_rok(arr)
    --      d('e-服务器选择-继续按扭',true,1,3)
    
        dialog('请选区-点确定后20秒选完\n(帐号原来计划在'..__game.qu,0);
        delay(20)
	elseif d('e-文明样式选择')then
	    click(1100, 659)
	    d('e-文明样式选择',true)
	else
		return true
	end
end


function _Arrow()
	
local ret = false
_arrow = _arrow or 0


local result = false

keepScreen(true)
	if d('箭头向下')then
	    for i=1,4 do
	        _arrow = _arrow + 1
	        x = x
	        y = y+50
	        log({x,y})
	        click(x,y)
	    end
		ret = true
	elseif d('箭头向左下') or d('箭头向左下2')  then
		log("向左")
		log({'x',x,'y',y})
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50-50 ,y + (_arrow%3+1)*50+50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50-50 ,y + (_arrow%3+1)*50+50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50-50 ,y + (_arrow%3+1)*50+50 )
		ret = true
	elseif d('箭头向左上')then
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50 ,y - (_arrow%3+1)*50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50 ,y - (_arrow%3+1)*50 )
		_arrow = _arrow + 1
		click(x - (_arrow%3+1)*50 ,y - (_arrow%3+1)*50 )
		ret = true
	elseif d('箭头向右') or d("箭头向右2")then
	    for i=1,4 do
	        _arrow = _arrow + 1
	        x = x+50
	        y = y
	        log({x,y})
	        click(x,y)
	    end
		ret = true
	elseif d('箭头向右-攻击',true,2)then
		ret = true
	end
keepScreen(false)
	
return x
end


t['游戏主界面'] = { 0x13567e,"83|1|0x1f5a80,54|625|0xf5e18a,56|727|0xf4bd63",degree,0,0,123,749}
t['游戏主界面-夜'] = { 0xf5bd63,"-1|-102|0xf2dc88,-56|-727|0xa507e,27|-731|0xf476f",degree,0,0,123,749}
	t['游戏主界面-野外'] = { 0xb527f,"0|1|0x3ea0c4,-1|15|0x7fdef5,-1|16|0x4192b3,-21|-2|0x66ddf8,-24|-2|0xa507c",degree,18,640,108,726}
	t['游戏主界面-城内'] = { 0x2074a0,"0|-10|0xffffff,0|15|0x6ce6ff,10|29|0x24776,15|33|0x82e7fe,-42|32|0x8578f",degree,27,653,106,722}
t['联盟加入'] = { 0x1274ba,"-60|-12|0xc8f6,-18|20|0xace9,47|1|0xc7ff",degree,586,203,753,269}
t['联盟加入']={0x1274ba, "0|0|0x1274ba,193|0|0x00c3ff,-72|-10|0x00cffe,93|3|0x00befb",90,495,236,828,294}
	t['联盟加入不能'] = { 0x939585,"-271|98|0xd3ff",degree,545,87,993,301}
	t['联盟加入不能']={0xbfc1b7, "0|0|0xbfc1b7,-195|128|0x00c2fe,-377|128|0x00c3fe",90,503,111,930,292}
t['关闭任务']={0x0e67ad, "0|0|0x0e67ad,9|1|0x1ac5f1,5|-7|0x1063ad,4|6|0x0e6aaa",90,168,171,207,213}	
	
function _init()
	d('游戏主界面-城内',true,2)
	if d('游戏主界面-野外',false,1,3) then
	    ocrInfo()
	    update_token()
	    if upimg then
	        uploadqu()
	        upimg = false
	    end
	    d('游戏主界面-野外',true,1,3)
	end
	if d('联盟加入',true)then
		d("联盟加入不能",true)
	elseif d('关闭任务',true)then
	elseif d('游戏主界面-城内')then
		log('初始化完成')
		if allimg then
		    if isimgupload() then
		        uploadimg()
		    end
		    allimg = false
		end
		return true
	end
end
	

t['弹窗-任务x'] = { 0xd3d1ca,"-11|-10|0xd7d6ce,-11|-4|0x9c9b8d,6|13|0x9d9a8f,9|9|0xd2cfc6",degree,1113,66,1165,112}	
t['弹窗-邮件面板x'] = { 0xd3d1c9,"-12|-10|0xd7d4cc,-13|-7|0x9e9991,9|14|0xa09c93",degree,1256,25,1317,70}
t['弹窗-资料面板x'] = { 0xd3d1ca,"-11|-10|0xd7d5ce,-13|-7|0x9a968e,8|13|0x9c988e",degree,1115,66,1161,110}
t['弹窗-设置面板x'] = { 0xd3d1ca,"-13|-8|0x9b978f,-9|10|0xd2d0c7,14|12|0x9a968d",degree,1136,24,1187,71}
t['弹窗-蓝色按钮'] = { 0x1274ba,"-107|-25|0xd4ff,-110|24|0xb5f0,115|24|0xb5f0,109|-24|0xd4ff",degree,333,164,1000,596}
t['弹窗-返回按钮'] = { 0xd6d4cf,"15|-9|0x8e8c86,10|-14|0xdbd9d3,10|13|0xd0d0cb,0|24|0x959287",degree,3,3,86,82}
t['酒馆-返回按钮']={0xd5d5cd, "0|0|0xd5d5cd,6|-1|0xaea8a1,-14|-18|0xbbb3ac,27|24|0xa29f97",90,3,5,80,76}
t['弹窗-正在加载'] = { 0xbb2fe,"2|14|0x64ae,7|-2|0xdb2fe,14|8|0x180d5",degree,343,652,558,690}	
t['弹窗-升级箭头-物质不足'] = { 0xd3d1ca,"-464|378|0xc7ff,-378|377|0x1274ba,-304|404|0xb7f3",degree,232,97,1095,651}
    t['弹窗-升级箭头-物质不足-更多']={0x02afee, "0|0|0x02afee,10|-24|0x1274ba",90,543,470,785,587}
t['弹窗-招到英雄'] = { 0x1274ba,"-84|-26|0xd2fd,88|25|0xb5f1",degree,67,574,339,695}
t['弹窗-开箱确定'] = { 0x1577bc,"-81|-27|0xd4ff,422|15|0xffa700,619|10|0xffa900",degree,274,591,1061,695}
t['弹窗-升级确认'] = { 0x1274ba,"-95|-7|0xc9ff,159|-389|0x858278,318|1|0xc2ff",degree,230,94,1088,661}
t['弹窗-取消城市编辑'] = { 0xd6d4cc,"-264|615|0xc0fc,-537|608|0xc4ff,-824|606|0xc5ff",degree,186,6,1328,717}
t['弹窗-网络断开'] = { 0x1176bc,"50|-291|0x858278,118|-289|0xc6c3b6",degree,362,183,974,568}
t['弹窗_点击任务_宝石'] = { 0xd3d1c9,"-460|407|0xffb100,-305|382|0xfebf00",degree,483,102,1099,662}
t['弹窗_绑定帐号'] = { 0xd3d1c9,"-274|395|0xc1fe,-497|388|0xc5ff,-591|234|0xf2a643",degree,241,99,1098,644}
t['弹窗_弹出宝箱'] = { 0x9bab6e,"-596|544|0xb77016,-397|533|0xb77016,-501|516|0xffc000,-502|568|0xfca100",degree,487,78,1195,716}
t['弹窗—回天改命'] = { 0xadafaf,"-595|521|0xb77016,-409|552|0xfeaa00",degree,462,21,1223,740}
t['弹窗—验证图片'] = { 0x1274ba,"-51|-7|0xd3ff,43|17|0xb5f1,58|-5|0x1077bc,-10|-131|0xffef00",degree,663,90,1029,458}
t['弹窗—验证图片']={0x1274ba, "0|0|0x1274ba,28|-5|0x00c7ff,-58|-3|0x00c5ff,9|-283|0x000000",90,668,92,1328,452}
	t['弹窗—验证图片-确定'] = { 0x539ffe,"83|0|0x539ffe,-339|-2|0xffffff,-323|-10|0x7e7e7e,-406|-3|0x7e7e7e",degree,392,644,944,730}
	t['弹窗—验证图片-确定-有图']={0x252525, "0|0|0x252525,0|1|0x252525",90,700,40,928,78}
t['弹窗—app更新'] = { 0xc3ff,"-82|-24|0xd3fd,64|20|0xb5f0,192|-1|0xdf3d33,343|2|0xdd3c33",degree,384,427,966,569}
t['酒馆—3确定']={0x1274ba, "0|0|0x1274ba,-48|-2|0x00c4ff,288|-1|0xffb000,633|0|0xffb000",90,177,587,1145,697}
t['弹窗—前往按钮']={0x1274ba, "0|0|0x1274ba,-71|-23|0x02cdf9,89|19|0x03aaec",90,550,529,803,660}
t['弹窗—红蓝点击蓝']={0x00c3ff, "0|0|0x00c3ff,106|-17|0x00cfff,-321|1|0xde3d33,-165|1|0xde3d33",90,431,444,900,538}
t['弹窗-常见问题']={0x007aff, "0|0|0x007aff,548|4|0x000000,298|0|0xf8f8f8",90,20,7,747,53}
t['弹窗-王国历史x']={0x906f40, "0|0|0x906f40,-8|-8|0x8d6f41,-1|12|0xac8d5d,9|-1|0xa08455",90,1191,12,1273,70}
t['弹窗-appid-取消']={0x007aff, "0|0|0x007aff,306|-5|0x007aff,306|9|0x007aff",90,427,63,904,546}
t['弹窗-聊天确定']={0xffffff, "0|0|0xffffff,-50|-37|0x0e75e5,56|28|0x0e75e5",90,596,596,736,676}
t['弹窗-网络错误']={0x007aff, "0|0|0x007aff,12|-6|0x007aff,19|-164|0x000000",90,563,288,769,478}
t['弹窗-商人走了']={0x92734a, "0|0|0x92734a,-418|41|0x000000,-403|42|0xcba973",90,469,159,1006,256}
t['弹窗-与众不同']={0x927560, "0|0|0x927560,11|-15|0x6f5343,-10|-15|0x755542",90,1139,86,1186,130}
t['弹窗-同意并继续']={0x00a5ff, "0|0|0x00a5ff,-366|-405|0xd30000,-456|-6|0xf7e1c6",90,267,148,1008,604}
t['弹窗-五星好评']={0x02a6e5, "0|0|0x02a6e5,70|-99|0x00befb,94|-108|0x1274ba,-97|-109|0xb67016,-78|-106|0xffb200",90,424,344,910,661}
t['弹窗-宝箱广告']={0xaf1b13, "0|0|0xaf1b13,-9|6|0xcf3d25,-587|631|0xffb000,-604|633|0xb67016,90|2|0x050503",90,530,7,1310,711}
    --1163, 110
    
function _Tips()
	local tips = {
		'弹窗-网络断开',
		'弹窗—红蓝点击蓝',
		'弹窗-任务x',
		'弹窗-邮件面板x',
		'弹窗-资料面板x',
		'弹窗-设置面板x',
		'弹窗-蓝色按钮',
		'酒馆-返回按钮',
		'弹窗-招到英雄',
		'弹窗-升级确认',
		'弹窗-开箱确定',
		'弹窗-取消城市编辑',
		'弹窗-升级箭头-物质不足',
		'弹窗—app更新',
		'弹窗_绑定帐号',
		'弹窗_弹出宝箱',
		'弹窗—回天改命',
		'酒馆—3确定',
		'弹窗-与众不同',
		'弹窗_点击任务_宝石',
		'弹窗—验证图片',
		'弹窗-同意并继续',
		'弹窗-正在加载',
		'弹窗—前往按钮',
		'弹窗-常见问题',
		'弹窗-王国历史x',
		'弹窗-appid-取消',
		'弹窗-聊天确定',
		'弹窗-网络错误',
		'弹窗-商人走了',
		'弹窗-五星好评',
		'弹窗-宝箱广告',
		}
	for k,v in pairs(tips)do
		if v == "弹窗-正在加载" then
			if d(v)then
				delay(15)
				return false
			end
		elseif v == '弹窗-宝箱广告' then
		    if d('弹窗-宝箱广告') then
		        click(1163, 110)
		        log('宝箱广告')
		        return false
		    end
		elseif v == "弹窗—验证图片" then
			if d(v,true,1,5) then
				local time_ = os.time()
				while ( os.time() - time_ < 120 ) do
					if d("弹窗—验证图片-确定") and d('弹窗—验证图片-确定-有图') then
						delay(1)
						if _yzmsb()then
							d("弹窗—验证图片-确定",true,1,5)
							delay(10);
							return true
						end
					end
				end
				click(20,20);
				return false
			end
		elseif v == '弹窗-常见问题' then
		    if d(v)then
    	        closeApp(_app.bid,1)
    	        return false
		    end
		elseif v == '弹窗-升级箭头-物质不足' then
            if d(v)then
                d('弹窗-升级箭头-物质不足-更多',true,1,2)
	            if d('造兵-资源不足-使用',true,1,2) then
    		        d('造兵-资源不足-使用*',true,1,2)
    		        d('造兵-资源不足-使用-X',true,1,2)
    		        d("升级-升级按钮",true,1,2)
    		    else
    		        d(v,true)
	            end
		        return false
            end
		else
			if d(v,true,1,2)then
			    if v == '弹窗-商人走了' then
			        _UI.任务 = false
			    end
				return false
			end
		end
	end
		_other = _other or 0
	_other = _other + 1
	local other_w_c = _other%2
	if other_w_c == 0 then
		moveTo(500,200,500,300,rd(10,20))
		log('-e-');
	else
	    click(10,10);
	    log('e');
	end
	return true
end
	
t['升级-升级箭头'] = { 0x1faa0f,"12|28|0x9203,-2|-29|0x70d255",degree,478,356,597,477}
t['升级-升级箭头']={0x4cc332, "0|0|0x4cc332,-13|43|0x049407,7|42|0x039506,-25|-13|0xdff0d8",90,292,323,641,485}
t['升级-升级箭头青铜'] = { 0xeab212,"0|-30|0xfee35c,-9|22|0xde9800",degree,485,356,585,460}
t['升级-升级箭头时代']={0xf4cb32, "0|0|0xf4cb32,-24|4|0xdeb434,22|5|0xdd9d22,-12|36|0xdd8f06",90,278,325,698,480}
    t['升级-升级箭头-车厂']={0x14a409, "0|0|0x14a409,157|-12|0x006598,-150|-27|0x097cb0,13|-35|0xdcefdd",90,123,109,1325,628}
t['升级-升级按钮'] = { 0xc2ff,"101|2|0xc2ff,-158|2|0xfeaf00,-298|-3|0xfeb200",degree,638,381,1162,682}
t['升级-前往'] = { 0x1274ba,"-37|-18|0xd3fd,63|14|0xace9",degree,671,496,1120,656}
t['升级-前往-升级箭头'] = { 0x17a50a,"-3|22|0x9203,-1|-26|0x5ecb43",degree,448,360,885,607}
t['升级-正在升级中'] = { 0xe0a10f,"27|-1|0xdea716,-8|-22|0xf0efe9,-1|-22|0xf1c03a,-32|17|0xcf920d,-41|18|0xe6e4d9",degree,470,357,861,570}
t['升级-正在升级中']={0xdea01c, "0|0|0xdea01c,-22|-20|0xeebb37,-52|17|0xd19618",90,470,357,861,570}

t['升级-正在升级中-总部'] = { 0xe3a412,"29|1|0xdea716,-1|-19|0xf1be35,-6|-20|0xf4ece1,-1|23|0xce9408,-35|8|0xf2e3cd,-31|20|0xcf920d",degree,478,344,616,490}
t['升级-正在升级中-总部']={0xefbe3f, "0|0|0xefbe3f,23|20|0xdf9d10,-1|38|0xd3981b,-16|-10|0xf3f4f0,-29|3|0xf1b525",90,330,347,631,491}
	t['升级-宝石'] = { 0xfeaf00,"148|-67|0x334e,397|2|0xc1fe,471|29|0x1176bc",degree,325,414,1020,611}
	t['升级-宝石-立即升级']={0xffaf00, "0|0|0xffaf00,260|-24|0x00cefc,426|24|0x04a2e4",90,639,523,1147,616}
	t['升级-宝石-不再提示']={0x00334f, "0|0|0x00334f,-16|-10|0x002b43,12|10|0x002b42,-186|68|0xffaf00,195|72|0x00befb",90,357,430,978,577}
	t['升级-宝石-确认']={0xffb100, "0|0|0xffb100,79|-66|0x078b0a,288|3|0x00c0fe",90,349,434,987,585}
	t['升级-宝石不足'] ={0x980e0e, "0|0|0x980e0e,4|0|0xffa700,7|0|0x980e0e",90,1078,189,1111,224}
	t['升级-新手保护确定'] = { 0x1274ba,"-115|-4|0xc7ff,114|4|0xc2ff,241|-23|0xd4ff,461|33|0x1176bc",degree,297,456,1040,615}
	t['升级-新手保护确定']={0x1274ba, "0|0|0x1274ba,64|-11|0x00ccff,257|11|0x00b8f8,422|-16|0x00d2fc",90,369,489,979,594}
	t['升级-宝石-大于100']={0xffffff, "0|0|0xffffff,27|0|0xffffff",90,747,573,808,596}

function _升级子程序()
    while d("升级-升级按钮") or d("升级-前往") do
		if d("升级-升级按钮",false,1,2)then
			
			local dengji = ocrText(783,171,835,206, 10,'1234567890')
			log({"dengji",dengji})
			if dengji == "" or dengji== nil then
				dengji = 100
			end
			log({"dengji",dengji})
			
			if (dengji=='2' or dengji=='3') and not( d("升级-宝石不足") ) then
				d('升级-宝石-立即升级',true)
				d("升级-宝石-不再提示",true,1,2)
				d("升级-宝石-确认",true,1,2)
			else
				if d("升级-升级按钮",true,1,2)then
				    d("升级-新手保护确定",true,1,3)
				    return true
				end
			end
		elseif d("升级-前往",true,1,2)then
			if d("升级-前往-升级箭头",true,1,2)then
			elseif d('升级-正在升级中')then
				return true
			end
		end
	end
end
	
function _build()
	log("升级")
    if _UI.升级 == '2' then
        click(1203, 267)    --点击车厂
    else
	    click(469,218,2)	--点击市政厅
    end
	if d("升级-升级箭头",true,1,2) or d('升级-升级箭头时代',true,1,2) or d('升级-升级箭头-车厂',true,1,2)then
        if _升级子程序() then
            _UI.升级 = false
        end
	elseif d('升级-正在升级中-总部') then
		_UI.升级 = false
		return true
	end
end


t['奖励-有奖励'] = { 0xe0ac64,"6|-9|0xfef6a4,34|-41|0xe30000",degree,8,119,109,221}
t['奖励-奖励面板-领取'] = { 0xbf0f,"-58|-16|0xd40f,57|15|0x9e0d",degree,954,173,1137,657}
t['奖励-奖励面板-领取分类'] = { 0x1e6184,"-32|-31|0xe20000",degree,31,112,157,525}
t['奖励-奖励面板-红色-银'] = { 0xc2c4d4,"37|-36|0xe20000",degree,606,155,717,249}
t['奖励-奖励面板-红色-黄'] = { 0xf4b246,"37|-35|0xe20000",degree,1013,148,1166,258}
t['奖励-奖励面板-领取箱子'] = { 0xffff19,"-26|2|0xfec404",degree,292,132,1160,278}
function _Award()
	log("奖励")
	if d("奖励-有奖励",true,1,3)then
		local _jlcs = 1
		while _jlcs< 30 and (d("奖励-奖励面板-领取",true,1,2) or d("奖励-奖励面板-红色-银",true,1,2)or d("奖励-奖励面板-红色-黄",true,1,2)or d("奖励-奖励面板-领取箱子",true) or d("奖励-奖励面板-领取分类",true,1,2)) do _jlcs=_jlcs+1 end
	else
		_UI.奖励 = false
		return false
	end

end


t['造兵-准备训练']={0x0375ac, "0|0|0x0375ac,-151|16|0x1ba80e,-302|-15|0x128bc5",90,147,91,1310,705}
    t['造兵-训练'] = { 0xfafeff,"20|-28|0xcffe,-92|-14|0xc5ff",degree,914,574,1137,659}
    t['造兵-加速'] = { 0xd3d1c9,"-151|515|0x1176bc,-232|500|0xd1ff,-38|545|0xb6f3",degree,858,58,1165,680}
    
t['造兵-骑兵工厂']={0x1f6198, "0|0|0x1f6198,-4|-3|0xa8553c,-21|22|0xfdd274,-19|26|0x18557d",90,323,6,583,208}
t['造兵-弓兵工厂']={0x0b56ff, "0|0|0x0b56ff,11|16|0xbf9d85,-4|4|0xfda92b,-9|1|0x0a34b1",90,798,47,1005,367}
t['造兵-车兵工厂']={0xffe290, "0|0|0xffe290,22|6|0x0063be,44|6|0xfefcd9,-31|-12|0x00549d,-28|-1|0xffa86d",90,1071,159,1317,550}
    t['造兵-资源不足']={0x00c2fe, "0|0|0x00c2fe,384|-383|0xd2d0ca,-13|-382|0x858278,47|-237|0x055171",90,459,79,1102,633}
    t['造兵-资源不足-使用']={0x1274ba, "0|0|0x1274ba,7|-20|0x00cefc,20|22|0x01a4e4",90,908,162,1136,471}
    t['造兵-资源不足-使用*']={0x1274ba, "0|0|0x1274ba,1|13|0x009edf",90,745,175,912,652}
    t['造兵-资源不足-使用-X']={0xd3d2cb, "0|0|0xd3d2cb,-7|-8|0xd8d7ce,-54|21|0xbdbdad,-57|46|0x044a68",90,1026,34,1216,160}
    
function _soldier()
	log("造兵")
	local 兵种 = {
		{"步兵",},
		{"弓兵","造兵-弓兵工厂"},
		{"骑兵","造兵-骑兵工厂"},
		{"车兵","造兵-车兵工厂"},
		}
	for k,v in ipairs(兵种) do
		if _UI.造兵[v[1]] then
		    log('准备造'..v[1])
		    if k == 1 then
			    click(549, 449,2)
			    click(549, 449,2)
			else
			    d(v[2],true,1,2)
			end
			if not (  d('造兵-准备训练') ) and not(k==1) then
			    d(v[2],true,1,2)
			end
			
			d('造兵-准备训练',true,1,2)
			if d('造兵-训练',true,1,2) or d('造兵-加速',true,1,2) then
			    if d('造兵-资源不足',true,1,2) then
			        d('造兵-资源不足-使用',true,1,2)
			        d('造兵-资源不足-使用*',true,1,2)
			        d('造兵-资源不足-使用-X',true,1,2)
			        d('造兵-训练',true,1,2)
			    end
				_UI.造兵[v] = false
			end
		end
	end
	_UI.造兵.key = false
end


t['建造-有建造'] = { 0xe20000,"20|-4|0xe20000",degree,75,511,116,557}
t['建造-装饰'] = { 0x656257,"-29|-37|0xe30000",degree,3,602,97,700}
t['建造-可以建造'] = { 0x255273,"-132|1|0x9ee6ff,111|1|0x9ee6ff",degree,134,469,419,665}
t['建造-可以建造分类'] = { 0x757568,"-42|-34|0xe20000",degree,3,478,99,570}
t['建造-准备建造'] = { 0x89a05,"-131|4|0xe50909,-171|-35|0xf27979,-151|6|0xf3e9e5",degree,6,2,1252,744}
	t['建造-建造取消'] = { 0xd3d1c9,"-24|242|0xd0ff,-30|441|0xffb000,-187|466|0xfca000",degree,898,58,1169,681}
t['建造-编辑城市'] = { 0xd59813,"24|-16|0xe20000",degree,1115,145,1210,286}
t['建造-编辑城市']={0xd4a434, "0|0|0xd4a434,23|-17|0xe10000",90,1100,151,1234,262}

function _NewBuild()
	log("建造")
	if d('建造-有建造')then
		click(64,564,2)
		d("建造-装饰",true,1,2)
		click(53,411,2)
		
		while d("建造-可以建造") or d("建造-可以建造分类",true,1,2)do
			if d("建造-可以建造",true,1,2) then
				if d('建造-准备建造',false,1,2)then
					log({x,y})
					if x > 1000 then
						moveTo(600,300,400,300,5)
						delay(2)
					end
					d('建造-准备建造',true,1,2)
					if d('建造-建造取消',true,1,2)then
						_UI.建造 = false
						return false
					end
				else
					_NewBuild_lun = _NewBuild_lun or 0
					_NewBuild_lun = _NewBuild_lun + 1
					if _NewBuild_lun%4 == 0then
						moveTo(600,300,400,300,5)--向左
					elseif _NewBuild_lun%4 == 1then
						moveTo(400,300,600,300,5)--向右
					elseif _NewBuild_lun%4 == 2then
						moveTo(300,500,300,300,5)--向上
					elseif _NewBuild_lun%4 == 3then
						moveTo(400,100,400,300,5)--向下
					end
					delay(0.5)
					d('建造-准备建造',true,1,2)
					if d('建造-建造取消',true,1,2)then
						_UI.建造 = false
						return false
					end
				end
			end
		end
		d('建造-编辑城市',true,1,2 )
	else
		_UI.建造 = false
	end
end


t['草-夜'] = { 0x378a56,"22|39|0x328057,17|3|0x51c1a,15|18|0xd131e",degree,9,6,1252,742}
t['草-白'] = { 0xabf54d,"20|41|0xa2eb50,16|5|0x133618,-10|12|0xd3117",degree,10,6,1242,741}
t['树-白'] = { 0xaefb4f,"-31|-59|0x6ba83a,12|-38|0x143516,41|-23|0x82c146",degree,6,3,1242,738}
t['树2-白']={0xa4eb4c, "0|0|0xa4eb4c,0|-30|0x1d411b,20|0|0x1a4220,-22|3|0xa0e74e,-41|-11|0x174925",degree,6,3,1242,738}
t['树2-白']={0xaaf652, "0|0|0xaaf652,-26|-13|0x173f1a,-36|-6|0xaaf44f,-19|-40|0xaefa4f,14|-6|0x1b421f",90,177,26,1310,663}
t['树-枫树']={0xff8a52, "0|0|0xff8a52,-8|4|0x383026,-20|-30|0xff9b54,20|-24|0x844f34,20|-16|0xffaf5e",90,177,26,1310,663}
t['草-铲子'] = { 0xeb3535,"-24|24|0xe50909,-162|2|0xe4f1f4,-155|-12|0x28a4dc",degree,5,4,1244,742}
t['草-铲子-是'] = { 0x1274ba,"-98|-19|0xd2ff,473|9|0xbffc",degree,331,450,1019,600}
function _glass()
	log("除草")
	for i=1,12 do
		if d("树-白",false,1,2) or d('草-夜',false,2,2) or d('草-白',false,2,2) or d("树2-白",false,1,2) or d('树-枫树',false,1,2)then
			
			if x < 100 then
				moveTo(300,600,500,600,10)
				delay(2)
			end
			if y > 500 then
				moveTo(300,600,300,400,10)
				delay(2)
			end
			
-- 			if d("草-铲子",true)then 
-- 				d("草-铲子-是",true)
-- 			end
			
			if d("树-白",true,1,2) or d("树2-白",true,1,2)or d('草-夜',true,2,2) or d('草-白',true,2,2)or d('树-枫树',true,1,2)then
				log({x,y})
				if d("草-铲子",true)then 
					d("草-铲子-是",true)
				end
			end
		end
	end
end

t['签到-vip'] = { 0xffb400,"36|-13|0xe20000",degree,128,45,203,88}
t['签到-领取'] = { 0xc40e,"-47|-18|0xc80e,44|21|0xc760a",degree,855,121,1126,489}
t['签到-领取-红'] = { 0,"13|7|0xcddce2,13|-55|0xe20000",degree,987,141,1136,254}
t['签到-领取-黄'] = { 0xf5b347,"37|-34|0xe20000",degree,767,526,877,629}
t['签到-领取-绿']={0x258c08, "0|0|0x258c08,-51|-12|0x00d00f,44|15|0x01a60d",90,900,386,1052,472}
t['签到-领取-红左']={0x0085bd, "0|0|0x0085bd,-1|-87|0xe30000",90,118,344,152,539}
t['签到-红点']={0xf6c369, "0|0|0xf6c369,38|-25|0xe20000",90,772,518,880,617}
t['签到-有红点提示']={0xd90000, "0|0|0xd90000,3|-1|0xd50000",90,183,44,205,58}
function _SignIn()
	log("签到")
	if d("签到-vip",true,1,2)then
		if d("签到-领取-黄",true,1,2)then
		elseif d("签到-领取",true,1,2)then
		elseif d("签到-领取-红",true,1,2)then
		elseif d("签到-领取-绿",true,1,2)then
		elseif d("签到-领取-红左",true,1,2)then
    	    local i=0
    	    while d("签到-领取-红左",true,1,2) and i< 10 do
    		    i=i+1
    		    d('签到-红点',true,1,2)
    	    end
		end
		
		local i=0
	    while d('签到-有红点提示') and i< 10 do
	        i=i+1
	        click(132, 442)
	        d('签到-红点',true,1,2)
	    end
	end
end


t['收集-玉米'] = { 0xffff6b,"-5|-3|0xffe731,6|8|0x7fe81d,-10|18|0x236602,-12|6|0x5bc40f",70,94,50,1208,716}
t['收集-玉米']={0x459b12, "0|0|0x459b12,5|-18|0xfff13c,0|-10|0xfec92d,-8|10|0x28700c",80,20,85,1250,745}
t['收集-木材'] = { 0xe0e0e1,"-5|-20|0xd3955f,12|-34|0x7a2f0a,2|-35|0xe1702b",70,20,85,1250,745}
t['收集-木材']={0xedae69, "0|0|0xedae69,16|-6|0x8b370f,15|2|0x762805,-8|10|0xc77847",90,20,85,1250,745}
t['收集-木材黄'] = { 0x6e2a08,"-19|2|0xecb87b,-16|21|0xd0905c,-5|7|0x92380b",degree,21,43,1232,712}
t['收集-石头'] = { 0xd8dfee,"0|-7|0x969fb7,-15|10|0x9da6c1,-16|16|0x606a83,12|11|0x485168",80,50,20,1250,736}
t['收集-握手'] = { 0xdedee0,"8|-19|0x2f9c01,0|-36|0xfcf2e1,-12|-41|0xffe67e,-12|-25|0x33a600",70,54,85,1224,723}
t['收集-握手']={0xfeeee1, "0|0|0xfeeee1,-2|-14|0x188ecd,3|13|0x067bbf,2|8|0xd06252,15|0|0x9f5110",90,824,539,946,645}
function _Collect()
	log("收集")
	local 收集 = {"收集-玉米","收集-木材","收集-石头","收集-握手","收集-木材黄"}
	for k,v in ipairs(收集) do
		d(v,true,2,2)
	end
end


t['英雄-放大镜'] = { 0xd8edf6,"7|6|0x1188bb,17|33|0x6093,-16|43|0xcce6ea,-20|29|0x6195",degree,415,475,515,570}
t['英雄-放大镜']={0x056599, "0|0|0x056599,-2|-49|0x3bb3e6",90,406,460,520,578}
t['英雄-开启'] = { 0x1274ba,"-93|-24|0xd3ff,111|25|0xb3ef,47|32|0x1176bc",degree,213,531,1107,705}
t['英雄-开启-确定'] = { 0x1274ba,"-76|-23|0xd1ff,105|20|0xb6f3,570|5|0xffac00",degree,270,596,1080,700}
function _Hero()
	log("英雄")
	click(314,344,2)
	if d("英雄-放大镜",true,1,2)then
		local _opentimes = 0
		while (d("英雄-开启",true,1,5) or d("英雄-开启-确定",true,1,3)) and _opentimes < 10 do
			_opentimes = _opentimes + 1
		end
		_UI.英雄 = false
	end
end


t['采矿-放大镜'] = { 0xe5984,"-5|-15|0xfdffff,-1|22|0x5585,11|13|0x7ce7ff",degree,13,507,107,613}
t['采矿-放大镜']={0xb4f1f0, "0|0|0xb4f1f0,10|0|0x136fa0,-9|27|0x00537c",90,9,504,112,610}
t['采矿-搜索'] = { 0x1274ba,"-69|-29|0xd3fe,81|23|0xb4f0",degree,130,454,1201,605}
	t['采矿-搜索-攻击'] = { 0x970e0e,"-104|-23|0xe94d3d,63|29|0xc12724,-103|24|0xd4302b",degree,167,94,1195,732}
	t['采矿-搜索-采集'] = { 0x1273b9,"-85|-29|0xd1fc,93|31|0x1175bb,88|-25|0xd2fe",degree,73,51,1233,739}
	t['采矿-搜索-采集']={0x1274ba, "0|0|0x1274ba,94|-23|0x08d5fe,-63|17|0x00b0ee",90,73,51,1233,739}
t['采矿-创建部队'] = { 0x1375ba,"-82|-24|0xd3fd,86|33|0x1175bb",degree,927,14,1195,727}
t['采矿-创建部队']={0x1274ba, "0|0|0x1274ba,-73|-16|0x03d0ff,90|19|0x00b8f6",90,884,12,1325,570}
    t['打野-创建部队-正在返回']={0xb75f02, "0|0|0xb75f02,7|-5|0xfcf8f5,14|-8|0xb25b00",90,1209,58,1322,309}
    t['打野-创建部队-行军']={0xb67016, "0|0|0xb67016,-90|-10|0xffba00,63|22|0xffa500",90,926,64,1319,394}
t['采矿-行军'] = { 0xfdae00,"118|-1|0xfeae00,-118|-6|0xfdb100,-340|-14|0xcafd,-208|8|0xbcf8",degree,612,603,1164,719}
    t['采矿-行军-打不过']={0xfbf1f2, "0|0|0xfbf1f2,-3|2|0xe3680e",90,863,579,1059,620}
t['采矿-行军2']={0xb67016, "0|0|0xb67016,57|-2|0xffb500,-230|5|0x00c4ff",90,706,577,1274,709}

t['打野-增加开关']={0x1073bd, "-99|93|0x00c0fc,-287|-1|0x1172ba",90,77,369,505,564}
t['打野-七世']={0x57c0f1, "0|0|0x57c0f1,1|3|0x72d8ff,3|8|0x59c2f1",90,462,138,498,175}
    t['打野-切换英雄']={0x3395d6, "0|0|0x3395d6,0|-11|0x3097d6",90,187,455,222,492}
        t['打野-切换英雄-七世']={0xffdcbb, "0|0|0xffdcbb,20|5|0xfdf67e,25|12|0x5a5dee,-26|3|0xc76d1b,-33|13|0x343999",90,12,97,265,623}
t['打野-搜索']={0x1274ba, "0|0|0x1274ba,10|0|0x06c3fc,-71|-15|0x04d0ff,90|21|0x02aff1",90,632,302,1231,617}

t['打野-正在行军']={0x0e9a00, "0|0|0x0e9a00,-4|-7|0xfdffff,-5|-14|0x0d9c00",90,1279,228,1317,277}
    t['打野-正在挖矿']={0xfeffff, "0|0|0xfeffff,2|13|0x4ff86c,6|0|0x0d9a00,13|2|0x4ff169,-66|-83|0x37e7fd",90,1200,151,1330,285}
    t['打野-敌弱我强']={0x06fd30, "0|0|0x06fd30,0|-3|0x06fd30",90,863,589,1051,615}
t['打野-正在战斗']={0xb40000, "0|0|0xb40000,-60|-90|0x20cdf7",90,1209,162,1325,276}
t['打野-体力不足']={0xdaaf00, "0|0|0xdaaf00,-17|-11|0xf18d04,-35|8|0x63e819",90,395,125,485,182}
t['打野-体力不足2']={0xd3d1cb, "0|0|0xd3d1cb,-188|190|0x0af94b,-343|411|0xffad00,-554|175|0xac1c14",90,340,77,1114,601}

function _monster()
	log("打野")
	log({"打野次数记数",打野次数记数,"_UI.打野次数",_UI.打野次数})
	if 打野次数记数 >=  _UI.打野次数  then
	    _UI.打野 = false
	end
	
	local 采集位置={{269,665,0xb3b0b0},{474,661,0x428a22},{675,662,0xc28f71},{861,659,0x585858},{1064,661,0x878787},}
	while d('采矿-放大镜') and 打野次数记数 < _UI.打野次数 and _UI.打野 do
	    
		local i = 1
		while i < 60 and ( d('打野-正在行军') or d('打野-正在战斗') )  and _UI.打野 do
		    delay(1)
		    if d('打野-正在挖矿') then
		        _UI.打野 = false
		    end
		    i=i+1
		end
		d('采矿-放大镜',true,1,3) 
		click( 采集位置[1][1],采集位置[1][2],2 )

        if 打野降低key then
            d('打野-增加开关',true,3,1)
            打野降低key = false
        elseif 打野增长key then
            d('打野-增加开关',true)
            d('打野-增加开关',true)
            d('打野-增加开关',true)
        end
		if d("采矿-搜索",true,1,3)then
			click(663,367,2)	--点屏中间
			log('点屏中间')
			if d("斥候-搜索-绿")then
				log("未开荒")
				_UI.采集.key = false
				return false
			end
			if d('打野-搜索',true)then
			    打野增长key = false
			     d("采矿-搜索",true,1,3)
			else
    			d("采矿-搜索-攻击",true,1,3)
    			
    			if d("采矿-创建部队",false,1,2)  then
    			    d('打野-创建部队-正在返回',true,1,2)
    			    if d('打野-创建部队-行军',true,1,3)then
    			        打野次数记数 = 打野次数记数 + 1
    			    end
    			end
    			 d("采矿-创建部队",true,1,2)
    			 
    			if d("采矿-行军")  then
    			    if not( d('打野-七世')) then
    			        d('打野-切换英雄',true)
    			        local qsi = 0
    			        while qsi < 10 do
    			            log('准备找埃及7世')
    			            if d('打野-切换英雄-七世',true,1,2) then
    			                break
    			            end
    			            qsi=qsi + 1
    			            delay(1)
    			        end
    			    end
    			    
    			    if d('采矿-行军-打不过')then
    			        打野增长key = false
    			        打野降低key = true
    			    elseif d('打野-敌弱我强') and d("采矿-行军",true) then
    				    log('打野中休息5秒','all')
    				    delay(5)
    				    打野次数记数 = 打野次数记数 + 1
    				    if d('打野-体力不足') or d('打野-体力不足2',true,1,2)then
    				        _UI.打野 = false
    				        return
    				    end
    				else
    				    打野增长key = false
    				    打野降低key = true
    				end
    			end
    		end
		end
	end

end

t['采集-采集前调低']={0x0eab00, "0|0|0x0eab00,-42|-1|0x0f74be,63|89|0x00c3ff,244|-1|0x1073bd",90,186,363,1195,606}

function _Collection()
	log("采集")
	if _UI.采集.key then
		local 采集位置={ {474,661,0x428a22},{675,662,0xc28f71},{861,659,0x585858},{1064,661,0x878787},}   --玉米.木材,石头,金币,随机( 不采金币 )
		if d('采矿-放大镜',true,1,2)then
			if tonumber(_UI.采集.种类) >= 4 then
				_Coll_key = rd(1,2)
				click( 采集位置[_Coll_key][1],采集位置[_Coll_key][2],2 )
			else
				click( 采集位置[tonumber(_UI.采集.种类)][1],采集位置[tonumber(_UI.采集.种类)][2],2 )
			end
			
			if d("采矿-搜索",false,1,3)then
			    d('采集-采集前调低',true,1,1)
			end
			
			if d("采矿-搜索",true,1,3)then
				click(663,367,2)	--点屏中间
				if d("斥候-搜索-绿")then
					log("未开荒")
					_UI.采集.key = false
					return false
				end
				d("采矿-搜索-攻击",true,1,2)
				d("采矿-搜索-采集",true,1,2)
				d("采矿-创建部队",true,1,2)
				
				if d("采矿-行军")  then
    			    if not( d('打野-七世')) then
    			        d('打野-切换英雄',true)
    			        local qsi = 0
    			        while qsi < 10 do
    			            log('准备找埃及7世')
    			            if d('打野-切换英雄-七世',true,1,2) then
    			                break
    			            end
    			            qsi=qsi + 1
    			            delay(1)
    			        end
    			    end
    			    
    			    if d("采矿-行军",true) or d('采矿-行军2',true) then
    				    _UI.采集.key = false
    				end
    			end
				
			end	
	    end
    end
end

local 斥候位置={{808,404,0xb2004},{952,564,0x97fb8},}
t['斥候-搜索'] = { 0xffac00,"-91|-29|0xffbf00,83|16|0xffa500",degree,894,263,1159,561}
t['斥候-搜索-绿'] = { 0xb67016,"-75|-29|0xffc000,94|22|0xffa400",degree,97,25,1230,722}
t['斥候-搜索-派遣'] = { 0xb67016,"-8|-19|0xffbe00,-93|-20|0xffbe00,79|25|0xffa500",degree,916,7,1195,572}
t['斥候-搜索-派遣中'] = { 0xffffff,"5|-5|0xb66200,-22|-36|0xbc13eb",degree,1224,158,1332,436}
t['斥候-休息中'] = { 0xffffff,"7|1|0x7d7d7d,-1|-13|0x7d7d7d,3|8|0xbdbdbd",degree,406,331,471,419}
function _Acouts()
	log("斥候")
	click(斥候位置[1][1],斥候位置[1][2],2)
	click(斥候位置[2][1],斥候位置[2][2],2)
	
	if d("斥候-搜索",true,1,2)then
		d("斥候-搜索-绿",true,1,2)
		d("斥候-搜索-派遣",true,1,2)
		if d("斥候-搜索-派遣中")then
			_UI.斥候 = false
		end
	elseif d("斥候-休息中")then
		_UI.斥候 = false
	end
end

t['医院+'] = { 0xf31919,"0|-13|0xfe3333,-11|1|0xf11616,1|11|0xe90202,15|-1|0xeaeee7",degree,606,225,699,323}
t['医院+']={0xf61f20, "0|0|0xf61f20,-1|-10|0xfa2425,-1|10|0xfc0303",90,564,200,727,330}
t['医院-治疗'] = { 0xc2ff,"100|-25|0xd1ff,-160|25|0xfea200,-399|-28|0xfebf00",degree,566,549,1153,669}
t['医院-治疗-无资源']={0xd3d2cb, "-291|155|0x0c2d3d,-250|522|0x00c1ff,-266|513|0x1176bc",90,666,35,1189,685}
t['医院-治好'] = { 0x9d4400,"9|0|0x9a4300,26|-4|0xc86600",75,609,228,703,335}
t['医院-治好']={0xcf7f01, "0|0|0xcf7f01,-29|-18|0xeffa00",90,583,205,740,373}
t['医院-治好2']={0xd4980d, "0|0|0xd4980d,-35|-11|0xedeb04,-9|-11|0xeeec05",90,610,230,731,344}


function _Hospital()
	log("医院")
	if d("医院+",true,1,2)then
		d("医院-治疗",true,1,2)
		if d('医院-治疗-无资源',true,1,2) then
		    return false
        end
	elseif d("医院-治好",true,1,2)then
	elseif d("医院-治好2",true,1,2)then
	else
		return false
	end
end

t['邮件-有邮件提醒']={0x156793, "0|0|0x156793,18|14|0x80e7ff,42|-12|0xde0000",90,1260,541,1333,623}
    t['邮件-邮箱界面']={0xd2b890, "0|0|0xd2b890,26|-2|0x79603a,228|-11|0xd7bd94,228|-1|0x9b855f",90,13,653,455,721}
        t['邮件-邮箱界面-有红点']={0xc4c0b4, "0|0|0xc4c0b4,70|-1|0xdb0000",90,45,3,1234,43}
t['邮件-邮件x']={0xd2d1cb, "0|0|0xd2d1cb,-8|-7|0xd3d2c9",90,1256,25,1314,67}
function _mail()
    log('读邮件')
    if d('邮件-有邮件提醒',true,1,3)then
        if d('邮件-邮箱界面')then
            local i=0
            while i<10 and d('邮件-邮箱界面-有红点',true) do
                d('邮件-邮箱界面',true)
                i=i+1
            end
        end
        d('邮件-邮箱界面',true)
        d('邮件-邮件x',true)
    end
end

t['礼物-木兰']={0xaa463d, "0|0|0xaa463d,25|-23|0xe20000",90,1082,90,1147,145}
t['礼物-木兰领取']={0x1274ba, "0|0|0x1274ba,-51|1|0x00c2fe",90,608,345,882,508}
function _gift()
    log('领木兰')
    if d('礼物-木兰',true)then
        d('礼物-木兰领取',true)
    end
end

t['日历-有奖励']={0xc07644, "0|0|0xc07644,8|-4|0xf2d3a2,26|-15|0xde0000",90,1265,94,1326,152}
t['日历-奖励界面x']={0x907147, "0|0|0x907147,11|1|0xa88c6b,1|-9|0xa78a69",90,1137,23,1178,58}
t['日历-奖励界面-领取']={0x228803, "0|0|0x228803,1|-18|0x00c90e,27|17|0x03a60d",90,993,113,1155,691}
t['日历-奖励界面-左侧面板']={0x533f21, "0|0|0x533f21,119|-29|0xde0000",90,163,45,440,690}
    t['日历-奖励界面-稍后查看']={0xffa900, "0|0|0xffa900,-461|-31|0x00caf6",90,370,622,954,715}
t['日历-奖励界面-红绿']={0x26b455, "0|0|0x26b455,-15|-16|0xe20000",90,466,73,1171,673}
t['日历-奖励界面-红蓝']={0x2481c1, "0|0|0x2481c1,-10|-20|0xe20000",90,466,73,1171,673}

function _book()
    log('日历奖励')
    if d('日历-有奖励',true,1,3)then
        local i=0
        while ( d('日历-奖励界面-领取',true,1,2)  or d('日历-奖励界面-左侧面板',true,1,2)  or d('日历-奖励界面-红绿',true)  or d('日历-奖励界面-红蓝',true)) and i< 20 do
            i=i+1
            d('日历-奖励界面-稍后查看',true)
            delay(1)
        end
        d('日历-奖励界面x',true)
    end
end
--简单清理
function clearOneAccount()
	log('简单清理')
	local sonlist={
		'/tmp/',
		'/Library/',
	}
	for k,v in ipairs(sonlist)do
		local dataPath = appDataPath(_app.bid)
		local AllPath = dataPath..v
		log(AllPath)
		delFile(AllPath)
	end
end


t['任务_点击任务'] = { 0xe4b067,"-18|15|0x6d0000,-16|-7|0x560000",degree,18,141,76,196}
	t['任务_点击任务_前往'] = { 0x1274ba,"-56|-18|0xd4fe,59|7|0xb6f3",degree,937,139,1163,429 }
	t['任务_点击任务_训练'] = { 0xc9ff,"-349|-175|0x14d900,-309|15|0xffac00",degree,595,387,1140,668}
	t['任务_点击任务_训练_取消'] = { 0xc0fe,"-445|-7|0xfeb200,-264|-67|0x334e",degree,286,356,1070,630}
t['任务_点击任务_采矿'] = { 0x8c7ff,"162|-26|0x1077bc,162|19|0x1076bd",degree,128,429,1173,600}		
t['任务_点击任务_科技面板']={0xd2d1ca, "0|0|0xd2d1ca,-447|-4|0x858278,-988|-1|0xb9b6ad,-1083|87|0x0899d3",90,14,27,1220,251}	
    t['任务_点击任务_研究']={0x00c2fd, "0|0|0x00c2fd,0|-18|0x00cdff,-240|-19|0xffbb00,-367|14|0xffa500",90,663,494,1129,616}
t['任务-联盟互动']={0x00bcfc, "0|0|0x00bcfc,-816|-26|0xeeb5a7,-823|-36|0xa65c4a,-780|-62|0xe3b300,-852|-63|0xd9af01",90,177,246,1147,674}
    t['任务-联盟帮助']={0xffb000, "0|0|0xffb000,-47|-23|0xfebc00,118|22|0xffa500",90,508,641,829,725}
    t['任务-活跃度80+']={0xebbc00, "0|0|0xebbc00,-1|-13|0x04445e",90,950,180,1057,232}
    t['任务-事半功倍']={0xfcf7f7, "0|0|0xfcf7f7,46|4|0x4b2610,44|143|0x492510,45|283|0x492410",90,197,257,332,673}
    t['任务-知识之力']={0x1274ba, "0|0|0x1274ba,-750|-58|0xfdee1c,-756|-57|0x834910,-774|2|0x1ab2ff,-780|-10|0xfeffff",90,178,267,1162,678}
        t['任务-埃及艳后']={0xffddbc, "0|0|0xffddbc,-37|31|0xec7700,19|13|0xfaf974,0|-24|0xfefb7f,-29|-18|0x2c33a0",90,700,40,928,78}
        t['任务-英雄之力-学习']={0x00c0fd, "0|0|0x00c0fd,231|0|0x00c0fb,-1011|-599|0xd4d4cd",90,11,12,1298,691}
        t['任务-英雄之力-学习-使用']={0x1274ba, "0|0|0x1274ba,-85|-18|0x00d0fd,53|23|0x01aeeb",90,912,211,1134,669}
    t['任务-神秘商人界面']={0x007eb9, "0|0|0x007eb9,39|-86|0x858278,99|-85|0xc9c5b6",90,531,65,942,206}
    t['任务-神秘商人-免费刷新']={0xffffff, "0|0|0xffffff,-23|-21|0x197bbf,-31|0|0x00b6f4",90,957,140,1137,201}
    t['任务-神秘商人-收费刷新']={0xd4d3cc, "0|0|0xd4d3cc,-26|92|0xffad00,-152|89|0xffaf00",90,946,63,1176,207}
t['任务-完成']={0x482d13, "0|0|0x482d13,-11|-14|0xd6b124,-5|-19|0x033e57",90,1078,189,1111,224}


t['任务_采集类']={0x00bffa, "0|0|0x00bffa,-11|-1|0x1274ba,-781|4|0x6f2b00,-784|-22|0xd2e6f6,-833|-55|0xffc379",90,184,265,1149,674}
    t['任务_采集类-搜索']={0x07c7ff, "0|0|0x07c7ff,71|-91|0x1073bd,-216|-90|0x0d7ec5",90,96,247,1282,631}
t['任务_科技时代']={0x00baf9, "0|0|0x00baf9,-811|-26|0x37def8,-815|9|0x03693d,-780|-51|0xffde90,-810|-20|0x0f3073",90,184,265,1149,674}

function _神秘商店()
    delay(1)
    local i = 0
    while i < 5 and d('任务-神秘商人界面') do
        local redx = 385
        for ii = 1,2 do
            for i=0,3 do
                t['商店购买-宝石']={0xc81108, "0|0|0xc81108,-6|-10|0xfff7f5,-7|3|0xe85f3e,-1|9|0xfea300",90,redx+i*185,238,redx+185+i*185,556}
                t['商店购买-物品']={0xffffff, "0|0|0xffffff,-2|-14|0xfec000,-4|13|0xfea300",90,redx+i*185,238,redx+185+i*185,556}
                if not(d('商店购买-宝石')) then
                    d('商店购买-物品',true,1,2)
                end
            end
            moveTo(757, 581,759, 376,2,10)
            delay(2)
        end
        if d('任务-神秘商人-免费刷新',true)then
        elseif d('任务-神秘商人-收费刷新',true) then
            return
        end
        i=i+1
    end
end

function _task()
    
	_setp['任务'] = _setp['任务'] + 1
	if _setp['任务'] > 3 then
		_UI.任务 = false
		return false
	end
	
    if d('任务-完成')then
        _UI.任务 = false
	elseif d('任务_点击任务',true,1,3)then
		click(122,336,2)    --点到任务
		d("奖励-奖励面板-领取",true,1,2)    --有奖励就领掉
		d("奖励-奖励面板-领取箱子",true)    --箱子的奖励
		d("奖励-奖励面板-红色-黄",true,1,2) --黄色的箱子
		
		if _setp['任务'] >1 then
    		for i=0,_setp['任务'] do
    	        moveTo(757, 581,759, 376,10)
    		end
    		delay(2)
		end
    
		local wz位置 = {{173,249,1158,404},{179,401,1161,543},{184,540,1148,676},}
		t['任务_点击任务_王者任务']={0x1274ba, "0|0|0x1274ba,-794|-11|0xf6d58e,-814|-13|0xfa2a39,-798|-52|0xd6dff5,-815|13|0xd32e36",90,wz位置[_setp['任务']][1],wz位置[_setp['任务']][2],wz位置[_setp['任务']][3],wz位置[_setp['任务']][4]}
		t['任务_采集类']={0x00bffa, "0|0|0x00bffa,-11|-1|0x1274ba,-781|4|0x6f2b00,-784|-22|0xd2e6f6,-833|-55|0xffc379",90,wz位置[_setp['任务']][1],wz位置[_setp['任务']][2],wz位置[_setp['任务']][3],wz位置[_setp['任务']][4]}
		--先做王者类任务-造兵
		if d('任务_点击任务_王者任务',true,1,2) then
		    click(809,507,2)
			d("任务_点击任务_训练_取消",true,1,2)
		    if d('任务_点击任务_训练',true) or d('造兵-加速') then
                toast('造兵一次',1)
			end
		elseif d('任务_采集类',true,1,3) then
		    if d("采矿-搜索",true,1,3) or d('任务_采集类-搜索',true,1,3)then
		        click(663,367,2)	--点屏中间
				d("采矿-搜索-采集",true,1,2)
				d("采矿-创建部队",true,1,2)
    			if d("采矿-行军")  then
    			    if not( d('打野-七世')) then
    			        d('打野-切换英雄',true)
    			        local qsi = 0
    			        while qsi < 10 do
    			            log('准备找埃及7世')
    			            if d('打野-切换英雄-七世',true,1,2) then
    			                break
    			            end
    			            qsi=qsi + 1
    			            delay(1)
    			        end
    			    end
    			    
    			    if d("采矿-行军",true) or d('采矿-行军2',true) then
    				    toast(采矿一次,1)
    				end
    			end
    		end
		elseif d('任务-联盟互动',true,1,2) then
		    if d('任务-联盟帮助',true,1,2) then
		    else
		        click(745, 506)
                _神秘商店()
		    end
		elseif d('任务-活跃度80+') or d('任务-事半功倍') then
		    for i=0,3 do
		        moveTo(757, 581,759, 376,10)
		    end
		    delay(2)
		    if d('任务-知识之力',true,1,5) then
		        local i = 0
		        while i<8 do
		            if d('任务-英雄之力-学习') then
		                d('任务-埃及艳后',true,1,2)
		                click(1280, 305)
		                break;
		            end
		            i=i+1
		        end
		        for i=0,4 do
		            d('任务-英雄之力-学习-使用',true)
		        end
		    elseif d('任务-联盟互动',true,1,2)then
    		    if d('任务-联盟帮助',true,1,2) then
    		    else
    		        click(745, 506)
                    _神秘商店()
    		    end
            end
		elseif d( '任务_点击任务_前往' ,true,1,3)then
		    if d('任务_点击任务_科技面板') then
    			local i=0
    			while d('任务_点击任务_科技面板') and i< 10 do
    			    if d('箭头向下',true,1,2) then
    			        click(x,y+50)
    			    end
    			    d('任务_点击任务_研究',true,1,2)
    			    if d("升级-前往") then
    			        _升级子程序()
    			    end
    			    delay(1)
    			    i=i+1
    			end
			elseif d("采矿-搜索",true,1,3) then
			else
				click(809,507,2)
			end
			delay(1)
			
			if d("游戏主界面-野外")then
	
			else
			
				d("任务_点击任务_训练_取消",true,1,2)
				
				if d('任务_点击任务_训练',true) or d('造兵-加速') then

				end
			
			end
		end
	end
end


t['联盟-展开联盟']={0x044974, "0|0|0x044974,-4|-5|0x6fe6ff,-22|6|0x84e8ff",90,1227,645,1331,746}
t['联盟-展开联盟-联盟']={0x8ff9ff, "0|0|0x8ff9ff,17|4|0x095383,-16|4|0x0a5585",90,1034,662,1117,737}
t['联盟-联盟界面']={0xd1d0c9, "0|0|0xd1d0c9,-1090|132|0x03568f,-1066|147|0x0c9fdb",90,12,5,1205,267}
    t['联盟-礼物']={0xf866f7, "0|0|0xf866f7,43|-46|0xde0000",90,858,505,993,666}
        t['联盟-礼物-领取']={0x208600, "0|0|0x208600,-41|-13|0x00cd10,45|14|0x03a00c",90,652,100,1170,502}
        --1160, 44 关闭的点
    t['联盟-联盟帮助+']={0xfacab6, "0|0|0xfacab6,42|-36|0xde0000",90,993,357,1128,476}
        t['联盟-联盟帮助']={0xb67016, "0|0|0xb67016,-53|-19|0xffb900,-38|8|0xffa900",90,552,635,720,725}
        --1163, 60 关闭的点
    t['联盟-联盟科技']={0x0050de, "0|0|0x0050de,3|-15|0x5fdaf6",90,726,518,837,645}
        t['联盟-联盟科技+官员推荐']={0xd5f8ff, "0|0|0xd5f8ff,37|-49|0xc20808,-50|-53|0xbf0806",90,174,121,892,696}
        t['联盟-联盟科技+可研科技']={0xe3e9ec, "0|0|0xe3e9ec,57|5|0x407182",90,652,100,1170,502}
            t['联盟-联盟科技+捐献']={0x00c7ff, "0|0|0x00c7ff,54|-495|0xd4d3cc,-274|9|0xffae00,-236|8|0xfeb200",90,633,55,1175,652}
            t['联盟-联盟科技+捐献完成']={0xd3d2cb, "0|0|0xd3d2cb,-68|499|0x898989,-320|503|0xffae00,-441|495|0xffb300",90,633,55,1175,652}
            t['联盟-联盟科技+研究科技']={0xba9367, "0|0|0xba9367,1|16|0x01b3f3,-9|25|0xc78a56",90,824,539,946,645}
        
function _lm()
    log('联盟研究')
    if not(d('联盟-展开联盟-联盟')) then
        d('联盟-展开联盟',true,1)
    end
    if d('联盟-展开联盟-联盟',true,1,5) then
        if d('联盟-礼物',true,1,3)then
            local i = 0
            while d('联盟-礼物-领取',true,1,2) and i<5 do
                i=i+1
            end
            click(1160, 44)
        end
        if d('联盟-联盟帮助+',true,2) then
            d('联盟-联盟帮助',true)
        end
        
        if d('联盟-联盟科技',true,1,5) then
            if d('联盟-联盟科技+官员推荐',true,1,5) or d('联盟-联盟科技+可研科技',true,1,5)then
                local i =0
                while d('联盟-联盟科技+捐献',true) and i< 22 do
                    i=i+1
                end
                if d('联盟-联盟科技+捐献完成') or d('联盟-联盟科技+研究科技') then
                    _UI.联盟 = false
                end
            end
        end
    end
end
        
    
t['游戏未绑定']={0x09bf07, "0|0|0x09bf07,-729|-10|0x09c107,-482|-517|0xfbe4c5,77|-450|0xfef2e5",90,304,55,1289,670}
function game()
    
    打野降低key = false;
    打野增长key = true;
    打野次数记数 = 0;
    
	local timeline = os.time()
	while os.time()-timeline < 60 * 10 do
		if active(_app.bid,8)then
			if d('游戏主界面') or d('游戏主界面-夜')then
				if d("游戏主界面-城内")then
					d('弹窗_绑定帐号',true,1)
					_glass()
					_SignIn()
					_Collect()
					_gift()
					_mail()
				-- 	_book()
					
					if _init()then
						if _Hospital() then
						elseif _UI.建造 then
							_NewBuild()
						elseif _UI.英雄 then
							_Hero()
						elseif _UI.升级 then
							_build()
						elseif false and _UI.奖励 then
							_Award()
						elseif _UI.任务 then
							_task()
						elseif _UI.造兵.key  then
							_soldier()
						elseif _UI.斥候 then
							_Acouts()
						elseif _UI.打野 then
						    if d("游戏主界面-城内",true,1,2)then
						        _monster()
						    end
						elseif _UI.采集.key then
							if d("游戏主界面-城内",true,1,2)then
								_Collection()
							end
						elseif _UI.联盟 then
						    _lm()
						else
							return 'next'
						end
					end
				elseif d("游戏主界面-野外")then
					click(65,681,2)
				end
			elseif d('游戏未绑定')then
			    return false
			else
				if _Evevnt() then
					_Arrow()
					_Tips()
				end
			end
		end
	end
	return 'next'
end
	


function main()
	
	while true do
	
		_setp = {}
		_setp['任务'] = 0
	
		_UI.国家 = __UI.国家 + 1
		_UI.升级 = __UI.升级
		_UI.奖励 = __UI.奖励
		_UI.造兵 = {}
		_UI.造兵.key = __UI.造兵key
		_UI.造兵.步兵 = __UI.步兵
		_UI.造兵.骑兵 = __UI.骑兵
		_UI.造兵.弓兵 = __UI.弓兵
		_UI.造兵.车兵 = __UI.车兵
		_UI.建造 = __UI.建造
		_UI.英雄 = __UI.英雄
		_UI.采集 = {}
		_UI.采集.key = __UI.采集key
		_UI.采集.种类 = __UI.采集种类+1
		_UI.斥候 = __UI.斥候
		_UI.任务 = __UI.任务
		_UI.打野 = __UI.打野
		_UI.打野次数 = tonumber(__UI.打野次数)
		_UI.联盟 = __UI.联盟
	
		upimg = true
		allimg = true
		
		log(_UI);
		game()

		clearOneAccount();
		AccountInfoBack();
		delay(1)

	end
end


function all()


    
    local sz=require('sz')
    __game = {}
    __game.imei = sz.system.serialnumber();
    __game.phone_name = getDeviceName()
    __game.note = UIv.note
    AccountInfoBack();
    
    __game.token = llsGameToken()[1]
    main()



end

if not(__reg)  then
    while (true) do
    	local ret,errMessage = pcall(all)
    	if ret then
    	else
    	    vpnx();
    		log(errMessage)
    		dialog(errMessage, 10)
    		mSleep(2000)
    	end
    end
end














	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
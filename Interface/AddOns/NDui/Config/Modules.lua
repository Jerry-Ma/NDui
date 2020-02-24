-- Configure 配置页面
local _, ns = ...
local _, C = unpack(ns)

-- Position predefs
C.UI = {
    WorldDivX = {176, 209, 84},
    WorldDivY = {282, 319, 365, 200, 208, -6},
    IconSize = {28, }
}

-- BUFF/DEBUFF相关
C.Auras = {
	BuffPos			= {"TOPRIGHT", Minimap, "TOPLEFT", -15, 0},			-- BUFF默认位置

	IconSize		= C.UI.IconSize[1],												-- 相关职业助手图标大小
	TotemsPos		= {"CENTER", UIParent, "CENTER", 0, -190},			-- 图腾助手默认位置
	StatuePos		= {"TOPRIGHT", UIParent, "BOTTOM", -460, 300},		-- 武僧雕像默认位置

	-- 技能监控各组初始位置
	PlayerAuraPos	= {"BOTTOMRIGHT", UIParent, "BOTTOM", -C.UI.WorldDivX[2], C.UI.WorldDivY[1]},	-- 玩家光环分组
	TargetAuraPos 	= {"BOTTOMLEFT", UIParent, "BOTTOM", C.UI.WorldDivX[2], C.UI.WorldDivY[2]},		-- 目标光环分组
	SpecialPos		= {"BOTTOMRIGHT", UIParent, "BOTTOM", -C.UI.WorldDivX[2], C.UI.WorldDivY[2]},	-- 玩家重要光环分组
	FocusPos		= {"BOTTOMLEFT", UIParent, "LEFT", 5, -130},		-- 焦点光环分组
	CDPos			= {"BOTTOM", UIParent, "BOTTOM", -C.UI.WorldDivX[1], C.UI.WorldDivY[2]},	-- 冷却计时分组
	EnchantPos		= {"BOTTOMRIGHT", UIParent, "BOTTOM", -C.UI.WorldDivX[2], C.UI.WorldDivY[3]},	-- 附魔及饰品分组
	RaidBuffPos		= {"CENTER", UIParent, "CENTER", -C.UI.WorldDivX[2], C.UI.WorldDivY[4]},		-- 团队增益分组
	RaidDebuffPos	= {"CENTER", UIParent, "CENTER", C.UI.WorldDivX[2], C.UI.WorldDivY[4]},			-- 团队减益分组
	WarningPos		= {"BOTTOMLEFT", UIParent, "BOTTOM", C.UI.WorldDivX[2], C.UI.WorldDivY[3]},		-- 目标重要光环分组
	-- InternalPos		= {"TOPRIGHT", UIParent, "BOTTOM", C.UI.WorldDivX[3], C.UI.WorldDivY[5]},	-- 法术内置冷却分组
	InternalPos		= {"BOTTOMLEFT", UIParent, "LEFT", 5, 80},	-- 法术内置冷却分组
}

-- 头像相关
C.UFs = {
	Playercb		= {"BOTTOM", UIParent, "BOTTOM", 0, C.UI.WorldDivX[6]},			-- 玩家施法条默认位置
	Targetcb		= {"BOTTOMLEFT", UIParent, "BOTTOM", -196, 280},			-- 目标施法条默认位置
	Focuscb			= {"TOP", UIParent, "TOP", 10, -180},			-- 焦点施法条默认位置

	PlayerPos		= {"TOPRIGHT", UIParent, "BOTTOM", -208, 274},		-- 玩家框体默认位置
	TargetPos		= {"TOPLEFT", UIParent, "BOTTOM", 208, 274},		-- 目标框体默认位置
	ToTPos			= {"BOTTOMRIGHT", UIParent, "BOTTOM", 193, 279},			-- 目标的目标框体默认位置
	PetPos			= {"LEFT", UIParent, "LEFT", 5, -190},		-- 宠物框体默认位置
	FocusPos		= {"LEFT", UIParent, "LEFT", 5, -150},				-- 焦点框体默认位置
    FoTPos          = {"LEFT", UIParent, "LEFT", 210, -150},
	PlayerPlate		= {"BOTTOM", UIParent, "BOTTOM", 0, 400},			-- 玩家姓名板默认位置

	BarPoint		= {"TOPLEFT", 12, 4},								-- 资源条位置（以自身头像为基准）
	BarSize			= {150, 5},											-- 资源条的尺寸（宽，长）
	BarMargin		= 3,												-- 资源条间隔
}

-- 小地图
C.Minimap = {
	Pos				= {"TOPRIGHT", UIParent, "TOPRIGHT", -7, -7},		-- 小地图默认位置
}

-- 美化及皮肤
C.Skins = {
	MicroMenuPos 	= {"BOTTOM", UIParent, "BOTTOM", 0, 2.5},			-- 微型菜单默认坐标
	RMPos  			= {"BOTTOMLEFT", QuickJoinToastButton, "TOPLEFT", 24, 73},					-- 团队工具默认坐标
}

-- 鼠标提示框
C.Tooltips = {
	TipPos 	= {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -7, 230},		-- 鼠标提示框默认位置
}

-- 信息条
C.Infobar = {
	Guild	 		= true,												-- 公会信息
	GuildPos 		= {"TOPLEFT", UIParent, 15, -6},					-- 公会信息位置
	Friends 		= true,												-- 好友模块
	FriendsPos 		= {"TOPLEFT", UIParent, 105, -6},					-- 好友模块位置
	System			= true,												-- 帧数/延迟
	SystemPos		= {"TOPLEFT", UIParent, 190, -6},					-- 帧数/延迟位置
	Memory			= true,												-- 内存占用
	MemoryPos		= {"TOPLEFT", UIParent, 285, -6},					-- 内存占用位置
	MaxAddOns		= 12,												-- 插件信息显示数量
	Location		= true,												-- 区域信息
	LocationPos		= {"TOPLEFT", UIParent, 380, -6},					-- 区域信息位置

	Spec			= true,												-- 天赋专精
	SpecPos			= {"BOTTOMRIGHT", UIParent, -310, 6},				-- 天赋专精位置
	Durability		= true,												-- 耐久度
	DurabilityPos	= {"BOTTOM", UIParent, "BOTTOMRIGHT", -230, 6},		-- 耐久度位置
	Gold			= true,												-- 金币信息
	GoldPos			= {"BOTTOM", UIParent, "BOTTOMRIGHT", -125, 6}, 	-- 金币信息位置
	Time			= true,												-- 时间信息
	TimePos			= {"BOTTOMRIGHT", UIParent, -15, 6},				-- 时间信息位置

	FontSize		= 12,												-- 字号
	AutoAnchor		= true,												-- 自动对齐
}

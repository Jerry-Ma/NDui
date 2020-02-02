local _, ns = ...
local B, C, L, DB = unpack(ns)
local Bar = B:GetModule("Actionbar")
local cfg = C.bars.bar2

function Bar:CreateBar2()
	local padding, margin = NDuiDB["UI"]["ActionBarFramePadding"], NDuiDB["UI"]["ActionBarButtonMargin"]
	local num = NUM_ACTIONBAR_BUTTONS
	local buttonList = {}
	local layout = NDuiDB["Actionbar"]["Style"]

	--create the frame to hold the buttons
	local frame = CreateFrame("Frame", "NDui_ActionBar2", UIParent, "SecureHandlerStateTemplate")

    local nrows = layout == 6 and 2 or 1
	frame:SetWidth(num/nrows*cfg.size + (num/nrows-1)*margin + 2*padding)
	frame:SetHeight(nrows*cfg.size + (nrows-1)*margin + 2*padding)

	if layout == 5 then
		frame.Pos = {"BOTTOM", UIParent, "BOTTOM", -108, 60}
    elseif layout == 6 then
        frame.Pos = {"BOTTOM", NDui_ActionBar1, "TOP", 0, padding}
	else
		frame.Pos = {"BOTTOM", UIParent, "BOTTOM", 0, 60}
	end

	--move the buttons into position and reparent them
	MultiBarBottomLeft:SetParent(frame)
	MultiBarBottomLeft:EnableMouse(false)

	for i = 1, num do
		local button = _G["MultiBarBottomLeftButton"..i]
		table.insert(buttonList, button) --add the button object to the list
		button:SetSize(cfg.size, cfg.size)
		button:ClearAllPoints()
		if i == 1 then
			button:SetPoint("TOPLEFT", frame, padding, -padding)
        elseif i == 7 and layout == 6 then
            local previous = _G["MultiBarBottomLeftButton1"]
			button:SetPoint("TOP", previous, "BOTTOM", 0, -margin)
		else
			local previous = _G["MultiBarBottomLeftButton"..i-1]
			button:SetPoint("LEFT", previous, "RIGHT", margin, 0)
		end
	end

	--show/hide the frame on a given state driver
	frame.frameVisibility = "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists][shapeshift] hide; show"
	RegisterStateDriver(frame, "visibility", frame.frameVisibility)

	--create drag frame and drag functionality
	if C.bars.userplaced then
		frame.mover = B.Mover(frame, SHOW_MULTIBAR1_TEXT, "Bar2", frame.Pos)
	end

	--create the mouseover functionality
	if cfg.fader then
		Bar.CreateButtonFrameFader(frame, buttonList, cfg.fader)
	end
end

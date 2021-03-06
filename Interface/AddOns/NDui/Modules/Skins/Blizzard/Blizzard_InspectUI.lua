local _, ns = ...
local B, C, L, DB = unpack(ns)

C.themes["Blizzard_InspectUI"] = function()
	B.StripTextures(InspectTalentFrame)
	B.StripTextures(InspectModelFrame, true)
	InspectGuildFrameBG:Hide()
	B.Reskin(InspectPaperDollFrame.ViewButton)
	InspectPaperDollFrame.ViewButton:ClearAllPoints()
	InspectPaperDollFrame.ViewButton:SetPoint("TOP", InspectFrame, 0, -45)
	InspectPVPFrame.BG:Hide()

	local function UpdateCorruption(self)
		local unit = InspectFrame.unit
		local itemLink = unit and GetInventoryItemLink(unit, self:GetID())
		self.Eye:SetShown(itemLink and IsCorruptedItem(itemLink))
	end

	-- Character
	local slots = {
		"Head", "Neck", "Shoulder", "Shirt", "Chest", "Waist", "Legs", "Feet", "Wrist",
		"Hands", "Finger0", "Finger1", "Trinket0", "Trinket1", "Back", "MainHand",
		"SecondaryHand", "Tabard",
	}

	for i = 1, #slots do
		local slot = _G["Inspect"..slots[i].."Slot"]
		local border = slot.IconBorder

		B.StripTextures(slot)
		slot.icon:SetTexCoord(unpack(DB.TexCoord))
		slot.icon:SetInside()
		B.CreateBD(slot, .25)
		slot:GetHighlightTexture():SetColorTexture(1, 1, 1, .25)

		if not slot.Eye then
			slot.Eye = slot:CreateTexture()
			slot.Eye:SetAtlas("Nzoth-inventory-icon")
			slot.Eye:SetInside()
			slot:HookScript("OnShow", UpdateCorruption)
			slot:HookScript("OnEvent", UpdateCorruption)
		end

		border:SetAlpha(0)
		hooksecurefunc(border, "SetVertexColor", function(_, r, g, b) slot:SetBackdropBorderColor(r, g, b) end)
		hooksecurefunc(border, "Hide", function() slot:SetBackdropBorderColor(0, 0, 0) end)
	end

	hooksecurefunc("InspectPaperDollItemSlotButton_Update", function(button)
		button.icon:SetShown(button.hasItem)
	end)

	-- Talents
	local inspectSpec = InspectTalentFrame.InspectSpec

	inspectSpec.ring:Hide()
	B.ReskinIcon(inspectSpec.specIcon)
	inspectSpec.roleIcon:SetTexture(DB.rolesTex)
	B.CreateBDFrame(inspectSpec.roleIcon)

	for i = 1, 7 do
		local row = InspectTalentFrame.InspectTalents["tier"..i]
		for j = 1, 3 do
			local bu = row["talent"..j]
			bu.Slot:Hide()
			bu.border:SetTexture("")
			B.ReskinIcon(bu.icon)
		end
	end

	local function updateIcon(self)
		local spec = nil
		if INSPECTED_UNIT ~= nil then
			spec = GetInspectSpecialization(INSPECTED_UNIT)
		end
		if spec ~= nil and spec > 0 then
			local role1 = GetSpecializationRoleByID(spec)
			if role1 ~= nil then
				local _, _, _, icon = GetSpecializationInfoByID(spec)
				self.specIcon:SetTexture(icon)
				self.roleIcon:SetTexCoord(B.GetRoleTexCoord(role1))
			end
		end
	end

	inspectSpec:HookScript("OnShow", updateIcon)
	InspectTalentFrame:HookScript("OnEvent", function(self, event, unit)
		if not InspectFrame:IsShown() then return end
		if event == "INSPECT_READY" and InspectFrame.unit and UnitGUID(InspectFrame.unit) == unit then
			updateIcon(self.InspectSpec)
		end
	end)

	for i = 1, 4 do
		local tab = _G["InspectFrameTab"..i]
		B.ReskinTab(tab)
		if i ~= 1 then
			tab:SetPoint("LEFT", _G["InspectFrameTab"..i-1], "RIGHT", -15, 0)
		end
	end

	B.ReskinPortraitFrame(InspectFrame)
end
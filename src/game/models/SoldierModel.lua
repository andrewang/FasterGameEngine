local UnitModel = require("game.models.UnitModel")
local SoldierNode = require("game.scenes.battle.view.SoldierNode")
local SoldierModel = class("SoldierModel", UnitModel)


function SoldierModel:initComponents()
	SoldierModel.super.initComponents(self)
	cc(self):addComponent("game.models.components.AttackComponent"):init(self.battle):exportMethods()
	cc(self):addComponent("game.models.components.MovableComponent"):init(self.battle):exportMethods()

end

function SoldierModel:initConfigData()
	self.config = {
		ai = "src/game/test/ai_attack_unit.json",
		size = 20,
		attackRangeMax = 100,
		attackRangeMin = 0,
		viewRange = 200,
		atkCD = 2,
		aimTime = 0.2,
		afterAttackDelay = 0.5,
		beforeAttackDelay = 0.5,
		moveSpeed = 400,
		unitType = UNIT_TYPE.movable,
	}
end

function SoldierModel:genTestRender()
	local render = SoldierNode.new(self)
	self:bindRenderer(render)
	return render
end


function SoldierModel:isUsingSkill()
	return false
end


return SoldierModel
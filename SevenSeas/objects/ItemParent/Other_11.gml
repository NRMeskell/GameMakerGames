/// @description Special Action

if itemPower = "summon ship"{
    instance_create(0,0,Merchant)
    }
    
if itemPower = "full health"{
    with Pirate
        myHealth += maxHealth div 2
    }


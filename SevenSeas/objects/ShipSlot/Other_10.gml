/// @description Draw Self

if myLayer = global.menuShipLayer and (Ship.portSelect = true or global.inPort = false)
    {
    draw_sprite(ShipSlotSpr, image_index, x, y)
    }


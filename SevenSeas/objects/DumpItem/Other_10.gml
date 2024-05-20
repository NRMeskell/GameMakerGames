/// @description Dump Cargo

with myDump
    {
    cargoAmount = 0
    if !global.inPort
        instance_create(0, 0, Barrel)
    }
myDump = undefined


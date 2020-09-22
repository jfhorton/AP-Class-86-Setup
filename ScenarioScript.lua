-- Switch states
OFF = 0
ON = 1

-- Reverser states
REVERSE = 1
NEUTRAL = 1
FORWARD = 1

-- Brake states
RUNNING = 0.24
FIRST_APPLICATION = 0.4
FULL_SERVICE = 0.7
EMERGENCY = 0.85
SHUTDOWN = 1

-- Wiper states (also uses OFF)
SLOW = -0.1
NORMAL = -0.5
FAST = -1


function OnEvent(event)
    _G["OnEvent" .. event]()
end

function OnEventSetup()
    SetupClass86Cab {
        -- Remove this line and set up the cab as required.
    }
end

function SetupClass86Cab(args)
    SysCall("PlayerEngine:SetControlValue", "Cab1MasterKey", 0, args.MasterKey or OFF) 
    if args.MasterKey == ON then 
        SysCall("PlayerEngine:SetControlValue", "Cab1AWSChangeEndSwitch", 0, ON)
        SysCall("PlayerEngine:SetControlValue", "MyAWSReset", 0, 1)     
    end
    SysCall("PlayerEngine:SetControlValue", "Cab1VirtualReverser", 0, args.Reverser or NEUTRAL)
    SysCall("PlayerEngine:SetControlValue", "AWS", 0, args.AwsSunflower or OFF) 
    SysCall("PlayerEngine:SetControlValue", "Cab1InstrumentLights", 0, args.InstrumentLights or OFF) 
    SysCall("PlayerEngine:SetControlValue", "Cab1HeadlightSwitch", 0, args.HeadLight or OFF)
    SysCall("PlayerEngine:SetControlValue", "Cab1TaillightSwitch", 0, args.TailLights or ON) 
    SysCall("PlayerEngine:SetControlValue", "Cab1MarkerLightSwitch", 0, args.MarkerLights or OFF) 
    SysCall("PlayerEngine:SetControlValue", "VirtualBrake", 0, args.Brake or SHUTDOWN)    
    SysCall("PlayerEngine:SetControlValue", "Cab1LeftWiperControl", 0, args.Wipers or OFF)           
end
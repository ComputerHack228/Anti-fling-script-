wait(4)
-- init
if not game.IsLoaded(game) then
   repeat task.wait() until game.IsLoaded(game)
end
game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "Anti fling activated!";
	Text = "script by Silly Nooby";
	Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 16;

-- variables
local RunService, FindFirstChildOfClass = game.GetService(game, "RunService"), game.FindFirstChildOfClass;
local Client = game.GetService(game, "Players").LocalPlayer

-- functions
function AntiFling()
   local HeartbeatLoop = nil
   
   for _, v in next, game:GetDescendants() do
       if  v and v:IsA"Part"  and v.Parent ~= Client.Character and v.Anchored == false and v.Name == "HumanoidRootPart" then 
           HeartbeatLoop = RunService.Heartbeat:Connect(function()
               v.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
               v.Velocity = Vector3.new(0,0,0)
               v.RotVelocity = Vector3.new(0,0,0)
               v.CanCollide = false
task.wait(1)
           end)
       end
   end
   end
   
   Client.Character.Humanoid.Died:Connect(function()
       HeartbeatLoop:Disconnect()
       HeartbeatLoop = nil
   end)
AntiFling()
workspace.DescendantAdded:Connect(function(part) if part:isA("Part") and part.Name == "HumanoidRootPart"  and part.Parent ~= game.Players.LocalPlayer.Character then do wait(2) AntiFling()
end


end
end)

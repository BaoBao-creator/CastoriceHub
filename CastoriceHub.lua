local v0=game.Players.LocalPlayer;local v1=v0.Character or v0.CharacterAdded:Wait() ;local v2=v1:WaitForChild("HumanoidRootPart");local v3=nil;local v4=nil;local v5=false;local v6=268 -118 ;local v7=nil;local v8=112 + 38 ;local v9=false;local function v10() if v3 then return;end v3=Instance.new("Part");v3.Size=Vector3.new(50,1,1188 -(116 + 1022) );v3.Position=Vector3.new(v2.Position.X, -(16.5 -12),v2.Position.Z);v3.Anchored=true;v3.Transparency=1;v3.CanCollide=true;v3.Parent=game.Workspace;game:GetService("RunService").RenderStepped:Connect(function() if (v2 and v3) then v3.Position=Vector3.new(v2.Position.X, -(3.5 + 1),v2.Position.Z);end end);end local function v11() if v3 then local v51=0 -0 ;while true do if (v51==0) then v3:Destroy();v3=nil;break;end end end end local function v12() local v30=0 -0 ;local v31;while true do if (v30==(861 -(814 + 45))) then v4.Transparency=2 -1 ;v4.CanCollide=true;v4.Parent=game.Workspace;game:GetService("RunService").RenderStepped:Connect(function() if (v2 and v4) then v4.Position=Vector3.new(v2.Position.X,v7,v2.Position.Z);end end);break;end if (v30==1) then v4.Size=Vector3.new(3 + 47 ,1,18 + 32 );v7=v2.Position.Y-(889 -(261 + 624)) ;v4.Position=Vector3.new(v2.Position.X,v7,v2.Position.Z);v4.Anchored=true;v30=2;end if (v30==(0 -0)) then if v4 then return;end v31=v0.Character or v0.CharacterAdded:Wait() ;v2=v31:WaitForChild("HumanoidRootPart");v4=Instance.new("Part");v30=1;end end end local function v13() if v4 then local v52=1080 -(1020 + 60) ;local v53;while true do if (v52==(1423 -(630 + 793))) then v53=0 -0 ;while true do if (v53==0) then v4:Destroy();v4=nil;break;end end break;end end end end v0.CharacterAdded:Connect(function(v32) local v33=0;while true do if (v33==(4 -3)) then v7=v2.Position.Y-(2 + 2) ;if v3 then local v74=0 -0 ;while true do if (v74==(1747 -(760 + 987))) then v11();v10();break;end end end v33=2;end if (v33==0) then v32:WaitForChild("HumanoidRootPart");v2=v32:FindFirstChild("HumanoidRootPart");v33=1914 -(1789 + 124) ;end if (v33==(768 -(745 + 21))) then if noclip then enableNoClip();end break;end end end);function teleportForward(v34) local v35=game.Players.LocalPlayer;if (v5 and v35 and v35.Character and v35.Character:FindFirstChild("HumanoidRootPart")) then local v54=0 + 0 ;local v55;local v56;local v57;while true do if ((0 -0)==v54) then v55=0 -0 ;v56=nil;v54=1 + 0 ;end if ((1 + 0)==v54) then v57=nil;while true do if (v55==1) then v56.CFrame=v56.CFrame + (v57 * v34) ;break;end if (v55==(1055 -(87 + 968))) then v56=v35.Character.HumanoidRootPart;v57=v56.CFrame.LookVector;v55=1;end end break;end end end end function getNearestPlayer() local v36=game:GetService("Players");local v37=v36.LocalPlayer;if ( not v37 or  not v37.Character or  not v37.Character:FindFirstChild("HumanoidRootPart")) then return nil;end local v38=v37.Character.HumanoidRootPart;local v39=nil;local v40=math.huge;for v49,v50 in pairs(v36:GetPlayers()) do if ((v50~=v37) and v50.Character and v50.Character:FindFirstChild("HumanoidRootPart")) then local v70=0;local v71;local v72;while true do if (v70==0) then v71=v50.Character.HumanoidRootPart;v72=(v38.Position-v71.Position).Magnitude;v70=1;end if (v70==(4 -3)) then if (v72<v40) then local v84=0;while true do if (v84==(0 + 0)) then v40=v72;v39=v50;break;end end end break;end end end end if (v39 and v39.Character) then return v39.Character.HumanoidRootPart.Position;else return nil;end end local function v14() if  not v9 then return nil;end v0.Character.Humanoid.PlatformStand=true;v2=v0.Character and v0.Character:FindFirstChild("HumanoidRootPart") ;local v42=getNearestPlayer();if (v42==nil) then local v58=0 -0 ;while true do local v73=1413 -(447 + 966) ;while true do if (0==v73) then if (v58==(0 -0)) then wait(1817.1 -(1703 + 114) );v0.Character.Humanoid.PlatformStand=false;v58=702 -(376 + 325) ;end if ((1 -0)==v58) then local v86=0 -0 ;while true do if (v86==(0 + 0)) then v0.Character.HumanoidRootPart.Velocity=Vector3.new(0 -0 ,0,0);return nil;end end end break;end end end end local v43=v2.Position;local v44=math.abs((v42-v43).Magnitude);if (v44<=v8) then local v59=0;while true do if (v59==(15 -(9 + 5))) then v0.Character.Humanoid.PlatformStand=false;v0.Character.HumanoidRootPart.Velocity=Vector3.new(0,0,376 -(85 + 291) );break;end if (v59==0) then v0.Character.HumanoidRootPart.CFrame=CFrame.new(v42);wait(0.1);v59=1;end end else local v60=1265 -(243 + 1022) ;local v61;while true do if (v60==(0 -0)) then v61=0;while true do if (v61==1) then v0.Character.HumanoidRootPart.Velocity=Vector3.new(0 + 0 ,1180 -(1123 + 57) ,0);break;end if ((0 + 0)==v61) then wait(254.1 -(163 + 91) );v0.Character.Humanoid.PlatformStand=false;v61=1931 -(1869 + 61) ;end end break;end end end end local v15=loadstring(game:HttpGet("https://sirius.menu/rayfield"))();local v16=v15:CreateWindow({Name="Castorice Hub",Icon="candy-cane",LoadingTitle="Castorice Hub Loading...",LoadingSubtitle="by BaoBao",Theme="Bloom",DisableRayfieldPrompts=true,DisableBuildWarnings=true,ConfigurationSaving={Enabled=true,FolderName=nil,FileName="Castorice Hub"},Discord={Enabled=false,Invite="noinvitelink",RememberJoins=true},KeySystem=true,KeySettings={Title="Castorice Hub",Subtitle="Key System",Note="Use the key provided by the admin.",FileName="Key",SaveKey=true,GrabKeyFromSite=false,Key={"BaoBaoDZ1337"}}});local v17=v16:CreateTab("Movement","move");local v18=v17:CreateToggle({Name="God Movement",CurrentValue=false,Flag="Toggle1",Callback=function(v45) if v45 then v12();else v13();end end});local v19=v17:CreateKeybind({Name="Up Keybind",CurrentKeybind="Space",HoldToInteract=false,Flag="Keybind1",Callback=function(v46) local v47=0 -0 ;while true do if (v47==(0 -0)) then wait(0.3 + 0 );v7=v2.Position.y-2 ;break;end end end});local v20=v17:CreateKeybind({Name="Down Keybind",CurrentKeybind="LeftAlt",HoldToInteract=false,Flag="Keybind1",Callback=function(v48) v7=v7-(13 -3) ;end});local v21=v16:CreateTab("Misc","list-collapse");local v22=v21:CreateButton({Name="Shut down",Callback=function() v15:Destroy();end});
-- ⚠️ WARNING: integrity protected!
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

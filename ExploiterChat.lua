--Exploiter Chat made by Sheenieboy
--loadstring(game:HttpGet(('https://raw.githubusercontent.com/sheenieboy/ExploiterChat/master/ExploiterChat'),true))()
--https://discord.gg/YmB9RZpbEn
spawn(function()
if not game:IsLoaded() then
	game.Loaded:Wait()
end
if(_G.ExploiterChat == true) then
	return;
end
_G.ExploiterChat = true;
if not getfenv(0).WebSocket and not syn_checkcaller then error('Unsupported exploit!') end
local Exploit = syn_checkcaller and "Synapse" or identifyexecutor() == "ScriptWare" and "ScriptWare" or PROTOSMASHER_LOADED and "Protosmasher" or KRNL_LOADED and "KRNL" or "Unknown";

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local EKGB = "ws://127.0.0.1"; 

local json_encode = function(tbl)
	local json = game:GetService("HttpService"):JSONEncode(tbl)
	return json
end
local json_decode = function(json)
	local tbl = game:GetService("HttpService"):JSONDecode(json)
	return tbl
end

function updateFile()
	if writefile then
		writefile("ExploiterChatPref.lua", game:GetService("HttpService"):JSONEncode({
			ChangableKey = ChangableKey; 
			ChatColor = ChatColor; 
			ECPrefix = ECPrefix; 
			ECOPPrefix = ECOPPrefix; 
			UsingVersion = UsingVersion; 
			NotificationSoundsEnabled = NotificationSoundsEnabled; 
			UniqueCode = UniqueCode; 
			JoinLeave = JoinLeave; 
			Username = Username; 
			ChatPosition = ChatPosition;
		}))
	end
end
local firstTimeLoaded = false
function loadPref()
	UsingVersion = "1";
	ChangableKey = 29394972;
	ChatColor = {255,255,255};
	ECPrefix = "'";
	ECOPPrefix = "#";
	NotificationSoundsEnabled = true;
	UniqueCode = "Default";
	JoinLeave = true;
	Username = "Default";
	ChatPosition = {0, 0, 1.7, 0};
	if writefile then
		if pcall(function() readfile("ExploiterChatPref.lua") end) then
			if readfile("ExploiterChatPref.lua") ~= nil then
				local json = game:GetService("HttpService"):JSONDecode(readfile("ExploiterChatPref.lua"))
				if json.UsingVersion ~= nil then UsingVersion = json.UsingVersion end
				if json.ChangableKey ~= nil then ChangableKey = json.ChangableKey end
				if json.ChatColor ~= nil then ChatColor = json.ChatColor end
				if json.ECPrefix ~= nil then ECPrefix = json.ECPrefix end
				if json.ECOPPrefix ~= nil then ECOPPrefix = json.ECOPPrefix end
				if json.NotificationSoundsEnabled ~= nil then NotificationSoundsEnabled = json.NotificationSoundsEnabled end
				if json.UniqueCode ~= nil then UniqueCode = json.UniqueCode end
				if json.JoinLeave ~= nil then JoinLeave = json.JoinLeave end
				if json.Username ~= nil then Username = json.Username end
				if json.ChatPosition ~= nil then ChatPosition = json.ChatPosition end
			else
				firstTimeLoaded = true
			end
		else
			firstTimeLoaded = true
		end
		updateFile();
	end
end
loadPref()

function dragGUI(gui)
	spawn(function()
		local dragging
		local dragInput
		local dragStart = Vector3.new(0,0,0)
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService("TweenService"):Create(gui, TweenInfo.new(.20), {Position = Position}):Play()
			if(gui.Name == "ChatWindow") then
				ChatPosition = {gui.Position.X.Scale, gui.Position.X.Offset, gui.Position.Y.Scale, gui.Position.Y.Offset};
				updateFile();
			end
		end
		gui.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		gui.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)
	end)
end

local ECVersion = "2.5";
local ChangeLog = game:GetObjects("rbxassetid://5142824610")[1]
ChangeLog.Background.Visible = false
ChangeLog.Background.Position = UDim2.new(.5, -310, .5, -232);
ChangeLog.Background.Version.Text = "v" .. ECVersion
ChangeLog.Background.ZIndex = 10
ChangeLog.Background.Exit.MouseButton1Click:Connect(function()
	ChangeLog.Background.Visible = false
end)
ChangeLog.Parent = game.CoreGui
ChangeLog.Background.Frame.TextLabel.Text = "Join the Official Discord. Type ;discord to get the invite in your clipboard!\
\
<b>Changes in 2.0.5</b>\
+ Fixed notification toggle\
+ Added banned words (Dont say racial slurs)\
+ The UI now saves position\
<b>Changes in 2.5</b>\
+ Chat revamp\
+ There is a new friends list feature!\
+ You can now pm players which brings up a new chat.\
+ Bug fixes.\
\
<u><b>Rules</b></u>\
1. No spamming or flooding.\
2. Be respectful to other users.\
3. No NSFW/NSFL content.\
4. No advertising or selling products.\
5. Any discussion about doxing or distribution of personal information will result in a permanent ban.\
6. Do not be toxic or harass other users.\
7. Racism or any other derogatory behaviour is prohibited.\
8. Malicious files, viruses, and IP loggers are disallowed.\
9. Do not impersonate other users.\
10. Any use of racial or homophobic slurs will result in a ban.\
\
<u><b>Features</b></u>\
+ Custom chat color\
+ Notification sound when you get a message and the chat is closed\
+ Emojis - Use : at the begging/end e.g :sunny: (will autocomplete if you click tab)\
+ Press # to open/close the chat\
+ Press ' (default) to focus on the chat\
+ Saves chat color, prefix and key\
+ Whisper to other players using /w username\
+ Join/leave messages\
+ Invite players to your game using ;invite [plr] or ;invite for all players\
+ <b>Discord Implementation - You can link your account in the official discord and talk in the linked chat!</b>\
\
<u><b>Commands</b></u>\
;invite - Invites people to your game\
;ignore [plr] - Ignores someone in the chat\
;unignore [plr] - Unignores someone in the chat\
;changekey [newkey or default] - Changes the private channel key\
;prefix [newprefix] - Changes the chat prefix from '\
;ocprefix [newprefix] - Changes the keybind to open/close the chat from #\
;silent - Toggles notification sounds\
;chatcolor - Brings up a gui that allows you to change your chat color\
;changelog - Brings up the change log\
;discord - Copy the discord link to your clipboard\
;users - Tells you how many users are connected to the chat\
;clear - Removes all messages from the chat\
;password - Copies your password to your clipboard";
ChangeLog.Background.Frame.TextLabel.Size = UDim2.new(0, 575, 0, 2000)
ChangeLog.Background.Frame.CanvasSize = UDim2.new(0, 0, 0, ChangeLog.Background.Frame.TextLabel.TextBounds.Y+30)
dragGUI(ChangeLog.Background)
function openDialog(location)
	ChangeLog.Background.Visible = true
end
local client;
if(syn_checkcaller) then
	client = syn.websocket.connect(EKGB)
elseif PROTOSMASHER_LOADED then
	client = WebSocket.new(EKGB)
	client:ConnectToServer()
	wait(1)
elseif(getfenv(0).WebSocket) then
	client = WebSocket.connect(EKGB)
	wait(1)
end

if(not client) then
	return warn("incompatable exploit")
end

local timeout = 0;
function sendServerRequest(Details) 
	local timeDiff = tick() - timeout
	if (timeDiff > 1.5) then
		timeout = tick()
		client:Send(json_encode(Details))
	end
end

if(UsingVersion ~= ECVersion) then
	openDialog("ChangeLog");
	UsingVersion = ECVersion
	updateFile()
end

local LoginSuccessful = false;
local LoginGui = game:GetObjects("rbxassetid://6165528007")[1]
local loginOpen = false
function openLogin()
	if(loginOpen) then return end
	loginOpen = true
	LoginGui.Parent = game.CoreGui;
	LoginGui.MainFrame.Position = UDim2.new(.5, -150, .5, -136.5);
	LoginGui.MainFrame.Interact.PasswordInput.Changed:Connect(function() 
		--LoginGui.MainFrame.Interact.PasswordInput.Text = string.match(LoginGui.MainFrame.Interact.PasswordInput.Text, "%w+"):sub(1,30);
		local newMess = string.match(LoginGui.MainFrame.Interact.PasswordInput.Text, "%w+")
		LoginGui.MainFrame.Interact.PasswordInput.Text = newMess and newMess:sub(1,30) or "";
	end)
	LoginGui.MainFrame.Interact.UsernameInput.Changed:Connect(function()
		local newMess = string.match(LoginGui.MainFrame.Interact.UsernameInput.Text, "%w+")
		LoginGui.MainFrame.Interact.UsernameInput.Text = newMess and newMess:sub(1,16) or "";
	end)
	LoginGui.MainFrame.Interact.UsernameInput.Text = game.Players.LocalPlayer.Name;
	LoginGui.MainFrame.Interact.PasswordInput.Text = UniqueCode ~= "Default" and UniqueCode or "";
	local loginPressed = false;
	LoginGui.MainFrame.Interact.Login.MouseButton1Click:Connect(function()
		if(loginPressed) then return end
		loginPressed = true;
		Username = LoginGui.MainFrame.Interact.UsernameInput.Text:match("%w+"):sub(1,16);
		UniqueCode = LoginGui.MainFrame.Interact.PasswordInput.Text
		client:Send(json_encode({
			['Action'] = 'Register',
			['Username'] = Username,
			['UniqueCode'] = UniqueCode;
		}))
		wait(2)
		loginPressed = false;
	end)
	LoginGui.MainFrame.TopBar.Discord.MouseButton1Click:Connect(function()
		local http = game:GetService('HttpService') 
		if toClipboard then
			spawn(function()
				toClipboard('https://discord.com/invite/YmB9RZpbEn')
				LoginGui.MainFrame.TopBar.Discord.Text = "Discord link copied to clipboard!";
				wait(5);
				LoginGui.MainFrame.TopBar.Discord.Text = "Click to get Discord Invite!";
			end)
			notify('Discord Invite', 'Copied to clipboard!\ndiscord.gg/YmB9RZpbEn')
		else
			notify('Discord Invite', 'discord.gg/YmB9RZpbEn')
		end
		local req = (syn and syn.request) or (http and http.request) or http_request
		if req then
			req({
				Url = 'http://127.0.0.1:6463/rpc?v=1',
				Method = 'POST',
				Headers = {
					['Content-Type'] = 'application/json',
					Origin = 'https://discord.com'
				},
				Body = http:JSONEncode({
					cmd = 'INVITE_BROWSER',
					nonce = http:GenerateGUID(false),
					args = {code = 'YmB9RZpbEn'}
				})
			})
		end
	end)
	LoginGui.MainFrame.TopBar.Exit.MouseButton1Click:Connect(function()
		LoginGui.Parent = nil
		loginOpen = false
	end)
	LoginGui.MainFrame.Interact.PasswordInput.RandomButton.MouseButton1Click:Connect(function()
		local valid_chars = {}
		local function set_valid(x, y)
			for i = string.byte(x), string.byte(y) do
				table.insert(valid_chars, string.char(i))
			end
		end
		set_valid('a', 'z')
		set_valid('A', 'Z')
		set_valid('0', '9')
		local function random_string(length)
			local s = {}
			for i = 1, length do s[i] = valid_chars[math.random(1, #valid_chars)] end
			return table.concat(s)
		end
		LoginGui.MainFrame.Interact.PasswordInput.Text = random_string(25)
	end)
	dragGUI(LoginGui.MainFrame)
end

local doLogin = function(msg)
	if(not msg) then return end
	local data = json_decode(msg)
	if(data["Action"] == "LoginSuccessful") then
		updateFile();
		LoginSuccessful = true;
	elseif(data["Action"] == "RegistrationSuccessful") then
		updateFile();
		LoginSuccessful = true;
	elseif(data["Action"] == "Error") then
		openLogin()
		LoginGui.MainFrame.TopBar.Message.Text = "Error: " .. data["Message"];
	end
end

local OnLogin
if(PROTOSMASHER_LOADED) then 
	client.OnMessage = doLogin;
else
	OnLogin = client.OnMessage:Connect(doLogin)
end

if(Username == "Default" or not UniqueCode) then
	openLogin()
else
	client:Send(json_encode({
		['Action'] = 'Login',
		['Username'] = Username,
		['UniqueCode'] = UniqueCode
	}))
end
repeat wait() until LoginSuccessful
if(OnLogin) then OnLogin:Disconnect() end
if(game.CoreGui:FindFirstChild("LoginGui")) then
	LoginGui.Parent = nil
	loginOpen = false;
end
local username = Username
local Nickname = false;
local Ignored = {}
local Rank = false;
local allowedCommands = false;
local LP = Players.LocalPlayer
local emojil = game:GetService("HttpService"):JSONDecode(game:HttpGet('https://raw.githubusercontent.com/emojione/emojione/master/emoji_strategy.json', true))
local last;
local SettingsOpen = false;
local ProfileAccessable = false;
local unread_counter = 0;
local Mouse = game.Players.LocalPlayer:GetMouse()

local PrivateChats = {}
local Chats = {}
local COMMANDS = {}
local STD = {}
local SPLIT = ' '
function ADD_COMMAND(N, D, A, P, F) table.insert(COMMANDS, {N = N, D = D, A = A, P = P, F = F}) end
function STD.TABLE(T, V) if not T then return false end for i,v in pairs(T) do if v == V then return true end end return false end
function STD.ENDAT(S, V) local SF = S:find(V) if SF then return S:sub(0, SF - string.len(V)), true else return S, false end end
function FCOMMAND(COMMAND, USERID) for i,v in pairs(COMMANDS) do if v.N:lower() == COMMAND:lower() or STD.TABLE(v.A, COMMAND:lower()) then return v end end end
function GCOMMAND(M) local CMD, HS = STD.ENDAT(M:lower(), SPLIT) if HS then return {CMD, true} else return {CMD, false} end end
function GPREFIX(STRING) if STRING:sub(1, string.len(C_PREFIX)) == C_PREFIX then return {'COMMAND', string.len(C_PREFIX) + 1} end return end
function GARGS(STRING) local A = {} local NA = nil local HS = nil local S = STRING:gsub('#', '') repeat NA, HS = STD.ENDAT(S, SPLIT) if NA ~= '' then table.insert(A, NA) S = S:sub(string.len(NA) + string.len(SPLIT) + 1) end until not HS return A end
function GCAPARGS(STRING) local A = {} local NA = nil local HS = nil local S = STRING repeat NA, HS = STD.ENDAT(S, SPLIT) if NA ~= '' then table.insert(A, NA) S = S:sub(string.len(NA) + string.len(SPLIT) + 1) end until not HS return A end
function ECOMMAND(STRING) STRING = STRING:gsub(';', '') repeat if STRING:find('  ') then STRING = STRING:gsub('  ', ' ') end until not STRING:find('  ') local SCMD, A, CMD SCMD = GCOMMAND(STRING) CMD = FCOMMAND(SCMD[1], LP.UserId) if not CMD then return end if(CMD.P) then CreateLabelChat({{false, false}, "SystemMessage", "System"}, "Executed command ;" .. STRING, getOpenedChat(), Color3.fromRGB(5, 150, 100)) end A = STRING:sub(string.len(SCMD[1]) + string.len(SPLIT) + 1) local ARGS = GARGS(A) CA = GCAPARGS(A) pcall(function() CMD.F(ARGS, SPEAKER) end) end

function FindInTable(Table, Name)
	for i,v in pairs(Table) do
		if v == Name then
			return true
		end
	end
	return false
end

function GetInTable(Table, Name)
	for i = 1, #Table do
		if Table[i] == Name then
			return i
		end
	end
	return false
end

function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		--notify('Clipboard','Copied to clipboard')
	else
		notify('Clipboard',"Your exploit doesn't have the ability to use the clipboard")
	end
end

-- Instances:

local ECPrefix = "'";

local Chat = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ChatWindow = Instance.new("Frame")
local ChatBarParentFrame = Instance.new("Frame")
local ChatBar = Instance.new("TextBox")
local ChatChannelParentFrame = Instance.new("Frame")
local Scroller = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Frame_4 = Instance.new("Frame")

local Chat2 = Instance.new("ImageButton")
local ChatIcon2 = Instance.new("ImageLabel")
local ChatCounter2 = Instance.new("ImageLabel")
local ChatCounterText2 = Instance.new("TextLabel")

Chat.Name = "CustomChat"
Chat.Parent = game:GetService("CoreGui")
Chat.DisplayOrder = 6
Chat.ResetOnSpawn = false

Frame.Parent = Chat
Frame.Name = "Container"
Frame.BackgroundTransparency = 1
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.Size = UDim2.new(0.3, 0, 0.274464846, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

ChatWindow.Parent = Frame
ChatWindow.Name = "ChatWindow"
ChatWindow.BackgroundTransparency = 1
ChatWindow.Position = UDim2.new(ChatPosition[1], ChatPosition[2], ChatPosition[3], ChatPosition[4]) --UDim2.new(0.5, 0, 0.5, -1)
ChatWindow.Size = UDim2.new(1, 0, 1, 0)
ChatWindow.BackgroundColor3 = Color3.fromRGB(0,0,0)
ChatWindow.BackgroundTransparency = 0.6

local roundness = Instance.new("UICorner");
roundness.CornerRadius = UDim.new(0,6);
roundness.Name = "Roundness";
roundness.Parent = ChatWindow;

ChatBarParentFrame.Name = "ChatBarParentFrame"
ChatBarParentFrame.Parent = ChatWindow
ChatBarParentFrame.BackgroundTransparency = 0
ChatBarParentFrame.Position = UDim2.new(0.5, 0, 1, -3)
ChatBarParentFrame.Size = UDim2.new(0.98, 0, 0, 20)
ChatBarParentFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
ChatBarParentFrame.BorderSizePixel = 0
ChatBarParentFrame.AnchorPoint = Vector2.new(0.5,1)

local roundness_2 = Instance.new("UICorner");
roundness_2.CornerRadius = UDim.new(0,16);
roundness_2.Name = "Roundness_2";
roundness_2.Parent = ChatBarParentFrame;

ChatBar.Name = "ChatBar"
ChatBar.Parent = ChatBarParentFrame
ChatBar.AnchorPoint = Vector2.new(0, 0.5)
ChatBar.Position = UDim2.new(0, 10, 0.5, 0)
ChatBar.BackgroundTransparency = 1
ChatBar.BorderSizePixel = 0;
ChatBar.Selectable = false
ChatBar.Size = UDim2.new(0.949999988, 0, 1, 0)
ChatBar.ClearTextOnFocus = false
ChatBar.Font = Enum.Font.Gotham
ChatBar.Text = ""
ChatBar.PlaceholderText = "To chat click here or press " .. ECPrefix .." key"
ChatBar.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
ChatBar.TextColor3 = Color3.fromRGB(100,100,100);
ChatBar.TextSize = 16
ChatBar.TextWrapped = true
ChatBar.TextXAlignment = Enum.TextXAlignment.Left

ChatChannelParentFrame.Name = "ChatChannelParentFrame"
ChatChannelParentFrame.Parent = ChatWindow
ChatChannelParentFrame.BackgroundTransparency = 1
ChatChannelParentFrame.BorderSizePixel = 0
ChatChannelParentFrame.Position = UDim2.new(0, 0, 0, 2)
ChatChannelParentFrame.Size = UDim2.new(1, 0, 1, -46)

local SizeConstraint = Instance.new("UISizeConstraint", ChatChannelParentFrame)
SizeConstraint.MaxSize = Vector2.new(ChatChannelParentFrame.AbsoluteSize.X, ChatChannelParentFrame.AbsoluteSize.Y)

Scroller.Name = "Scroller"
Scroller.Parent = ChatChannelParentFrame
Scroller.Active = true
Scroller.BackgroundTransparency = 1.000
Scroller.BorderSizePixel = 0
Scroller.Position = UDim2.new(0, 7, 0, 3)
Scroller.Selectable = false
Scroller.Size = UDim2.new(1, -14, 1, -6)
Scroller.CanvasSize = UDim2.new(0, 0, 0, 36)
Scroller.ScrollBarThickness = 4
Scroller.ScrollingEnabled = true
Scroller.ZIndex = 5

local limit = 100;
local currentHistory = {};
Scroller.ChildAdded:Connect(function(object)
	table.insert(currentHistory,1,object);
	if(#currentHistory > limit) then
		for i = 1,#currentHistory do
			if(i > limit) then
				Scroller.getObjectFromUI(currentHistory[i]):disconnect();
				table.remove(currentHistory,i);
			end
		end
	end
end)

UIListLayout.Parent = Scroller
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Frame_4.Parent = Scroller
Frame_4.BackgroundTransparency = 1.000
Frame_4.LayoutOrder = 1
Frame_4.Size = UDim2.new(1, 0, 0, 18)

ChatIcon2.Name = "ChatIcon"
ChatIcon2.Parent = Chat2
ChatIcon2.BackgroundTransparency = 1.000
ChatIcon2.Position = UDim2.new(0.5, -14, 0.5, -13)
ChatIcon2.Size = UDim2.new(0, 28, 0, 27)
ChatIcon2.Image = "rbxasset://textures/ui/Chat/Chat.png"

ChatCounter2.Name = "ChatCounter"
ChatCounter2.Parent = ChatIcon2
ChatCounter2.BackgroundTransparency = 1.000
ChatCounter2.Position = UDim2.new(1, -12, 0, -4)
ChatCounter2.Size = UDim2.new(0, 18, 0, 18)
ChatCounter2.Visible = true
ChatCounter2.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"

ChatCounterText2.Name = "ChatCounterText"
ChatCounterText2.Parent = ChatCounter2
ChatCounterText2.BackgroundTransparency = 1.000
ChatCounterText2.BorderSizePixel = 0
ChatCounterText2.Position = UDim2.new(0.5, -6, 0.5, -7)
ChatCounterText2.Size = UDim2.new(0, 13, 0, 9)
ChatCounterText2.Font = Enum.Font.SourceSansBold
ChatCounterText2.Text = "0"
ChatCounterText2.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatCounterText2.TextSize = 13.000
ChatCounterText2.TextWrapped = true
ChatCounterText2.TextXAlignment =  Enum.TextXAlignment.Center

local testLabel = Instance.new('TextLabel')
testLabel.TextWrapped = true;
testLabel.Position = UDim2.new(1,0,1,0);
testLabel.Parent = ChatChannelParentFrame.Scroller
testLabel.Visible = false;

function rainbowText(textLabel)
	if textLabel:isA("TextLabel") then
		textLabel.RichText = true
		local s = textLabel.Text
		local frequency = 2
		local totalCharacters = 0
		local strings = {}
		
		for character in string.gmatch(s, ".") do
			if string.match(character, "%s") then
				table.insert(strings, character)
			else
				totalCharacters = totalCharacters+1
				table.insert(strings, '<font color="rgb(0, 0, 0)">')
				table.insert(strings, character..'</font>')
			end
		end
		local ticker = 0
		spawn(function()
			while(wait(0.1)) do
				local str = ""
				local counter = totalCharacters
				for _, sub in pairs(strings) do
					if string.match(sub, "%a+%b()") then
						counter = counter-1
						ticker = ticker + 0.01
						local color = Color3.fromHSV(-math.atan(math.tan((ticker + counter/math.pi)/frequency))/math.pi + 0.5, 1, 1)
						sub = string.gsub(sub, "%a+%b()", "rgb("..math.floor(color.R * 255)..", "..math.floor(color.G * 255)..", "..math.floor(color.B * 255)..")")
					end	
					str = str .. sub
				end
				textLabel.Text = str
			end
		end)
	end
end

local Profile = game:GetObjects("rbxassetid://6196205846")[1]
Profile.Parent = Chat;
Profile.Visible = false;
Profile.Exit.MouseButton1Click:Connect(function()
	Profile.Visible = false;
end)
dragGUI(Profile)
function openProfile(data)
	if(data["UserId"] == nil or data["Rank"] == nil or data["LastPlayed"] == nil) then return end
	local content, isReady = game.Players:GetUserThumbnailAsync(data["UserId"], Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
	local json = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://users.roblox.com/v1/users/"..data["UserId"]));
	local description = json["description"]
	Profile.ProfilePic.Image = content
	Profile.Username.Text = "Name: " .. (data['Nickname'] or data["FoundUsername"]);
	Profile.OnlineStatus.TextColor3 = data["OnlineStatus"] == true and Color3.new(125/255, 255/255, 26/255) or Color3.new(255/255, 0/255, 0/255)
	Profile.OnlineStatus.Text = data["OnlineStatus"] == true and "<b>Online</b>" or "<b>Offline</b>";
	--Profile.Disc.TextColor3 = data["DiscordID"] ~= nil and Color3.new(125/255, 255/255, 26/255) or Color3.new(255/255, 0/255, 0/255)
	Profile.Disc.Text = data["DiscordID"] ~= nil and "Discord: <font color=\"rgb(125, 255, 26)\"><b>Linked</b></font>" or "Discord: <font color=\"rgb(255,255,255)\"><b>Not Linked</b></font>";
	Profile.Rank.Text = "Rank: " .. data["Rank"]:gsub("Rainbow;", "");
	Profile.ExploitTxt.Text = "Exploit: " .. data["Exploit"]
	local placeName = game:GetService('MarketplaceService'):GetProductInfo(data["LastPlayed"]).Name
	Profile.Playing.Text = "Last game played: " .. placeName
	Profile.Description.Text = "Description: " .. description
	Profile.Visible = true;
end

local LeftClickFrame = Instance.new("Frame", Chat)
LeftClickFrame.Name = "LeftClickFrame"
LeftClickFrame.AnchorPoint = Vector2.new(0,1)
LeftClickFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LeftClickFrame.BackgroundTransparency = 0.600
LeftClickFrame.BorderSizePixel = 0.5
LeftClickFrame.Size = UDim2.new(0, 100, 0, 50)
LeftClickFrame.Visible = false;

local ACTION_CUT         	 = 160
local ACTION_COPY        	 = 161
local ACTION_PASTE       	 = 162
local ACTION_DELETE      	 = 163
local ACTION_SORT        	 = 164
local ACTION_CUT_OVER    	 = 174
local ACTION_COPY_OVER   	 = 175
local ACTION_PASTE_OVER  	 = 176
local ACTION_DELETE_OVER	 = 177
local ACTION_SORT_OVER  	 = 178
local ACTION_EDITQUICKACCESS = 190
local ACTION_FREEZE 		 = 188
local ACTION_STARRED 		 = 189
local ACTION_ADDSTAR 		 = 184
local ACTION_ADDSTAR_OVER 	 = 187
local ACTION_CHAT 			 = 33

local NODE_COLLAPSED      = 165
local NODE_EXPANDED       = 166
local NODE_COLLAPSED_OVER = 179
local NODE_EXPANDED_OVER  = 180

local iconMap = 'http://www.roblox.com/asset/?id=483448923'
game:GetService('ContentProvider'):Preload(iconMap)
local buttonNumber = 0
function makeButton(name,iconID,off)
	iconID = tonumber(iconID) or 0;
	buttonNumber = buttonNumber+1;
	local button = Instance.new("TextButton")
	button.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	button.BorderSizePixel = 0
	button.Position = UDim2.new(0,0,0,0)
	button.Size = UDim2.new(1,0,0,25)
	button.Text = ""
	button.ZIndex = 10
	button.ClipsDescendants = true;
	local iconDehash do
		local f=math.floor
		function iconDehash(h)
			return f(h/14%14),f(h%14)
		end
	end
	local row,col = iconDehash(iconID)
	local IconFrame = Instance.new("Frame", button)
	IconFrame.Name = "IconFrame"
	IconFrame.Size = UDim2.new(0,16,0,16)
	IconFrame.Position = UDim2.new(0,5,0,5)
	IconFrame.ClipsDescendants = true;
	local icon = Instance.new("ImageLabel")
	icon.Name = "Icon"
	icon.Parent = IconFrame
	--icon.Size = UDim2.new(0,16,0,16)
	icon.Size = UDim2.new(Vector2.new(256,256).x/16,0,Vector2.new(256,256).y/16,0);
	icon.BackgroundTransparency = 1
	if(iconID > 0) then
		icon.Image = iconMap;--iconID
	end
	icon.ZIndex = 10
	if off then
		icon.ScaleType = Enum.ScaleType.Crop
		icon.ImageRectSize = Vector2.new(16,16)
		icon.ImageRectOffset = Vector2.new(off,0)
	end
	local label = Instance.new("TextLabel")
	label.Name = "ButtonLabel"
	label.Parent = button
	label.BackgroundTransparency = 1
	label.Text = name
	label.Position = UDim2.new(0,28,0,0)
	label.Size = UDim2.new(1,-28,1,0)
	label.Font = Enum.Font.SourceSans
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextSize = 14
	label.ZIndex = 10
	label.TextXAlignment = Enum.TextXAlignment.Left
	local pad,border = 2,1
	icon.Position = UDim2.new(-col - (pad*(col+1) + border)/16,0,-row - (pad*(row+1) + border)/16,0)
	return button
end

local UIListLayoutLC = Instance.new("UIListLayout", LeftClickFrame)
UIListLayoutLC.SortOrder = Enum.SortOrder.LayoutOrder

local ProfClickButton = Instance.new("ImageButton")
ProfClickButton = makeButton("Profile",12)
ProfClickButton.Size = UDim2.new(1,0,0,25)
ProfClickButton.Name = "ProfClickButton"
ProfClickButton.Parent = LeftClickFrame

local AddClickButton = Instance.new("ImageButton")
AddClickButton = makeButton("Add",12)
AddClickButton.Size = UDim2.new(1,0,0,25)
AddClickButton.Name = "FriendButton"
AddClickButton.Parent = LeftClickFrame

local PMButton = Instance.new("ImageButton")
PMButton = makeButton("PM User",ACTION_CHAT)
PMButton.Size = UDim2.new(1,0,0,25)
PMButton.Name = "PMUser"
PMButton.Parent = LeftClickFrame

local DeleteButton = Instance.new("ImageButton")
DeleteButton = makeButton("Delete",177)
DeleteButton.Size = UDim2.new(1,0,0,25)
DeleteButton.Name = "Colors"
DeleteButton.Parent = LeftClickFrame

local CopyButton = Instance.new("ImageButton")
CopyButton = makeButton("Copy",175)
CopyButton.Size = UDim2.new(1,0,0,25)
CopyButton.Name = "Copy"
CopyButton.Parent = LeftClickFrame

local InvButton = Instance.new("ImageButton")
InvButton = makeButton("Invite",21)
InvButton.Size = UDim2.new(1,0,0,25)
InvButton.Name = "InvButton"
InvButton.Parent = LeftClickFrame

spawn(function()
	repeat 
		wait(1)
	until allowedCommands == true
	MDeleteButton = Instance.new("ImageButton")
	MDeleteButton = makeButton("Mod Delete",177)
	MDeleteButton.Size = UDim2.new(1,0,0,25)
	MDeleteButton.Name = "MDelete"
	MDeleteButton.Parent = LeftClickFrame

	MMuteButton = Instance.new("ImageButton")
	MMuteButton = makeButton("Mod Mute",189)
	MMuteButton.Size = UDim2.new(1,0,0,25)
	MMuteButton.Name = "MMute"
	MMuteButton.Parent = LeftClickFrame

	MBanButton = Instance.new("ImageButton")
	MBanButton = makeButton("Mod Ban",189)
	MBanButton.Size = UDim2.new(1,0,0,25)
	MBanButton.Name = "MBan"
	MBanButton.Parent = LeftClickFrame

	MIpBanButton = Instance.new("ImageButton")
	MIpBanButton = makeButton("Mod Ban All",189)
	MIpBanButton.Size = UDim2.new(1,0,0,25)
	MIpBanButton.Name = "MIpBan"
	MIpBanButton.Parent = LeftClickFrame
end)

local rightOpen = false;
function openRightClick(MessageClicked)
	local UIU
	UIU = UserInputService.InputBegan:Connect(function(input) 
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if(rightOpen) then
				local t
				local guisAtPosition = game:GetService("CoreGui"):GetGuiObjectsAtPosition(Mouse.X, Mouse.Y)
				for _, gui in pairs(guisAtPosition) do
					if gui.Name == "LeftClickFrame" then
						t = gui
					end
				end
				if(not t) then
					LeftClickFrame.Visible = false;
					rightOpen = false;
					UIU:Disconnect()
				end
			end
		end
	end)
	
	if(MessageClicked:GetAttribute("PlayerName")) then
		local ClickedUser = MessageClicked:GetAttribute("PlayerName");
		if(findFriend(AcceptedFriends, ClickedUser)) then
			AddClickButton.Visible = false;
		else
			AddClickButton.Visible = true;
		end
		local showName = string.match(MessageClicked.ChatMessage.PlayerName.Text, "%w+")
		local usernameSize = GetStringTextBounds(showName).X > 100 and GetStringTextBounds(showName).X or 100
		LeftClickFrame.Size = UDim2.new(0, usernameSize + 10, 0, buttonNumber*25)
		ProfClickButton.ButtonLabel.Text = showName
		rightOpen = true;
		LeftClickFrame.Visible = true;
		local xP = Mouse.X
		local yP = Mouse.Y
		local eventss = {}
		LeftClickFrame.Position = UDim2.new(0, xP, 0, yP);
		eventss[1] = PMButton.MouseButton1Click:Connect(function()
			makePrivateChat(ClickedUser)
			for i,v in pairs(eventss) do
				v:Disconnect()
			end
			LeftClickFrame.Visible = false;
			rightOpen = false;
		end)
		eventss[2] = DeleteButton.MouseButton1Click:Connect(function()
			MessageClicked:Destroy()
			for i,v in pairs(eventss) do
				v:Disconnect()
			end
			LeftClickFrame.Visible = false;
			rightOpen = false;
		end)
		eventss[3] = CopyButton.MouseButton1Click:Connect(function()
			toClipboard(MessageClicked.ChatMessage.PlayerName.Text .. MessageClicked.ChatMessage.Text:gsub(" +"," "))
			for i,v in pairs(eventss) do
				v:Disconnect()
			end
			LeftClickFrame.Visible = false;
			rightOpen = false;
		end)
		eventss[8] = InvButton.MouseButton1Click:Connect(function()
			sendServerRequest({
				['Action'] = 'Invite',
				['Username'] = username,
				['ForPlayer'] = ClickedUser;
				['PlaceId'] = game.PlaceId,
				['JobId'] = game.JobId,
				['UniqueCode'] = UniqueCode,
			})
			for i,v in pairs(eventss) do
				v:Disconnect()
			end
			LeftClickFrame.Visible = false;
			rightOpen = false;
		end)
		eventss[9] = ProfClickButton.MouseButton1Click:Connect(function()
			sendServerRequest({
				['Action'] = 'getProfile',
				['Username'] = username,
				['findPlayer'] = ClickedUser,
				['UniqueCode'] = UniqueCode;
			})
			for i,v in pairs(eventss) do
				v:Disconnect()
			end
			LeftClickFrame.Visible = false;
			rightOpen = false;
		end)
		eventss[10] = AddClickButton.MouseButton1Click:Connect(function()
			sendServerRequest({
				['Action'] = 'friendRequest',
				['Username'] = username,
				['UniqueCode'] = UniqueCode,
				['ForPlayer'] = ClickedUser,
			})
			for i,v in pairs(eventss) do
				v:Disconnect()
			end
			LeftClickFrame.Visible = false;
			rightOpen = false;
		end)
		if(allowedCommands) then
			eventss[4] = MMuteButton.MouseButton1Click:Connect(function()
				sendServerRequest({
					['Action'] = 'Mute',
					['Time'] = '30m',
					['Username'] = username,
					['ToPlayer'] = ClickedUser,
					['UniqueCode'] = UniqueCode;
				})
				
				for i,v in pairs(eventss) do
					v:Disconnect()
				end
				LeftClickFrame.Visible = false;
				rightOpen = false;
			end)
			eventss[5] = MBanButton.MouseButton1Click:Connect(function()
				sendServerRequest({
					['Action'] = 'Ban',
					['Username'] = username,
					['ToPlayer'] = ClickedUser,
					['UniqueCode'] = UniqueCode,
				})
				for i,v in pairs(eventss) do
					v:Disconnect()
				end
				LeftClickFrame.Visible = false;
				rightOpen = false;
			end)
			eventss[6] = MIpBanButton.MouseButton1Click:Connect(function()
				sendServerRequest({
					['Action'] = 'BanIp',
					['Username'] = username,
					['ToPlayer'] = ClickedUser,
					['UniqueCode'] = UniqueCode,
				})
				for i,v in pairs(eventss) do
					v:Disconnect()
				end
				LeftClickFrame.Visible = false;
				rightOpen = false;
			end)
			eventss[7] = MDeleteButton.MouseButton1Click:Connect(function()
				print(MessageClicked.ChatMessage.Text:gsub(" +"," "));
				sendServerRequest({
					['Action'] = 'DelMessage',
					['Username'] = username,
					['Message'] = MessageClicked.ChatMessage.Text:gsub(" +"," ");
					['Time'] = MessageClicked.Time.Text;
					['UniqueCode'] = UniqueCode,
				})
				for i,v in pairs(eventss) do
					v:Disconnect()
				end
				LeftClickFrame.Visible = false;
				rightOpen = false;
			end)
		end
	end
end

local GlobalButton = Instance.new("TextButton")
GlobalButton.Parent = ChatWindow
GlobalButton.BackgroundColor3 = Color3.fromRGB(83, 255, 57)
GlobalButton.BackgroundTransparency = 0.6
GlobalButton.ClipsDescendants = true
GlobalButton.Position = UDim2.new(0, 7, 0, -25)
GlobalButton.Size = UDim2.new(0, 150, 0, 25)
GlobalButton.Font = Enum.Font.SourceSansBold
GlobalButton.Text = "Global Chat"
GlobalButton.Name = "GlobalChat"
GlobalButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GlobalButton.TextSize = 18.000
GlobalButton.TextStrokeTransparency = 0.750
GlobalButton.TextWrapped = true
GlobalButton.TextXAlignment = Enum.TextXAlignment.Center
GlobalButton.TextYAlignment = Enum.TextYAlignment.Center
GlobalButton.BorderSizePixel = 3;

local GlobalCorner = Instance.new("UICorner");
GlobalCorner.CornerRadius = UDim.new(0,8);
GlobalCorner.Parent = GlobalButton;

local AnnouncementLabel = Instance.new("TextLabel", ChatBarParentFrame)
AnnouncementLabel.Size = UDim2.new(1, 0, 0, 20)
AnnouncementLabel.Position = UDim2.new(0, 0, 1, 5)
AnnouncementLabel.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
AnnouncementLabel.BackgroundTransparency = 0.4
AnnouncementLabel.Visible = false;

local AnnouncementLabelCorner = Instance.new("UICorner");
AnnouncementLabelCorner.CornerRadius = UDim.new(0,8);
AnnouncementLabelCorner.Parent = AnnouncementLabel;

local ChatCounterGlobal = Instance.new("ImageLabel")
ChatCounterGlobal.Name = "ChatCounter"
ChatCounterGlobal.Parent = GlobalButton
ChatCounterGlobal.BackgroundTransparency = 1.000
ChatCounterGlobal.Position = UDim2.new(1, -20, 0, 4)
ChatCounterGlobal.Size = UDim2.new(0, 18, 0, 18)
ChatCounterGlobal.Visible = false;
ChatCounterGlobal.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"
local ChatCounterTextGlobal = Instance.new("TextLabel")
ChatCounterTextGlobal.Name = "ChatCounterText"
ChatCounterTextGlobal.Parent = ChatCounterGlobal
ChatCounterTextGlobal.BackgroundTransparency = 1.000
ChatCounterTextGlobal.BorderSizePixel = 0
ChatCounterTextGlobal.Position = UDim2.new(0.5, -6, 0.5, -7)
ChatCounterTextGlobal.Size = UDim2.new(0, 13, 0, 9)
ChatCounterTextGlobal.Font = Enum.Font.SourceSansBold
ChatCounterTextGlobal.Text = "0"
ChatCounterTextGlobal.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatCounterTextGlobal.TextSize = 13.000
ChatCounterTextGlobal.TextWrapped = true
ChatCounterTextGlobal.TextXAlignment =  Enum.TextXAlignment.Center

local CustomChannelButton = Instance.new("TextButton")
CustomChannelButton.Parent = ChatWindow
CustomChannelButton.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
CustomChannelButton.BackgroundTransparency = 0.6
CustomChannelButton.ClipsDescendants = true
CustomChannelButton.Position = UDim2.new(0, 160, 0, -25)
CustomChannelButton.Size = UDim2.new(0, 150, 0, 25)
CustomChannelButton.Font = Enum.Font.SourceSansBold
CustomChannelButton.Text = "Private Room"
CustomChannelButton.Name = "PrivateRoom"
CustomChannelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CustomChannelButton.TextSize = 18.000
CustomChannelButton.TextStrokeTransparency = 0.750
CustomChannelButton.TextWrapped = true
CustomChannelButton.TextXAlignment = Enum.TextXAlignment.Center
CustomChannelButton.TextYAlignment = Enum.TextYAlignment.Center

local CustomCorner = Instance.new("UICorner");
CustomCorner.CornerRadius = UDim.new(0,8);
CustomCorner.Parent = CustomChannelButton;

local ChatCounterCustom = Instance.new("ImageLabel")
ChatCounterCustom.Name = "ChatCounter"
ChatCounterCustom.Parent = CustomChannelButton
ChatCounterCustom.BackgroundTransparency = 1.000
ChatCounterCustom.Position = UDim2.new(1, -20, 0, 4)
ChatCounterCustom.Size = UDim2.new(0, 18, 0, 18)
ChatCounterCustom.Visible = false
ChatCounterCustom.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"
local ChatCounterTextCustom = Instance.new("TextLabel")
ChatCounterTextCustom.Name = "ChatCounterText"
ChatCounterTextCustom.Parent = ChatCounterCustom
ChatCounterTextCustom.BackgroundTransparency = 1.000
ChatCounterTextCustom.BorderSizePixel = 0
ChatCounterTextCustom.Position = UDim2.new(0.5, -6, 0.5, -7)
ChatCounterTextCustom.Size = UDim2.new(0, 13, 0, 9)
ChatCounterTextCustom.Font = Enum.Font.SourceSansBold
ChatCounterTextCustom.Text = "0"
ChatCounterTextCustom.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatCounterTextCustom.TextSize = 13.000
ChatCounterTextCustom.TextWrapped = true
ChatCounterTextCustom.TextXAlignment =  Enum.TextXAlignment.Center

local ChangeRoomBar = Instance.new("TextBox")
ChangeRoomBar.Parent = ChatWindow
ChangeRoomBar.BackgroundTransparency = 0
ChangeRoomBar.Selectable = true
ChangeRoomBar.Size = UDim2.new(0, 100, 0, 25)
ChangeRoomBar.ClearTextOnFocus = false
ChangeRoomBar.Font = Enum.Font.SourceSansBold
ChangeRoomBar.Text = ""
ChangeRoomBar.Name = "ChangeRoomTxt"
ChangeRoomBar.PlaceholderText = ChangableKey
ChangeRoomBar.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
ChangeRoomBar.TextColor3 = Color3.fromRGB(0, 0, 0)
ChangeRoomBar.TextSize = 18.000
ChangeRoomBar.TextTransparency = 0.400
ChangeRoomBar.TextWrapped = true
ChangeRoomBar.TextXAlignment = Enum.TextXAlignment.Center
ChangeRoomBar.TextYAlignment = Enum.TextYAlignment.Center
ChangeRoomBar.Position = UDim2.new(0, 320, 0, -25)
ChangeRoomBar.Visible = false

local RoomNumberCorner = Instance.new("UICorner");
RoomNumberCorner.CornerRadius = UDim.new(0,8);
RoomNumberCorner.Parent = ChangeRoomBar;

local ChangeRoomButton = Instance.new("TextButton")
ChangeRoomButton.Parent = ChatWindow
ChangeRoomButton.BackgroundTransparency = 0.4
ChangeRoomButton.ClipsDescendants = true
ChangeRoomButton.Position = UDim2.new(0, 430, 0, -25)
ChangeRoomButton.Size = UDim2.new(0, 100, 0, 25)
ChangeRoomButton.Font = Enum.Font.SourceSansBold
ChangeRoomButton.Text = "Join Room"
ChangeRoomButton.Name = "JoinButton"
ChangeRoomButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChangeRoomButton.TextSize = 18.000
ChangeRoomButton.TextStrokeTransparency = 0.750
ChangeRoomButton.TextWrapped = true
ChangeRoomButton.TextXAlignment = Enum.TextXAlignment.Center
ChangeRoomButton.TextYAlignment = Enum.TextYAlignment.Center
ChangeRoomButton.BackgroundColor3 = Color3.fromRGB(83, 255, 57)
ChangeRoomButton.Visible = false

local RoomCorner = Instance.new("UICorner");
RoomCorner.CornerRadius = UDim.new(0,8);
RoomCorner.Parent = ChangeRoomButton;

local OpenedChannel = "Global";
local CustomChannel = ChatChannelParentFrame:Clone()
CustomChannel.Parent = ChatWindow
CustomChannel.Visible = false

local ChannelClone = ChatChannelParentFrame:Clone()

GlobalButton.MouseButton1Click:Connect(function()
	ChatCounterGlobal.Visible = false;
	ChatCounterTextGlobal.Text = "0";
	CustomChannelButton.BackgroundColor3 = Color3.fromRGB(163, 162, 165)  --GRAY
	GlobalButton.BackgroundColor3 = Color3.fromRGB(83, 255, 57) --GREEN
	CustomChannel.Visible = false;
	ChatChannelParentFrame.Visible = true;
	OpenedChannel = "Global";
	ChangeRoomBar.Visible = false;
	ChangeRoomButton.Visible = false;
	for i,v in pairs(PrivateChats) do
		v["Chat"].Visible = false;
		v["Button"].Ring.Visible = false;
		v["Button"].Visible = true;
	end
end)
local customLoaded = false;
CustomChannelButton.MouseButton1Click:Connect(function()
	ChatCounterCustom.Visible = false;
	ChatCounterTextCustom.Text = "0";
	CustomChannelButton.BackgroundColor3 = Color3.fromRGB(83, 255, 57)
	GlobalButton.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
	CustomChannel.Visible = true;
	ChatChannelParentFrame.Visible = false;
	OpenedChannel = "Custom";
	ChangeRoomBar.Visible = true;
	ChangeRoomButton.Visible = true;
	for i,v in pairs(PrivateChats) do
		v["Chat"].Visible = false;
		v["Button"].Ring.Visible = false;
		v["Button"].Visible = false;
	end
	if(customLoaded == false and JoinLeave) then
		customLoaded = true;
		client:Send(json_encode({
			['Action'] = 'New User',
			['Username'] = username,
			['PlaceId'] = game.PlaceId,
			['UserId'] = game.Players.LocalPlayer.UserId,
			['Exploit'] = Exploit,
			['Verify'] = Encrypt("Loaded"),
			['UniqueCode'] = UniqueCode,
		}));
	end
end)

getOpenedChat = function()
	if(OpenedChannel == "Global") then
		return ChatChannelParentFrame;
	elseif(OpenedChannel == "Custom") then
		return CustomChannel;
	else
		return ChatWindow:FindFirstChild(OpenedChannel);
	end
end




function LocalTime()
  local the_hour = math.floor((tick() % 86400) / 3600)
  local the_minute = math.floor((tick() % 3600) / 60)
  local the_second = math.floor(tick() % 60)
  local the_time_of_day = the_hour > 11 and 'PM' or 'AM'
  the_hour = (the_hour % 12 == 0 and 12 or the_hour % 12)
  the_hour = the_hour < 10 and '0' .. the_hour or the_hour
  the_minute = the_minute < 10 and '0' .. the_minute or the_minute
  the_second = the_second < 10 and '0' .. the_second or the_second
  return the_hour .. ':' .. the_minute .. ':' .. the_second .. ' ' .. the_time_of_day
end

function playNotificationSound()
	if(NotificationSoundsEnabled) then
		local sound = Instance.new("Sound", game.Workspace)
		sound.SoundId = "rbxassetid://241852639"
		sound:Play()
		spawn(function()
			wait(2)
			sound:remove()
		end)
	end
end

local TextSizeCache = {}
function GetStringTextBounds(text, sizeBounds)
	local font = Enum.Font.SourceSansBold;
	local fontSize = Enum.FontSize.Size18;
	sizeBounds = sizeBounds or false
	if not TextSizeCache[text] then
		TextSizeCache[text] = {}
	end
	if not TextSizeCache[text][font] then
		TextSizeCache[text][font] = {}
	end
	if not TextSizeCache[text][font][sizeBounds] then
		TextSizeCache[text][font][sizeBounds] = {}
	end
	if not TextSizeCache[text][font][sizeBounds][fontSize] then
		testLabel.Text = text
		testLabel.Font = font
		testLabel.FontSize = fontSize
		if sizeBounds then
			testLabel.TextWrapped = true;
			testLabel.Size = sizeBounds
		else
			testLabel.TextWrapped = false;
		end
		TextSizeCache[text][font][sizeBounds][fontSize] = testLabel.TextBounds
	end
	return TextSizeCache[text][font][sizeBounds][fontSize]
end
local singleSpaceSize = GetStringTextBounds(" ")
function CreateLabelChat(MessageType, Text, addToChat, Color, InviteData)
	local xOffset = 0;
	local ScrollingFrame = addToChat.Scroller;
	local playerNameDisplayText = MessageType[3] ~= "" and "[" ..  MessageType[3] .. "]:" or "";
	local playerNameSize = GetStringTextBounds(playerNameDisplayText)
	local MessageContainer = Instance.new("Frame", ScrollingFrame)
	MessageContainer.Position = UDim2.new(0, 0, 0, 0);
	MessageContainer.ZIndex = 1;
	MessageContainer.BackgroundColor3 = Color3.new(0, 0, 0);
    MessageContainer.BackgroundTransparency = 1;
	MessageContainer.Name = 'MessageContainer';
	if(MessageType[1][2]) then
		MessageContainer:SetAttribute("PlayerName", MessageType[1][2]);
	end
	if(addToChat == ChatChannelParentFrame) then
		table.insert(Chats, MessageContainer)
	end
	if(MessageType[2] ~= "SystemMessage" and MessageType[2] ~= "Invite") then
		local nowTime = LocalTime() .. " - ";
		local timeMessageSize = GetStringTextBounds(nowTime)
		local TimeText = Instance.new("TextLabel", ScrollingFrame)
		TimeText.Name = 'Time';
		TimeText.Position = UDim2.new(0, xOffset, 0, 0);
		TimeText.Size = UDim2.new(0, timeMessageSize.X, 0, timeMessageSize.Y);
		TimeText.Text = nowTime;
		TimeText.ZIndex = 1;
		TimeText.BackgroundColor3 = Color3.new(0, 0, 0);
		TimeText.BackgroundTransparency = 1;
		TimeText.TextXAlignment = Enum.TextXAlignment.Left;
		TimeText.TextYAlignment = Enum.TextYAlignment.Top;
		TimeText.TextWrapped = true;
		TimeText.TextColor3 = Color3.new(255/255, 255/255, 243/255);
		TimeText.FontSize = Enum.FontSize.Size18;
		TimeText.Font = Enum.Font.SourceSansBold;
		TimeText.TextStrokeColor3 = Color3.new(34/255,34/255,34/255);
		TimeText.TextStrokeTransparency = 0.75;
		TimeText.Parent = MessageContainer;
		xOffset = xOffset + timeMessageSize.X
	end
	if(MessageType[2] == "WhisperTo") then
		local toMessageSize = GetStringTextBounds("{To " .. MessageType[4] .. "} ")
		local whisperToText = Instance.new("TextLabel", ScrollingFrame)
		whisperToText.Name = 'WhisperTo';
		whisperToText.Position = UDim2.new(0, xOffset, 0, 0);
		whisperToText.Size = UDim2.new(0, toMessageSize.X, 0, toMessageSize.Y);
		whisperToText.Text = "{To " .. MessageType[4] .. "} ";
		whisperToText.ZIndex = 1;
		whisperToText.BackgroundColor3 = Color3.new(0, 0, 0);
		whisperToText.BackgroundTransparency = 1;
		whisperToText.TextXAlignment = Enum.TextXAlignment.Left;
		whisperToText.TextYAlignment = Enum.TextYAlignment.Top;
		whisperToText.TextWrapped = true;
		whisperToText.TextColor3 = Color3.new(255/255, 255/255, 243/255);
		whisperToText.FontSize = Enum.FontSize.Size18;
		whisperToText.Font = Enum.Font.SourceSansBold;
		whisperToText.TextStrokeColor3 = Color3.new(34/255,34/255,34/255);
		whisperToText.TextStrokeTransparency = 0.75;
		whisperToText.Parent = MessageContainer;
		xOffset = xOffset + toMessageSize.X
	elseif(MessageType[2] == "WhisperFrom") then
		local fromMessageSize = GetStringTextBounds("{From " .. MessageType[3] .. "} ")
		local whisperToText = Instance.new("TextLabel", ScrollingFrame)
		whisperToText.Name = 'WhisperFromText';
		whisperToText.Position = UDim2.new(0, xOffset, 0, 0);
		whisperToText.Size = UDim2.new(0, fromMessageSize.X, 0, fromMessageSize.Y);
		whisperToText.Text = "{From " .. MessageType[3] .. "} ";
		whisperToText.ZIndex = 1;
		whisperToText.BackgroundColor3 = Color3.new(0, 0, 0);
		whisperToText.BackgroundTransparency = 1;
		whisperToText.TextXAlignment = Enum.TextXAlignment.Left;
		whisperToText.TextYAlignment = Enum.TextYAlignment.Top;
		whisperToText.TextWrapped = true;
		whisperToText.TextColor3 = Color3.new(255/255, 255/255, 243/255);
		whisperToText.FontSize = Enum.FontSize.Size18;
		whisperToText.Font = Enum.Font.SourceSansBold;
		whisperToText.TextStrokeColor3 = Color3.new(34/255,34/255,34/255);
		whisperToText.TextStrokeTransparency = 0.75;
		whisperToText.Parent = MessageContainer;
		xOffset = xOffset + fromMessageSize.X
	end
	
	if(MessageType[1][1] ~= "Default" and MessageType[1][1]) then
		local Rainbow = false;
		if(FindInString(MessageType[1][1], "Rainbow;")) then
			Rainbow = true;
			MessageType[1][1] = MessageType[1][1]:gsub("Rainbow;", "");
		end
		local toMessageSize = GetStringTextBounds("[" .. MessageType[1][1] .. "] ")
		local ModTxt = Instance.new("TextLabel", ScrollingFrame)
		ModTxt.Name = 'Prefix';
		ModTxt.Position = UDim2.new(0, xOffset, 0, 0);
		ModTxt.Size = UDim2.new(0, toMessageSize.X, 0, toMessageSize.Y);
		ModTxt.Text = "[" .. MessageType[1][1] .. "] ";
		ModTxt.ZIndex = 1;
		ModTxt.RichText = true;
		ModTxt.BackgroundColor3 = Color3.new(0, 0, 0);
		ModTxt.BackgroundTransparency = 1;
		ModTxt.TextXAlignment = Enum.TextXAlignment.Left;
		ModTxt.TextYAlignment = Enum.TextYAlignment.Top;
		ModTxt.TextWrapped = true;
		ModTxt.TextColor3 = Color;
		ModTxt.FontSize = Enum.FontSize.Size18;
		ModTxt.Font = Enum.Font.SourceSansBold;
		ModTxt.TextStrokeColor3 = Color3.new(34/255,34/255,34/255);
		ModTxt.TextStrokeTransparency = 0.75;
		ModTxt.Parent = MessageContainer;
		xOffset = xOffset + toMessageSize.X
		if(Rainbow) then
			rainbowText(ModTxt)
		end
	end
	local numNeededSpaces = math.ceil((playerNameSize.X + xOffset) / singleSpaceSize.X) + 1
	local chatMessageDisplayText = string.rep(" ", numNeededSpaces) .. Text
	local chatMessageSize = GetStringTextBounds(chatMessageDisplayText, UDim2.new(0, ScrollingFrame.AbsoluteSize.X-5, 0, ScrollingFrame.AbsoluteSize.Y))
	local ChatMessage = Instance.new("TextLabel", MessageContainer)
	ChatMessage.Name = 'ChatMessage';
	ChatMessage.Position = UDim2.new(0, 0, 0, 0);
	ChatMessage.Size = UDim2.new(1, 0, 1, 0);
	ChatMessage.Text = chatMessageDisplayText;
	ChatMessage.ZIndex = 1;
	ChatMessage.BackgroundColor3 = Color3.new(0, 0, 0);
	ChatMessage.BackgroundTransparency = 1;
	ChatMessage.TextXAlignment = Enum.TextXAlignment.Left;
	ChatMessage.TextYAlignment = Enum.TextYAlignment.Top;
	ChatMessage.TextWrapped = true;
	ChatMessage.TextColor3 = Color3.new(255/255, 255/255, 243/255);
	ChatMessage.FontSize = Enum.FontSize.Size18;
	ChatMessage.Font = Enum.Font.SourceSansBold;
	ChatMessage.TextStrokeColor3 = Color3.new(34/255,34/255,34/255);
	ChatMessage.TextStrokeTransparency = 0.750;
	ChatMessage.Size = UDim2.new(1, 0, 0, chatMessageSize.Y);
	local getAtPlayer = string.find(Text, "@")
	if getAtPlayer ~= nil then
		local search = Text:sub(getAtPlayer + 1)
		local endsearch = string.find(search, " ")
		local atPlayer
		if endsearch ~= nil then
			atPlayer = search:sub(1, endsearch - 1)
		else
			atPlayer = search
		end
		if(atPlayer ~= nil) then
			if(atPlayer == username) then
				ChatMessage.TextColor3 = Color3.new(150, 205, 0)
				playNotificationSound()
			end
		end
	end
	local PlayerName = Instance.new("TextButton", ChatMessage)
	PlayerName.Name = 'PlayerName';
    PlayerName.BackgroundTransparency = 1;
    PlayerName.BackgroundColor3 = Color3.new(0, 1, 1);
    PlayerName.BorderSizePixel = 0;
    PlayerName.ZIndex = 2;
    PlayerName.Text = playerNameDisplayText;
    PlayerName.TextColor3 = Color;
    PlayerName.Position = UDim2.new(0, xOffset, 0, 0);
    PlayerName.TextXAlignment = Enum.TextXAlignment.Left;
    PlayerName.TextYAlignment = Enum.TextYAlignment.Top;
    PlayerName.FontSize = Enum.FontSize.Size18;
    PlayerName.Font = Enum.Font.SourceSansBold;
    PlayerName.Size = UDim2.new(0, playerNameSize.X, 0, playerNameSize.Y);
    PlayerName.TextStrokeColor3 = Color3.new(34/255,34/255,34/255)
    PlayerName.TextStrokeTransparency = 0.750;
	MessageContainer.Size = UDim2.new(1, -5, 0, chatMessageSize.Y + 1);
    local chatMessageElementYSize = UDim2.new(0, 0, 0, chatMessageSize.Y)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, ScrollingFrame.UIListLayout.AbsoluteContentSize.Y-20)
	addToChat.Scroller.CanvasPosition = Vector2.new(0,ScrollingFrame.CanvasSize.Y.Offset + ChatMessage.TextBounds.Y)
	PlayerName.MouseButton1Click:Connect(function()
		if(MessageType[2] ~= "SystemMessage" and MessageType[2] ~= "Invite") then
			local playersuser = PlayerName.Text:split("[")[2]
			playersuser = playersuser:split("]")[1]
			if(playersuser ~= LP.Name) then
				ChatBar.Text = "/w " .. playersuser .. " ";
				ChatBar:CaptureFocus()
			end
		end
	end)
	if(MessageType[2] == "Invite") then
		local function inputEnded(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				game:GetService('TeleportService'):TeleportToPlaceInstance(InviteData[1], InviteData[2], Players.LocalPlayer)
			end
		end
		ChatMessage.InputEnded:Connect(inputEnded)
	end
	if(addToChat ~= getOpenedChat()) then
		if(MessageType[2] ~= "SystemMessage") then
			if(addToChat == ChatChannelParentFrame) then
				ChatCounterGlobal.Visible = true;
				ChatCounterTextGlobal.Text = tonumber(ChatCounterTextGlobal.Text)+1;
			elseif(addToChat == CustomChannel) then
				ChatCounterCustom.Visible = true;
				ChatCounterTextCustom.Text = tonumber(ChatCounterTextCustom.Text)+1;
			else
				local Notifier = ChatWindow:FindFirstChild("PMB-" .. fromPlayer)
				if(Notifier) then
					Notifier.ChatCounter.Visible = true;
					Notifier.ChatCounter.ChatCounterText.Text = tonumber(Notifier.ChatCounter.ChatCounterText.Text)+1;
				end
			end
			playNotificationSound()
		end
	elseif(not ChatWindow.Visible) then
		if(MessageType[2] ~= "SystemMessage") then
			unread_counter = unread_counter + 1
			ChatCounterText2.Text = tostring(unread_counter)
			if unread_counter > 99 then
				ChatCounterText2.Text = "99+"
			end
			playNotificationSound()
		end
	end
end



if(ChangableKey == 29394972) then
	CreateLabelChat({{false, false}, "SystemMessage", "Error"},"To use private room, you need to set a custom key. To do this use the command ;changekey [number]. This will create another channel on the chat. Only people using the same code can see eachothers messages", CustomChannel, Color3.fromRGB(255, 0, 0))
end

CreateLabelChat({{false, false}, "SystemMessage", ""},"Encrypted chat between Exploiters. Use ;cmds for a list of features/commands!", ChatChannelParentFrame, Color3.fromRGB(255, 0, 0))
CreateLabelChat({{false, false}, "SystemMessage", ""},"Encrypted chat between Exploiters. Use ;cmds for a list of features/commands!", CustomChannel, Color3.fromRGB(255, 0, 0))

ChangeRoomButton.MouseButton1Click:Connect(function()
	if(ChangeRoomBar.Text == "") then
		return;
	end
	ChangableKey = tonumber(ChangeRoomBar.Text);
	ChangeRoomBar.PlaceholderText = ChangableKey;
	ChangeRoomBar.Text = "";
	CreateLabelChat({{false, false}, "SystemMessage", "System"}, "Your room code is now: " .. ChangableKey, CustomChannel, Color3.fromRGB(5, 150, 100))
	updateFile();
end)

local FriendsGui = game:GetObjects("rbxassetid://6936647572")[1]
dragGUI(FriendsGui.MainFrame)
FriendsGui.MainFrame.Visible = false
FriendsGui.Parent = game.CoreGui
FriendsGui.MainFrame.AnchorPoint = Vector2.new(0.5,0.5);
FriendsGui.MainFrame.Position = UDim2.new(-1, 0, 0.5, 0);
FriendsGui.MainFrame.FriendsList.Position = UDim2.new(0,0,0.073,0);
FriendsGui.MainFrame.FriendsList.Size = UDim2.new(0,300,0,409);

local FriendsList = FriendsGui.MainFrame.FriendsList
FriendsGui.MainFrame.FriendExample.Visible = false;
FriendsGui.MainFrame.Search.Visible = false;
FriendsGui.MainFrame.TopBar.Title.Text = "Friends List";
FriendsGui.MainFrame.TopBar.RequestsButton.Visible = false;
FriendsGui.MainFrame.Buttons.Visible = false;

function clearFriendsList()
	for _, instance in pairs(FriendsList:GetChildren()) do
		if instance:IsA("TextLabel") then
			instance:Destroy()
		end
	end
end

function getFriendsList()
	sendServerRequest({
		['Action'] = 'GetFriendsList',
		['Username'] = username,
		['UniqueCode'] = UniqueCode,
	})
end
getFriendsList()
local FriendRequestUsernames = {}
AcceptedFriends = {}

FriendsGui.MainFrame.TopBar.Exit.MouseButton1Click:Connect(function()
	FriendsOpen = false
	FriendsGui.MainFrame:TweenPosition(UDim2.new(0, -1000, 0, 0), "InOut", "Quart", 0.5, true, nil)
	wait(0.5)
	FriendsGui.MainFrame.Visible = false
end)

FriendsGui.MainFrame.TopBar.HomeButton.MouseButton1Click:Connect(function()
	FriendsGui.MainFrame.FriendsList.Position = UDim2.new(0,0,0.073,0);
	FriendsGui.MainFrame.FriendsList.Size = UDim2.new(0,300,0,409);
	FriendsGui.MainFrame.Search.Visible = false;
	FriendsGui.MainFrame.TopBar.Title.Text = "Friends List";
	getFriendsList()
end)

FriendsGui.MainFrame.TopBar.SearchButton.MouseButton1Click:Connect(function()
	FriendsGui.MainFrame.FriendsList.Position = UDim2.new(0,0,0.146,0);
	FriendsGui.MainFrame.FriendsList.Size = UDim2.new(0,300,0,374);
	clearFriendsList()
	FriendsGui.MainFrame.Search.Visible = true;
	FriendsGui.MainFrame.TopBar.Title.Text = "Search";
end)

FriendsGui.MainFrame.TopBar.RequestsButton.MouseButton1Click:Connect(function()
	FriendsGui.MainFrame.FriendsList.Position = UDim2.new(0,0,0.073,0);
	FriendsGui.MainFrame.FriendsList.Size = UDim2.new(0,300,0,409);
	clearFriendsList()
	FriendsGui.MainFrame.Search.Visible = false;
	FriendsGui.MainFrame.TopBar.Title.Text = "Friend Requests";
	for i,FromPlayer in pairs(FriendRequestUsernames) do
		CreatePlayerCard(FromPlayer, "Request");
	end
end)

FriendsGui.MainFrame.Search.SearchBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		sendServerRequest({
			['Action'] = 'SearchFriends',
			['Username'] = username,
			['UniqueCode'] = UniqueCode,
			['ForPlayer'] = FriendsGui.MainFrame.Search.SearchBox.Text;
		})
	end
end)

FriendsGui.MainFrame.Search.SearchBox.SearchButton.MouseButton1Click:Connect(function()
	if(#FriendsGui.MainFrame.Search.SearchBox.Text >= 2) then
		sendServerRequest({
			['Action'] = 'SearchFriends',
			['Username'] = username,
			['UniqueCode'] = UniqueCode,
			['ForPlayer'] = FriendsGui.MainFrame.Search.SearchBox.Text;
		})
	end
end)

local noRepeat = false;
function ChangeInfo(showInfo)
	if(noRepeat) then return end
	noRepeat = true	
	local label = FriendsGui.MainFrame.TopBar.InformationLabel:Clone()
	label.Text = showInfo;
	label.Position = UDim2.new(0.5, 0, 1, -100)
	label.BackgroundTransparency = 1
	label.BackgroundColor3 = Color3.fromRGB(255,255,255)
	label.Name = "InformationLabelClone"
	label.Parent = FriendsGui.MainFrame.TopBar;
	
	local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	game:GetService("TweenService"):Create(label, tweenInfo, {Position=UDim2.new(0.5, 0, 1, -16), BackgroundColor3=Color3.fromRGB(0,0,0), BackgroundTransparency=0.8}):Play()
	game:GetService("TweenService"):Create(FriendsGui.MainFrame.TopBar.InformationLabel, tweenInfo, {BackgroundTransparency=1, TextTransparency=1}):Play()
	wait(1.5)
	label.Text = "Exploiter Chat Friends List";
	FriendsGui.MainFrame.TopBar.InformationLabel:Remove()
	label.Name = "InformationLabel"
	noRepeat = false;
end
function findFriend(Table, PlayerName)
	for i,v in ipairs(Table) do
		if(v[1] == PlayerName) then 
			return true
		end
	end
	return false;
end
function CreatePlayerCard(RequestedPlayer, UsedFor)
	local ExampleClone = FriendsGui.MainFrame.FriendExample:Clone()
	ExampleClone.Text = RequestedPlayer[3] or RequestedPlayer[1];
	local DisplayName = RequestedPlayer[3] or RequestedPlayer[1];
	if(UsedFor ~= "Request") then
		if(RequestedPlayer[2]) then
			ExampleClone.OnlineStatus.ImageColor3 = Color3.new(0, 255, 0) --GREEN
		else
			ExampleClone.OnlineStatus.ImageColor3 = Color3.new(255, 0, 0) --RED
		end
	else
		ExampleClone.OnlineStatus.Visible = false
	end
	local function getInFriends(Table, Name)
		for i = 1, #Table do
			if Table[i][1] == Name then
				return i
			end
		end
		return false
	end
	local UIU
	local ButtonsOpen = false
	ExampleClone.ButtonsButton.MouseButton1Click:Connect(function()
		local newButtons = FriendsGui.MainFrame.Buttons:Clone();
		newButtons.Parent = FriendsGui;
		newButtons.FriendButton.Visible = false
		newButtons.MessageButton.Visible = false
		newButtons.InviteButton.Visible = false
		newButtons.RemoveButton.Visible = false
		newButtons.AcceptButton.Visible = false
		newButtons.DeclineButton.Visible = false
		local xP = Mouse.X
		local yP = Mouse.Y
		newButtons.Position = UDim2.new(0, xP, 0, yP);
		ButtonsOpen = true;
		newButtons.Visible = true
		UIU = UserInputService.InputBegan:Connect(function(input) 
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				if(ButtonsOpen) then
					local t
					local guisAtPosition = game:GetService("CoreGui"):GetGuiObjectsAtPosition(Mouse.X, Mouse.Y)
					for _, gui in pairs(guisAtPosition) do
						if gui == newButtons then
							t = gui
						end
					end
					if(not t) then
						newButtons.Visible = false;
						ButtonsOpen = false;
						UIU:Disconnect()
					end
				end
			end
		end)
	
		if(findFriend(AcceptedFriends, RequestedPlayer[1])) then
			newButtons.MessageButton.Visible = true
			newButtons.RemoveButton.Visible = true
			newButtons.InviteButton.Visible = true
			newButtons.MessageButton.MouseButton1Click:Connect(function()
				makePrivateChat(RequestedPlayer[1])
			end)
			newButtons.RemoveButton.MouseButton1Click:Connect(function()
				sendServerRequest({
					['Action'] = 'RemoveFriend',
					['Username'] = Username,
					['UniqueCode'] = UniqueCode,
					['FriendName'] = RequestedPlayer[1];
				})
				ExampleClone:Remove()
				ChangeInfo("Removed " .. DisplayName)
			end)
			newButtons.InviteButton.MouseButton1Click:Connect(function()
				sendServerRequest({
					['Action'] = 'Invite',
					['Username'] = username,
					['ForPlayer'] = RequestedPlayer[1];
					['PlaceId'] = game.PlaceId,
					['JobId'] = game.JobId,
					['UniqueCode'] = UniqueCode,
				})
				ChangeInfo("Invited " .. DisplayName .. " to your game")
			end)
		elseif(UsedFor == "Request") then
			newButtons.AcceptButton.Visible = true
			newButtons.DeclineButton.Visible = true
			newButtons.AcceptButton.MouseButton1Click:Connect(function()
				if findFriend(FriendRequestUsernames, RequestedPlayer[1]) then
					table.remove(FriendRequestUsernames, getInFriends(FriendRequestUsernames, RequestedPlayer[1]))
				end
				ExampleClone:Remove()
				sendServerRequest({
					['Action'] = 'AcceptFriendRequest',
					['Username'] = username,
					['UniqueCode'] = UniqueCode,
					['ForPlayer'] = RequestedPlayer[1];
				})
				if(#FriendRequestUsernames == 0) then
					FriendsGui.MainFrame.TopBar.RequestsButton.Visible = false;
				end
				ChangeInfo("Accepted " .. DisplayName .. " as a friend")
			end)
			newButtons.DeclineButton.MouseButton1Click:Connect(function()
				if findFriend(FriendRequestUsernames, RequestedPlayer[1]) then
					table.remove(FriendRequestUsernames, getInFriends(FriendRequestUsernames, RequestedPlayer[1]))
				end
				ExampleClone:Remove()
				if(#FriendRequestUsernames == 0) then
					FriendsGui.MainFrame.TopBar.RequestsButton.Visible = false;
				end
				ChangeInfo("Declined " .. DisplayName .. " as a friend")
			end)
		elseif(UsedFor == "Search") then
			newButtons.FriendButton.Visible = true
			newButtons.FriendButton.MouseButton1Click:Connect(function()
				sendServerRequest({
					['Action'] = 'friendRequest',
					['Username'] = username,
					['UniqueCode'] = UniqueCode,
					['ForPlayer'] = RequestedPlayer[1],
				})
				ChangeInfo("Sent a friend request to " .. DisplayName)
			end)
		end
	end)
	
	ExampleClone.Parent = FriendsList
	ExampleClone.Visible = true;
end
local PMPos = 315
function makePrivateChat(OtherPlayer)
	sendServerRequest({
		['Action'] = 'getFriendID',
		['Username'] = username,
		['UniqueCode'] = UniqueCode,
		['FriendName'] = OtherPlayer;
	})

	if(ChatWindow:FindFirstChild("PM-" .. OtherPlayer)) then return end
	local PrivateChat = ChannelClone:Clone()
	PrivateChat.Parent = ChatWindow
	PrivateChat.Visible = false
	PrivateChat.Name = "PM-" .. OtherPlayer
	
	local PMImageButton = Instance.new("ImageButton", ChatWindow)
	PMImageButton.Name = "PMB-" .. OtherPlayer
	PMImageButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
	PMImageButton.BackgroundTransparency = 1
	PMImageButton.ClipsDescendants = false
	PMImageButton.ZIndex = 3
	PMImageButton.Position = UDim2.new(0, PMPos, 0, -25)
	PMImageButton.Size = UDim2.new(0, 25, 0, 25)
	
	if(getOpenedChat() == CustomChannel) then
		PMImageButton.Visible = false;
	end
	
	local PMImageButtonC = Instance.new("UICorner", PMImageButton);
	PMImageButtonC.CornerRadius = UDim.new(8,8);
	local PMRing = Instance.new("ImageButton", PMImageButton)
	PMRing.Visible = false;
	PMRing.Name = "Ring"
	PMRing.ImageColor3 = Color3.fromRGB(0,255,0)
	PMRing.ImageTransparency = 0.6
	PMRing.BackgroundTransparency = 1
	PMRing.ZIndex = 1
	PMRing.Size = UDim2.new(0, 31, 0, 31)
	PMRing.Position = UDim2.new(0, -3, 0, -3)
	PMRing.Image = "http://www.roblox.com/asset/?id=398719017";
	local PChatCounter = ChatCounterGlobal:Clone()
	PChatCounter.Position = UDim2.new(1, -10, 0, -5);
	PChatCounter.ChatCounterText.Text = 0;
	PChatCounter.Parent = PMImageButton
	PChatCounter.Visible = false;
	PMPos = PMPos + 30;
	PMImageButton.MouseButton1Click:Connect(function()
		for i,v in pairs(PrivateChats) do
			v["Chat"].Visible = false;
			v["Button"].Ring.Visible = false;
			v["Button"].Visible = true;
		end
		PMRing.Visible = true;
		PChatCounter.Visible = false;
		PChatCounter.ChatCounterText.Text = "0";
		CustomChannelButton.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
		GlobalButton.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
		CustomChannel.Visible = false;
		ChatChannelParentFrame.Visible = false;
		OpenedChannel = PrivateChat.Name;
		ChangeRoomBar.Visible = false;
		ChangeRoomButton.Visible = false;
		PrivateChat.Visible = true;
	end)
	table.insert(PrivateChats, {["Chat"] = PrivateChat, ["Button"] = PMImageButton});
end

local SettingsButton = Instance.new("ImageButton")
SettingsButton.Name = "SettingsButton"
SettingsButton.Parent = ChatWindow
SettingsButton.BackgroundTransparency = 1
SettingsButton.Position = UDim2.new(1, -25, 0, 5)
SettingsButton.Size = UDim2.new(0, 20, 0, 20)
SettingsButton.Image = "rbxassetid://1204397029"
SettingsButton.ZIndex = 10

local FriendsButton = Instance.new("ImageButton")
FriendsButton.Name = "FriendsButton"
FriendsButton.Parent = ChatWindow
FriendsButton.BackgroundTransparency = 1
FriendsButton.Position = UDim2.new(1, -25, 0, 35)
FriendsButton.Size = UDim2.new(0, 20, 0, 20)
FriendsButton.Image = "rbxassetid://4384401919"
FriendsButton.ZIndex = 10

local FriendsOpen = false;
FriendsButton.MouseButton1Click:Connect(function()
	if FriendsOpen == false then 
		getFriendsList()
		FriendsOpen = true
		FriendsGui.MainFrame.Search.Visible = false;
		FriendsGui.MainFrame.TopBar.Title.Text = "Friends List";
		FriendsGui.MainFrame.Visible = true
		FriendsGui.MainFrame:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), "InOut", "Quart", 0.5, true, nil)
	else 
		FriendsOpen = false
		FriendsGui.MainFrame:TweenPosition(UDim2.new(-1, 0, 0.5, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		FriendsGui.MainFrame.Visible = false
	end
end)

local SettingsFrame = Instance.new("Frame", ChatWindow)
SettingsFrame.Name = "SettingsFrame"
SettingsFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SettingsFrame.BackgroundTransparency = 0.600
SettingsFrame.BorderSizePixel = 0
SettingsFrame.Position = UDim2.new(0, -1000, 0, 0)
SettingsFrame.Size = UDim2.new(0, 180, 1, 0)
SettingsFrame.Visible = false;

local roundness2 = Instance.new("UICorner");
roundness2.CornerRadius = UDim.new(0,6);
roundness2.Parent = SettingsFrame;

SettingsButton.MouseButton1Click:Connect(function()
	if SettingsOpen == false then 
		SettingsOpen = true
		SettingsFrame.Visible = true;
		SettingsFrame:TweenPosition(UDim2.new(1, 10, 0, 0), "InOut", "Quart", 0.5, true, nil)	
	else 
		SettingsOpen = false
		SettingsFrame:TweenPosition(UDim2.new(0, -1000, 0, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.5)
		SettingsFrame.Visible = false;
	end
end)

local SettingsTitle = Instance.new("TextLabel")
SettingsTitle.Name = "SettingsTitle"
SettingsTitle.Parent = SettingsFrame
SettingsTitle.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
SettingsTitle.BorderSizePixel = 0
SettingsTitle.BackgroundTransparency = 1
SettingsTitle.Position = UDim2.new(0, 0, 0, 5)
SettingsTitle.Size = UDim2.new(1, 0, 0, 20)
SettingsTitle.Font = Enum.Font.SourceSans
SettingsTitle.TextSize = 18
SettingsTitle.Text = "Settings"
SettingsTitle.TextColor3 = Color3.new(1, 1, 1)
SettingsTitle.TextXAlignment = Enum.TextXAlignment.Center
SettingsTitle.ZIndex = 10

local NotificationSounds = Instance.new("TextLabel")
NotificationSounds.Name = "NotificationSounds"
NotificationSounds.Parent = SettingsFrame
NotificationSounds.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
NotificationSounds.BorderSizePixel = 0
NotificationSounds.BackgroundTransparency = 1
NotificationSounds.Position = UDim2.new(0, 5, 0, 30)
NotificationSounds.Size = UDim2.new(1, -10, 0, 20)
NotificationSounds.Font = Enum.Font.SourceSans
NotificationSounds.TextSize = 14
NotificationSounds.Text = "Notification Sounds"
NotificationSounds.TextColor3 = Color3.new(1, 1, 1)
NotificationSounds.TextXAlignment = Enum.TextXAlignment.Left
NotificationSounds.ZIndex = 10

local SilentButton = Instance.new("Frame")
SilentButton.Name = "Button"
SilentButton.Parent = NotificationSounds
SilentButton.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
SilentButton.BorderSizePixel = 0
SilentButton.Position = UDim2.new(1, -20, 0, 0)
SilentButton.Size = UDim2.new(0, 20, 0, 20)
SilentButton.ZIndex = 10

local On = Instance.new("TextButton")
On.Name = "On"
On.Parent = SilentButton
On.BackgroundColor3 = Color3.fromRGB(150, 150, 151)
On.BackgroundTransparency = 1
On.BorderSizePixel = 0
On.Position = UDim2.new(0, 2, 0, 2)
On.Size = UDim2.new(0, 16, 0, 16)
On.Font = Enum.Font.SourceSans
On.FontSize = Enum.FontSize.Size14
On.Text = ""
On.TextColor3 = Color3.new(0, 0, 0)
On.ZIndex = 10

if(NotificationSoundsEnabled) then
	On.BackgroundTransparency = 0
else
	On.BackgroundTransparency = 1
end

On.MouseButton1Click:Connect(function()
	if NotificationSoundsEnabled == false then 
		NotificationSoundsEnabled = true
		On.BackgroundTransparency = 0
	else 
		NotificationSoundsEnabled = false
		On.BackgroundTransparency = 1
	end
	updateFile()
end)

local JLTitle = Instance.new("TextLabel")
JLTitle.Name = "JLTitle"
JLTitle.Parent = SettingsFrame
JLTitle.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
JLTitle.BorderSizePixel = 0
JLTitle.BackgroundTransparency = 1
JLTitle.Position = UDim2.new(0, 5, 0, 60)
JLTitle.Size = UDim2.new(1, -10, 0, 20)
JLTitle.Font = Enum.Font.SourceSans
JLTitle.TextSize = 14
JLTitle.Text = "Join/Leave Messages"
JLTitle.TextColor3 = Color3.new(1, 1, 1)
JLTitle.TextXAlignment = Enum.TextXAlignment.Left
JLTitle.ZIndex = 10

local JLFrame = Instance.new("Frame")
JLFrame.Name = "Button"
JLFrame.Parent = JLTitle
JLFrame.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
JLFrame.BorderSizePixel = 0
JLFrame.Position = UDim2.new(1, -20, 0, 0)
JLFrame.Size = UDim2.new(0, 20, 0, 20)
JLFrame.ZIndex = 10

local JLButton = Instance.new("TextButton")
JLButton.Name = "JLButton"
JLButton.Parent = JLFrame
JLButton.BackgroundColor3 = Color3.fromRGB(150, 150, 151)
JLButton.BackgroundTransparency = 1
JLButton.BorderSizePixel = 0
JLButton.Position = UDim2.new(0, 2, 0, 2)
JLButton.Size = UDim2.new(0, 16, 0, 16)
JLButton.Font = Enum.Font.SourceSans
JLButton.FontSize = Enum.FontSize.Size14
JLButton.Text = ""
JLButton.TextColor3 = Color3.new(0, 0, 0)
JLButton.ZIndex = 10

if(JoinLeave) then
	JLButton.BackgroundTransparency = 0
else
	JLButton.BackgroundTransparency = 1
end

JLButton.MouseButton1Click:Connect(function()
	if JoinLeave == false then 
		JoinLeave = true
		JLButton.BackgroundTransparency = 0
	else 
		JoinLeave = false;
		JLButton.BackgroundTransparency = 1
	end
	updateFile()
end)

local ProfTitle = Instance.new("TextLabel")
ProfTitle.Name = "ProfTitle"
ProfTitle.Parent = SettingsFrame
ProfTitle.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
ProfTitle.BorderSizePixel = 0
ProfTitle.BackgroundTransparency = 1
ProfTitle.Position = UDim2.new(0, 5, 0, 90)
ProfTitle.Size = UDim2.new(1, -10, 0, 20)
ProfTitle.Font = Enum.Font.SourceSans
ProfTitle.TextSize = 14
ProfTitle.Text = "Profile Accessable"
ProfTitle.TextColor3 = Color3.new(1, 1, 1)
ProfTitle.TextXAlignment = Enum.TextXAlignment.Left
ProfTitle.ZIndex = 10

local ProfFrame = Instance.new("Frame")
ProfFrame.Name = "Button"
ProfFrame.Parent = ProfTitle
ProfFrame.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
ProfFrame.BorderSizePixel = 0
ProfFrame.Position = UDim2.new(1, -20, 0, 0)
ProfFrame.Size = UDim2.new(0, 20, 0, 20)
ProfFrame.ZIndex = 10

local ProfButton = Instance.new("TextButton")
ProfButton.Name = "ProfButton"
ProfButton.Parent = ProfFrame
ProfButton.BackgroundColor3 = Color3.fromRGB(150, 150, 151)
ProfButton.BackgroundTransparency = 1
ProfButton.BorderSizePixel = 0
ProfButton.Position = UDim2.new(0, 2, 0, 2)
ProfButton.Size = UDim2.new(0, 16, 0, 16)
ProfButton.Font = Enum.Font.SourceSans
ProfButton.FontSize = Enum.FontSize.Size14
ProfButton.Text = ""
ProfButton.TextColor3 = Color3.new(0, 0, 0)
ProfButton.ZIndex = 10

ProfButton.MouseButton1Click:Connect(function()
	if ProfileAccessable == false then 
		ProfileAccessable = true
		ProfButton.BackgroundTransparency = 0
	else 
		ProfileAccessable = false;
		ProfButton.BackgroundTransparency = 1
	end
	sendServerRequest({
		['Action'] = 'setPreferences',
		['Username'] = username,
		['UniqueCode'] = UniqueCode,
		['ProfileAccessable'] = ProfileAccessable and 1 or 0;
	})
end)

function makeSettingsButton(name,iconID,off)
	local button = Instance.new("TextButton")
	button.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
	button.BorderSizePixel = 0
	button.Position = UDim2.new(0,0,0,0)
	button.Size = UDim2.new(1,0,0,25)
	button.Text = ""
	button.ZIndex = 10
	local icon = Instance.new("ImageLabel")
	icon.Name = "Icon"
	icon.Parent = button
	icon.Position = UDim2.new(0,5,0,5)
	icon.Size = UDim2.new(0,16,0,16)
	icon.BackgroundTransparency = 1
	icon.Image = iconID
	icon.ZIndex = 10
	if off then
		icon.ScaleType = Enum.ScaleType.Crop
		icon.ImageRectSize = Vector2.new(16,16)
		icon.ImageRectOffset = Vector2.new(off,0)
	end
	local label = Instance.new("TextLabel")
	label.Name = "ButtonLabel"
	label.Parent = button
	label.BackgroundTransparency = 1
	label.Text = name
	label.Position = UDim2.new(0,28,0,0)
	label.Size = UDim2.new(1,-28,1,0)
	label.Font = Enum.Font.SourceSans
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextSize = 14
	label.ZIndex = 10
	label.TextXAlignment = Enum.TextXAlignment.Left
	return button
end

local Prefix = Instance.new("TextLabel")
Prefix.Name = "Prefix"
Prefix.Parent = SettingsFrame
Prefix.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Prefix.BorderSizePixel = 0
Prefix.BackgroundTransparency = 1
Prefix.Position = UDim2.new(0, 5, 0, 120)
Prefix.Size = UDim2.new(1, -10, 0, 20)
Prefix.Font = Enum.Font.SourceSans
Prefix.TextSize = 14
Prefix.Text = "Prefix"
Prefix.TextColor3 = Color3.new(1, 1, 1)
Prefix.TextXAlignment = Enum.TextXAlignment.Left
Prefix.ZIndex = 10

local PrefixBox = Instance.new("TextBox")
PrefixBox.Name = "PrefixBox"
PrefixBox.Parent = Prefix
PrefixBox.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
PrefixBox.BorderSizePixel = 0
PrefixBox.Position = UDim2.new(1, -20, 0, 0)
PrefixBox.Size = UDim2.new(0, 20, 0, 20)
PrefixBox.Font = Enum.Font.SourceSansBold
PrefixBox.TextSize = 14
PrefixBox.Text = ECPrefix;
PrefixBox.TextColor3 = Color3.new(0, 0, 0)
PrefixBox.ZIndex = 10

PrefixBox:GetPropertyChangedSignal("Text"):Connect(function()
	ECPrefix = string.sub(PrefixBox.Text, 1, 1)
	ChatBar.PlaceholderText = "To chat click here or press " .. ECPrefix .." key"
	updateFile()
end)

local ECOPPrefixBox = Instance.new("TextLabel")
ECOPPrefixBox.Name = "ECOPPrefixBox"
ECOPPrefixBox.Parent = SettingsFrame
ECOPPrefixBox.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
ECOPPrefixBox.BorderSizePixel = 0
ECOPPrefixBox.BackgroundTransparency = 1
ECOPPrefixBox.Position = UDim2.new(0, 5, 0, 150)
ECOPPrefixBox.Size = UDim2.new(1, -10, 0, 20)
ECOPPrefixBox.Font = Enum.Font.SourceSans
ECOPPrefixBox.TextSize = 14
ECOPPrefixBox.Text = "Open/Close Prefix"
ECOPPrefixBox.TextColor3 = Color3.new(1, 1, 1)
ECOPPrefixBox.TextXAlignment = Enum.TextXAlignment.Left
ECOPPrefixBox.ZIndex = 10

local ECPrefixBox = Instance.new("TextBox")
ECPrefixBox.Name = "ECPrefixBox"
ECPrefixBox.Parent = ECOPPrefixBox
ECPrefixBox.BackgroundColor3 = Color3.fromRGB(78, 78, 79)
ECPrefixBox.BorderSizePixel = 0
ECPrefixBox.Position = UDim2.new(1, -20, 0, 0)
ECPrefixBox.Size = UDim2.new(0, 20, 0, 20)
ECPrefixBox.Font = Enum.Font.SourceSansBold
ECPrefixBox.TextSize = 14
ECPrefixBox.Text = ECOPPrefix
ECPrefixBox.TextColor3 = Color3.new(0, 0, 0)
ECPrefixBox.ZIndex = 10

ECPrefixBox:GetPropertyChangedSignal("Text"):Connect(function()
	ECOPPrefix = string.sub(ECPrefixBox.Text, 1, 1)
	updateFile()
end)

local ColorsButton = Instance.new("ImageButton")
ColorsButton = makeSettingsButton("Chat Color","rbxassetid://6154927458") -- 4911962991
ColorsButton.Position = UDim2.new(0,5,0,180)
ColorsButton.Size = UDim2.new(1,-10,0,25)
ColorsButton.Name = "Colors"
ColorsButton.Parent = SettingsFrame

ColorsButton.MouseButton1Click:Connect(function()
	ChangeChatColor()
end)

local ResetButton = Instance.new("ImageButton")
ResetButton = makeSettingsButton("Clear Chat","rbxassetid://4661609682")
ResetButton.Position = UDim2.new(0,5,0,210)
ResetButton.Size = UDim2.new(1,-10,0,25)
ResetButton.Name = "Colors"
ResetButton.Parent = SettingsFrame

ResetButton.MouseButton1Click:Connect(function()
	for i,v in pairs(getOpenedChat().Scroller:GetChildren()) do
		if(v.Name == "MessageContainer") then
			v:Destroy()
		end
	end
	getOpenedChat().Scroller.CanvasSize = UDim2.new(0, 0, 0, getOpenedChat().Scroller.UIListLayout.AbsoluteContentSize.Y)
	getOpenedChat().Scroller.CanvasPosition = Vector2.new(0,0)
end)

local DiscordButton = Instance.new("ImageButton")
DiscordButton = makeSettingsButton("Discord Link","")
DiscordButton.Position = UDim2.new(0,5,0,240)
DiscordButton.Size = UDim2.new(1,-10,0,25)
DiscordButton.Name = "Disc"
DiscordButton.Parent = SettingsFrame

DiscordButton.MouseButton1Click:Connect(function()
	local http = game:GetService('HttpService') 
	if toClipboard then
		toClipboard('https://discord.com/invite/YmB9RZpbEn')
		notify('Discord Invite', 'Copied to clipboard!\ndiscord.gg/YmB9RZpbEn')
	else
		notify('Discord Invite', 'discord.gg/YmB9RZpbEn')
	end 
	local req = (syn and syn.request) or (http and http.request) or http_request
	if req then
		req({
			Url = 'http://127.0.0.1:6463/rpc?v=1',
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'application/json',
				Origin = 'https://discord.com'
			},
			Body = http:JSONEncode({
				cmd = 'INVITE_BROWSER',
				nonce = http:GenerateGUID(false),
				args = {code = 'YmB9RZpbEn'}
			})
		})
	end
end)

function getText(object)
	if object ~= nil then
		if object:GetAttribute('Tip') ~= nil then
			return object:GetAttribute('Tip');
		end
	end
	return nil
end
FriendsGui.HoverLabel.Visible = false;
function checkTT()
	local t
	local guisAtPosition = game.CoreGui:GetGuiObjectsAtPosition(Mouse.X, Mouse.Y)

	for _, gui in pairs(guisAtPosition) do
		if gui.Parent.Name == "Buttons" then
			t = gui
		end
	end

	if t ~= nil then
		local gt = getText(t)
		if gt ~= nil then
			local x = Mouse.X
			local y = Mouse.Y
			local xP
			local yP

				xP = x + 21

				yP = y
			FriendsGui.HoverLabel.Position = UDim2.new(0, xP, 0, yP)
			FriendsGui.HoverLabel.Text = " " .. gt .. " ";
			FriendsGui.HoverLabel.Visible = true
		else
			FriendsGui.HoverLabel.Visible = false
		end
	else
		FriendsGui.HoverLabel.Visible = false
	end
end
Mouse.Move:Connect(checkTT)
local mouseIsInWindow = true;
local lastBackgroundFadeTime = 0
local backgroundIsFaded = false
local doingAction = false
function doFadeIn()
	if(backgroundIsFaded) then
		if(doingAction) then repeat wait() until not doingAction end
		doingAction = true
		lastBackgroundFadeTime = tick()
		backgroundIsFaded = false;
		SettingsButton.Visible = true;
		FriendsButton.Visible = true;
		local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		game:GetService("TweenService"):Create(ChatWindow, tweenInfo, {BackgroundTransparency=0.6}):Play()
		game:GetService("TweenService"):Create(ChatBarParentFrame, tweenInfo, {BackgroundTransparency=0}):Play()
		game:GetService("TweenService"):Create(ChatBar, tweenInfo, {TextTransparency=0}):Play()
		game:GetService("TweenService"):Create(Scroller, tweenInfo, {ScrollBarImageTransparency=0.4}):Play()
		doingAction = false;
	end
end

function doFadeOut()
	if(doingAction) then repeat wait() until not doingAction end
	doingAction = true
	lastBackgroundFadeTime = tick()
	backgroundIsFaded = true;
	SettingsOpen = false
	SettingsFrame:TweenPosition(UDim2.new(UDim2.new(0, -1000, 0.1, 0)), "InOut", "Quart", 0.5, true, nil)
	SettingsButton.Visible = false;
	FriendsButton.Visible = false;
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	game:GetService("TweenService"):Create(ChatWindow, tweenInfo, {BackgroundTransparency=1}):Play()
	game:GetService("TweenService"):Create(ChatBarParentFrame, tweenInfo, {BackgroundTransparency=1}):Play()
	game:GetService("TweenService"):Create(ChatBar, tweenInfo, {TextTransparency=1}):Play()
	game:GetService("TweenService"):Create(Scroller, tweenInfo, {ScrollBarImageTransparency=1}):Play()
	doingAction = false
	SettingsFrame.Visible = false;
end

spawn(function()
	while true do
		game:GetService("RunService").RenderStepped:wait()
		while (mouseIsInWindow or ChatBar:IsFocused()) do
			if (mouseIsInWindow) then
				repeat wait() until mouseIsInWindow == false;
			end
			if (ChatBar:IsFocused()) then
				repeat wait() until not ChatBar:IsFocused();
			end
		end

		if (not backgroundIsFaded) then
			local timeDiff = tick() - lastBackgroundFadeTime
			if (timeDiff > 3.5) then
				doFadeOut()
			end
		end
	end
end)

ChatWindow.MouseEnter:connect(function()
	mouseIsInWindow = true
	if(backgroundIsFaded) then
		doFadeIn()
	end
end)

ChatWindow.MouseLeave:connect(function()
	mouseIsInWindow = false;
	lastBackgroundFadeTime = tick()
end)

SettingsFrame.MouseEnter:connect(function()
	mouseIsInWindow = true
	if(backgroundIsFaded) then
		doFadeIn()
	end
end)

SettingsFrame.MouseLeave:connect(function()
	mouseIsInWindow = false;
	lastBackgroundFadeTime = tick()
end)

Mouse.KeyUp:connect(function(Key)
	if (Key:byte() == ECPrefix:byte()) then
		ChatBar:CaptureFocus()
	elseif(Key:byte() == ECOPPrefix:byte()) then	
		if ChatWindow.Visible then
			unread_counter = 0
			ChatCounter2.Visible = true
			ChatIcon2.ImageColor3 = Color3.new(255, 255, 255)
			doFadeOut()
			ChatWindow.Visible = false
		elseif not ChatWindow.Visible then
			ChatCounterText2.Text = "0"
			ChatCounter2.Visible = false
			unread_counter = 0
			ChatWindow.Visible = true
			ChatIcon2.ImageColor3 = Color3.new(0, 255, 0)
			doFadeIn()
		end
	end
end)

ChatBar.Focused:Connect(function(enterPressed)
	ChatWindow.Visible = true
	doFadeIn()
	ChatIcon2.ImageColor3 = Color3.new(0, 255, 0)
	unread_counter = 0
	ChatCounterText2.Text = "0"
	ChatCounter2.Visible = false
end)

ChatBar.FocusLost:Connect(function(enterPressed)
	lastBackgroundFadeTime = tick()
	if enterPressed then
		if string.len(ChatBar.Text) ~= 0 then
			local newmsg;
			if string.sub(ChatBar.Text, 1, 3) == "/w " then
				local msg = ChatBar.Text:gsub("/w ", "")
				local args = msg:split(" ")
				msg = msg:gsub(args[1] .. " ", "")
				newmsg = {
					['Username'] = Username,
					['Action'] = "Message",
					['Message'] = Encrypt(msg, args[1]),
					['UniqueCode'] = UniqueCode,
				}
				CreateLabelChat({{Rank, Username}, "WhisperTo", Nickname or Username, args[1]}, msg, getOpenedChat(), Color3.fromRGB(249, 233, 153))
			elseif OpenedChannel:match("PM-") then
				local msg = ChatBar.Text:gsub(" +"," ");
				newmsg = {
					['Username'] = Username,
					['Action'] = "PM",
					['Message'] = Encrypt(msg, OpenedChannel:gsub("PM-", "")),
					['UniqueCode'] = UniqueCode;
				}
				CreateLabelChat({{Rank, Username}, "Message", Nickname or Username}, msg, getOpenedChat(), Color3.fromRGB(ChatColor[1], ChatColor[2], ChatColor[3]))
			elseif string.sub(ChatBar.Text, 1, 1) == ";" then
				local msg = ChatBar.Text:gsub(";", "")
				ECOMMAND(msg)
			else
				local msg = ChatBar.Text:gsub(" +"," ");
				newmsg = {
					['Username'] = Username,
					['Action'] = "Message",
					['Message'] = Encrypt(msg),
					['UniqueCode'] = UniqueCode,
				}	
				if(OpenedChannel == "Global") then
					newmsg['Global'] = true;
				else
					newmsg['Global'] = false;
				end
			end
			if(newmsg ~= nil) then
				newmsg = json_encode(newmsg)
				client:Send(newmsg)
			end
		end
		ChatBar.Text = "";
	end
	focused = false;
end)

function FindInString(str, with)
	if string.match(tostring(str), tostring(with)) then
		return true;
	end
	return false;
end

Chat2.Name = "Chat2"
Chat2.Parent = (game.Players.LocalPlayer.PlayerGui:FindFirstChild("TopBar") and game.Players.LocalPlayer.PlayerGui.TopBar.Frame) or game.CoreGui:WaitForChild("TopBar");--(game.StarterGui:FindFirstChild("TopBar") and game.StarterGui.TopBar.Frame) or game.CoreGui:WaitForChild("TopBar");
Chat2.BackgroundTransparency = 1.000
Chat2.Position = UDim2.new(0, 150, 0, 0)
Chat2.Size = UDim2.new(0, 50, 0, 36)
Chat2.AutoButtonColor = false
Chat2.MouseButton1Click:Connect(function()
	if ChatWindow.Visible then
		unread_counter = 0
		ChatCounter2.Visible = true
		ChatWindow.Visible = false
		ChatIcon2.ImageColor3 = Color3.new(255, 255, 255)
	elseif not ChatWindow.Visible then
		ChatCounterText2.Text = "0"
		ChatCounter2.Visible = false
		unread_counter = 0
		ChatWindow.Visible = true
		ChatIcon2.ImageColor3 = Color3.new(0, 255, 0)
	end
end)
function Encrypt(Message, ToPlayer)
	local localKey = 29394972
	if(OpenedChannel == "Custom") then
		localKey = ChangableKey
	end
	local Message = table.concat(ChatColor, ",") .. "|||" .. Message
	local function EC(key, str)
		local tab = {}
		for i = 0, 127 do 
			local a = -1 
			repeat a = a + 2 
			until a * (2 * i + 1) % 256 == 1 
			tab[i] = a
		end
		local Var1 = key
		local Var2 = key + key
		return (Message:gsub(".", function(Encode) 
			local Var3 = Var1 % 274877906944
			local Var4 = (Var1 - Var3) / 274877906944 
			local Var5 = Var4 % 85 
			Encode = Encode:byte() 
			local Var6 = (Encode * tab[Var5] - (Var4 - Var5) / 85) % 256
			Var1 = Var3 * Var2 - Var4 + Var6 + Encode
			return ('%02x'):format(Var6)
		end))
	end
	if(ToPlayer) then
		local Key;
		for i = 1, #ToPlayer do
			Key = ToPlayer:sub(i, i):byte()
		end
		Message = "PM|||" .. EC(Key*0.91, Message)
	end
	return EC(localKey, Message)
end

function Decrypt(Message, NewKey)
	local isPM = false
	local function EC(key, str)
		local Var1 = key
		local Var2 = key + key
		return(str:gsub("%x%x", function(Decode) 
			local Var3 = Var1 % 274877906944
			local Var4 = (Var1 - Var3) / 274877906944
			local Var5 = Var4 % 85
			Decode = tonumber(Decode, 16)
			local Var6 = (Decode + (Var4 - Var5) / 85) * (2 * Var5 + 1) % 256
			Var1 = Var3 * Var2 - Var4 + Decode + Var6
			
			return string.char(Var6)
		end))
	end
	Message = EC(NewKey, Message)
	if(Message:split("|||")[1] == "PM") then
		isPM = true
		local Key;
		for i = 1, #username do
			Key = username:sub(i, i):byte()
		end
		Message = EC(Key*0.91, Message:split("|||")[2])
	end
	local decryptedMessage = Message:split("|||")
	if(decryptedMessage[2] ~= nil) then
		return {decryptedMessage[1], decryptedMessage[2], isPM};
	end
	return false;
end

function GetPlayers(str)
	local str = tostring(str)
	local found = {}
	for i,v in pairs(Players:GetChildren()) do
		if v.Name:lower():sub(1, #str) == str:lower() then
			table.insert(found, v)
		end
	end
	return found
end

ChatBar.Changed:connect(function(prop)
	if prop ~= "Text" then
		return
	end
	ChatBar.Text = ChatBar.Text:sub(1,200)
end)

local scaleRatio = function(ratioObject)
	local relativeY = ratioObject.AbsoluteSize.Y/workspace.CurrentCamera.ViewportSize.Y;

	local scale = function()
		ratioObject.Size = UDim2.new(1,0,0,workspace.CurrentCamera.ViewportSize.Y*relativeY);
	end

	scale();
	workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		game:GetService("RunService").Heartbeat:Wait();
		scale();
	end);
end

local messageTextSizeRatio = Instance.new("TextLabel");
local constraint = Instance.new("UITextSizeConstraint");

messageTextSizeRatio.Name = "MessageTextSizeRatio";
messageTextSizeRatio.Parent = ChatWindow;
messageTextSizeRatio.AnchorPoint = Vector2.new(0,0.5);
messageTextSizeRatio.BackgroundColor3 = Color3.fromRGB(255,255,255);
messageTextSizeRatio.BackgroundTransparency = 1.000;
messageTextSizeRatio.Position = UDim2.new(0,0,0.776666641,0);
messageTextSizeRatio.Size = UDim2.new(1, 0,0.056, 0); -- UDim2.new(1,0,0.330000013,0);
messageTextSizeRatio.Visible = false;
messageTextSizeRatio.Font = Enum.Font.SourceSans;
messageTextSizeRatio.TextColor3 = Color3.fromRGB(0,0,0);
messageTextSizeRatio.TextScaled = true;
messageTextSizeRatio.TextSize = 16.000;
messageTextSizeRatio.TextWrapped = true;

scaleRatio(messageTextSizeRatio);

constraint.Name = "Constraint";
constraint.Parent = messageTextSizeRatio;
constraint.MinTextSize = 9;
constraint.MaxTextSize = 20;

local getBounds = function(txt)
	return game:GetService("TextService"):GetTextSize(
		txt or ChatBar.Text,
		ChatBar.TextSize,
		ChatBar.Font,
		Vector2.new(ChatBar.AbsoluteSize.X,math.huge)
	);
end

local proportionScale = function()
	local textSize = messageTextSizeRatio.TextBounds.Y;
	for _,v in pairs(ChatWindow:GetDescendants()) do
		if(v:IsA("UICorner")) then
			if(v.Parent.Name ~= "ChatbarCover" and v.Name ~= "message_roundness") then
				v.CornerRadius = UDim.new(0,textSize / 1.5);
			end
		end
	end
	ChatBar.TextSize = messageTextSizeRatio.TextBounds.Y;
end

local updateSize = function()
	local textBounds = getBounds(ChatBar.Text);
	local offset = ChatBar.TextSize*1.25;
	local chatbarSize = (textBounds.Y + offset);
	local previousSize = ChatWindow.Size;
	local newChatWindowSize = UDim2.new(1,0,1,math.clamp(textBounds.Y - offset,0,math.huge));
	singleLineChatbarSize = (getBounds("...").Y + offset);
	ChatWindow:TweenSize(
		newChatWindowSize,
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quad,
		0.1,
		true
	);
	ChatBarParentFrame:TweenSize(
		UDim2.new(0.98, 0,0, chatbarSize),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quad,
		0.1,
		true
	);
	ChatBar.Size = UDim2.new(1,(-ChatBar.TextSize*1.25),1,0);
end

local lastY;
local lastTime = 0;
game:GetService("RunService").RenderStepped:Connect(function()
	proportionScale();
	if(getBounds().Y ~= lastY and (lastTime == 0 or tick() - lastTime > 0.01)) then
		lastTime = tick();
		lastY = getBounds().Y;
		updateSize();
	end
end)

local insertKey = Enum.KeyCode.RightShift

local plrs = game: GetService("Players")
local PlayerGui = plrs.LocalPlayer:FindFirstChildOfClass("PlayerGui")
local EmojiList = Instance.new("ScrollingFrame")
local EmojiButton = Instance.new("TextButton")

EmojiList.Name = "EmojiList"
EmojiList.Parent = ChatBarParentFrame
EmojiList.Active = true
EmojiList.BackgroundColor3 = Color3.new(0, 0, 0)
EmojiList.BackgroundTransparency = 0.6
EmojiList.BorderSizePixel = 0
EmojiList.Position = UDim2.new(0, 0, 0, 42)
EmojiList.Size = UDim2.new(1, 0, 1, 200)
EmojiList.ScrollBarThickness = 4
EmojiList.VerticalScrollBarInset = "Always"
EmojiList.Visible = false

EmojiButton.Name = "EmojiButton"
EmojiButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
EmojiButton.BackgroundTransparency = 1
EmojiButton.BorderSizePixel = 0
EmojiButton.Size = UDim2.new(1, 0, 0, 20)
EmojiButton.Font = Enum.Font.SourceSansBold
EmojiButton.TextSize = 18
EmojiButton.TextColor3 = Color3.new(1, 1, 1)
EmojiButton.TextXAlignment = Enum.TextXAlignment.Left

local selected = 0
local chatbox = ChatBar
local emotes = {}
local emojis = {}
local unicode = loadstring(game:HttpGet(('https://raw.githubusercontent.com/sheenieboy/unicode/main/Unicode'), true))()
for i, w in next, emojil do
	local str = ""
	for v in w.unicode_output:gmatch("[%a%d]+") do
		str = str..unicode(v)
	end
	emojis[w.shortname: sub(2, -2)] = {
		str,
		w.keywords
	}
	emotes[#emotes + 1] = w.shortname:sub(2, -2)
end

local emotes, names = emojis, emotes
shared.emotes = emotes
shared.names = names

function compare(t, v)
	for _, i in next, t do
		if i: sub(1, #v): lower() == v: lower() then
			return true
		end
	end
end

function insertEmoji(chat, emoji, emojiText)
	if chat and emoji and emojiText then
		local finalEmojiText = ':'..emojiText..':'
		local prefix = string.find(chatbox.Text, ":")
		local swapChat = string.gsub(chat, chatbox.Text: sub(prefix), finalEmojiText)
		local swapEmoji = string.gsub(swapChat, ':[%w%p]+:', emoji)
		return (swapEmoji)
	end
end

local e = {}
local n = {}

function update(name)
	local t = name
	e = {}
	n = {}
	for i, v in next, emotes do
		if i: sub(1, #t): lower() == t: lower() or compare(v[2], t) then
			n[#n + 1] = i
		end
	end
	table.sort(n, function (a, b) return a <= b end)
	for i, v in next, n do
		e[i] = emotes[v][1]
	end
	EmojiList: ClearAllChildren()
	local namenum = 1
	local prefix = string.find(chatbox.Text, ":")
	if #e ~= 0 then
		EmojiList.Visible = true
		local YSize = 25
		local num = 1
		for i, v in next, e do
			if i <= 100 then
				local Position = ((num * YSize) - YSize)
				local b = EmojiButton: Clone()
				local emoj = v
				local emojName = n[i]
				b.Name = tostring(namenum)
				b.Parent = EmojiList
				b.Text = emoj..' :'..emojName..':'
				b.Position = UDim2.new(0, 8, 0, Position + 5)
				EmojiList.CanvasSize = UDim2.new(0, 0, 0, Position + 30)
				if namenum <= 9 then
					EmojiList.Size = UDim2.new(1, 0, 1, EmojiList.CanvasSize.Y.Offset - 40)
				else
					EmojiList.Size = UDim2.new(1, 0, 1, 200)
				end
				namenum = namenum + 1
				num = num + 1
				b.MouseButton1Click:Connect(function () chatbox.Text = insertEmoji(chatbox.Text, emoj, emojName) chatbox: CaptureFocus() EmojiList.Visible = false end)
			end
		end
	else
		EmojiList.Visible = false
	end
	selected = 0
end

local chatboxFunc = nil
local function Index()
	chatbox.Text = string.gsub(chatbox.Text, "\t", "")
	local prefix = string.find(chatbox.Text, ":")
	if prefix ~= nil then
		local search = chatbox.Text: sub(prefix + 1)
		if string.find(search, " ") then
			EmojiList.Visible = false
		return
	end
	local endsearch = string.find(search, ":")
	if endsearch ~= nil then
		update(search:sub(1, endsearch - 1))
		EmojiList.Visible = false
		chatbox.Text = insertEmoji(chatbox.Text, e[1], n[1])
		return
	end
	update(search)
	else
		EmojiList.Visible = false
	end
end
chatboxFunc = chatbox:GetPropertyChangedSignal("Text"):Connect(Index)

local function updateView()
	local index = selected - 1
	local topPos = math.ceil(EmojiList.CanvasPosition.Y / 25)
	local bottomPos = math.floor((EmojiList.CanvasPosition.Y + EmojiList.AbsoluteSize.Y) / 25) - 1
	local canvasPos
	if index < topPos then
		canvasPos = index * 25
	elseif index > bottomPos then
		canvasPos = 25 * (index + 1) - EmojiList.AbsoluteSize.Y + 5
	end
	if canvasPos then
		EmojiList.CanvasPosition = Vector2.new(0, canvasPos)
	end
end

UserInputService.InputBegan:Connect(function(input) 
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		local t
		local guisAtPosition = game.CoreGui:GetGuiObjectsAtPosition(Mouse.X, Mouse.Y)
		for _, gui in pairs(guisAtPosition) do
			if gui.Name == "MessageContainer" then
				t = gui
			end
		end
		if(t ~= nil) then
			openRightClick(t)
		end
		return;
	end

	if EmojiList.Visible then
		if input.KeyCode == Enum.KeyCode.Down then 
			local function scrollDown() 
				local deselect = EmojiList:FindFirstChild(selected) 
				if deselect ~= nil then 
					deselect.BackgroundTransparency = 1 
				end 
				selected = selected + 1 
				local item = EmojiList:FindFirstChild(selected) 
				if item ~= nil then 
					item.BackgroundTransparency = 0.6
				else
					selected = selected - 1
					local item = EmojiList:FindFirstChild(selected) 
					if item ~= nil then 
						item.BackgroundTransparency = 0.6 
					end 
				end
				updateView()
			end

			local releaseEvent, stopped releaseEvent = UserInputService.InputEnded:Connect(function(input) 
				if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Down then 
					releaseEvent:Disconnect() 
					stopped = true
				end
			end) 
			scrollDown() 
			wait(0.5) 
			while not stopped do
				scrollDown()
				wait() 
			end 
		elseif input.KeyCode == Enum.KeyCode.Up then 
			local function scrollUp() 
				local deselect = EmojiList:FindFirstChild(selected) 
				if deselect ~= nil then 
					deselect.BackgroundTransparency = 1 
				end 
				selected = selected - 1 
				local item = EmojiList:FindFirstChild(selected)
				if item ~= nil then 
					item.BackgroundTransparency = 0.6
				else
					selected = selected + 1
					local item = EmojiList:FindFirstChild(selected) 
					if item ~= nil then 
						item.BackgroundTransparency = 0.6 
					end 
				end 
				updateView() 
			end

			local releaseEvent, stopped releaseEvent = UserInputService.InputEnded:Connect(function(input) 
				if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Up then 
					releaseEvent:Disconnect() 
					stopped = true
				end 
			end) 
			scrollUp() 
			wait(0.5)
			while not stopped do
				scrollUp()
				wait() 
			end 
		elseif input.KeyCode == insertKey then
			if selected ~= 0 then 
				local item = EmojiList:FindFirstChild(selected)
				local prefix = string.find(chatbox.Text, ":") 
				if item ~= nil and prefix ~= nil then 
					chatbox.Text = insertEmoji(chatbox.Text, e[selected], n[selected]) 
					chatbox:CaptureFocus() 
					EmojiList.Visible = false 
				end 
			end 
		end 
	end
end)
local Connected = false;
local Reconnect = true;

function ClientConnection()
	if(syn_checkcaller) then
		client = syn.websocket.connect(EKGB)
	elseif PROTOSMASHER_LOADED then
		client = WebSocket.new(EKGB)
		client:ConnectToServer()
		wait(1)
	elseif(identifyexecutor() or getfenv(0).WebSocket) then
		client = WebSocket.connect(EKGB)
		wait(1)
	end

	local ConnectionClosed = function(Msg)
		Connected = false;
		if(Reconnect) then
			CreateLabelChat({{false, false}, "SystemMessage", "Server"}, "Lost connection! Will attempt to reconnect in a couple of seconds.", getOpenedChat(), Color3.fromRGB(255, 0, 0))
			local a = 0;
			repeat 
				wait(7)
				a = a+1;
				if(not Connected) then
					CreateLabelChat({{false, false}, "SystemMessage", "System"}, "Attempting to reconnect.", getOpenedChat(), Color3.fromRGB(255, 255, 0))
					spawn(function()
						ClientConnection()
						client:Send(json_encode({
							['Action'] = 'Login',
							['Username'] = Username,
							['UniqueCode'] = UniqueCode;
						}));
					end)
				end
			until a >= 3 or Connected
		end
	end
	local MessageRecieved = function(msg)
		Connected = true;
		local data = json_decode(msg)
		if(data["Action"] == "RegistrationSuccessful" or data["Action"] == "LoginSuccessful") then
			LoginSuccessful = true;
			return;
		end
		if data['Action'] == 'CloseError' then
			CreateLabelChat({{false, false}, "SystemMessage", "Error"}, data['Message'], getOpenedChat(), Color3.fromRGB(255, 0, 0))
			Reconnect = false;
			client:Close()
			return;
		end
		if data['Action'] == 'Error' then
			CreateLabelChat({{false, false}, "SystemMessage", "Error"}, data['Message'], getOpenedChat(), Color3.fromRGB(255, 0, 0))
			return;
		end
		if data['Action'] == 'ActivePlayers' then
			CreateLabelChat({{false, false}, "SystemMessage", "Server"}, data['Message'] .. " users connected", getOpenedChat(), Color3.fromRGB(5, 150, 100))
			return
		end
		if data['Action'] == 'Server' then
			CreateLabelChat({{false, false}, "SystemMessage", "Server"}, data['Message'], getOpenedChat(), Color3.fromRGB(255, 0, 0))
			return
		end
		if data['Action'] == 'ShowUsernames' then
			CreateLabelChat({{false, false}, "SystemMessage", "Server"}, data['Message'], getOpenedChat(), Color3.fromRGB(5, 150, 100))
			return
		end
		if data['Action'] == 'DelMessage' then
			for i,v in pairs(ChatChannelParentFrame.Scroller:GetChildren()) do
				if(v:FindFirstChild("ChatMessage")) then
					if(data['Message'] == v.ChatMessage.Text:gsub(" +"," ") and data['Time'] == v.Time.Text) then
						v:Destroy()
					end
				end
			end
			return;
		end
		if data['Action'] == 'PurgeChat' then
			for i = 1,data['Amount'] do
				if(Chats[i]) then
					local MessageContainer2 = Chats[#Chats];
					MessageContainer2:Destroy()
					table.remove(Chats, #Chats)
				end
			end
			ChatChannelParentFrame.Scroller.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y-20)
			ChatChannelParentFrame.Scroller.CanvasPosition = Vector2.new(0,ChatChannelParentFrame.Scroller.CanvasSize.Y.Offset)
			return;
		end
		if data['Action'] == 'Invite' then
			if(data['ForPlayer'] == username or data['ForPlayer'] == "all") then
				local placeName = game:GetService('MarketplaceService'):GetProductInfo(data['PlaceId']).Name
				CreateLabelChat({{false, false}, "Invite", "Invite"}, (data['Nickname'] or data['Username']) .. " wants you to join " .. placeName .. ", Click to accept", getOpenedChat(), Color3.fromRGB(5, 150, 100), {data['PlaceId'], data['JobId']})
			end
			return
		end
		if data['Action'] == 'ReturnSearchResults' then
			for _, instance in pairs(FriendsList:GetChildren()) do
				if instance:IsA("TextLabel") then
					instance:Destroy()
				end
			end
			local LoadedList = json_decode(data["Results"])
			for i = 1,#LoadedList do
				CreatePlayerCard(LoadedList[i], "Search")
			end
			return
		end
		if data['Action'] == 'friendRequest' then
			if(data['ForPlayer'] == username) then
				if not FindInTable(FriendRequestUsernames, data['Username']) then
					FriendsGui.MainFrame.TopBar.RequestsButton.Visible = true;
					table.insert(FriendRequestUsernames, {data['Username'], false})
					CreateLabelChat({{false, false}, "SystemMessage", "Friend Request"}, (data['Nickname'] or data['Username']) .. " sent you a friends request", getOpenedChat(), Color3.fromRGB(5, 150, 100), {data['PlaceId'], data['JobId']})
				end
			end
			return
		end
		if data['Action'] == "ReturnFriendID" then
			if(ChatWindow:FindFirstChild("PMB-" .. data['FriendName'])) then
				local foundButton = ChatWindow:FindFirstChild("PMB-" .. data['FriendName'])
				foundButton.Image = Players:GetUserThumbnailAsync(data['UserId'], Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
			end
			return;
		end
		if data['Action'] == 'ReturnFriendsList' then
			for _, instance in pairs(FriendsList:GetChildren()) do
				if instance:IsA("TextLabel") then
					instance:Destroy()
				end
			end
			local LoadedList = json_decode(data["Friends"])
			AcceptedFriends = LoadedList;
			for i = 1,#LoadedList do
				CreatePlayerCard(LoadedList[i], "Friend")
			end
			return
		end
		if data['Action'] == 'TriggerRefresh' then
			sendServerRequest({
				['Action'] = 'GetFriendsList',
				['Username'] = Username,
				['UniqueCode'] = UniqueCode;
			})
			return;
		end
		if data['Action'] == 'FoundPlayerProfile' then
			openProfile(data);
			return;
		end
		if data['Action'] == 'GiveRank' then
			Rank = data['Rank'];
			Nickname = data['Nickname'];
			if(data['Commands'] == 1) then
				allowedCommands = true;
			end
			if(data['ProfileAccessable'] == 1) then
				ProfileAccessable = true;
				ProfButton.BackgroundTransparency = 0
			end
			if(data['Alert'] ~= "None") then
				AnnouncementLabel.Text = data['Alert'];
				AnnouncementLabel.Visible = true;
			end
			return
		end
		if data['Action'] == 'Player Left' and JoinLeave then
			CreateLabelChat({{false, false}, "SystemMessage", "Server"}, (data['Nickname'] or data['Username']) .. " left", ChatChannelParentFrame, Color3.fromRGB(5, 150, 100))
			return
		end
		if data['Action'] == 'New User' and JoinLeave then
			if(data['Verify'] == 'Loaded') then
				CreateLabelChat({{false, false}, "SystemMessage", "Server"}, (data['Nickname'] or data['Username']) .. " joined", ChatChannelParentFrame, Color3.fromRGB(5, 150, 100))
			elseif(Decrypt(data['Verify'], ChangableKey)) then
				CreateLabelChat({{false, false}, "SystemMessage", "Server"}, (data['Nickname'] or data['Username']) .. " joined", CustomChannel, Color3.fromRGB(5, 150, 100))
			end
			return;
		end
		local getMessage = Decrypt(data['Message'], 29394972)
		local messageLocation = ChatChannelParentFrame
		if(not getMessage and ChangableKey ~= 29394972) then
			getMessage = Decrypt(data['Message'], ChangableKey)
			messageLocation = CustomChannel
		end
		if getMessage and not FindInTable(Ignored, data['Username']) then
			local messageColor = getMessage[1]:split(",")
			local Msg = getMessage[2]
			local Private = getMessage[3]
			if(data['Action'] == "PM") then
				if(not ChatWindow:FindFirstChild("PM-"..data['Username'])) then
					makePrivateChat(data['Username'])
				end
				messageLocation = ChatWindow:FindFirstChild("PM-"..data['Username']);
				Private = false;
			end
			local UseName = data['Nickname'] or data['Username'];
			CreateLabelChat({{data['Rank'], data['Username']}, Private and "WhisperFrom" or "Message", UseName}, Msg, messageLocation, Color3.fromRGB(messageColor[1], messageColor[2], messageColor[3]))
		end
	end
	if(PROTOSMASHER_LOADED) then
		client.OnMessage = MessageRecieved;
		client.OnClose = ConnectionClosed;
	else
		client.OnMessage:Connect(MessageRecieved)
		client.OnClose:Connect(ConnectionClosed)
	end
	client:Send(json_encode({
		['Action'] = 'New User',
		['Username'] = username,
		['PlaceId'] = game.PlaceId,
		['UserId'] = game.Players.LocalPlayer.UserId,
		['Exploit'] = Exploit,
		['Verify'] = "Loaded",
		['UniqueCode'] = UniqueCode,
	}));
end
ClientConnection();

local colorpickerOpen = false
function ChangeChatColor()
	cache_currentChatColor = ChatColor
	if not colorpickerOpen then
		colorpickerOpen = true
		picker = game:GetObjects("rbxassetid://6154791783")[1]
		picker.Name = "ColorPicker"
		picker.Parent = game:GetService("CoreGui").RobloxGui

				local newMt = setmetatable({},{})

				local pickerGui = picker.ColorPicker
				local pickerTopBar = pickerGui.TopBar
				local pickerExit = pickerTopBar.Exit
				local pickerFrame = pickerGui.Content
				local colorSpace = pickerFrame.ColorSpaceFrame.ColorSpace
				local colorStrip = pickerFrame.ColorStrip
				local previewFrame = pickerFrame.Preview
				local basicColorsFrame = pickerFrame.BasicColors
				local customColorsFrame = pickerFrame.CustomColors
				local defaultButton = pickerFrame.Default
				local applyButton = pickerFrame.Apply

				local colorScope = colorSpace.Scope
				local colorArrow = pickerFrame.ArrowFrame.Arrow

				local hueInput = pickerFrame.Hue.Input
				local satInput = pickerFrame.Sat.Input
				local valInput = pickerFrame.Val.Input

				local redInput = pickerFrame.Red.Input
				local greenInput = pickerFrame.Green.Input
				local blueInput = pickerFrame.Blue.Input

				local mouse = game:GetService("Players").LocalPlayer:GetMouse()

				local hue,sat,val = 0,0,1
				local red,green,blue = ChatColor[1]/255,ChatColor[2]/255,ChatColor[3]/255 --1,1,1
				local chosenColor = Color3.new(0,0,0)

				local basicColors = {Color3.new(0,0,0),Color3.new(0.66666668653488,0,0),Color3.new(0,0.33333334326744,0),Color3.new(0.66666668653488,0.33333334326744,0),Color3.new(0,0.66666668653488,0),Color3.new(0.66666668653488,0.66666668653488,0),Color3.new(0,1,0),Color3.new(0.66666668653488,1,0),Color3.new(0,0,0.49803924560547),Color3.new(0.66666668653488,0,0.49803924560547),Color3.new(0,0.33333334326744,0.49803924560547),Color3.new(0.66666668653488,0.33333334326744,0.49803924560547),Color3.new(0,0.66666668653488,0.49803924560547),Color3.new(0.66666668653488,0.66666668653488,0.49803924560547),Color3.new(0,1,0.49803924560547),Color3.new(0.66666668653488,1,0.49803924560547),Color3.new(0,0,1),Color3.new(0.66666668653488,0,1),Color3.new(0,0.33333334326744,1),Color3.new(0.66666668653488,0.33333334326744,1),Color3.new(0,0.66666668653488,1),Color3.new(0.66666668653488,0.66666668653488,1),Color3.new(0,1,1),Color3.new(0.66666668653488,1,1),Color3.new(0.33333334326744,0,0),Color3.new(1,0,0),Color3.new(0.33333334326744,0.33333334326744,0),Color3.new(1,0.33333334326744,0),Color3.new(0.33333334326744,0.66666668653488,0),Color3.new(1,0.66666668653488,0),Color3.new(0.33333334326744,1,0),Color3.new(1,1,0),Color3.new(0.33333334326744,0,0.49803924560547),Color3.new(1,0,0.49803924560547),Color3.new(0.33333334326744,0.33333334326744,0.49803924560547),Color3.new(1,0.33333334326744,0.49803924560547),Color3.new(0.33333334326744,0.66666668653488,0.49803924560547),Color3.new(1,0.66666668653488,0.49803924560547),Color3.new(0.33333334326744,1,0.49803924560547),Color3.new(1,1,0.49803924560547),Color3.new(0.33333334326744,0,1),Color3.new(1,0,1),Color3.new(0.33333334326744,0.33333334326744,1),Color3.new(1,0.33333334326744,1),Color3.new(0.33333334326744,0.66666668653488,1),Color3.new(1,0.66666668653488,1),Color3.new(0.33333334326744,1,1),Color3.new(1,1,1)}
				local customColors = {}

				dragGUI(picker)

				local function updateColor(noupdate)
					local relativeX,relativeY,relativeStripY = 219 - hue*219, 199 - sat*199, 199 - val*199
					local hsvColor = Color3.fromHSV(hue,sat,val)

					if noupdate == 2 or not noupdate then
						hueInput.Text = tostring(math.ceil(359*hue))
						satInput.Text = tostring(math.ceil(255*sat))
						valInput.Text = tostring(math.floor(255*val))
					end
					if noupdate == 1 or not noupdate then
						redInput.Text = tostring(math.floor(255*red))
						greenInput.Text = tostring(math.floor(255*green))
						blueInput.Text = tostring(math.floor(255*blue))
					end

					chosenColor = Color3.new(red,green,blue)

					colorScope.Position = UDim2.new(0,relativeX-9,0,relativeY-9)
					colorStrip.ImageColor3 = Color3.fromHSV(hue,sat,1)
					colorArrow.Position = UDim2.new(0,-2,0,relativeStripY-4)
					previewFrame.BackgroundColor3 = chosenColor

					newMt.Color = chosenColor
					if newMt.Changed then newMt:Changed(chosenColor) end
				end

				local function colorSpaceInput()
					local relativeX = mouse.X - colorSpace.AbsolutePosition.X
					local relativeY = mouse.Y - colorSpace.AbsolutePosition.Y

					if relativeX < 0 then relativeX = 0 elseif relativeX > 219 then relativeX = 219 end
					if relativeY < 0 then relativeY = 0 elseif relativeY > 199 then relativeY = 199 end

					hue = (219 - relativeX)/219
					sat = (199 - relativeY)/199

					local hsvColor = Color3.fromHSV(hue,sat,val)
					red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b

					updateColor()
				end

				local function colorStripInput()
					local relativeY = mouse.Y - colorStrip.AbsolutePosition.Y

					if relativeY < 0 then relativeY = 0 elseif relativeY > 199 then relativeY = 199 end	

					val = (199 - relativeY)/199

					local hsvColor = Color3.fromHSV(hue,sat,val)
					red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b

					updateColor()
				end

				local function hookButtons(frame,func)
					frame.ArrowFrame.Up.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							frame.ArrowFrame.Up.BackgroundTransparency = 0.5
						elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
							local releaseEvent,runEvent

							local startTime = tick()
							local pressing = true
							local startNum = tonumber(frame.Text)

							if not startNum then return end

							releaseEvent = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
								releaseEvent:Disconnect()
								pressing = false
							end)

							startNum = startNum + 1
							func(startNum)
							while pressing do
								if tick()-startTime > 0.3 then
									startNum = startNum + 1
									func(startNum)
								end
								wait(0.1)
							end
						end
					end)

					frame.ArrowFrame.Up.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							frame.ArrowFrame.Up.BackgroundTransparency = 1
						end
					end)

					frame.ArrowFrame.Down.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							frame.ArrowFrame.Down.BackgroundTransparency = 0.5
						elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
							local releaseEvent,runEvent

							local startTime = tick()
							local pressing = true
							local startNum = tonumber(frame.Text)

							if not startNum then return end

							releaseEvent = UserInputService.InputEnded:Connect(function(input)
								if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
								releaseEvent:Disconnect()
								pressing = false
							end)

							startNum = startNum - 1
							func(startNum)
							while pressing do
								if tick()-startTime > 0.3 then
									startNum = startNum - 1
									func(startNum)
								end
								wait(0.1)
							end
						end
					end)

					frame.ArrowFrame.Down.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement then
							frame.ArrowFrame.Down.BackgroundTransparency = 1
						end
					end)
				end

				colorSpace.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						local releaseEvent,mouseEvent

						releaseEvent = UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
							releaseEvent:Disconnect()
							mouseEvent:Disconnect()
						end)

						mouseEvent = UserInputService.InputChanged:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement then
								colorSpaceInput()
							end
						end)

						colorSpaceInput()
					end
				end)

				colorStrip.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						local releaseEvent,mouseEvent

						releaseEvent = UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
							releaseEvent:Disconnect()
							mouseEvent:Disconnect()
						end)

						mouseEvent = UserInputService.InputChanged:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement then
								colorStripInput()
							end
						end)

						colorStripInput()
					end
				end)

				local function updateHue(str)
					local num = tonumber(str)
					if num then
						hue = math.clamp(math.floor(num),0,359)/359
						local hsvColor = Color3.fromHSV(hue,sat,val)
						red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
						hueInput.Text = tostring(hue*359)
						updateColor(1)
					end
				end
				hueInput.FocusLost:Connect(function() updateHue(hueInput.Text) end) hookButtons(hueInput,updateHue)

				local function updateSat(str)
					local num = tonumber(str)
					if num then
						sat = math.clamp(math.floor(num),0,255)/255
						local hsvColor = Color3.fromHSV(hue,sat,val)
						red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
						satInput.Text = tostring(sat*255)
						updateColor(1)
					end
				end
				satInput.FocusLost:Connect(function() updateSat(satInput.Text) end) hookButtons(satInput,updateSat)

				local function updateVal(str)
					local num = tonumber(str)
					if num then
						val = math.clamp(math.floor(num),0,255)/255
						local hsvColor = Color3.fromHSV(hue,sat,val)
						red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
						valInput.Text = tostring(val*255)
						updateColor(1)
					end
				end
				valInput.FocusLost:Connect(function() updateVal(valInput.Text) end) hookButtons(valInput,updateVal)

				local function updateRed(str)
					local num = tonumber(str)
					if num then
						red = math.clamp(math.floor(num),0,255)/255
						local newColor = Color3.new(red,green,blue)
						hue,sat,val = Color3.toHSV(newColor)
						redInput.Text = tostring(red*255)
						updateColor(2)
					end
				end
				redInput.FocusLost:Connect(function() updateRed(redInput.Text) end) hookButtons(redInput,updateRed)

				local function updateGreen(str)
					local num = tonumber(str)
					if num then
						green = math.clamp(math.floor(num),0,255)/255
						local newColor = Color3.new(red,green,blue)
						hue,sat,val = Color3.toHSV(newColor)
						greenInput.Text = tostring(green*255)
						updateColor(2)
					end
				end
				greenInput.FocusLost:Connect(function() updateGreen(greenInput.Text) end) hookButtons(greenInput,updateGreen)

				local function updateBlue(str)
					local num = tonumber(str)
					if num then
						blue = math.clamp(math.floor(num),0,255)/255
						local newColor = Color3.new(red,green,blue)
						hue,sat,val = Color3.toHSV(newColor)
						blueInput.Text = tostring(blue*255)
						updateColor(2)
					end
				end
				blueInput.FocusLost:Connect(function() updateBlue(blueInput.Text) end) hookButtons(blueInput,updateBlue)

				local colorChoice = Instance.new("TextButton")
				colorChoice.Name = "Choice"
				colorChoice.Size = UDim2.new(0,25,0,18)
				colorChoice.BorderColor3 = Color3.new(96/255,96/255,96/255)
				colorChoice.Text = ""
				colorChoice.AutoButtonColor = false
				colorChoice.ZIndex = 10

				local row = 0
				local column = 0
				for i,v in pairs(basicColors) do
					local newColor = colorChoice:Clone()
					newColor.BackgroundColor3 = v
					newColor.Position = UDim2.new(0,1 + 30*column,0,21 + 23*row)

					newColor.MouseButton1Click:Connect(function()
						red,green,blue = v.r,v.g,v.b
						local newColor = Color3.new(red,green,blue)
						hue,sat,val = Color3.toHSV(newColor)
						updateColor()
					end)	

					newColor.Parent = basicColorsFrame
					column = column + 1
					if column == 6 then row = row + 1 column = 0 end
				end

				row = 0
				column = 0
				for i = 1,12 do
					local color = customColors[i] or Color3.new(0,0,0)
					local newColor = colorChoice:Clone()
					newColor.BackgroundColor3 = color
					newColor.Position = UDim2.new(0,1 + 30*column,0,20 + 23*row)

					newColor.MouseButton1Click:Connect(function()
						local curColor = customColors[i] or Color3.new(0,0,0)
						red,green,blue = curColor.r,curColor.g,curColor.b
						hue,sat,val = Color3.toHSV(curColor)
						updateColor()
					end)

					newColor.MouseButton2Click:Connect(function()
						customColors[i] = chosenColor
						newColor.BackgroundColor3 = chosenColor
					end)

					newColor.Parent = customColorsFrame
					column = column + 1
					if column == 6 then row = row + 1 column = 0 end
				end

				applyButton.MouseButton1Click:Connect(function()
					ChatColor = {math.floor(chosenColor.r*255),math.floor(chosenColor.g*255),math.floor(chosenColor.b*255)};
					updateFile()
				end)
				applyButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then applyButton.BackgroundTransparency = 0.4 end end)
				applyButton.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then applyButton.BackgroundTransparency = 0 end end)

				defaultButton.MouseButton1Click:Connect(function()
					ChatColor = {255,255,255};
					updateFile()
				end)
				defaultButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then defaultButton.BackgroundTransparency = 0.4 end end)
				defaultButton.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then defaultButton.BackgroundTransparency = 0 end end)

				pickerExit.MouseButton1Click:Connect(function()
					picker:TweenPosition(UDim2.new(0.5, -219, 0, -500), "InOut", "Quart", 0.5, true, nil)
				end)

				updateColor()

				newMt.SetColor = function(self,color)
					red,green,blue = color.r,color.g,color.b
					hue,sat,val = Color3.toHSV(color)
					updateColor()
				end

		picker:TweenPosition(UDim2.new(0.5, -219, 0, 100), "InOut", "Quart", 0.5, true, nil)
	else
		picker:TweenPosition(UDim2.new(0.5, -219, 0, 100), "InOut", "Quart", 0.5, true, nil)
	end
end

local Notification = Instance.new("Frame")
local Title_2 = Instance.new("TextLabel")
local Text_2 = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
Notification.Name = "notification"
Notification.Parent = Chat
Notification.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
Notification.BorderSizePixel = 0
Notification.Position = UDim2.new(1, -500, 1, 20)
Notification.Size = UDim2.new(0, 250, 0, 100)
Notification.ZIndex = 10

Title_2.Name = "Title"
Title_2.Parent = Notification
Title_2.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Title_2.BorderSizePixel = 0
Title_2.Size = UDim2.new(0, 250, 0, 20)
Title_2.Font = Enum.Font.SourceSans
Title_2.TextSize = 14
Title_2.Text = "Notification Title"
Title_2.TextColor3 = Color3.new(1, 1, 1)
Title_2.ZIndex = 10

Text_2.Name = "Text"
Text_2.Parent = Notification
Text_2.BackgroundTransparency = 1
Text_2.BorderSizePixel = 0
Text_2.Position = UDim2.new(0, 5, 0, 25)
Text_2.Size = UDim2.new(0, 240, 0, 75)
Text_2.Font = Enum.Font.SourceSans
Text_2.TextSize = 16
Text_2.Text = "Notification Text"
Text_2.TextColor3 = Color3.new(1, 1, 1)
Text_2.TextWrapped = true
Text_2.ZIndex = 10

CloseButton.Name = "CloseButton"
CloseButton.Parent = Notification
CloseButton.BackgroundTransparency = 1
CloseButton.Position = UDim2.new(1, -20, 0, 0)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Text = ""
CloseButton.ZIndex = 10

pinNotification = nil
local notifyCount = 0
function notify(text,text2,length)
	spawn(function()
		local LnotifyCount = notifyCount+1
		local notificationPinned = false
		notifyCount = notifyCount+1
		if pinNotification then pinNotification:Disconnect() end
		pinNotification = Notification.MouseEnter:Connect(function()
			spawn(function()
				pinNotification:Disconnect()
				notificationPinned = true
				Title_2.BackgroundTransparency = 1
				wait(0.5)
				Title_2.BackgroundTransparency = 0
			end)
		end)
		Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, 0), "InOut", "Quart", 0.5, true, nil)
		wait(0.6)
		local closepressed = false
		if text2 then
			Title_2.Text = text
			Text_2.Text = text2
		else
			Title_2.Text = 'Notification'
			Text_2.Text = text
		end
		Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, -100), "InOut", "Quart", 0.5, true, nil)
		CloseButton.MouseButton1Click:Connect(function()
			Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, 0), "InOut", "Quart", 0.5, true, nil)
			closepressed = true
			pinNotification:Disconnect()
		end)
		if length and isNumber(length) then
			wait(length)
		else
			wait(10)
		end
		if LnotifyCount == notifyCount then
			if closepressed == false and notificationPinned == false then
				pinNotification:Disconnect()
				Notification:TweenPosition(UDim2.new(1, Notification.Position.X.Offset, 1, 0), "InOut", "Quart", 0.5, true, nil)
			end
			notifyCount = 0
		end
	end)
end

ADD_COMMAND('discord','discord',{},true,
function(args)
	local http = game:GetService('HttpService') 
	if toClipboard then
		toClipboard('https://discord.com/invite/YmB9RZpbEn')
		notify('Discord Invite', 'Copied to clipboard!\ndiscord.gg/YmB9RZpbEn')
	else
		notify('Discord Invite', 'discord.gg/YmB9RZpbEn')
	end 
	local req = (syn and syn.request) or (http and http.request) or http_request
	if req then
		req({
			Url = 'http://127.0.0.1:6463/rpc?v=1',
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'application/json',
				Origin = 'https://discord.com'
			},
			Body = http:JSONEncode({
				cmd = 'INVITE_BROWSER',
				nonce = http:GenerateGUID(false),
				args = {code = 'YmB9RZpbEn'}
			})
		})
	end
end)

ADD_COMMAND('invite','invite',{},true,
function(args)
	local forPlayer = args[1] or "all";
	sendServerRequest({
		['Action'] = 'Invite',
		['Username'] = username,
		['ForPlayer'] = forPlayer;
		['PlaceId'] = game.PlaceId,
		['JobId'] = game.JobId,
		['UniqueCode'] = UniqueCode,
	})
end)

ADD_COMMAND('ignoredlist','ignoredlist',{},true,
function(args)
	notify("Encrypted Chat", "Ignored Users: "..table.concat(Ignored, ", "))
end)

ADD_COMMAND('ignore','ignore',{},true,
function(args)
	local Players = GetPlayers(args[1])
	if #Players > 0 then
		local Player = GetPlayers(args[1])[1]
		if not FindInTable(Ignored, Player.Name) then
			table.insert(Ignored, Player.Name)
			notify("Encrypted Chat", "Ignored user: "..Player.Name)
		end
	end
end)
ADD_COMMAND('unignore','unignore',{},true,
function(args)
	local Players = GetPlayers(args[1])
	if #Players > 0 then
		local Player = GetPlayers(args[1])[1]
		if FindInTable(Ignored, Player.Name) then
			table.remove(Ignored, GetInTable(Ignored, Player.Name))
			notify("Encrypted Chat", "Unignored user: "..Player.Name)
		end
	end
	
end)

ADD_COMMAND('changekey','',{"changecode", "key"},true,
function(args)
	if(args[1]:lower() == "default") then
		ChangableKey = 29394972;
		notify("Encrypted Chat", "Changed security code to default")
	else 
		ChangableKey = tonumber(args[1]);
		notify("Encrypted Chat", "Changed security code to: " .. ChangableKey)
	end
	updateFile()
end)

ADD_COMMAND('users','',{},false,
function(args)
	sendServerRequest({
		['Action'] = 'GetUsers',
		['UniqueCode'] = UniqueCode,
	})
end)

ADD_COMMAND('prefix','',{},true,
function(args)
	if(args[1]) then
		ECPrefix = string.sub(args[1], 1, 1)
		ChatBar.PlaceholderText = "To chat click here or press " .. ECPrefix .." key"
		updateFile()
		notify("Encrypted Chat", "Changed prefix to: " .. string.sub(args[1], 1, 1))
	end
end)

ADD_COMMAND('ocprefix','',{},true,
function(args)
	if(args[1]) then
		ECOPPrefix = string.sub(args[1], 1, 1)
		updateFile()
		notify("Encrypted Chat", "Changed prefix to: " .. ECOPPrefix)
	end
end)

--MODERATOR CMDS
ADD_COMMAND('close','',{},false,
function(args)
	client:Close()
end)

ADD_COMMAND('friends','',{},false,
function(args)
	getFriendsList()
	FriendsGui.MainFrame.Visible = true
end)

ADD_COMMAND('reconnect','',{'rejoin','rj'},false,
function(args)
	if(Connected) then
		client:Close()
		wait(2)
	end
	ClientConnection();
end)

ADD_COMMAND('join','',{},false,
function(args)
	ClientConnection();
end)

ADD_COMMAND('purge','',{},false,
function(args)
	local amount = 100;
	if(args[1]) then
		amount = tonumber(args[1]);
	end
	sendServerRequest({
		['Action'] = 'PurgeChat',
		['Amount'] = amount,
		['Username'] = username,
		['UniqueCode'] = UniqueCode,
	})
end)

ADD_COMMAND('mute','',{},true,
function(args)
	if(args[1]) then
		local addTime = ""
		for Index, Value in pairs(args) do
			addTime = (addTime.."%s "):format(Value)
		end
		sendServerRequest({
			['Action'] = 'Mute',
			['Username'] = username,
			['ToPlayer'] = args[1],
			['Time'] = addTime or "Perm",
			['UniqueCode'] = UniqueCode,
		})
	end
end)

ADD_COMMAND('unmute','',{},true,
function(args)
	if(args[1]) then
		sendServerRequest({
			['Action'] = 'UnMute',
			['Username'] = username,
			['ToPlayer'] = args[1],
			['UniqueCode'] = UniqueCode,
		})
	end
end)

ADD_COMMAND('tempban','',{},true,
function(args)
	if(args[1]) then
		sendServerRequest({
			['Action'] = 'TempBan',
			['Username'] = username,
			['Minutes'] = args[2],
			['ToPlayer'] = args[1],
			['UniqueCode'] = UniqueCode,
		})
	end
end)

ADD_COMMAND('ban','',{},true,
function(args)
	if(args[1]) then
		sendServerRequest({
			['Action'] = 'Ban',
			['Username'] = username,
			['ToPlayer'] = args[1],
			['UniqueCode'] = UniqueCode,
		})
	end
end)

ADD_COMMAND('unban','',{},true,
function(args)
	if(args[1]) then
		sendServerRequest({
			['Action'] = 'UnBan',
			['Username'] = username,
			['ToPlayer'] = args[1],
			['UniqueCode'] = UniqueCode,
		})
	end
end)
ADD_COMMAND('banip','',{'ipban'},true,
function(args)
	if(args[1]) then
		sendServerRequest({
			['Action'] = 'BanIp',
			['Username'] = username,
			['ToPlayer'] = args[1],
			['UniqueCode'] = UniqueCode;
		})
	end
end)

ADD_COMMAND('unbanip','',{'unipban'},true,
function(args)
	if(args[1]) then
		sendServerRequest({
			['Action'] = 'UnBanIp',
			['Username'] = username,
			['ToPlayer'] = args[1],
			['UniqueCode'] = UniqueCode;
		})
	end
end)

ADD_COMMAND('silent','silent',{},true,
function(args)	
	if(NotificationSoundsEnabled == false) then
		NotificationSoundsEnabled = true;
		updateFile()
		notify("Encrypted Chat", "Silent mode disabled")
	else
		NotificationSoundsEnabled = false;
		updateFile()
		notify("Encrypted Chat", "Silent mode enabled")
	end
end)

ADD_COMMAND('clear','',{},false,
function(args)
	for i,v in pairs(getOpenedChat().Scroller:GetChildren()) do
		if(v.Name == "MessageContainer") then
			v:Destroy()
		end
	end
	getOpenedChat().Scroller.CanvasSize = UDim2.new(0, 0, 0, getOpenedChat().Scroller.UIListLayout.AbsoluteContentSize.Y)
	getOpenedChat().Scroller.CanvasPosition = Vector2.new(0,0)
end)

ADD_COMMAND('profile','',{},false,
function(args)
	if(args[1]) then
		sendServerRequest({
			['Action'] = 'getProfile',
			['Username'] = username,
			['findPlayer'] = args[1],
			['UniqueCode'] = UniqueCode;
		})
	end
end)

ADD_COMMAND('changelog','',{},false,
function(args)
	openDialog("ChangeLog");
end)

ADD_COMMAND('cmds','',{"commands"},false,
function(args)
	openDialog("Cmds");
end)

ADD_COMMAND('password','password',{'uniquekey'},false,
function(args)
	notify("Encrypted Chat", "Copied your unique key to your clipboard")
	toClipboard(UniqueCode);
end)

ADD_COMMAND('chatcolor','chatcolor',{},false,
function(args)
	ChangeChatColor()
end)

ChatWindow.Visible = true
ChatIcon2.ImageColor3 = Color3.new(0, 255, 0)
Scroller.ScrollBarImageTransparency = 0.4
unread_counter = 0
ChatCounterText2.Text = "0"
ChatCounter2.Visible = false
dragGUI(ChatWindow)

spawn(function()
	wait(10);
	client:Send(json_encode({
		['Action'] = 'UpdateInfo',
		['Username'] = username,
		['PlaceId'] = game.PlaceId,
		['UserId'] = game.Players.LocalPlayer.UserId,
		['Exploit'] = Exploit,
		['UniqueCode'] = UniqueCode,
	}));
end)

end)

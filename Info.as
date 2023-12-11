array<string> getInfo(){
    CTrackMania@ app = cast<CTrackMania>(GetApp());

    array<string> info = {};

    auto user = app.CurrentProfile;
#if UNITED
    if (user!=null)info.InsertLast("Username : "+ColoredStringUnited(user.NickName)+" ("+user.OnlineLogin+")");
#elif TMNEXT
    auto msUsers = app.ManiaPlanetScriptAPI.MasterServer_MSUsers;
    if (msUsers.Length>0)info.InsertLast("Username : "+msUsers[0].DisplayName + " ("+msUsers[0].Login+")");
#else
    if (user!=null)info.InsertLast("Username : "+ColoredString(user.DisplayProfileName)+" ("+user.AccountSettings.OnlineLogin+")");
#endif

    // OS
    string OSStr = "Unknown";
#if WINDOWS
    OSStr = "Windows";
#elif LINUX
    OSStr = "Linux";
#else
    OSStr = "Unknown";
#endif
#if SERVER
    OSStr += " on dedicated server"; //How are you even displaying this
#endif
    info.InsertLast("OS : " + OSStr);

    // GAME
    string gameStr = "Unknown";
#if TMNEXT
    gameStr = "Trackmania (2020)";
#elif MP41
    gameStr = "Maniaplanet 4.1";
#elif MP40
    gameStr = "Maniaplanet 4.0";
#elif MP3
    gameStr = "Maniaplanet 3";
#elif TURBO
    gameStr = "Trackmania Turbo";
#elif UNITED
    gameStr = "Trackmania United";
#endif
#if LOGS
    gameStr += " (Logs)";
#endif
#if HAS_DEV
    gameStr += " (Dev)";
#endif
#if MANIA64
    gameStr += " 64-Bit";
#elif MANIA32
    gameStr += " 32-Bit";
#endif
    info.InsertLast("Game : "+gameStr);

    // GAMEVERSION
#if UNITED
//TODO find out
#else
    info.InsertLast("Version : "+ app.ManiaPlanetScriptAPI.ExeVersion); 
#endif
                
    // PLATFORM
#if UNITED
//Unsure if possible
#elif !TURBO && !MP3
    info.InsertLast("Platform : "+str(app.ManiaPlanetScriptAPI.System.Platform));
#else
    info.InsertLast("Platform : " + str(app.ManiaPlanetScriptAPI.SystemPlatform));
#endif

    // GPU
#if UNITED
//Unsure if possible
#elif !TURBO && !MP3
    auto displaySettings = app.ManiaPlanetScriptAPI.DisplaySettings;
    if (displaySettings!=null)info.InsertLast("GPU : "+app.ManiaPlanetScriptAPI.DisplaySettings.DeviceInfo);
#else
//Unsure if possible
#endif

    // DISPLAY
#if UNITED
    auto window = cast<CVisionViewportDx9>(app.Viewport).SystemWindow;
    info.InsertLast("Display Size : "+ (window.SizeX+","+window.SizeY));
    info.InsertLast("Display Status : "+ window.StatusString);
#elif !TURBO && !MP3
    if (displaySettings!=null)info.InsertLast("Display : " + str(displaySettings.DisplayMode) + " @ " + str(displaySettings.DisplayMode==CGameDisplaySettingsWrapper::EDisplayMode::Windowed?displaySettings.WindowSize:displaySettings.FullscreenSize));
#else
    auto window = cast<CDx11Viewport>(app.Viewport).SystemWindow;
    info.InsertLast("Display Size : "+ (window.SizeX+","+window.SizeY));
    info.InsertLast("Display Status : "+ window.StatusString);
#endif

    //AUDIO
    info.InsertLast("Audio : " + cast<COalAudioPort>(app.AudioPort).DeviceName);

    // OPENPLANET
#if UNITED
    info.InsertLast("Openplanet : " + Meta::OpenplanetBuildInfo());
#else
    info.InsertLast("Openplanet : " + Meta::OpenplanetBuildInfo() + (Meta::IsDeveloperMode()?" in developer mode":""));
#endif
    // PACKAGES
    auto loadedPlugins = Meta::AllPlugins();
    int pm = 0;
    int b = 0;
    int d = 0;
    for (int i = 0; i<loadedPlugins.Length; i++){
        if (loadedPlugins[i].Source == Meta::PluginSource::ApplicationFolder)b++;
        else if (loadedPlugins[i].SiteID!=0)pm++;
        else d++;
    }
    info.InsertLast("Plugins : " + pm + " (Openplanet.dev), " + b + " (Builtin), " + d + " (Other)");
    
    // DEVICES
    CInputPort@ dx8 = app.InputPort;
    for (int i = 0; i<dx8.ConnectedDevices.Length; i++){
#if UNITED
        info.InsertLast("Device : " + dx8.ConnectedDevices[i].DeviceName + " (" + dx8.ConnectedDevices[i].InstanceName + ")");
#else
        info.InsertLast("Device : " + dx8.ConnectedDevices[i].DeviceModelName + " (" + dx8.ConnectedDevices[i].InstanceName + ")");
#endif
    }

    return info;
}
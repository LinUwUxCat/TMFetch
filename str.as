/*

    To-String utilities.

 */
string str(int2 a){
    return a.x+ "," + a.y;
}
string str(int3 a){
    return a.x+ "," + a.y + "," + a.z;
}
#if !UNITED && !TURBO && !MP3
string str(CGameDisplaySettingsWrapper::EDisplayMode DisplayMode){
    switch (DisplayMode){
        case CGameDisplaySettingsWrapper::EDisplayMode::Windowed:
            return "Windowed";
        case CGameDisplaySettingsWrapper::EDisplayMode::WindowedFull:
            return "Borderless Windowed";
        case CGameDisplaySettingsWrapper::EDisplayMode::FullscreenExclusive:
            return "Fullscreen";
        default:
            return "Unknown";
    }
}

string str(CSystemPlatformScript::ESystemPlatform platform){
    switch (platform){
        case CSystemPlatformScript::ESystemPlatform::None:
            return "Standalone";
        case CSystemPlatformScript::ESystemPlatform::Steam:
            return "Steam";
        case CSystemPlatformScript::ESystemPlatform::UPlay:
            return "Ubisoft Connect";
        case CSystemPlatformScript::ESystemPlatform::PS4:
            return "Playstation 4";
        case CSystemPlatformScript::ESystemPlatform::XBoxOne:
            return "XBox One";
#if TMNEXT
        case CSystemPlatformScript::ESystemPlatform::PS5:
            return "Playstation 5";
        case CSystemPlatformScript::ESystemPlatform::XBoxSeries:
            return "XBox Series";
        case CSystemPlatformScript::ESystemPlatform::Stadia:
            return "Google Stadia";
        case CSystemPlatformScript::ESystemPlatform::Luna:
            return "Amazon Luna";
#endif
        default:
            return "Unknown";
    }
}
#endif

#if !UNITED
string str(CGameManiaPlanetScriptAPI::ESystemPlatform platform){
    switch (platform){
        case CGameManiaPlanetScriptAPI::ESystemPlatform::None:
            return "Standalone";
        case CGameManiaPlanetScriptAPI::ESystemPlatform::Steam:
            return "Steam";
        case CGameManiaPlanetScriptAPI::ESystemPlatform::UPlay:
            return "Ubisoft Connect";
        case CGameManiaPlanetScriptAPI::ESystemPlatform::PS4:
            return "Playstation 4";
        case CGameManiaPlanetScriptAPI::ESystemPlatform::XBoxOne:
            return "XBox One";
        default:
            return "Unknown";
    }
}
#endif
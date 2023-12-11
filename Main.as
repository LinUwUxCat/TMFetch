#if !UNITED
UI::Font@ monoFont;
#endif
void Main(){
#if !UNITED
    @monoFont = UI::LoadFont("DroidSansMono.ttf", 16);
#endif
}

void RenderMenu(){
    if(UI::MenuItem("TMFetch", "", Setting_WindowShown)){
        Setting_WindowShown = !Setting_WindowShown;
    }
}

void RenderInterface(){
    if (!Setting_WindowShown)return;
    if (UI::Begin("TMFetch", Setting_WindowShown)){
        if (UI::BeginTable("TMFetch.Table", 2, UI::TableFlags::SizingStretchProp)){
            UI::TableSetupColumn("###TMFetch.Table.Column-Logo");
            UI::TableSetupColumn("###TMFetch.Table.Column-Info");
            if (UI::TableNextColumn()){
#if !UNITED
                UI::PushFont(monoFont);
                UI::Text(getLogo());
                UI::PopFont();
#else
                UI::Text(getLogo());
#endif
            }
            if (UI::TableNextColumn()){
                auto info = getInfo();
                string infostr = "";
                for(int i = 0; i<info.Length; i++){
                    infostr+=info[i]+"\n";
                }
                UI::Text(infostr);
            }

            UI::EndTable();
        }
    } UI::End();
}
string ColoredStringUnited(string s){
    string outs = "";
    for(int i = 0; i<s.Length; i++){
        if (s.SubStr(i, 1)=="$"){
            outs += "\\";
        }
        outs += s.SubStr(i, 1);
    }
    return outs+"\\$z";
}
titleText ["","BLACK FADED",999];
sleep 5;

titleText ["", "BLACK IN", 15];
15 fadeSound 1;

sleep 25;


player action ["WeaponOnBack", player];



[
    [
        ["O P E R A T I O N   T A F E L S I L B E R","<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t align = 'center' shadow = '0' size = '1.5' font='EtelkaNarrowMediumPro'>%1</t><br/><br/>",25],
        ["McDiod und nomisum für Gruppe Adler","<t align = 'right' color='#80ffffff' shadow = '0' size = '0.5'>%1</t>",50]
    ]
] spawn BIS_fnc_typeText;
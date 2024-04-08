/*
Program notes:
This program is about a story of Mario and Luigi. It contain
six part (including file 4.5 but file 5 is not included, it is
just a preparation file)

My prompt for how to managing this piece and my power point is also in
the folder of the project. MY first part is to start it, and then 
there is a counting number of rocket launch. and then the radio
part included switch to other channels. i also use a pitshift ugen
to change my voice to an alien. 
*/

// Score with Hid

Hid key;
HidMsg keymsg;
1 => int keyboard;
if( key.openKeyboard(keyboard) == false ) me.exit();
<<< "keyboard '" + key.name() + "' ready", "" >>>;

int one, two, three, four, fourptfive, six;

while(true){
    // 2nd part
    key => now;
    while (key.recv(keymsg))
    {
        if (keymsg.isButtonDown())
        {
            <<< "Button Down:", keymsg.ascii >>>;
            if (keymsg.ascii == 91) // number "[" on keyboard
            {
                Machine.add(me.dir()+"/Zhang_Hanzhi_Final_1.ck") => one;
                
            }
            if (keymsg.ascii == 93) // number "]" on keyboard
            {
                Machine.add(me.dir()+"/Zhang_Hanzhi_Final_2.ck") => two;

            }
            if (keymsg.ascii == 92) // number "\" on keyboard
            {
                Machine.add(me.dir()+"/Zhang_Hanzhi_Final_3.ck") => three;

            }
            if (keymsg.ascii == 44) // number "<" on keyboard
            {
                Machine.add(me.dir()+"/Zhang_Hanzhi_Final_4.ck") => four;
            }
            if (keymsg.ascii == 46) // number ">" on keyboard
            {
                Machine.add(me.dir()+"/Zhang_Hanzhi_Final_4.5.ck") => fourptfive;
            }
            if (keymsg.ascii == 47) // number "?" on keyboard
            {
                Machine.add(me.dir()+"/Zhang_Hanzhi_Final_6.ck") => six;
            }     
            // remove code
            if (keymsg.ascii == 89) // numnber "Y" on keyboard
            { // remove all code 
                Machine.remove(one);
            }             
            // remove code
            if (keymsg.ascii == 85) // numnber "U" on keyboard
            { // remove all code 
                Machine.remove(two);
            }      
            // remove code
            if (keymsg.ascii == 73) // numnber "I" on keyboard
            { // remove all code 
                Machine.remove(three);
            }
            // remove code
            if (keymsg.ascii == 79) // numnber "O" on keyboard
            { // remove all code 
                Machine.remove(four);
            }
            // remove code
            if (keymsg.ascii == 80) // numnber "P" on keyboard
            { // remove all code 
                Machine.remove(fourptfive);
            }
            // remove code
            if (keymsg.ascii == 39) // numnber "'" on keyboard
            { // remove all code 
                Machine.remove(six);
            }
        }
    }
}
            
fun void joy2()
{
//joystick
Hid jst;
HidMsg jstmsg;
//name the joystick
0 => int joystick;
// try to open joystick
if( jst.openJoystick(joystick) == false ) me.exit();
// print
<<< "joystick '" + jst.name() + "' ready", "" >>>;

// electric sound 
SqrOsc sqr => Pan2 sqrpan => dac;
//mute it first
0 => sqr.gain;


//start 
while(true){
    
    
    // 1st part: semitone scale    
    jst => now;
    while (jst.recv(jstmsg))
    {
        if (jstmsg.isButtonDown() )
        {
            <<< "joystick button", jstmsg.which, "down" >>>;
            if (jstmsg.which == 1) // button 1
            {
                60+12*2 => int startnote; //start note
                // part of the semitone raising
                while (startnote >= 60-12) {
                    Std.mtof(startnote) => sqr.freq;
                    0.1 => sqr.gain;
                    0.2 :: second => now;
                    1 -=> startnote;
                    0.2 => sqrpan.gain;
                } 
                0 => sqr.gain;
                
                0.5 :: second => now;
                
                // next thing: mario sound
                SndBuf mario2 => Pan2 mario2pan => dac;
                me.dir() + "/audio/smb_world_clear.wav" => mario2.read;
                0 => mario2.pos;
                0.4 => mario2.gain;
                0.3 => mario2pan.gain;
            } 
        }
    } 
}
}

fun void key2()
{
SndBuf allendsound => Pan2 pan => dac;
SndBuf yahoo => pan => dac;
me.dir() + "/audio/allendsound.wav" => allendsound.read;
me.dir() + "/audio/yahoo.wav" => yahoo.read;
allendsound.samples() => allendsound.pos;
yahoo.samples() => yahoo.pos;

// set up the keyboard hid
Hid kyb;
HidMsg kybmsg;
1 => int keyboard;
if( kyb.openKeyboard(keyboard) == false ) me.exit();
<<< "keyboard '" + kyb.name() + "' ready", "" >>>;

while(true){
    // 2nd part
    kyb => now;
    while (kyb.recv(kybmsg))
    {
        if (kybmsg.isButtonDown())
        {
            <<< "Button Down:", kybmsg.ascii >>>;
            if (kybmsg.ascii == 78) // "n"
            {
                0 => allendsound.pos;
                0.07 => pan.gain;
            }
            if (kybmsg.ascii == 77) // "m"
            {
                0 => yahoo.pos;
                0.07 => pan.gain;
            }
        }
    }
}
}

spork ~ key2();
spork ~ joy2();
while(true) 1::second => now;
                
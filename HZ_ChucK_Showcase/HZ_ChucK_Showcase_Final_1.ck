/* 
Hanzhi Zhang Final Showcase
*/

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
        if (jstmsg.which == 0) // button 0
        {
            60-12 => int startnote; //start note
            // part of the semitone raising
            while (startnote <= 60+12*2) {
                Std.mtof(startnote) => sqr.freq;
                0.05 => sqr.gain;
                0.3 => sqrpan.gain;
                0.2 :: second => now;
                1 +=> startnote;
            } 
            0 => sqr.gain;
            0 => sqrpan.gain;
            
            0.5:: second => now;
            
            // next thing: mario sound
            SndBuf mario1 => Pan2 mariopan => dac;
            me.dir() + "/audio/smb_stage_clear.wav" => mario1.read;
            0 => mario1.pos;
            0.7 => mario1.gain;
            0.3 => mariopan.gain;
        } 
    }
}



}
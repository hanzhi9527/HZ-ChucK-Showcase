SndBuf alifire => Pan2 alifirepan => dac; //alienfire
SndBuf mshoot => Pan2 mshootpan => dac; // marioshoot
me.dir() + "/audio/alienfire.wav" => alifire.read;
me.dir() + "/audio/marioshoot.wav" => mshoot.read;
alifire.samples() => alifire.pos;
mshoot.samples() => mshoot.pos;

// infinite event loop

    // make HidIn and HidMsg
    Hid jst;
    HidMsg jstmsg;
    // which joystick
    0 => int joystick;
    // open joystick 0, exit on faila
    if( !jst.openJoystick( joystick ) ) me.exit();
    <<< "joystick '" + jst.name() + "' ready", "" >>>;

// alien voice
adc => PitShift pit => Gain gain1 =>  dac;
adc => Gain gain2 => dac;    

0  => gain1.gain => gain2.gain;
// messages received
while(true){
    jst => now;
    
    while( jst.recv( jstmsg ) )
    {

        
        if (jstmsg.isButtonDown())
        {
           
            <<< "button:", jstmsg.which >>>;
            
            
            // set a temporary variable
            0 => int variable;
            if (jstmsg.which == 6) // button "7"
            {
                1 => variable; 
                <<< "1" >>>;
            }
            if (jstmsg.which == 7) // button "8"
            {
                0 => variable;
                <<< "0" >>>;
            }
            
            if (jstmsg.which == 6 || jstmsg.which == 7) // button "7"
            {

                1.4 => pit.shift; 
                if (variable == 1)
                {
                    1.5 => pit.gain;
                    0.3 => gain1.gain;
                    0 => gain2.gain;
                    1.0::second => now;
                    <<< "success" >>>;
                }
                if (variable == 0)
                {
                    0 => pit.gain;
                    0 => gain1.gain;
                    0.2 => gain2.gain;
                    1.0:: second => now;
                    <<< "fail" >>>;
                }
                
            }
            
            if (jstmsg.which == 2) // button 2
            {
                0 => alifire.pos;
            } 
            if (jstmsg.which == 3) // button 3
            {
                0 => mshoot.pos;
            }
        }
    }
}
SndBuf song => Pan2 pan => dac;
SndBuf BBCmusic => pan => dac;
SndBuf oina => pan => dac;
SndBuf fball => pan => dac;
SndBuf rdstrt => pan => dac;
me.dir() + "/audio/morningmood.wav" => song.read;
me.dir() + "/audio/BBCmusic.wav" => BBCmusic.read;
me.dir() + "/audio/outinamerica.wav" => oina.read;
me.dir() + "/audio/footballradio.wav" => fball.read;
me.dir() + "/audio/radiostart.wav" => rdstrt.read;
song.samples() => song.pos;
BBCmusic.samples() => BBCmusic.pos;
oina.samples() => oina.pos;
fball.samples() => fball.pos;
rdstrt.samples() => rdstrt.pos;

Math.random2(0,5) => int channel;

//joystick
Hid jst;
HidMsg jstmsg;
//name the joystick
0 => int joystick;
// try to open joystick
if( jst.openJoystick(joystick) == false ) me.exit();
// print
<<< "joystick '" + jst.name() + "' ready", "" >>>;

0 => float center;
center => pan.pan; // center the panposition first


//start 

while(true){
    
    
    // 1st part: semitone scale    
    jst => now;
    while (jst.recv(jstmsg))
    {
        if (jstmsg.isButtonDown() || jstmsg.isAxisMotion())
        {
            <<< "joystick button", jstmsg.which, "down" >>>;
            <<< "joystick axis", jstmsg.which == 0, ":", jstmsg.axisPosition >>>;
            if (jstmsg.which == 10) // button "11"
            {
                0 => song.pos;
                BBCmusic.samples() => BBCmusic.pos;
                oina.samples() => oina.pos;
                fball.samples() => fball.pos;
                pan.chan(0); // channel
                0.15 => pan.gain;
                
            } 
            
            //change the panning
            if (jstmsg.which == 0 && jstmsg.axisPosition <= -0.4 && pan.pan() >= -1.0) // axis left
            {
                -0.1 + pan.pan() => pan.pan; // move the pan to the left
                <<< "left" >>>;
            }
            if (jstmsg.which == 0 && jstmsg.axisPosition >= 0.4 && pan.pan() <= 1.0) // axis right
            {
                0.1 + pan.pan() => pan.pan; // move the pan to the right
                <<< "right" >>>;
            }
            
            // is it possible to track the sound we use before?
            if (jstmsg.which == 11) // button  "12"
            {
                0 => BBCmusic.pos;
                song.samples() => song.pos;
                oina.samples() => oina.pos;
                fball.samples() => fball.pos;
                0.1 => pan.gain;
                pan.chan(5);
            }
            if (jstmsg.which == 9) // button  "10"
            {
                0 => oina.pos;
                BBCmusic.samples() => BBCmusic.pos;
                song.samples() => song.pos;
                fball.samples() => fball.pos;
                0.1 => pan.gain;
                pan.chan(2);
            }
            if (jstmsg.which == 8) // button "9"
            {
                0 => fball.pos;
                BBCmusic.samples() => BBCmusic.pos;
                song.samples() => song.pos;
                oina.samples() => oina.pos;
                0.1 => pan.gain;
                pan.chan(1);
            }
            if (jstmsg.which == 5) // button "5"
            {
                song.samples() => song.pos;
                BBCmusic.samples() => BBCmusic.pos;
                oina.samples() => oina.pos;
                fball.samples() => fball.pos;
                rdstrt.samples() => rdstrt.pos;
            }
            if (jstmsg.which == 4) // button "4"
            {
                0 => rdstrt.pos;
                song.samples() => song.pos;
                BBCmusic.samples() => BBCmusic.pos;
                oina.samples() => oina.pos;
                fball.samples() => fball.pos;
                0.1 => pan.gain;
                pan.chan(4);
            }
            if (jstmsg.which == 0) // front button
            {
                channel => pan.chan; 
                0.2 => pan.gain; // change the channel
            }    
        }
    }

}

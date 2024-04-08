SndBuf aliapr => Pan2 aliaprpan => dac; // alienappear
SndBuf alistrt => Pan2 alistrtpan => dac;//alienstarttalking
SndBuf hoohoo => Pan2 hhpan => dac;     //hoohoo
SndBuf dsmi => Pan2 dsmipan => dac;   //devilsmile

SndBuf boing => Pan2 boingpan => dac;   //boing

SndBuf alilv => Pan2 alilvpan => dac; //alienleave
SndBuf alilv2 => Pan2 alilv2pan => dac; //alienleave2
SndBuf phew => Pan2 phewpan => dac; //phew
SndBuf firevic => Pan2 firevicpan => dac; //firevictory

me.dir() + "/audio/alienappear.wav" => aliapr.read;
me.dir() + "/audio/alienstarttalking.wav" => alistrt.read;
me.dir() + "/audio/hoohoo.wav" => hoohoo.read;
me.dir() + "/audio/devilsmile.wav" => dsmi.read;

me.dir() + "/audio/sm64_mario_boing.wav" => boing.read;

me.dir() + "/audio/alienleave.wav" => alilv.read;
me.dir() + "/audio/alienleave2.wav" => alilv2.read;
me.dir() + "/audio/phew.wav" => phew.read;
me.dir() + "/audio/firevictory.wav" => firevic.read;

aliapr.samples() => aliapr.pos;
alistrt.samples() => alistrt.pos;
hoohoo.samples() => hoohoo.pos;
dsmi.samples() => dsmi.pos;

boing.samples() => boing.pos;

alilv.samples() => alilv.pos;
alilv2.samples() => alilv2.pos;
phew.samples() => phew.pos;
firevic.samples() => firevic.pos;

    //keyboard
    Hid kyb;
    HidMsg kybmsg;
    1 => int keyboard;
    // open keyboard 0, exit on fail
    if (!kyb.openKeyboard (keyboard) ) me.exit();
    <<< "keyboard '" + kyb.name() + "'ready", "" >>>;


    
while(true)
{
    kyb => now;
    
    while (kyb.recv (kybmsg) )
    {
        if (kybmsg.isButtonDown())
        {
            <<< "button:", kybmsg.ascii >>>;
            
            if (kybmsg.ascii == 81) // button "q"
            {
                0 => aliapr.pos;    //alien appear
            }
            if (kybmsg.ascii == 87) // button "w"
            {
                0 => alistrt.pos;   //alien start talking
            }
            if (kybmsg.ascii == 69) // button "e"
            {
                0 => hoohoo.pos;  // hoo hoo
            }
            if (kybmsg.ascii == 82) // button "r"
            {
                0 => dsmi.pos;   // devil smile
            }
            if (kybmsg.ascii == 65) // button "a"
            {
                0 => boing.pos;  // boing
            }
            if (kybmsg.ascii == 83) // button "s"
            {
                0 => alilv.pos;   //alien leave
            }
            if (kybmsg.ascii == 68) // button "d"
            {
                0 => alilv2.pos;   //alien leave2
            }
            if (kybmsg.ascii == 70) // button "f"
            {
                0 => phew.pos;   //phew
            }
            if (kybmsg.ascii == 71) // button "g"
            {
                0 => firevic.pos;   //fire victory
            }
            
                
        }
    }
}
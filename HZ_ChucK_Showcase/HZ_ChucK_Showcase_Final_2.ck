// counting numbers' sound
SndBuf no1 => Pan2 pan => dac;
SndBuf no2 => pan => dac;
SndBuf no3 => pan => dac;
SndBuf no4 => pan => dac;
SndBuf no5 => pan => dac;
SndBuf no6 => pan => dac;
SndBuf no7 => pan => dac;
SndBuf no8 => pan => dac;
SndBuf no9 => pan => dac;
SndBuf no10 => pan => dac;
SndBuf hwg => pan => dac; // here we go
SndBuf lsg => pan => dac; // letsago
SndBuf rckl => pan => dac; // rocketlaunch
SndBuf hihat6 => pan => dac; // hihat 6
SndBuf snare4 => pan => dac; // snare 4
SndBuf error => pan => dac; // error
me.dir() + "/audio/01.wav" => no1.read;
me.dir() + "/audio/02.wav" => no2.read;
me.dir() + "/audio/03.wav" => no3.read;
me.dir() + "/audio/04.wav" => no4.read;
me.dir() + "/audio/05.wav" => no5.read;
me.dir() + "/audio/06.wav" => no6.read;
me.dir() + "/audio/07.wav" => no7.read;
me.dir() + "/audio/08.wav" => no8.read;
me.dir() + "/audio/09.wav" => no9.read;
me.dir() + "/audio/10.wav" => no10.read;
me.dir() + "/audio/herewego.wav" => hwg.read;
me.dir() + "/audio/letsago.wav" => lsg.read;
me.dir() + "/audio/rocketlaunch.wav" => rckl.read;
me.dir() + "/audio/hihat6.wav" => hihat6.read;
me.dir() + "/audio/snare4.wav" => snare4.read;
me.dir() + "/audio/error.wav" => error.read;
no1.samples() => no1.pos;
no2.samples() => no2.pos;
no3.samples() => no3.pos;
no4.samples() => no4.pos;
no5.samples() => no5.pos;
no6.samples() => no6.pos;
no7.samples() => no7.pos;
no8.samples() => no8.pos;
no9.samples() => no9.pos;
no10.samples() => no10.pos;
hwg.samples() => hwg.pos;
lsg.samples() => lsg.pos;
rckl.samples() => rckl.pos;
hihat6.samples() => hihat6.pos;
snare4.samples() => snare4.pos;
error.samples() => error.pos;

0.3 => no1.gain => no2.gain => no3.gain => no4.gain => no5.gain => no6.gain => no7.gain => no8.gain => no9.gain => no10.gain;

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
        if (kybmsg.ascii == 48) // number 0 on keyboard
        {
no1.samples() => no1.pos;
no2.samples() => no2.pos;
no3.samples() => no3.pos;
no4.samples() => no4.pos;
no5.samples() => no5.pos;
no6.samples() => no6.pos;
no7.samples() => no7.pos;
no8.samples() => no8.pos;
no9.samples() => no9.pos;
hihat6.samples() => hihat6.pos;
snare4.samples() => snare4.pos;
            0 => no10.pos;
            0.2 => pan.gain;
            pan.chan(0);
        }
        if (kybmsg.ascii == 49) // number 1
        {
no10.samples() => no10.pos;
no2.samples() => no2.pos;
no3.samples() => no3.pos;
no4.samples() => no4.pos;
no5.samples() => no5.pos;
no6.samples() => no6.pos;
no7.samples() => no7.pos;
no8.samples() => no8.pos;
no9.samples() => no9.pos;
hihat6.samples() => hihat6.pos;
snare4.samples() => snare4.pos;
            0 => no1.pos;
            0.2 => pan.gain;
            pan.chan(0);
        }
        if (kybmsg.ascii == 50) // number 2
        {
no1.samples() => no1.pos;
no10.samples() => no10.pos;
no3.samples() => no3.pos;
no4.samples() => no4.pos;
no5.samples() => no5.pos;
no6.samples() => no6.pos;
no7.samples() => no7.pos;
no8.samples() => no8.pos;
no9.samples() => no9.pos;
hihat6.samples() => hihat6.pos;
snare4.samples() => snare4.pos;
            0 => no2.pos;
            0.2 => pan.gain;
            pan.chan(1);
        }
        if (kybmsg.ascii == 51) // number 3
        {
no1.samples() => no1.pos;
no2.samples() => no2.pos;
no10.samples() => no10.pos;
no4.samples() => no4.pos;
no5.samples() => no5.pos;
no6.samples() => no6.pos;
no7.samples() => no7.pos;
no8.samples() => no8.pos;
no9.samples() => no9.pos;
hihat6.samples() => hihat6.pos;
snare4.samples() => snare4.pos;
            0 => no3.pos;
            0.2 => pan.gain;
            pan.chan(2);
        }
        if (kybmsg.ascii == 52) // number 4
        {
no1.samples() => no1.pos;
no2.samples() => no2.pos;
no3.samples() => no3.pos;
no10.samples() => no10.pos;
no5.samples() => no5.pos;
no6.samples() => no6.pos;
no7.samples() => no7.pos;
no8.samples() => no8.pos;
no9.samples() => no9.pos;
hihat6.samples() => hihat6.pos;
snare4.samples() => snare4.pos;
            0 => no4.pos;
            0.2 => pan.gain;
            pan.chan(5);
        }
        if (kybmsg.ascii == 53) // number 5
        {
no1.samples() => no1.pos;
no2.samples() => no2.pos;
no3.samples() => no3.pos;
no4.samples() => no4.pos;
no10.samples() => no10.pos;
no6.samples() => no6.pos;
no7.samples() => no7.pos;
no8.samples() => no8.pos;
no9.samples() => no9.pos;
hihat6.samples() => hihat6.pos;
snare4.samples() => snare4.pos;
            0 => no5.pos;
            0.2 => pan.gain;
            pan.chan(1);
        }
        if (kybmsg.ascii == 54) // number 6
        {
no1.samples() => no1.pos;
no2.samples() => no2.pos;
no3.samples() => no3.pos;
no4.samples() => no4.pos;
no5.samples() => no5.pos;
no10.samples() => no10.pos;
no7.samples() => no7.pos;
no8.samples() => no8.pos;
no9.samples() => no9.pos;
hihat6.samples() => hihat6.pos;
snare4.samples() => snare4.pos;
            0 => no6.pos;
            0.2 => pan.gain;
            pan.chan(2);
        }
        if (kybmsg.ascii == 55) // number 7
        {
no1.samples() => no1.pos;
no2.samples() => no2.pos;
no3.samples() => no3.pos;
no4.samples() => no4.pos;
no5.samples() => no5.pos;
no6.samples() => no6.pos;
no10.samples() => no10.pos;
no8.samples() => no8.pos;
no9.samples() => no9.pos;
hihat6.samples() => hihat6.pos;
snare4.samples() => snare4.pos;
            0 => no7.pos;
            0.2 => pan.gain;
            pan.chan(3);
        }
        if (kybmsg.ascii == 56) // number 8
        {
no1.samples() => no1.pos;
no2.samples() => no2.pos;
no3.samples() => no3.pos;
no4.samples() => no4.pos;
no5.samples() => no5.pos;
no6.samples() => no6.pos;
no7.samples() => no7.pos;
no10.samples() => no10.pos;
no9.samples() => no9.pos;
hihat6.samples() => hihat6.pos;
snare4.samples() => snare4.pos;
            0 => no8.pos;
            0.2 => pan.gain;
            pan.chan(4);
        }
        if (kybmsg.ascii == 57) // number 9
        {
no1.samples() => no1.pos;
no2.samples() => no2.pos;
no3.samples() => no3.pos;
no4.samples() => no4.pos;
no5.samples() => no5.pos;
no6.samples() => no6.pos;
no7.samples() => no7.pos;
no8.samples() => no8.pos;
no10.samples() => no10.pos;
hihat6.samples() => hihat6.pos;
snare4.samples() => snare4.pos;
            0 => no9.pos;
            0.2 => pan.gain;
            pan.chan(5);
        }
        
        if (kybmsg.ascii == 72) // here we go "h"
        {
            0 => hwg.pos;
            0.2 => hwg.gain => pan.gain;
        }
        if (kybmsg.ascii == 76) // letsa go "l"
        {
            0 => lsg.pos;
            0.07 => pan.gain;
        }
        if (kybmsg.ascii == 82) // rocketlaunch "r"
        {
            0 => rckl.pos;
            0.04 => pan.gain;
        }
        if (kybmsg.ascii == 90) // hihat6 "z"
        {
            0 => hihat6.pos;
            0.03 => pan.gain;
        }
        if (kybmsg.ascii == 88) // snare4 "x"
        {
            0 => snare4.pos;
            0.06 => pan.gain;
        }
        if (kybmsg.ascii == 69) // error "e"
        {
            0 => error.pos;
            0.05 => pan.gain;
        }
        
    }
    
}

}

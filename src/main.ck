// In order to call this code properly you should use the "start" script, which
// is probably in this same folder.
//
// If you know what you are doing and definitely wants to modify this file,
// then at least open the start script, since it has a lot of useful
// information on how this file is called and what are the meanings of each
// command line option (the program will not work without them).

Dyno mixer => dac;

// Creates two guitars and uses command lines to define what is the "mode" of
// the sound synthesis.
Guitar g[2];
Guitar.setup(me.arg(0),mixer);

new PickedGuitar @=> g[0];
new LegatoGuitar @=> g[1];

InputHandler handler;
MouseHandler mouseHandler;

// if Keyboard is passed as the second command line argument, you shall specify
// what is the device ID of your keyboard. Note that this isn't necessary if
// you are using a guitar (or a Joypad, for example).
int device;

if (me.arg(1) == "keyboard") {
    new KeyboardHandler @=> handler;
    Std.atoi(me.arg(2)) => device;
}

if (me.arg(1) == "guitar") {
    new GuitarHandler @=> handler;
    0 => device;
}

//mouseHandler.openDevice(1);
handler.openDevice(device);

//spork ~mouseHandler.queryInput(null);
spork ~handler.queryInput(g);

2::week => now;

public class InputHandler {
    
    // This is the Human Interface Device handler. When a device that
    // understands HID sends a message, this variable is advised about it.
    Hid hi;
    
    // Any message sent by a HID is a HidMsg. This variable is used to store
    // the last message received by "hi".
    HidMsg msg;

    public void openDevice(int device) {}
    public void queryInput(Guitar guitars[]) {}
}

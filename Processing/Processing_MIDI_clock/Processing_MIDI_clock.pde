/*
    
    Basic tutorial to create animations in sync with a MIDI clock
    by: luiscript
    
    
    Important info about MIDI clock standard:
    
    clock     0xF8 (248)
    start     0xFA (250)
    continue  0xFB (251)
    stop      0xFC (252)


*/

import themidibus.*;   // download this library or you would get an error

MidiBus myBus;         // this is or MIDI bus object

int timing = 0;        // counts the total of quarter notes
float lfo = 0.0;       // this will be our LFO

void setup() {
  size(400, 400);
  background(0);

  //this prints all the available MIDI ports 
  MidiBus.list(); 
  
  //select the MIDI port of your preference
  //in my case port 0 named "Bus 1"
  myBus = new MidiBus(this, 0, "Bus 1"); 
}


//this function will be called when raw MIDI data arrives
void rawMidi(byte[] data) {  
  
  if(data[0] == (byte)0xFC) {         // TRUE when MIDI clock stops.
    
    // reset timing when clock stops to stay in sync for the next start
    timing = 0;
  
  } else if(data[0] == (byte)0xF8) {  // TRUE every MIDI clock pulse
     
    //we need to increase timing every pulse to get the total count
    timing++;
    
    // MIDI clock sends 24 ppqn (pulses per quarter note)
    // with this formula, lfo will oscillate between 0 and 1 every quarter note
    lfo = ( timing % 24 ) / 24.0;
    
    // now you can use lfo to easily animate whatever you want in sync with BPM
  }
}

void draw() {
  background(0);
  
  //since we have lfo oscillating between 0 and 1, we can use it to animate the size of this ellipse in sync
  ellipse(width/2, height/2, 100 * lfo, 100 * lfo);
}


// Enjoy
// @luiscript
#pragma once

#include "ofMain.h"
#include "ofxAbletonLink.h"

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();
    
    
        ofxAbletonLink link;
        float lfo;
		
};

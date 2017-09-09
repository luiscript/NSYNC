#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

}

//--------------------------------------------------------------
void ofApp::update(){
    lfo = link.getPhase() / link.getQuantum();
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofDrawCircle(ofGetWidth()/2, ofGetHeight()/2, 200 * lfo );
}

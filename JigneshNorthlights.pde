import processing.sound.*;

import KinectPV2.*;
PImage bg;
int yi;
/*
 Skeleton color map example.
 Skeleton (x,y) positions are mapped to match the color Frame
 */
import KinectPV2.KJoint;
import KinectPV2.*;

SoundFile file;
float L;

ParticleSystem ps;

KinectPV2 kinect;
int x,y,x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,human, num;

void setup() {
  size(1920,1080, P3D);
//  fullScreen (SPAN);
  kinect = new KinectPV2(this);
  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);
  kinect.init();
  bg = loadImage("northlight.jpg");
  ps = new ParticleSystem(new PVector(width/2, 25));
  
  L=0;
  file = new SoundFile (this,"Everdream.mp3");
  file.play();
  file.loop();
  file.amp(0.5);
  file.rate(L);
}

void draw() {
 // background(0);
   
   background(bg);
  
  stroke(226, 204, 0);
 // line(0, yi, width, yi);
  
  yi++;
  if (yi > height) {
    yi = 0; 
  }
  
  
  
  for (int i = 0; i < 10; i++) {
 
 ps.addParticle(x, y);
 ps.addParticle(x1, y1);
 if(num>1){
     if(num>2){
       ps.addParticle(x4, y4);
   ps.addParticle(x5, y5);
     }
     
   ps.addParticle(x2, y2);
   ps.addParticle(x3, y3);
 }
 
// ps.addParticle(  );
   
  } 
    
  ps.run();
  
  //image(kinect.getColorImage(), 0, 0, width, height);

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();
num=skeletonArray.size();
  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    human=i;
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
     
      //draw different color for each hand state
      drawHandState(joints[KinectPV2.JointType_HandRight], 1, human);
      drawHandState(joints[KinectPV2.JointType_HandLeft], 2, human);
    }
  }

  fill(0, 0, 0);
  text(frameRate, 50, 50);
}



//draw joint
void drawJoint(KJoint[] joints, int jointType) {
  pushMatrix();
  translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  ellipse(0, 0, 30, 30);
  popMatrix();
}


//draw hand state
void drawHandState(KJoint joint, int hand, int homan) {
  noStroke();
  handState(joint.getState());
  pushMatrix();
  if(homan==0){
  if(hand==1){
  x=Math.round(joint.getX());
  y=Math.round(joint.getY());
  }
  else{
    x1=Math.round(joint.getX());
  y1=Math.round(joint.getY());
  }
  }
  else if(homan==1){
  if(hand==1){
  x2=Math.round(joint.getX());
  y2=Math.round(joint.getY());
  }
  else{
    x3=Math.round(joint.getX());
  y3=Math.round(joint.getY());
  }
  }
  
  else if(homan==2){
  if(hand==1){
  x4=Math.round(joint.getX());
  y4=Math.round(joint.getY());
  }
  else{
    x5=Math.round(joint.getX());
  y5=Math.round(joint.getY());
  }
  }
  
  
  translate(joint.getX(), joint.getY(), joint.getZ());
  ellipse(0, 0, 10, 10);
  popMatrix();
}

void handState(int handState) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    fill(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
    fill(255, 0, 0);
    break;
  case KinectPV2.HandState_Lasso:
    fill(0, 0, 255);
    break;
  case KinectPV2.HandState_NotTracked:
    fill(255, 255, 255);
    break;
  }
}

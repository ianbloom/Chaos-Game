import controlP5.*;
ControlP5 cp5;

int radius;
PVector center;
PVector[] choices = new PVector[2];
PVector choice;
PVector temp = new PVector(0, 0);
int index;
int index2 = 0;
int index3 = 0;
PVector[] generators;
int count = 0;
int colorCount = 0;
boolean shouldI = false;
int resetFlag = 0;
int runFlag = 0;
int sliderFlag = 0;
int slider2Flag = 0;
int slider3Flag = 0;
int pointCount;
int addValue = 0;
int addValue2 = 0;
int colorTick = 0;

void setup() {
  fullScreen();
  background(0);
  
  cp5 = new ControlP5(this);
  cp5.addButton("reset")
   .setValue(0)
   .setPosition(width-30,30)
   .setSize(20,20)
   ;
  cp5.addButton("run")
   .setValue(0)
   .setPosition(180,20)
   .setSize(20,20)
   ;
  cp5.addSlider("points")
   .setPosition(20,20)
   .setSize(100,20)
   .setRange(0,10)
   .setNumberOfTickMarks(11)
   .setValue(0);
   ;
  cp5.addSlider("omit1")
   .setPosition(20,50)
   .setSize(100,20)
   .setRange(0,10)
   .setNumberOfTickMarks(11)
   .setValue(0);
   ;
  cp5.addSlider("omit2")
   .setPosition(20,80)
   .setSize(100,20)
   .setRange(0,10)
   .setNumberOfTickMarks(11)
   .setValue(0);
   ;
  
  center = new PVector(width/2, height/2);
  radius = height/2 - 10;
  
  stroke(255);
  strokeWeight(.25);
  
  
  generators = create(6);
  for (int i = 0; i < generators.length; i++) {
    point(generators[i].x, generators[i].y);
  }
  
  
  choices[0] = new PVector(random(width), random(height));
  choices[1] = new PVector(random(width), random(height));
  
}

void draw() {
  if( shouldI == true) {
    for (int i = 0; i < 10000; i++) {
      index = int(random(generators.length));
      if(addValue == 0 && addValue2 == 0) {
        choices[0].x = ((generators[index].x + choices[1].x)/2);
        choices[0].y = ((generators[index].y + choices[1].y)/2);
        if (count > 20) {
          point(choices[0].x, choices[0].y);
        }
        choices[1] = choices[0];
        count++;
        index3 = index2;
        index2 = index;
      }
      if(addValue != 0 && addValue2 == 0) {
        if(index != (index2 + addValue)%generators.length) {
          choices[0].x = ((generators[index].x + choices[1].x)/2);
          choices[0].y = ((generators[index].y + choices[1].y)/2);
          if (count > 20) {
            point(choices[0].x, choices[0].y);
          }
          choices[1] = choices[0];
          count++;
          index3 = index2;
          index2 = index;
        }
      }
      if(addValue != 0 && addValue2 != 0) {
        if(index != (index2 + addValue)%generators.length && index != (index2 + addValue2)%generators.length) {
          choices[0].x = ((generators[index].x + choices[1].x)/2);
          choices[0].y = ((generators[index].y + choices[1].y)/2);
          if (count > 20) {
            point(choices[0].x, choices[0].y);
          }
          choices[1] = choices[0];
          count++;
          index3 = index2;
          index2 = index;
        }
      }
      if(addValue == 0 && addValue2 != 0) {
        if(index != (index2 + addValue2)%generators.length) {
          choices[0].x = ((generators[index].x + choices[1].x)/2);
          choices[0].y = ((generators[index].y + choices[1].y)/2);
          if (count > 20) {
            point(choices[0].x, choices[0].y);
          }
          choices[1] = choices[0];
          count++;
          index3 = index2;
          index2 = index;
        }
      }
    }
  }
}

PVector[] create(int _n) {
  PVector[] generators;
  generators = new PVector[_n];
  for (int i = 0; i < generators.length; i++) {
    float x = center.x + radius * cos(TWO_PI * i / generators.length);
    float y = center.y + radius * sin(TWO_PI * i / generators.length);
    PVector dot = new PVector(x, y);
    generators[i] = dot;
  }
  return generators;
}

public void reset(int theValue) {
  if(resetFlag > 0) {
    background(0);
    print("poop");
    shouldI = false;
  }
  resetFlag++;
}

public void run(int theValue) {
  if(runFlag > 0) {
    background(0);
    generators = create(pointCount);
    shouldI = true;
  }
  runFlag++;
}

public void points(int theValue) {
  if(sliderFlag > 0) {
    background(0);
    pointCount = theValue;
    shouldI = false;
  }
  sliderFlag++;
}

public void omit1(int theValue) {
  if(slider2Flag > 0) {
    background(0);
    addValue = theValue;
    shouldI = false;
  }
  slider2Flag++;
}

public void omit2(int theValue) {
  if(slider3Flag > 0) {
    background(0);
    addValue2 = theValue;
    shouldI = false;
  }
  slider3Flag++;
}
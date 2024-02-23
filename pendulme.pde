float r1 = 200;
float r2 = 200;
float m1 = 40;
float m2 = 40;
float a1 = PI/4;
float a2 = PI/8;
float a1_v = 0;
float a2_v =0;
float a1_a = 0.01;
float a2_a = -0.001;
float g = PI;
float cx;
float cy;

float px2 = -1;
float py2 = -1;

PGraphics canvas;
void setup(){
 size(600,600);
  cx = width/2;
  cy = 50;
 canvas = createGraphics(600,600);
 canvas.beginDraw();
 canvas.background(255);
 canvas.endDraw();
}
void draw(){
  
  float num1 = -g*(2*m1+m2) * sin(a1); 
  float numb2 = -m2 * g *sin(a1- 2 * a2) - 2 * sin(a1 - a2) * m2*(a2_v * a2_v *r2 +(a1_v * a1_v)*r2* cos(a1-a2));
  float numb3 = r1*(2*m1 + m2 - m2 * cos(2*a1 - 2 *a2));
  
  float a1_a = (num1 + numb2)/ numb3;
  
  float num4 = 2 * sin(a1 - a2) * ((a1_v * a1_v) * r1 * (m1 + m2) + g * (m1 +m2) * cos(a1) + (a2_v * a2_v)  * r2 * m2 * cos(a1 - a2));
  float numb5 = r2 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2));
  float a2_a = num4 / numb5;
  
 //background(255);
 image(canvas,0,0);
 stroke(0);
 strokeWeight(2);
 frameRate(20);
 translate(300,50);
 float x1 = r1 *sin(a1);
 float y1 = r1 * cos(a1);
 
 float x2 = x1 +r2 * sin(a2);
 float y2 = y1 +r2 * cos(a2);
 
 
 
 line(0,0,x1,y1); 
 fill(0);
 ellipse(x1,y1,m1,m1);
 
 line(x1,y1,x2,y2); 
 fill(0);
 ellipse(x2,y2,m2,m2);
 
 a1_v += a1_a;
 a2_v += a2_a;
 a1 += a1_v;
 a2 += a2_v;
 
 
 
 
 canvas.beginDraw();
 canvas.translate(cx,cy);
 canvas.strokeWeight(2);
 canvas.stroke(0);
 
if (frameCount > 1){
  canvas.line(px2,py2,x2,y2);
}
 canvas.endDraw();
 
 px2 = x2;
 py2 = y2;
}

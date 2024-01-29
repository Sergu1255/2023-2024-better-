final ArrayList<ArrayList<GridAngle>> grid = new ArrayList<ArrayList<GridAngle>>();

int xOFF = 50;
final int yOFF = 50;
final int spacing = 10;
final float rez = 0.005;

class GridAngle {
  int x, y, r;
  float angle;
  
  PVector v;
  
  GridAngle(int x_, int y_, int r_, float angle_){
    x = x_;
    y = y_;
    
    angle = angle_;
    r = r_;
    v = new PVector(x + r * cos(angle), y + r * sin(angle));
  }
  void display(){
   strokeWeight(2);
   stroke(random(255));
   frameRate(15);
   line(x,y, v.x, v.y);
   
  }
}
void createGrid(){
  for (int x = xOFF; x<width-xOFF; x+=spacing){
    ArrayList<GridAngle> row = new ArrayList<GridAngle>();
    
    for (int y = yOFF; y<width-yOFF; y+=spacing){
      float angle = map(noise(x*rez, y*rez), 0.0, 1.0, 0.0, TAU);
      row.add(new GridAngle(x,y, spacing/2, angle));
      
      
    }
    grid.add(row);
  }
}
void setup(){
  size(600,600);
  createGrid();
}

void draw(){
  background(220);
  for (int x = 0; x<grid.size(); x++) {
    xOFF ++;
    for ( int y = 0; y<grid.get(0).size(); y ++) {
      grid.get(x).get(y).display();
    }
  }
  save("grid.png");
  
}

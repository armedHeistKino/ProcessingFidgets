import java.util.*;

float GRAVITY_ACC = 9.81;
float STRING_LEN = 80;

class Pendulum {
  PVector origin;
  
  // Angular measures
  float ang = 0;
  float angvel = 0;
  float angacc = 0;
  
  Pendulum(PVector _origin, float _ang) {
    origin = _origin;
    ang = _ang;
  }
  
  void update(){
    angacc = -1 * sin(radians(ang)) * GRAVITY_ACC / STRING_LEN;
    angvel += angacc;
    ang += angvel;
  }
  
  void render(){
    stroke(0);
    point(origin.x, origin.y, 10);
    
    PVector pend = new PVector(STRING_LEN * cos(radians(ang + 90)), STRING_LEN * sin(radians(ang + 90)));
    pend.normalize();
    pend.mult(STRING_LEN);
    
    // pendulum line
    line(origin.x, origin.y, origin.x + pend.x, origin.y + pend.y);
    
    // pendulum ends
    noStroke();
    fill(255, 51, 51);
    circle(origin.x + pend.x, origin.y + pend.y, 15);
  }
}

class DoublePendulum {
  int m;
  
  Pendulum one;
  Pendulum two;
  
  LinkedList<PVector> trail;
  
  DoublePendulum(PVector _oneOrigin, float _oneAng, PVector _twoOrigin, float _twoAng) {
    one = new Pendulum(_oneOrigin, _oneAng);
    two = new Pendulum(_twoOrigin, _twoAng);
    
    trail = new LinkedList<PVector>();
    
    m = millis();
  }
  
  void update() {
    one.angacc = GRAVITY_ACC / STRING_LEN * (-2*sin(radians(one.ang)) + sin(radians(two.ang)));
    two.angacc = GRAVITY_ACC / STRING_LEN * (2*sin(radians(one.ang)) - 2*sin(radians(two.ang)));
    
    one.angvel += one.angacc;
    two.angvel += two.angacc;
    
    one.ang += one.angvel;
    two.ang += two.angvel;
  }
  
  void render() {
    stroke(0);
    point(one.origin.x, one.origin.y, 10);
    
    PVector onePendLocation = new PVector(cos(radians(one.ang + 90)), sin(radians(one.ang + 90)));
    onePendLocation.normalize();
    onePendLocation.mult(STRING_LEN);
    
    two.origin.x = one.origin.x + onePendLocation.x; two.origin.y = one.origin.y + onePendLocation.y;
    
    PVector twoPendLocation = new PVector(cos(radians(two.ang + 90)), sin(radians(two.ang + 90)));
    twoPendLocation.normalize();
    twoPendLocation.mult(STRING_LEN);
    
    // Line
    strokeWeight(3);
    stroke(255, 51, 51);
    line(one.origin.x, one.origin.y, one.origin.x + onePendLocation.x, one.origin.y + onePendLocation.y);
    
    stroke(26, 83, 255);
    line(two.origin.x, two.origin.y, two.origin.x + twoPendLocation.x, two.origin.y + twoPendLocation.y);
    
    // Pendulum
    noStroke();
    fill(255, 51, 51);
    circle(one.origin.x + onePendLocation.x, one.origin.y + onePendLocation.y, 15);
    
    fill(26, 83, 255);
    // Pendulum
    circle(two.origin.x + twoPendLocation.x, two.origin.y + twoPendLocation.y, 15);
    
    // Pendulum trail
    trail.addFirst(new PVector(two.origin.x + twoPendLocation.x, two.origin.y + twoPendLocation.y));
    
    int cnt = trail.size();
    int lenTrail = trail.size();
    for (PVector pv: trail) {
       println(cnt / (float)lenTrail);
       fill(26, 83, 255, map(cnt / (float)lenTrail, 0, 1.0, 0, 255));
       circle(pv.x, pv.y, 3);
       cnt--;
    }
    if (lenTrail == 61) trail.removeLast(); 
  }
}

DoublePendulum system;

void setup() {
  size(800, 800);
  system = new DoublePendulum(new PVector(800/2, 800/2), 56, new PVector(800/2 + STRING_LEN, 800/2), 32);
}

void draw() {
  background(0);
  system.update();
  system.render();
}

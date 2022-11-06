float GRAVITY_ACC = 9.81;
float AIR_DENSITY = 1.25;
float DRAG_COEF = 0.47;
float SPHERE_AREA = 0.01;

float INIT_ANGLE = 160;

class Pendulum {
  PVector origin;
  PVector locPendulum;
  
  float ang;
  float angvel;
  float angacc;
  
  float mass;
  float lenString;
  
  Pendulum(float _mass, float _lenString, float initAng) {
    mass = _mass;
    lenString = _lenString;
    
    ang = initAng;
    angvel = 0;
    angacc = 0;
    
    origin = new PVector(width/2, height/2);
  }
  
  void update() {
     angacc = - 1 * GRAVITY_ACC / (0.01 * lenString) * sin(radians(ang)) + (angvel * angvel) * (AIR_DENSITY * DRAG_COEF * SPHERE_AREA * 0.01 * lenString)/(2*mass);
     angvel += angacc;
     ang += angvel;
     
     locPendulum = new PVector(cos(radians(ang + 90)), sin(radians(ang + 90)));
     locPendulum.normalize();
     locPendulum.mult(lenString);
     locPendulum.x += origin.x; locPendulum.y += origin.y;
  }
  
  void display() {
    // line
    strokeWeight(3);
    stroke(26, 83, 255);
    line(origin.x, origin.y, locPendulum.x, locPendulum.y);
    
    // pendulum
    noStroke();
    fill(26, 83, 255);
    circle(locPendulum.x, locPendulum.y, 20);
  }
}

Pendulum system;

void setup() {
  size(600, 600);
  // kg, cm, angle degree
  system = new Pendulum(0.1, 150, INIT_ANGLE);
}

void draw() {
  background(55, 55, 55);
  system.update();
  system.display();
}

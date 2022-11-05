float GravityAcc = 1;
float dampingC = 0.0015;

class PendulumDemens {
  PVector origin;
  PVector bob;
  
  float phi;
  float phiVel;
  float phiAcc;
  
  float theta;
  float thetaVel;
  float thetaAcc;
  
  float mass;
  float len;
  
  PendulumDemens(float m, float l, float thetaInit, float phiInit) {
    theta = thetaInit;
    thetaVel = 0;
    thetaAcc = 0;
    
    phi = phiInit;
    phiVel = 0;
    phiAcc = 0;
    
    mass = m;
    len = l;
    
    origin = new PVector();
    origin.x = origin.y = origin.z = 0;
    
    bob = new PVector();
    bob.x = bob.y = bob.z = 0;
  }
  
  void update() {
    float rTheta = radians(theta);
    float rPhi = radians(phi);
    
     phiAcc     = -GravityAcc/len * cos(rTheta) * sin(rPhi) - dampingC * phiVel;
     phiVel    += phiAcc;
     phi       += phiVel;
     
     thetaAcc   = -GravityAcc/len * sin(rTheta) * cos(rPhi) - dampingC * thetaVel;
     thetaVel  += thetaAcc;
     theta     += thetaVel;
     
     bob.x = len * sin(radians(theta)) * cos(radians(phi));
     bob.y = len * sin(radians(theta)) * sin(radians(phi));
     bob.z = -len * cos(radians(theta));
     
     bob.normalize();
     bob.mult(len);
  }
  
  void display() {     
    noStroke();
    fill(255, 153, 153);
        
    // ceiling
    box(50, 50, 5);    
        
    // line
    strokeWeight(5);
    stroke(255, 153, 153);
    line(origin.x, origin.y, origin.z, bob.x, bob.y, bob.z);
    
    // bob
    noStroke();
    translate(bob.x, bob.y, bob.z);
    sphere(10);
  }
}

PendulumDemens system;

void setup() {
  size(1000, 1000, P3D);
  // mass, len, theta, phi
  system = new PendulumDemens(0.05, 150, 45, 45);
  
  camera(300, 0, 0, 0, 0, 0, 0, 0, 1);
}

PVector position = new PVector(0, 0, 0);
PVector up = new PVector(0, 0, -1);

float distance = 500;

void draw() {
  background(102, 140, 153);
  smooth();
  lights();
  
  {
    strokeWeight(2);
    // RED, X
    stroke(255, 0, 0);
    line(500, 0, 0, 0, 0, 0);
  
    // GREEN, Y
    stroke(0, 255, 0);
    line(0, 500, 0, 0, 0, 0);
  
    // BLUE, Z
    stroke(0, 0, 255);
    line(0, 0, 500, 0, 0, 0);
  }
  
  {
    float ang = map(mouseY, 0, height, PI/2, -PI/2);
    float phi = map(mouseX, 0,  width, 0, 2*PI);
    
    position.x = cos(ang) * sin(phi);
    position.y = cos(ang) * cos(phi);
    position.z = sin(ang);
    
    position.normalize();
    position.mult(distance);
    
    camera(position.x, position.y, position.z, 0, 0, 0, up.x, up.y, up.z);   
  }
  
  system.update();
  system.display();
}

public class Ball {
    int radius;
    float bounce;
    color col;
    PVector location;
    PVector velocity;
    PVector acceleration;
    int maxSpeed = 20;
  
    //Ball constructor
    public Ball(float x, float y, int r, color c) {
      location = new PVector(x, y);
      velocity = new PVector(0, 0);
      acceleration = new PVector(0, 0.5);
      radius = r;
      col = c;
      //assign a default value of 0.7 to bounce.
      bounce = 0.7;
    }
    
    //Overloaded constructor
    public Ball(float x, float y, int r, color c, float b) {
       //'this' calls the constructor above this one ^
        this(x, y, r, c);
        bounce = b;
    }
    
    public void draw() {
        fill(col);
        ellipse(location.x, location.y, radius, radius);
        location.x = location.x + velocity.x;
        location.y = location.y + velocity.y;
        velocity.x = velocity.x + acceleration.x;
        velocity.y = velocity.y + acceleration.y;
        
        location.x = limit(location.x, 0, width);
        velocity.x = limit(velocity.x, -maxSpeed, maxSpeed);
        
        location.y = limit(location.y, 0, height);
        velocity.y = limit(velocity.y, -maxSpeed, maxSpeed);
        bounds();
    }
    
    public void bounds() {
        if(location.x + velocity.x > width || location.x + velocity.x < 0) {
           velocity.x *= -bounce;        
           //velocity.x = velocity.x*-1;
           
           //velocity.x += 1;
           //velocity.x = velocity.x + 1;
           //velocity.x++;
           
           //velocity.x -= 10;
           //velocity.x = velocity.x - 10;
        }
        if(location.y + velocity.y > height || location.y + velocity.y < 0) {
           velocity.y *= -bounce;
        }
    }
    
    public float limit(float value, float min, float max) {
       if(value > max) return max;
       if(value < min) return min;
       else return value;
    }
    
}

public class Game {
  boolean newTurn, follow = true;
  PVector direction;
  Ball ball;
  int score;
  float randX, randY;
  
  public Game() {
     newTurn = true;
     score = 0;
     randX = 100;
     randY = height/2;
     direction = new PVector(mouseX, mouseY);
     ball = new Ball(randX, randY, 50, color(255, 0, 0));
     ball.acceleration.y = 0;
  }
  
  public void update() {
    //draw ball
    drawArrow();
    ball.draw();
  }
  
  void drawArrow() {
    if(follow) {
       direction.x = mouseX;
       direction.y = mouseY;
    }
    PVector newDir = new PVector(direction.x - ball.location.x, direction.y - ball.location.y); 
    float theta = atan(newDir.y/newDir.x);
    System.out.println("Theta: " + degrees(PI/6 + theta));
    float x2 = direction.x - 20*cos(PI/6 + theta);
    float y2 = direction.y - 20*sin(PI/6 + theta);
    PVector firstLeg = new PVector(x2, y2);
    line(ball.location.x, ball.location.y, direction.x, direction.y);
    line(firstLeg.x, firstLeg.y, direction.x, direction.y);
  }
  
}

void mousePressed() {
  basketball.follow = !(basketball.follow);
}



Game basketball;

void setup() {
   size(1200, 800);
   basketball = new Game();
}

void draw() {
    background(255, 255, 255);
    basketball.update();
    textSize(24);
    fill(0, 0, 0);
    text("Score: " + basketball.score, 10, 30);
}
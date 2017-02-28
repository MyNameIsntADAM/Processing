int cols, rows;
int scale = 20;
int w, h;
 
void setup() {
     w = 600;
     h = 600;
     cols = w / scale;
     rows = h / scale;
     size(200, 200);
}

void draw() {
   background(0); 
   stroke(255);
   noFill();
    frame.setLocation(500, 500);  
   
   for(int y = 0; y < rows; y++) {
     
      beginShape(TRIANGLE_STRIP);
      for(int x = 0; x < cols; x++) {
         vertex(x*scale, y*scale);
         vertex(x*scale, (y+1)*scale);
      }
      endShape();
   }
}
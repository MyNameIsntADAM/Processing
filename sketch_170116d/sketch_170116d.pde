PImage img;
String path = "../image.jpg";

void setup() {
    img = loadImage(path);
    int width = img.width, height = img.height;
    size(2000, 2000);
    background(0);
    noStroke();
    fill(100);
}
    
void draw() {
  img.loadPixels();
  image(img, 0, 0);
}
  
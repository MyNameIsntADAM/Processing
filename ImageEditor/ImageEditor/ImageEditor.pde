class ImageEditor {
    
    String path = "../image.png";
    PImage img;
  
    void setup() {
        img = loadImage(path);
        size(img.width, img.height);
    }
    
    void draw() {
        image(img, 0, 0);
        img.loadPixels();
        
    }
  
    
}
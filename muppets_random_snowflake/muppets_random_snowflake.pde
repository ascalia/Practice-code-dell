//declare variables
int count = 80;
PImage [] muppet = new PImage [5];
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];
float[] sz = new float[count];
float[] theta = new float[count];
float[] spin = new float[count];
string []
void setup() {
  size(800, 600);
  imageMode(CENTER);
  for (int i=0; i<muppet.length; i++){
     muppet = loadImage("beaker.png"[i]);//beaker1.png","beaker2.png","beaker3.png","beaker4.png");
  }//initialize variables
  for (int i = 0; i < count; i++) {
    sz[i] = random(50, 120);
    loc[i] = new PVector(random(width), random(-height*1.5, -sz[i]/2));
    vel[i] = new PVector(0, random(1));
    acc[i] = new PVector(0, .01);
    theta[i] = random(TWO_PI);
    spin[i] = random(-.01, .01);
  }
  noStroke();
  fill(255, 200);
}

void draw() {
  background(0, 20, 50);
  for (int i = 0; i < count; i++) {
    //move snowflake
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
    vel[i].limit(3);
    //draw snowflake
    pushMatrix();
    translate(loc[i].x, loc[i].y);
    rotate(theta[i]);
   // tint(255,50);
    image(muppet[(i)random(1,5)],0, 0, sz[i], sz[i]);
    popMatrix();
    //change horizontal acceleration
    acc[i].x = random(-.05, .05);
    //spin
    theta[i] += spin[i];
    //restart snowflake
    if (loc[i].y - sz[i]/2 > height) {
      loc[i].set(random(width), random(-height, -sz[i]/2));
      vel[i].set(0, 1);
    }
  }
}

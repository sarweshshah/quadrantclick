import cc.arduino.*;
import org.firmata.*;

import processing.serial.*;

Serial bluetoothPort;
PImage image;

int berries_rect_width = 255;
int berries_rect_height = 276;
int coffee_rect_width = 496;
int coffee_rect_height = 453;
int lemon_rect_width = 390;
int lemon_rect_height = 308;

String coffee = "Click to smell Coffee...";
String lemon = "Click to smell Lemon...";
String berries = "Click to smell Blueberries...";

void settings() {
  size(1296, 864);
}

void setup() {
  for (String serial : Serial.list()) {
    println(serial);
  }

  bluetoothPort = new Serial(this, Serial.list()[1], 9600);

  image = loadImage("toa-heftiba-106427.jpg"); //Load image pathname here
  image.resize(1296, 864);
  image(image, 0, 0);
}

void draw() {
  //fill(255, 2);
  noFill();
  strokeWeight(3);
  stroke(255);

  // Mouse pointing on the berries
  if (mouseX>16 && mouseY>16 && mouseX<271 && mouseY<292) {
    rect(16, 16, berries_rect_width, berries_rect_height); // berries
    text(berries, 16, 310);
  } 

  // Mouse pointing on the coffee
  else if (mouseX>619 && mouseY>156 && mouseX<1109 && mouseY<609) {
    rect(619, 156, coffee_rect_width, coffee_rect_height); // coffee
    text(coffee, 619, 627);
  }

  // Mouse pointing on the lemon
  else if (mouseX>196 && mouseY>539 && mouseX<610 && mouseY<847) {
    rect(196, 539, lemon_rect_width, lemon_rect_height); // lemon
    text(lemon, 196, 527);
  } else {
    clear();
    image(image, 0, 0);
  }
}

void mouseClicked() {
  // Mouse pointing on the berries
  if (mouseX>16 && mouseY>16 && mouseX<271 && mouseY<292) {
    // code to arduino
    bluetoothPort.write(49);
  } 

  // Mouse pointing on the coffee
  else if (mouseX>619 && mouseY>156 && mouseX<1109 && mouseY<609) {
    // code to arduino
    bluetoothPort.write(50);
  }

  // Mouse pointing on the lemon
  else if (mouseX>196 && mouseY>539 && mouseX<610 && mouseY<847) {
    // code to arduino
    //bluetoothPort.write(115);
    bluetoothPort.write(51);
    //bluetoothPort.write(101);
  }
}
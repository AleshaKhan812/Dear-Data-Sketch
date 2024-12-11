int numCars = 15; // Number of cars based on the data
Car[] cars = new Car[numCars];

void setup() {
  size(800, 400);
  // Create car objects based on the uploaded data
  cars[0] = new Car("Small", "Fair", color(255, 0, 0)); // Red red
  cars[1] = new Car("Medium", "Fair", color(255, 69, 0)); // Orangey red
  cars[2] = new Car("Small", "Slow", color(#AF304E)); // Purple red
  cars[3] = new Car("Small", "Fair", color(255, 0, 0)); // Red red
  cars[4] = new Car("Medium", "Fair", color(255, 0, 50)); // Bright red
  cars[5] = new Car("Small", "Fast", color(255, 0, 0)); // Red red
  cars[6] = new Car("Medium", "Slow", color(#AF304E)); // Purple red
  cars[7] = new Car("Small", "Slow", color(255, 69, 0)); // Orangey red
  cars[8] = new Car("Medium", "Slow", color(128, 0, 0)); // Maroon
  cars[9] = new Car("Small", "Fair", color(#AF304E)); // Purple red
  cars[10] = new Car("Small", "Fair", color(255, 0, 50)); // Bright red
  cars[11] = new Car("Small", "Fair", color(255, 0, 0)); // Red red
  cars[12] = new Car("Big", "Slow", color(139, 0, 0)); // Dark red
  cars[13] = new Car("Big", "Stopped", color(255, 0, 50)); // Bright red
  cars[14] = new Car("Big", "Slow", color(139, 0, 0)); // Dark red

  for (int i = 0; i < cars.length; i++) {
    cars[i].x = map(i, 0, cars.length, 50, width - 50);
    cars[i].y = height / 2;
  }
}

void draw() {
  background(50);
  stroke(255);
  line(0, height / 2, width, height / 2); // Draw the road

  for (Car car : cars) {
    car.display();
  }
}

class Car {
  float x, y;
  float vibrationAmount;
  int carColor;
  float size;

  Car(String size, String speed, int carColor) {
    this.carColor = carColor;

    // Determine vibration based on speed
    if (speed.equals("Fast")) {
      vibrationAmount = 5;
    } else if (speed.equals("Fair")) {
      vibrationAmount = 2;
    } else if (speed.equals("Slow")) {
      vibrationAmount = 1;
    } else if (speed.equals("Stopped")) {
      vibrationAmount = 0;
    }

    // Determine size based on car size
    if (size.equals("Small")) {
      this.size = 20;
    } else if (size.equals("Medium")) {
      this.size = 30;
    } else if (size.equals("Big")) {
      this.size = 40;
    }
  }

  void display() {
    float offsetX = random(-vibrationAmount, vibrationAmount);
    float offsetY = random(-vibrationAmount, vibrationAmount);

    fill(carColor);
    noStroke();
    ellipse(x + offsetX, y + offsetY, size, size);
  }
}

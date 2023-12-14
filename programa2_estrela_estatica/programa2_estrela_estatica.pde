void setup() {
  size(300, 300);
  smooth(8);
}

void draw() {
  background(200, 200, 200);
  stroke(255, 255, 255);
  strokeWeight(6);
  desenharEstrela(mouseX, mouseY, 40, 12);
}

void desenharEstrela(float posX, float posY, float raio, int pontas) {
  //strokeCap(SQUARE); // utilizar extremidades quadradas nas linhas
  float anguloEntreLinhas = TWO_PI / pontas;
  for (int i = 0; i < pontas; i++) {
    float pontaX = posX + raio * cos(i * anguloEntreLinhas);
    float pontaY = posY + raio * sin(i * anguloEntreLinhas);
    line(posX, posY, pontaX, pontaY);
  }
}

import processing.sound.*;

Fonte fonte;
PImage imagem;
boolean guardar = false;

AudioIn input;
Amplitude loudness;
float volume = 0;

void setup() {
  size(900, 500, P2D);
  smooth(8);
  blendMode(MULTIPLY);
  imageMode(CENTER);
  fonte = new Fonte("letras.txt");
  imagem = loadImage("diamond.png");
  
  input = new AudioIn(this, 0);
  input.start(); 
  loudness = new Amplitude(this);
  loudness.input(input);
}

void draw() {
  float novoVolume = loudness.analyze();
  novoVolume = constrain(novoVolume * 10, 0, 1);
  volume = volume * 0.6 + novoVolume * 0.4;
  
  background(240);
  desenharTexto("LETRAS", 50, 50, 15);
  desenharTexto("MODULARES", 50, 160, 15);
  
  if (guardar) {
    save(System.currentTimeMillis() + ".png");
    guardar = false;
  }
}

void keyReleased() {
  guardar = true;
}

void desenharModulo(float x, float y, float dim) {
  push();
  translate(x, y);
  rotate(PI * volume);
  image(imagem, 0, 0, dim * 3, dim * 3);
  pop();
}

import processing.sound.*;

Fonte fonte;
boolean guardar = false;

AudioIn input;
Amplitude loudness;
float volume = 0;

void setup() {
  size(900, 500, P2D);
  smooth(8);
  fonte = new Fonte("letras.txt");
  
  // Inicializar variaveis para analisar audio captado pelo micro
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
  float raio = (dim / 2) * volume;
  int numPontas = 10;
  float anguloEntreLinhas = TWO_PI / numPontas;
  for (int i = 0; i < numPontas; i++) {
    float pontaX = x + raio * cos(i * anguloEntreLinhas);
    float pontaY = y + raio * sin(i * anguloEntreLinhas);
    line(x, y, pontaX, pontaY);
  }
}

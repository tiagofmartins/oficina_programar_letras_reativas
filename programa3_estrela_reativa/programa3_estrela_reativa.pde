// Importar biblioteca que permite trabalhar com som
import processing.sound.*;

// Criar variaveis para analisar audio captado pelo micro
AudioIn input;
Amplitude loudness;
float volume = 0;

// Funcao executada 1 vez no inicio do programa
void setup() {
  size(400, 400);
  smooth(8);
  
  // Inicializar variaveis para analisar audio captado pelo micro
  input = new AudioIn(this, 0);
  input.start(); 
  loudness = new Amplitude(this);
  loudness.input(input);
}

// Funcao executada continuamente apos a funcao setup()
void draw() {
  // Calcular o volume do audio captado pelo micro (valor entre 0 e 1)
  float novoVolume = loudness.analyze();
  novoVolume = constrain(novoVolume * 10, 0, 1);
  volume = volume * 0.6 + novoVolume * 0.4; 
 
  background(0);
  stroke(255);
  strokeWeight(5);
  
  // Desenhar estrelha com dimensao determinada pelo volume sonoro
  desenharEstrela(width / 2, height / 2, volume * 200, 30);
}

void desenharEstrela(float posX, float posY, float raio, int pontas) {
  float anguloEntreLinhas = TWO_PI / pontas;
  for (int i = 0; i < pontas; i++) {
    float pontaX = posX + raio * cos(i * anguloEntreLinhas);
    float pontaY = posY + raio * sin(i * anguloEntreLinhas);
    line(posX, posY, pontaX, pontaY);
  }
}

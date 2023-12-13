import processing.sound.*; // importar biblioteca que permite trabalhar com som

// variaveis globais
AudioIn input;      // objeto que captura som
Amplitude loudness; // objeto que analiza som
float volume = 0;   // variavel para guardar o volume (valor entre 0 e 1)

// funcao executada 1 vez no inicio do programa
void setup() {
  size(400, 400); // definir dimensao da janela
  smooth(8);      // ligar suavizacao dos contornos
  
  input = new AudioIn(this, 0);   // criar input de som
  input.start();                  // iniciar captura de som 
  loudness = new Amplitude(this); // criar analizador de som
  loudness.input(input);          // ligar o input de som ao analizador
}

// funcao executada continuamente apos a funcao setup()
void draw() {
  float novoVolume = loudness.analyze();        // determinar o volume sonoro
  novoVolume = constrain(novoVolume * 5, 0, 1); // amplificar o volume mantendo o seu valor entre 0 e 1
  volume = volume * 0.7 + novoVolume * 0.3;     // atualizar o valor do volume de forma suave 
 
  background(0);   // limpar janela
  stroke(255);     // ligar contorno branco
  strokeWeight(5); // definir espessura linha
  
  // desenhar estrelha com dimensao determinada pelo volume sonoro
  desenharEstrela(width / 2, height / 2, volume * 200, 30);
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

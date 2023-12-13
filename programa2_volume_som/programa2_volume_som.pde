import processing.sound.*;                    // importar biblioteca que permite trabalhar com som

// variaveis globais
AudioIn input;                                // objeto que captura som
Amplitude loudness;                           // objeto que analiza som
float diam = 0;                               // variavel para guardar o diametro do circulo

// funcao executada 1 vez no inicio do programa
void setup() {
  size(400, 400);                             // definir dimensao da janela
  input = new AudioIn(this, 0);               // criar input de som
  input.start();                              // iniciar captura de som 
  loudness = new Amplitude(this);             // criar analizador de som
  loudness.input(input);                      // ligar o input de som ao analizador
}

// funcao executada continuamente apos a funcao setup()
void draw() {
  float volume = loudness.analyze();          // determinar o volume sonoro
  volume = constrain(volume * 5, 0, 1);       // amplificar o volume mantendo o seu valor entre 0 e 1
  float newDiam = volume * width;             // calcular o novo valor do diametro
  diam = diam * 0.7 + newDiam * 0.3;          // atualizar o valor do diametro de forma suave 
 
  background(0);                              // limpar janela
  noStroke();                                 // desligar contorno
  fill(255);                                  // ativar preenchimento a branco
  ellipse(width / 2, height / 2, diam, diam); // desenhar circulo com diametro determinado pelo volume sonoro
}

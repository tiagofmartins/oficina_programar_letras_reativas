Fonte fonte;

void setup() {
  size(900, 500, P2D);
  smooth(8);
  fonte = new Fonte("letras.txt");
}

void draw() {
  background(240);
  desenharTexto("OLA", 50, 50, 20);
  desenharTexto("POMBAL", 50, 50 + 20 * 7, 20);
}

void desenharTexto(String texto, float x, float y, float dimModulo) {
  float glifoX = x;
  
  // para cada caractere do texto
  for (int i = 0; i < texto.length(); i++) {
    
    // selecionar o glifo atual
    char caractere = texto.charAt(i);
    Glifo glifo = fonte.getGlifo(caractere);
    int modulosHor = glifo.getNumModulosHor();
    int modulosVer = glifo.getNumModulosVer();
    
    // desenhar grelha de modulos do glifo atual
    for (int linha = 0; linha < modulosVer; linha++) {
      float moduloY = y + linha * dimModulo;
      for (int coluna = 0; coluna < modulosHor; coluna++) {
        float moduloX = glifoX + coluna * dimModulo;
        char modulo = glifo.getModulo(coluna, linha);
        if (modulo == '+') {
          fill(255, 100, 0);
          stroke(240);
          strokeWeight(2);
          rect(moduloX, moduloY, dimModulo, dimModulo);
        }
      }
    }
    
    // adicionar a largura do glifo que foi desenhado e mais um bocado
    glifoX += dimModulo * (modulosHor + 1); 
  }
}

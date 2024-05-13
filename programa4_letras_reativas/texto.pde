void desenharTexto(String texto, float x, float y, float dimModulo) {
  float glifoX = x;

  // Repetir para cada cada caractere do texto
  for (int i = 0; i < texto.length(); i++) {

    // Selecionar o glifo atual
    char caractere = texto.charAt(i);
    Glifo glifo = fonte.getGlifo(caractere);
    int modulosHor = glifo.getNumModulosHor();
    int modulosVer = glifo.getNumModulosVer();

    // Desenhar grelha de modulos do glifo atual
    for (int linha = 0; linha < modulosVer; linha++) {
      float moduloY = y + linha * dimModulo;
      for (int coluna = 0; coluna < modulosHor; coluna++) {
        float moduloX = glifoX + coluna * dimModulo;
        char modulo = glifo.getModulo(coluna, linha);
        if (modulo == '+') {
          desenharModulo(moduloX, moduloY, dimModulo);
        }
      }
    }

    // Adicionar a largura do glifo que foi desenhado e uma margem
    glifoX += dimModulo * (modulosHor + 1);
  }
}

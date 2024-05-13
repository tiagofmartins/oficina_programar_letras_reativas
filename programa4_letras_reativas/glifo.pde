class Glifo {
  
  char caractere;
  int numLinhas;
  int numColunas;
  char[][] modulos;
  
  Glifo(char c, int colunas, int linhas) {
    caractere = c;
    numLinhas = linhas;
    numColunas = colunas;
    modulos = new char[numLinhas][numColunas];
    for (int linha = 0; linha < numLinhas; linha++) {
      for (int coluna = 0; coluna < numColunas; coluna++) {
        modulos[linha][coluna] = ' ';
      }
    }
  }
  
  void setModulo(int coluna, int linha, char modulo) {
    modulos[linha][coluna] = modulo;
  }
  
  char getModulo(int coluna, int linha) {
    return modulos[linha][coluna];
  }
  
  int getNumModulosHor() {
    return numColunas;
  }
  
  int getNumModulosVer() {
    return numLinhas;
  }
}

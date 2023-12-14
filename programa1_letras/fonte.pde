import java.util.Map;

class Fonte {

  HashMap<Character, Glifo> glifos = new HashMap<Character, Glifo>();

  Fonte(String caminhoFicheiroModulos) {
    // ler conteudo do ficheiro de texto
    String[] linhasConteudo = loadStrings(caminhoFicheiroModulos);
    String[] partesConteudo = String.join("\n", linhasConteudo).split("\n/");

    // ler o numero de modulos verticalmente especificado no inicio do ficheiro
    int numModulosVer = Integer.valueOf(partesConteudo[0].strip());
    
    // para cada glifo especificado no ficheiro
    for (int parte = 1; parte < partesConteudo.length; parte++) {
      String[] linhasParte = partesConteudo[parte].split("\n");

      // determinar o caractere atual
      char caractere = linhasParte[0].charAt(0);

      // determinar o numero maximo de glifos horizontalmente
      int numModulosHor = 0;
      for (int linha = 1; linha < linhasParte.length; linha++) {
        int numModulos = linhasParte[linha].replaceAll("\\s+$", "").length(); // ignorar espacos no final da linha
        numModulosHor = max(numModulosHor, numModulos);
      }

      // criar glifo vazio com a dimensao esperada
      Glifo glifo = new Glifo(caractere, numModulosHor, numModulosVer);
      glifos.put(caractere, glifo);

      // preencher modulos do glifo
      for (int linha = 1; linha < linhasParte.length; linha++) {
        for (int coluna = 0; coluna < linhasParte[linha].length(); coluna++) {
          glifo.setModulo(coluna, linha - 1, linhasParte[linha].charAt(coluna));
        }
      }
    }

    // calcular numero medio de modulos horizontalmente
    int sumModulosHor = 0;
    for (Map.Entry<Character, Glifo> g : glifos.entrySet()) {
      sumModulosHor += g.getValue().getNumModulosHor();
    }
    int mediaModulosHor = round(sumModulosHor / float(glifos.size()));
    
    // criar glifo para o espaco entre palavras
    Glifo glifoEspaco = new Glifo(' ', mediaModulosHor, numModulosVer);
    glifos.put(' ', glifoEspaco);
    
    // criar glifo especial para caracteres nao especificados no ficheiro
    Glifo glifoEspecial = new Glifo('§', mediaModulosHor, numModulosVer);
    glifos.put('§', glifoEspecial);
    for (int linha = 0; linha < numModulosVer; linha++) {
      for (int coluna = 0; coluna < mediaModulosHor; coluna++) {
        glifoEspecial.setModulo(coluna, linha, '+');
      }
    }
  }

  Glifo getGlifo(char caractere) {
    // devolve o glifo para um determinado caractere
    if (glifos.containsKey(caractere)) {
      return glifos.get(caractere);
    } else {
      return glifos.get('§');
    }
  }
}

Fonte fonte;
boolean guardar = false;

void setup() {
  size(900, 500, P2D);
  smooth(8);
  fonte = new Fonte("letras.txt");
}

void draw() {
  background(240);
  desenharTexto("LETRAS", 50, 50, 15);
  desenharTexto("MODULARES", 50, 160, 15);
  
  if (guardar) {
    save(System.currentTimeMillis() + ".png");
    guardar = false;
  }
}

void keyReleased() {
  // Guardar imagem quando uma tecla é pressionada
  guardar = true;
}

void desenharModulo(float x, float y, float dim) {
  // Desenhar modulo na posicao <x,y> e com a dimensao <dim>
  fill(255, 100, 0);
  stroke(240);
  strokeWeight(2);
  rect(x, y, dim, dim);
}

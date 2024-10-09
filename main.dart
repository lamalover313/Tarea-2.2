//Crea un programa que verifique si un número es par o impar.
void main() {
  verificarParImpar(5);
  verificarParImpar(52);
}
void verificarParImpar(int n) {
  if (n % 2 == 0)
    print('$n es par');
  else
    print('$n es impar');
}

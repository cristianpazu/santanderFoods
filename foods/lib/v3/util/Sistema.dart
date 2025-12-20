class Sistema {

  int parsePrecio(String? precio) {
  if (precio == null) return 0;

  return int.tryParse(
    precio.replaceAll(RegExp(r'[^0-9]'), ''),
  ) ?? 0;
}

String formato(int valor) {
  return valor.toString().replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => '.',
  );
}
}
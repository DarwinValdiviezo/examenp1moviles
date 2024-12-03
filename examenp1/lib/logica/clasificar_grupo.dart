String clasificarGrupo(String nombre, String sexo) {
  nombre = nombre.toUpperCase();
  sexo = sexo.toLowerCase();

  if (sexo == 'femenino' && nombre.compareTo('M') < 0) {
    return 'A';
  } else if (sexo == 'masculino' && nombre.compareTo('N') > 0) {
    return 'A';
  } else {
    return 'B';
  }
}

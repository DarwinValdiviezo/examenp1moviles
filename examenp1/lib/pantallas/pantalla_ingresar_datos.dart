import 'package:flutter/material.dart';
import 'pantalla_resultado.dart';

class PantallaIngresarDatos extends StatefulWidget {
  @override
  _PantallaIngresarDatosState createState() => _PantallaIngresarDatosState();
}

class _PantallaIngresarDatosState extends State<PantallaIngresarDatos> {
  final TextEditingController nombreController = TextEditingController();
  String generoSeleccionado = "Femenino";
  String mensajeError = "";

  @override
  Widget build(BuildContext context) {
    double alturaPantalla = MediaQuery.of(context).size.height;
    double anchoPantalla = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: alturaPantalla,
        width: anchoPantalla,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6EBB02),
              Color(0xFFFFE135),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // HEADER
            Container(
              padding: EdgeInsets.symmetric(vertical: alturaPantalla * 0.05),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  'Ingrese sus datos',
                  style: TextStyle(
                    fontSize: alturaPantalla * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: alturaPantalla * 0.05),

            // FORMULARIO
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: anchoPantalla * 0.05),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NOMBRE
                      Text(
                        'Nombre',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: nombreController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                          ),
                          onChanged: (_) {
                            setState(() {
                              mensajeError = "";
                            });
                          },
                        ),
                      ),
                      if (mensajeError.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            mensajeError,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      SizedBox(height: alturaPantalla * 0.03),

                      // GÉNERO
                      Text(
                        'Seleccione su género',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: generoSeleccionado,
                          items: [
                            DropdownMenuItem(
                              value: "Femenino",
                              child: Text("Femenino"),
                            ),
                            DropdownMenuItem(
                              value: "Masculino",
                              child: Text("Masculino"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              generoSeleccionado = value!;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: alturaPantalla * 0.05),

                      // BOTÓN
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            String nombre = nombreController.text.trim();

                            if (nombre.isEmpty) {
                              setState(() {
                                mensajeError = "Por favor ingrese su nombre.";
                              });
                              return;
                            } else if (!RegExp(r"^[a-zA-Z]+$")
                                .hasMatch(nombre)) {
                              setState(() {
                                mensajeError =
                                    "El nombre debe contener solo letras y sin espacios.";
                              });
                              return;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PantallaResultado(
                                  nombre: nombre,
                                  sexo: generoSeleccionado,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF6EBB02),
                            padding: EdgeInsets.symmetric(
                              horizontal: anchoPantalla * 0.2,
                              vertical: alturaPantalla * 0.02,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Ver Resultado',
                            style: TextStyle(
                              fontSize: alturaPantalla * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

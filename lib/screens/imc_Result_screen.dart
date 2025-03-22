import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;
  const ImcResultScreen(
      {super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolBarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double imcResult = weight / ((height / 100) * (height / 100));
    final imcDetails = getImcDetails(imcResult);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tu resultado",
            style: TextStyle(
                fontSize: 38, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.backgroundComponent,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(imcDetails['title'].toUpperCase(),
                        style: TextStyle(
                            fontSize: 30,
                            color: imcDetails['color'],
                            fontWeight: FontWeight.w600)),
                    Text(
                      "${imcResult.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 74,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(imcDetails['description'],
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white54,
                              fontWeight: FontWeight.w400),
                              textAlign: TextAlign.justify),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                    backgroundColor:
                        WidgetStateProperty.all(AppColors.primary)),
                child: Text(
                  "Finalizar",
                  style: TextStyles.bodyText,
                )),
          )
        ],
      ),
    );
  }

  AppBar toolBarResult() {
    return AppBar(
      title: Text("Resultado IMC"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }
  
  Map<String, dynamic> getImcDetails(double imcResult) {
    String title;
    String description;
    Color color;

    if (imcResult < 18.5) {
      title = "BAJO PESO";
      description = "Tu peso está por debajo de lo normal. Es importante que consultes a un profesional de la salud para evaluar tu estado nutricional.";
      color = Colors.blue;
    } else if (imcResult < 24.9) {
      title = "NORMAL";
      description = "Tu peso está dentro del rango normal. Mantén una dieta equilibrada y ejercicio regular para mantener tu salud.";
      color = Colors.green;
    } else if (imcResult < 29.9) {
      title = "SOBREPESO";
      description = "Tienes un peso superior al normal. Considera adoptar hábitos saludables para evitar posibles problemas de salud.";
      color = Colors.orange;
    } else if (imcResult < 34.9) {
      title = "OBESIDAD I";
      description = "Estás en el primer grado de obesidad. Es recomendable que busques asesoramiento médico para mejorar tu salud.";
      color = Colors.red;
    } else if (imcResult < 39.9) {
      title = "OBESIDAD II";
      description = "Estás en el segundo grado de obesidad. Es importante que tomes medidas para reducir tu peso y mejorar tu bienestar.";
      color = Colors.redAccent;
    } else {
      title = "OBESIDAD III";
      description = "Estás en el tercer grado de obesidad. Es crucial que busques ayuda médica para abordar los riesgos asociados con tu peso.";
      color = Colors.deepOrange;
    }

    return {
      'title': title,
      'description': description,
      'color': color,
    };
  }
}

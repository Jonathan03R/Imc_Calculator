import 'package:flutter/material.dart';
import 'package:imc_calculadora/components/gender_selector.dart';
import 'package:imc_calculadora/components/heigth_selector.dart';
import 'package:imc_calculadora/components/number_selector.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';
import 'package:imc_calculadora/screens/imc_Result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 30;
  int selectedWeight = 50;
  double selectedHeigth = 170;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeigthSelector(
            selectedHeigth: selectedHeigth,
            onHeigthChange: (newHeigth) {
              setState(() {
                selectedHeigth = newHeigth;
              });
            }),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            Expanded(
                child: NumberSelector(
                    title: "PESO",
                    value: selectedWeight,
                    onIncrement: () {
                      setState(() {
                        selectedWeight++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        selectedWeight--;
                      });
                    })),
            SizedBox(width: 16),
            Expanded(
                child: NumberSelector(
                    title: "EDAD",
                    value: selectedAge,
                    onIncrement: () {
                      setState(() {
                        selectedAge++;
                      });
                    },
                    onDecrement: () {
                      setState(() {
                        selectedAge--;
                      });
                    })),
          ]),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImcResultScreen(
                                height: selectedHeigth,
                                weight: selectedWeight,
                            )));
                  },
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      backgroundColor:
                          WidgetStateProperty.all(AppColors.primary)),
                  child: Text("calcular", style: TextStyles.bodyText))),
        )
      ],
    );
  }
}

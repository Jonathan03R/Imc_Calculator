import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';

class HeigthSelector extends StatefulWidget {

  final double selectedHeigth;
  final Function(double) onHeigthChange;
  const HeigthSelector({super.key, required this.selectedHeigth, required this.onHeigthChange});

  @override
  State<HeigthSelector> createState() => _HeigthSelectorState();
}

class _HeigthSelectorState extends State<HeigthSelector> {
  // double heigth = 170; // esto es la altura por default

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text("ALTURA", style: TextStyles.bodyText),
            ),
            Text("${ widget.selectedHeigth.toStringAsFixed(0)} cm",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold)),
            Slider(
              value: widget.selectedHeigth,
              onChanged: (newHeigth) {
                widget.onHeigthChange(newHeigth);
              },
              min: 100,
              max: 220,
              divisions: 120,
              label: "${widget.selectedHeigth.toStringAsFixed(0)} cm",
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

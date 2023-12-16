import 'package:dice_riverpod/app_constans/colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dice_riverpod/providers/dice_random_numbers_provider.dart';
import 'package:dice_riverpod/widgets/dice_widget.dart';

class DiceView extends StatelessWidget {
  const DiceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        title: const Text(
          'Dicee',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final diceProvider = ref.watch(
                  diceRandomNumberNotifierProvider,
                );

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    DiceWidget(
                      onPressed: () {
                        ref
                            .read(diceRandomNumberNotifierProvider.notifier)
                            .changeDice();
                      },
                      diceNumber: diceProvider.left.toString(),
                    ),
                    DiceWidget(
                      onPressed: () {
                        ref
                            .read(diceRandomNumberNotifierProvider.notifier)
                            .changeDice();
                      },
                      diceNumber: diceProvider.right.toString(),
                    ),
                  ],
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return TextButton(
                  onPressed: () {
                    ref
                        .read(diceRandomNumberNotifierProvider.notifier)
                        .restart();
                  },
                  child: const Text(
                    'Restart',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

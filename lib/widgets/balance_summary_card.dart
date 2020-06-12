import 'package:flutter/material.dart';

import '../custom_colors.dart';

class BalanceSummaryCard extends StatelessWidget {
  // Only asking for the balance in case the way formatting the balance changes later.
  // Use it to see if it's negative or positive to determine the color of the card
  final double balance;
  final String formattedBalance;

  const BalanceSummaryCard({
    @required this.balance,
    @required this.formattedBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          // To match Card's border radius.
          borderRadius: BorderRadius.circular(4),
          color: balance >= 0
              ? CustomColors.incomeColor
              : CustomColors.expenseColor,
        ),
        child: Column(
          children: <Widget>[
            // Must surround text with container so it will take up space to align left.
            Container(
              width: double.infinity,
              child: const Text(
                'Balance',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            // Must surround text with container so it will take up space to align right.
            Container(
              // SizedBox would take up too much height otherwise.
              height: 80,
              width: double.infinity,
              child: FittedBox(
                alignment: Alignment.bottomRight,
                // Only shrink the fontSize if needed, but don't grow it.
                fit: BoxFit.scaleDown,
                child: Text(
                  formattedBalance,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
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

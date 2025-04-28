import 'package:batt_ds/batt_ds.dart';
import 'package:flutter/material.dart';

final class OnboardingFormHeader extends StatefulWidget {
  final String title;
  final double progress;
  final bool backButtonEnabled;
  final Function() onbackPressed;

  const OnboardingFormHeader({
    required this.title,
    required this.progress,
    required this.onbackPressed,
    this.backButtonEnabled = true,
    super.key,
  });

  @override
  OnboardingFormHeaderState createState() => OnboardingFormHeaderState();
}

class OnboardingFormHeaderState extends State<OnboardingFormHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.xxlarge.all.subtract(AppPaddings.xlarge.bottom),
      child: SizedBox(
        height: 68,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppSpacings.lg,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Opacity(
                  opacity: widget.backButtonEnabled ? 1 : 0,
                  child: IconButton(
                    style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(CornerRadii.s.x),
                          ),
                        ),
                        elevation: WidgetStatePropertyAll(0),
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.grey[100]),
                        visualDensity: VisualDensity.compact),
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      weight: 0.75,
                      color: AppColors.grey[800],
                    ),
                    onPressed: () => widget.onbackPressed(),
                  ),
                ),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            LinearProgressIndicator(
                value: widget.progress,
                backgroundColor: AppColors.grey[200],
                color: AppColors.defaultBlue),
          ],
        ),
      ),
    );
  }
}

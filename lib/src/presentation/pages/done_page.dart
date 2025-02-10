import 'package:flutter/material.dart';
import 'onboarding_page.dart';

final class OnboardingDonePage extends OnboardingPage {
  OnboardingDonePage({
    super.key,
    required super.formKey,
    required super.onAction,
    super.initialData,
  });

  @override
  OnboardingDonePageState createState() => OnboardingDonePageState();
}

class OnboardingDonePageState extends State<OnboardingDonePage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onAction({});
    });
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(60.0),
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 800, maxHeight: 800),
            child: Column(
              children: [
                Icon(Icons.check),
                Text("All done!"),
                Text(
                    "Thank you for completing the onboarding process. We hope you have a great experience using our app."),
                ElevatedButton(
                  onPressed: () {
                    widget.onAction({});
                  },
                  child: Text("Go to Home Page"),
                )
              ],
            )),
      ),
    );
  }
}

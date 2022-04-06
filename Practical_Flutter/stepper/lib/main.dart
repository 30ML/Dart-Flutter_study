import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stepper Demo'),
        ),
        body: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepContinue:
              _currentStep < 2 ? () => setState(() => _currentStep += 1) : null,
          onStepCancel:
              _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
          steps: const [
            Step(
              title: Text('Get Ready'),
              isActive: true,
              content: Text('Let\'s begin..'),
            ),
            Step(
              title: Text('Get Set'),
              isActive: true,
              content: Text('Ok, just a little more..'),
            ),
            Step(
              title: Text('Go!'),
              isActive: true,
              content: Text('And, We\'re done!'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(
                  height: 150.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 200.0,
                      child: Image.asset(
                          'assets/images/onboarding.png'
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0,
                  right: 15.0,
                    top: 15.0,
                    bottom: 5.0
                  ),
                  child: Text('Stay on top of your finance with us.',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0
                  ),
                  textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0,
                  right: 15.0,
                    bottom: 15.0
                  ),
                  child: Text('We are your new financial Advisors to recommend the best investments for you.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 50.0,
                    width: 100.0,
                    child: ElevatedButton(
                      onPressed: () => context.pushReplacement('/login'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                        foregroundColor: MaterialStateProperty.all(Colors.white)
                      ),
                        child: const Text('Login',
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                        ),
                    ),
                  ),
                )
              ])
          ),
        ],
      ),
    );
  }
}

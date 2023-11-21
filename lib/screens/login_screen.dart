import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  TextEditingController nameController= TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverList(delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Login to your account',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
            ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 8.0,
              left: 8.0),
              child: Text('Invest and double your income now',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'username',
                        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey
                        ),
                        prefixIcon: const Icon(
                            Icons.person,
                          color: Colors.grey,
                          size: 18.0,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey
                          ),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: isVisible ? false : true,
                      decoration: InputDecoration(
                          hintText: 'password',
                        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey
                        ),
                          prefixIcon: const Icon(
                              Icons.lock,
                            color: Colors.grey,
                            size: 18.0,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                                isVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                              size: 18.0,
                            ),
                            onPressed: (){
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),

                      ),
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50.0,),
                    ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()) {
                            context.pushReplacement('/bottomNavigationBar', extra: nameController.text);
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                            foregroundColor: MaterialStateProperty.all(Colors.white)
                        ),
                        child: const Text('Login')
                    )
                  ],
                ),
              ),
            ),
          ]),
          ),
        ],
      ),
    );
  }
}

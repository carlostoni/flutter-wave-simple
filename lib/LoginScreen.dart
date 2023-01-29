import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Color.fromARGB(255, 35, 90, 37),
                  Color.fromARGB(255, 57, 165, 113)
                ],
              ),
            ),
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [Colors.white, Colors.green],
                  [
                    Color.fromARGB(255, 15, 36, 46),
                    Color.fromARGB(255, 13, 71, 119),
                    Colors.green
                  ],
                ],
                durations: [19440, 10800],
                heightPercentages: [0.30, 0.35],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 0,
              size: Size(double.infinity, double.infinity),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.6),
            child: SizedBox(
              child: Container(
                width: 350,
                height: 275,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                   boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(4.0, 4.0), //(x,y)
                    blurRadius: 10.0,
                  ),
                ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              labelText: "Usuário",
                              // ignore: prefer_const_constructors
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Insira o usuário";
                            }
                            return null;
                          },
                          onSaved: (value) => _username = value!,
                        ),
                        TextFormField(
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                              labelText: "Senha",
                              // ignore: prefer_const_constructors
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Insira a senha";
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value!,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 50),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (_username == "admin" &&
                                  _password == "admin") {
                                Navigator.pushReplacementNamed(
                                    context, "/home");
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Usuário ou senha incorretos"),
                                ));
                              }
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                            child: Text('Entrar',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

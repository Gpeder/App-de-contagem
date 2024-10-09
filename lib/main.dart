import 'package:flutter/material.dart'; // Importando o pacote do Flutter

void main() { 
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget { 
  const MyApp({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: HomePage(), 
    );
  }
}

class HomePage extends StatefulWidget { 
  HomePage({Key? key}) : super(key: key); 

  @override
  _HomePageState createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage> { 
  int count = 0; 

  void decrement() { 
    setState(() {
      count--; 
    });
    print(count); 
  }

  void increment() { 
    setState(() {
      count++; 
    });
    print(count); 
  }

  bool get isEmpty => count == 0; 
  bool get isFull => count == 20; 

  @override
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: Container( 
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.jpg'), 
            fit: BoxFit.cover, 
          ),
        ),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            // TEXTO INFORMATIVO
            Text( 
              isFull ? 'Lotado' : 'Pode entrar!', 
              style: const TextStyle(
                fontSize: 60, 
                color: Colors.white, 
                fontWeight: FontWeight.w500, 
              ),
            ),
            const SizedBox(height: 20), 
            // CONTAGEM
            Text( 
              '$count', 
              style: const TextStyle(
                fontSize: 100, 
                color: Colors.white, 
                fontWeight: FontWeight.w700, 
              ),
            ),
            const SizedBox(height: 30), 
            // BOTÕES
            Row( 
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                // BOTÃO SAIR
                TextButton( 
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white, 
                    fixedSize: const Size(120, 120), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), 
                    ),
                  ),
                  onPressed: isEmpty ? null : decrement, 
                  child: const Text(
                    'Saiu', 
                    style: TextStyle(
                      fontSize: 30, 
                      color: Colors.black, 
                      fontWeight: FontWeight.w500, 
                    ),
                  ),
                ),
                const SizedBox(width: 20), 
                // BOTÃO ENTRAR
                TextButton( 
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white, 
                    fixedSize: const Size(120, 120), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), 
                    ),
                  ),
                  onPressed: isFull ? null : increment, 
                  child: const Text(
                    'Entrou', 
                    style: TextStyle(
                      fontSize: 30, 
                      color: Colors.black, 
                      fontWeight: FontWeight.w500, 
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
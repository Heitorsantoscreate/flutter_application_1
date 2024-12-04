import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white), // Corrigido para bodyLarge
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Cor do texto do botão
        padding: EdgeInsets.all(20), // Maior padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Bordas arredondadas
        ),
        elevation: 8, // Sombra para dar efeito de elevação
        textStyle:
            TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // Texto maior
      ),
    ),
  );

  static final ButtonStyle numericButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 57, 56, 56), // Fundo preto
    foregroundColor: Colors.white, // Texto branco
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Bordas arredondadas
    ),
    elevation: 8, // Sombra para dar efeito de elevação
    padding: EdgeInsets.all(20), // Maior padding
    textStyle:
        TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // Texto maior
  );

  static final ButtonStyle operatorButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 88, 23, 194), // Fundo azul escuro
    foregroundColor: Colors.white, // Texto branco
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Bordas arredondadas
    ),
    elevation: 8, // Sombra para dar efeito de elevação
    padding: EdgeInsets.all(20), // Maior padding
    textStyle:
        TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // Texto maior
  );

  static final ButtonStyle clearButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 230, 139, 12), // Fundo vermelho para o "C"
    foregroundColor: Colors.white, // Texto branco
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Bordas arredondadas
    ),
    elevation: 8, // Sombra para dar efeito de elevação
    padding: EdgeInsets.all(20), // Maior padding
    textStyle:
        TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // Texto maior
  );
}

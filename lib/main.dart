import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_spintech/view_model/product_view_model.dart';
import 'package:test_spintech/views/landing/landing.dart';

void main(List<String> args) {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ProductViewModel())
      ],
      child: MaterialApp(
        home: const LandingScreen(),
        theme: ThemeData(
          textTheme: TextTheme(
            titleLarge: GoogleFonts.zenDots(
              fontWeight: FontWeight.w400,
              fontSize: 30,
              color: Colors.white
            ),
            bodyLarge: GoogleFonts.spaceGrotesk(
              fontSize: 18,
              color: Colors.white
            ),
            bodyMedium: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
          )
        ),
      ),
    );
  }
}

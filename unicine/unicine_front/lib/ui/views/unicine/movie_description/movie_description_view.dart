import 'package:flutter/material.dart';
import 'package:uni_cine/ui/views/unicine/movie_description/function_program.dart';
import 'package:uni_cine/ui/views/unicine/movie_description/movie_data.dart';

class MovieDescriptionView extends StatelessWidget {
  // final String urlVideo;
  // final String movie;

  const MovieDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MovieData(),
            SizedBox(width: 150),
            FunctionProgram(),
          ],
        ),
      ),
    );
  }
}

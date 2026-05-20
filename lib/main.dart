import 'package:flutter/material.dart';
import 'database.dart';
import 'model/filme_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
      ),

      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Filme> listaFilmes = Database.filmes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.amber,

        title: const Text(
          "imdbFlutter",

          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),

        centerTitle: true,
      ),

      body: ListView.builder(

        itemCount: listaFilmes.length,

        itemBuilder: (context, index) {

          Filme filme = listaFilmes[index];

          return Container(

            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),

            child: ListTile(

              leading: Container(

                width: 55,
                height: 55,

                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: const Icon(
                  Icons.movie,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              title: Text(
                filme.titulo,

                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              subtitle: Text(
                "${filme.anoLancamento}",

                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),

              trailing: Container(

                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Text(
                  filme.imdb.toString(),

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              onTap: () {
                print("Clicou em ${filme.titulo}");
              },

              onLongPress: () {
                print(
                  "Você clicou LongPress no filme ${filme.titulo}",
                );
              },
            ),
          );
        },
      ),
    );
  }
}
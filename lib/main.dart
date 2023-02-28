import 'package:contador_bloc/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/bloc_imports.dart';

void main() async {
  // Garante que a biblioteca de widgets do FLutter esteja inicializada;
  WidgetsFlutterBinding.ensureInitialized();

  // Configura o armazenamento persistente do estado do bloc com hydrated_bloc;
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  // Toda vez que a mudança de estado a instância é notificada podendo registrar info;
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

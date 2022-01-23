import 'package:block_sample/connectivity/connectivity_cubit.dart';
import 'package:block_sample/counter/counter_cubic.dart';
import 'package:block_sample/todo/data/database_repository.dart';
import 'package:block_sample/todo/data/network_services.dart';
import 'package:block_sample/todo/data/repository.dart';
import 'package:block_sample/todo/logic/cubic/auth_cubit.dart';
import 'package:block_sample/todo/logic/cubic/todo_bloc.dart';
import 'package:block_sample/todo/presentation/screen/login_screen.dart';
import 'package:block_sample/todo/presentation/screen/todo_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Repository repository = Repository(networkService: NetworkService());
    DatabaseRepository databaseRepository = DatabaseRepository();

    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(repository: repository,
    hiveRepository: databaseRepository),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TodoBloc(repository: repository,hiveRepository: databaseRepository),
          )
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white
            ),
            home: SplashScreen()
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black87, body:
    BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated && !state.isAuthenticated) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (builder) => LoginScreen()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (builder) => TodoScreen()));
        }
      },
      child: const Center(
        child: Icon(Icons.today, color: Colors.white, size: 200,),),
    ),);
  }

}





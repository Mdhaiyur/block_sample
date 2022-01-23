import 'package:bloc/bloc.dart';
import 'package:block_sample/todo/data/database_repository.dart';
import 'package:block_sample/todo/data/model/user.dart';
import 'package:block_sample/todo/data/model/user_response.dart';
import 'package:block_sample/todo/data/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Repository repository;
  final DatabaseRepository hiveRepository;

  AuthCubit({required this.repository,required this.hiveRepository}) : super(AuthInitial()) {
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(UserModelAdapter());
    openHiveBox();
  }

  openHiveBox() async {
    await hiveRepository.openBox();
    checkUserStatus();
  }

  checkUserStatus(){
    var user=hiveRepository.getModels();
    if(user.length==0){
      emit(Authenticated(isAuthenticated: false));
    }
    else{
      emit(Authenticated(isAuthenticated: true));
    }
  }

  loginUser(String email, String password) async {
    emit(AuthLoading());

    UserResponse userResponse = await repository.loginUser(email, password);
    if (userResponse.error == '') {
      await hiveRepository.addUser(userResponse.user!);

      emit(LoginSuccess(user: userResponse.user!));
    } else {
      emit(AuthFailed(errorMessage: userResponse.error!));
    }
  }

  registerUser(String email,String password,String name,int age) async {
    emit(AuthLoading());

    UserResponse userResponse = await repository.signupUser(email, password,name,age);
    if (userResponse.error == '') {
      await hiveRepository.addUser(userResponse.user!);

      emit(LoginSuccess(user: userResponse.user!));
    } else {
      emit(AuthFailed(errorMessage: userResponse.error!));
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    print(change);
  }
}

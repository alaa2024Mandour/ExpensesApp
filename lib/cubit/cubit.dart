import 'package:expenses_app/cubit/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesCubit extends Cubit<Status> {
  ExpensesCubit() : super(InitialState());

  static ExpensesCubit get(context) => BlocProvider.of(context);

}
import 'package:bloc/bloc.dart';
import 'package:geekz_challenge/models/all_news_response.dart';
import 'package:meta/meta.dart';
import '../data/repositories/all_news_repo.dart';
import '../data/service_locator.dart';

part 'all_news_event.dart';
part 'all_news_state.dart';

class AllNewsBloc extends Bloc<AllNewsEvent, AllNewsState> {
  AllNewsBloc() : super(AllNewsInitial()) {
    on<GetAllNewsEvent>((event, emit) async{
      emit(LoadingAllNewsState());
      var allNewsRepo = sl<AllNewsRepo>();
      try{
        var _response = await allNewsRepo.getAllNews();
        emit(LoadedAllNewsState(_response));
      }
      catch(e){
        emit(ErrorAllNewsState(e.toString()));
      }
    });
  }

}

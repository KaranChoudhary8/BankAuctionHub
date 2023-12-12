import 'package:bank_auction_hub/Models/auction_detail_model.dart';
import 'package:bloc/bloc.dart';

class ListToDetailCubit extends Cubit<ListToDetailState> {
  ListToDetailCubit() : super(ListToDetailState(selectedIndex: -1));

  void userClickedonListCard({required int index, AuctionDetailModel? model}) {
    emit(state.copyWith(sIndex: index, sModel: model));
  }
}

class ListToDetailState {
  final AuctionDetailModel? selectedModel;
  final int selectedIndex;
  ListToDetailState({this.selectedModel, required this.selectedIndex});

  ListToDetailState copyWith({AuctionDetailModel? sModel, int? sIndex}) {
    return ListToDetailState(
        selectedIndex: sIndex ?? selectedIndex,
        selectedModel: sModel ?? selectedModel);
  }
}

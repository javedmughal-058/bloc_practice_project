import 'package:equatable/equatable.dart';

abstract class FavouriteEvent extends Equatable{
  const FavouriteEvent();

}

class FetchFavouriteList extends FavouriteEvent{

  const FetchFavouriteList();

  @override
  List<Object?> get props => [];
}

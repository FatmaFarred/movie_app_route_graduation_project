import 'package:dartz/dartz.dart';

import '../../../../Api manager/errors/failure.dart';
import '../../../entities/MovieDetailsResponseEntity.dart';
import '../../../entities/MovieSuggetionResponseEntity.dart';

abstract class MovieDetailsDataSource {

  Future <Either<Failure,MovieDetailsResponseEntity>> getMovieDeatials(int id );

  Future <Either<Failure,MovieSuggetionResponseEntity>> getMovieSuggetion(int id );

}

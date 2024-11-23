import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entites/banners_entity.dart';
import '../entites/categories_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoriesEntity>>> getCategories({int? id});
  Future<Either<Failure, List<BannersEntity>>> getBanners();
}

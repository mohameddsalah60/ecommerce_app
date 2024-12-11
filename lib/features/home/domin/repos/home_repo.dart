import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entites/banners_entity.dart';
import '../../../categories/domin/entites/categories_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
  Future<Either<Failure, List<BannersEntity>>> getBanners();
}

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entites/categories_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoriesEntity>>> getCategories({int? id});
}

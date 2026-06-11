import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/utils/result.dart';
import '../models/dashboard_model.dart';

class DashboardRepository {
  DashboardRepository(this._dioClient);

  final DioClient _dioClient;

  Future<Result<DashboardModel>> getDashboardStats() async {
    try {
      final response = await _dioClient.get(ApiConstants.dashboard);
      final data = (response.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
      return Success(DashboardModel.fromJson(data));
    } catch (e) {
      return FailureResult(_mapException(e));
    }
  }

  Failure _mapException(Object e) {
    if (e is ServerException) {
      return ServerFailure(e.message, statusCode: e.statusCode, errors: e.errors);
    }
    if (e is NetworkException) {
      return NetworkFailure(e.message);
    }
    if (e is UnauthorizedException) {
      return UnauthorizedFailure(e.message);
    }
    return UnknownFailure(e.toString());
  }
}

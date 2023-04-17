
import 'package:driver/app/models/geocode/geocode_request.dart';
import 'package:driver/app/models/geocode/geocode_response.dart';
import 'package:driver/app/models/search/place_details_response.dart';
import 'package:driver/config/config.dart';
import 'package:driver/global_constants/global_constants.dart';

import '../../models/error/api_error.dart';
import '../../models/search/search_destination_result.dart';
import '../../models/user/user_data.dart';
import '../../network/api_handler.dart';
import '../../network/api_s.dart';
import '../repositories/app_repo.dart';

class AppRepoImplementaion implements AppRepo {
  @override
  Future getUserInfo() async {
    final response =
        await APIHandler.hitApi(dio.get("${APIs.appApiUrl}/users"));
    if (response is APIError) {
      return response;
    } else {
      return UserDataResponse.fromJson(response);
    }
  }

  @override
  Future getUserCurrentAddress({GeocodeRequest? request}) async {
    final response = await APIHandler.hitApi(dio.get(
      "${APIs.geocode}latlng=${request!.latlng}&key=${request.key}",
    ));

    if (response is APIError) {
      return response;
    } else {
      return GeocodeResponse.fromJson(response);
    }
  }

  @override
  Future searchDestination(String placeName) async {
    final response = await APIHandler.hitApi(dio.get(
      "${APIs.placeAutoComplete}input=$placeName&key=${Config.mapKey}&sessiontoken=1234567890&components=country:np",
    ));

    if (response is APIError) {
      return response;
    } else {
      return SearchDestinationResponse.fromJson(response);
    }
  }

  @override
  Future placeDetails(String placeId) async {
    final response = await APIHandler.hitApi(dio.get(
      "${APIs.placeDetails}placeid=$placeId&key=${Config.mapKey}",
    ));

    if (response is APIError) {
      return response;
    } else {
      return PlaceDetailsResponse.fromJson(response);
    }
  }
}

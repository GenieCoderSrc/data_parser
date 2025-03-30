import 'package:flutter/foundation.dart';

import 'i_data_sources/i_list_data_parser_service.dart';

class ListDataParserServiceImpl<M> extends IListDataParserService<M> {
  // static DataParserServiceImpl? _instance;
  //
  // DataParserServiceImpl._();
  //
  // static DataParserServiceImpl get getInstance =>
  //     _instance ??= DataParserServiceImpl._();

  @override
  List<M>? parseStreamListData(
      {required List<Object?> event, required Function converter}) {
    try {
      return event
          .map<M>((Object? item) => converter(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint(
          'DataParserServiceImpl | $M | parseStreamListData | error: $e');

      return null;
    }
  }

  @override
  List<M>? parseFutureDataList(
      {required List<Object>? mapList,
      required Function(Map<String, dynamic> item) converter}) {
    try {
      return mapList
          ?.map<M>((Object? item) => converter(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint(
          'DataParserServiceImpl | $M | parseStreamListData | error: $e');

      return null;
    }
  }
}

List<M>? parseFutureDataList<M>(
    {required List<Object>? mapList,
    required Function(Map<String, dynamic> item) converter}) {
  try {
    return mapList
        ?.map<M>((Object? item) => converter(item as Map<String, dynamic>))
        .toList();
  } catch (e) {
    debugPrint('DataParserServiceImpl | $M | parseStreamListData | error: $e');

    return null;
  }
}

// return mapList
//     ?.map<EmployeeModel>((employee) => EmployeeModel.fromJson(employee))
// .toList();

//
//     .map<NotificationModel>(
// (QueryDocumentSnapshot<Map<String, dynamic>>? notification) =>
// notification != null
// ? NotificationModel.fromData(
// json: notification.data(), currentUid: uid)
// : NotificationModel())
// .toList();

// List<ProfileEntity> _convertStreamToMembershipList(List<Object?> event) =>
//     event
//         .map<ProfileEntity>((Object? member) => member != null
//         ? UserModel.fromData(member as Map<String, dynamic>)
//         : UserModel())
//         .toList();

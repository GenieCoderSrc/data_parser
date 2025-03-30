abstract class IListDataParserService<M> {
  List<M>? parseFutureDataList(
      {required List<Object>? mapList,
      required Function(Map<String, dynamic> item) converter});

  List<M>? parseStreamListData(
      {required List<Object?> event, required Function converter});
}

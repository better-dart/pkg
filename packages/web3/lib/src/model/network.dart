///
///
///
class NetWorkOption {
  String? httpUrl;
  String? wsUrl;
  String? name;
  String? type;
  int? networkID;

  NetWorkOption({
    this.httpUrl,
    this.wsUrl,
    this.name,
    this.type,
    this.networkID,
  });

  @override
  String toString() {
    return 'NetWorkMeta{httpUrl: $httpUrl, wsUrl: $wsUrl, name: $name, type: $type, networkID: $networkID}';
  }
}

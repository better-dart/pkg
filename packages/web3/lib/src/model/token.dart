///
/// token 信息格式:
///
class TokenMeta {
  /// 正式链
  String address;

  /// 测试链
  String addressTest;

  /// 符号:
  String symbol;

  /// 图片:
  String logo;
  String name;

  /// 合约协议类型:
  bool isErc20;
  bool isErc721;
  int decimals;

  TokenMeta({
    this.address,
    this.addressTest,
    this.symbol,
    this.logo,
    this.name,
    this.isErc20,
    this.isErc721,
    this.decimals,
  });
}

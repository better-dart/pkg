///
/// token 信息格式:
///
class TokenOption {
  /// 正式链
  String? address;

  /// 测试链
  String? addressTest;

  /// 符号:
  String? symbol;

  /// 图片:
  String? logo;
  String? name;

  /// 合约协议类型:
  bool? isErc20;
  bool? isErc721;
  int? decimals;

  TokenOption({
    this.address,
    this.addressTest,
    this.symbol,
    this.logo,
    this.name,
    this.isErc20,
    this.isErc721,
    this.decimals,
  });

  @override
  String toString() {
    return 'TokenOption{address: $address, addressTest: $addressTest, symbol: $symbol, logo: $logo, name: $name, isErc20: $isErc20, isErc721: $isErc721, decimals: $decimals}';
  }
}

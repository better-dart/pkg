# MonoRepo for Dart/Flutter Packages:

- mono repo:
  - [x] dart packages.
  - [x] flutter packages.

[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)


## Packages:

These are the available plugins in this repository.

| Plugin | Pub | Points | Popularity | Likes |
|--------|-----|--------|------------|-------|
| [kit](./packages/kit/) | [![pub package](https://img.shields.io/pub/v/kit.svg)](https://pub.dev/packages/kit) | [![pub points](https://badges.bar/kit/pub%20points)](https://pub.dev/packages/kit/score) |  [![popularity](https://badges.bar/kit/popularity)](https://pub.dev/packages/kit/score) | [![likes](https://badges.bar/kit/likes)](https://pub.dev/packages/kit/score) |
| [better_ui](./packages/better_ui/) | [![pub package](https://img.shields.io/pub/v/better_ui.svg)](https://pub.dev/packages/better_ui) | [![pub points](https://badges.bar/better_ui/pub%20points)](https://pub.dev/packages/better_ui/score) | [![popularity](https://badges.bar/better_ui/popularity)](https://pub.dev/packages/better_ui/score) | [![likes](https://badges.bar/better_ui/likes)](https://pub.dev/packages/better_ui/score) |
| [web3](./packages/web3/) | [![pub package](https://img.shields.io/pub/v/web3.svg)](https://pub.dev/packages/web3) | [![pub points](https://badges.bar/web3/pub%20points)](https://pub.dev/packages/web3/score) | [![popularity](https://badges.bar/web3/popularity)](https://pub.dev/packages/web3/score) | [![likes](https://badges.bar/web3/likes)](https://pub.dev/packages/web3/score) |
| [crypto_wallet](./packages/crypto_wallet/) | [![pub package](https://img.shields.io/pub/v/crypto_wallet.svg)](https://pub.dev/packages/crypto_wallet) | [![pub points](https://badges.bar/crypto_wallet/pub%20points)](https://pub.dev/packages/crypto_wallet/score) | [![popularity](https://badges.bar/crypto_wallet/popularity)](https://pub.dev/packages/crypto_wallet/score) | [![likes](https://badges.bar/crypto_wallet/likes)](https://pub.dev/packages/crypto_wallet/score) |
| [wallet_connect](./packages/wallet_connect/) | [![pub package](https://img.shields.io/pub/v/wallet_connect.svg)](https://pub.dev/packages/wallet_connect) | [![pub points](https://badges.bar/wallet_connect/pub%20points)](https://pub.dev/packages/wallet_connect/score) | [![popularity](https://badges.bar/wallet_connect/popularity)](https://pub.dev/packages/wallet_connect/score) | [![likes](https://badges.bar/wallet_connect/likes)](https://pub.dev/packages/wallet_connect/score) |




- [x] [better_ui](packages/better_ui): UI库, 封装通用组件, 易于使用.
- [x] [kit](packages/kit): common utils, 基础库, 常用工具方法.
- [x] [web3](packages/web3): web3 wrapper with [web3dart](https://github.com/simolus3/web3dart), 扩展封装.
- [x] [crypto_wallet](packages/crypto_wallet): crypto wallet core lib.
- [x] [wallet_connect](packages/wallet_connect): crypto wallet connect lib.


## Docs/Wiki:

- https://github.com/better-dart/pkg/wiki


## Dart/Flutter Packages:

- https://github.com/better-dart/pkg


## Development:

- 添加一个新 lib:
- 参见: `Makefile`:

```
# https://github.com/hhstore/blog/issues/245
create-pkg:
	cd packages; flutter create --template=package better_ui

```


## better-ui:

- https://pub.dev/packages/better_ui
- how to use:

```yaml

  better_ui: ^0.0.1

  # used by local path:
  better_ui:
    path: /your-local-path-to-here/better-dart/pkg/packages/better_ui # local path

```

## kit:

- dart common utils.
- how to use:
- https://pub.dev/packages/kit


```yaml
  kit: ^0.0.1
```




## wallet-connect:


- [wallet-connect](./packages/wallet_connect): wallet connect for flutter App


- how to use:

```yaml

  # used by git repo:
  wallet_connect:
    git:
      url: https://github.com/better-dart/pkg.git   # repo http clone url
      ref: "babee6d"                                # git tag or git commit-id
      path: packages/wallet_connect                 # pkg path


```


## web3:

- web3 封装
- how to use:

```yaml

  # used by git repo:
  web3:
    git:
      url: https://github.com/better-dart/pkg.git   # repo http clone url
      ref: "babee6d"                                # git tag or git commit-id
      path: packages/web3                           # pkg path


```


## publish pkg:

- https://dart.cn/tools/pub/publishing


```

# double check:
dart pub publish --dry-run


# do publish:
dart pub publish

```

# MonoRepo for Dart/Flutter Packages:

- mono repo:
  - [x] dart packages.
  - [x] flutter packages.

[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)


## Package List:

- [x] [better_ui](packages/better_ui): UI库, 封装通用组件, 易于使用.
- [x] [dust](packages/dust): common utils, 基础库, 常用工具方法.
- [x] [web3](packages/web3): web3 wrapper with [web3dart](https://github.com/simolus3/web3dart), 扩展封装.
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


- how to use:

```yaml

  # used by git repo:
  better_ui:
    git:
      url: https://github.com/better-dart/pkg.git   # repo http clone url
      ref: "babee6d"                                # git tag or git commit-id
      path: packages/better_ui                      # pkg path


  # used by local path:
  better_ui:
    path: /your-local-path-to-here/better-dart/pkg/packages/better_ui # local path

```

## dust:

- dart common utils.
- how to use:

```yaml

  # used by git repo:
  dust:
    git:
      url: https://github.com/better-dart/pkg.git   # repo http clone url
      ref: "babee6d"                                # git tag or git commit-id
      path: packages/dust                           # pkg path

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

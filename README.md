# Dockerのsecretの仕様を確認するときに作ったもの

- dockerfile内でmountしたsecretはdocker imageをビルドする時だけに使えるものなので出来上がったdocker imageには残らない.
- docker buildでのsecretとdocker composeのsecretsは目的が違う. compose側でsecretsを設定しておくとできあがったdocker imageの中でもsecretsを参照できるが、dockerfileでmountを書いていたらビルド時だけのsecretsになるのでdocker imageには残らない.

- [CTI-Edge#579](https://gitlab.com/laplust/core/core-tech-interface/cti-edge/-/issues/579)に調べた時のメモを色々と書き残している.

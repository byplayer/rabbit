---
layout: ja
title: Markdown記法でのスライドの作り方
---
## Rabbit用Markdown記法について

基本的にMarkdownの書式を使いますが、スライド用のMarkdownでは
マークアップの使い方が通常の文書の場合と異なります。

[サンプルスライド](../sample/)にサンプルがあります。

### ページ

一番大きな見出し「#」がページのタイトルになります。そのペー
ジは次の見出しまで続きます。

  # タイトル

  なにか

  ...

  # 次のページ

  ...

この例だと二ページになります。

### タイトルページ

最初のページはタイトルページになります。タイトルページには見
出し付きリスト「:」でスライドのメタ情報を指定できます。

  # 発表のタイトル

  author
  :    須藤功平
  institution
  :    COZMIXNG

この例では、作者が須藤功平で、所属がCOZMIXNGであるということ
を示しています。

現在のところ、authorとinstitution以外にsubtitle、
content_source、themeというメタ情報が指定できます。themeは、
Rabbitを起動するときにテーマが指定されなかった場合に使用され
るテーマになります。

TODO: 他にもメタデータが増えているはず。

### ...

TODO: 他の書き方についても書く
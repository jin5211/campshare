### CampShare README

# CampShare

CampShareは、キャンプ好きな人たちがつながり、共有するためのプラットフォームです。ブログの投稿から始まり、ユーザー同士でキャンプ用具をレンタルし、副業の機会を提供します。

## URL
[CampShare](http://18.182.125.10/)

## BASIC認証
- ID: admin
- PASSWORD: 1234

## テスト用アカウント
- user-1
  - メール: test01@test.com
  - パスワード: 123456

- user-2
  - メール: test02@test.com
  - パスワード: 123456

## テスト用クレジットカード情報
- カード番号: 4242 4242 4242 4242
- 有効期限: 12/30
- セキュリティコード: 123
## 利用方法

### 新規ユーザー登録
- 必須項目
  - メールアドレス
  - パスワード
  - 確認用パスワード
  - 名前
  - プライバシーポリシーへの同意

- LINEアカウントでの登録
  - 上記項目の中でプライバシーポリシーへの同意のみ必須

- 任意項目
  - レンタル機能を使用する際には必須

### ブログ投稿
- 「NewBlog」ボタンからブログ記事を作成
- 文字編集ツールバーと画像添付機能付き

### ギア出品・レンタル機能
- プロフィール情報が不足していると利用不可
- プロフィール情報を入力後、「NewGear」ボタンで出品可能
- 他ユーザーの出品商品を「show」ボタンからレンタル可能

- レンタルプラン
  - 日帰りプラン（8:00~18:00）
  - 1泊2日プラン（8:00~翌日18:00）
  - 2泊3日プラン（8:00~翌々日18:00）

## 機能一覧

| 機能                     | ログインユーザー（プロフィール情報入力完成） | ログインユーザー（プロフィール情報入力不足） | 非ログインユーザー   |
| ----------------------  | :---------------------------------: | :-----------------------------------: |:----------------:|
| ユーザー登録              |        X                            |         X                             |        ○         |
| ユーザープロフィール編集    |        ○                            |         ○                             |        X         |
| ブログ記事投稿機能         |        ○                            |         ○                             |        X         |
| ブログ記事へのコメント機能  |        ○                            |         ○                             |        X         |
| ギア出品機能              |        ○                            |         X                             |        X         |
| レンタル機能              |        ○                            |         X                             |        X         |

## アプリケーションを作成した背景

前職では施工管理の仕事に従事し、工事で使用される高所作業車の管理を担当していました。高層ビルの建築現場で、多数の階層ごとに異なる工事業者と多数の高所作業車をアナログで割り振るのは非常に手間がかかる作業でした。この経験から、予約機能があるアプリの必要性を感じました。

まずは簡単な予約機能の実装を試みたいと思い、キャンプが好きな親友のために、このアプリを作成しました。キャンプ用具のレンタル機能を通じて、ユーザー同士の交流を促進し、副業の機会を提供することを目指しました。

## 実装予定の機能
- 予約通知機能（アプリ内、LINE、メール）
- ユーザー間のチャット機能
- ユーザー間のフォロー機能

## 開発環境
- フロントエンド
  - Bootstrap(v5.3)
  - JavaScript
- バックエンド
  - Ruby on Rails
- その他
  - AWS S3
  - AWS EC2

## ローカルでの動作方法
```
git clone https://github.com/jin5211/campshare.git
cd campshare
```

## 工夫した点
- LINEアカウントでの簡単登録
- プライバシーポリシー同意の必須化
- プロフィール情報不足時のレンタル機能利用制限

---

このREADMEが少しでも役立つことを願っています。何か追加のアドバイスがあれば、ぜひ教えてください。

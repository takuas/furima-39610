# テーブル設計

## users テーブル

| column             | type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| kana_last_name     | string     | null: false                    |
| kana_first_name    | string     | null: false                    |
| date_of_birth      | date       | null: false                    |

### Association

- has_many   :items
- has_many   :orders
- has_many   :comments
- has_many   :favorites

## items テーブル

| column             | type       | options                        |
| ------------------ | ------     | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| ship_from_id       | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- has_one    :order
- has_many   :favorites
- belongs_to :user

## orders テーブル

| column             | type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- has_one    :sending_address
- belongs_to :user
- belongs_to :item

## sending_address テーブル

| column             | type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| postal             | string     | null: false                    |
| ship_from_id       | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| tel                | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## commentsテーブル

| column             | type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## favoritesテーブル

| column             | type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

# furimaアプリの追加実装

## header部分

- カテゴリーの項目を選択すると、カテゴリー一覧のリストを表示する。
  選択すると、選択したカテゴリー一覧のページに移動する。
- 商品一覧の項目を選択すると、同じページのピックアップカテゴリーの部分までスクロールする。
- ログインしている時にユーザー名の項目をクリックすると、ユーザーのマイページに移動する。
- header部分に置いてある検索フォームを使用できるようにし、複数のキーワードからも検索できるようにした。
  検索した後は、該当した商品が並んだページに移動する。
- 項目にカーソルを合わせている時に、視覚的に分かりやすいように下線を表示させる。

## トップページ

- トップページで下にスクロールした時に「FURIMAが選ばれる３つの理由」に関連する項目と、
  「FUEIMAの特徴」に関連する項目を浮かび上がらせるようにした。(デフォルトは非表示)
- ピックアップカテゴリーに表示している商品リストに購入済みの場合は表示しないようにした。
- ピックアップカテゴリーの下にカテゴリーごとの検索フォームを設置し、選択して検索ボタンを押したら、
  選択したカテゴリー一覧ページに移動する。
- 右下の出品するボタンの上部にページ上部にスクロールするボタンを設置した。
- 自分がお気に入りにしている商品には星マークを点灯させ、またお気に入りの数を有効化した。

## footer部分

- FURIMAを見るの下部にあるカテゴリー一覧から、カテゴリーごとのページに移動するリンクを有効にした。

## カテゴリー一覧ページ

- カテゴリーごとの商品検索結果を表示するために、カテゴリー一覧ページを作成。
- header部分の検索フォームとピックアップカテゴリーの検索結果はこのページで表示する。
- 商品一覧下部にある検索フォームで現在表示しているカテゴリーを表現。
- 検索フォームからカテゴリーを選択し検索ボタンを押すことで、別のカテゴリーを表示する。
- このページは購入済みの商品は表示される。

## 商品詳細ページ

- ページに表示してあるお気に入り機能を有効にした。クリックした場合は非同期で「お気に入り済み」「お気に入り」に変化する
- どれくらいの人がお気に入りにしているか分かるように数を設置した。
- 視覚的に分かりやすくお気に入り済みの時は星マークが点灯するようにした。
- 自分が出品した商品に関しては、「お気に入り数」に変化させクリックできないようにした。
- コメント機能を有効にし、非同期でコメントできるようにした。
- また、コメントがない場合にはコメント一覧は表示されず、コメント投稿した時と同時にコメント一覧が表示されるようにした。
- コメント一覧にあるユーザー名からそのユーザーのマイページに移動できるようにリンクを設置。
- 「前の商品」、「後ろの商品」で実際に移動できるようにした。また、商品が存在しない場合にはクリックできない。
- ページ下部にある「⚪︎⚪︎をもっと見る」の部分でカテゴリー一覧のページに移動できるようにリンクを設置。
- 「購入画面に進む」「編集」「削除」「コメントする」「前の商品」「後ろの商品」「⚪︎⚪︎をもっと見る」にカーソルを合わせると
   背景を変化させて選択していることを視覚的に分かりやすくした。

## ユーザーマイページ

- 登録したユーザー情報を見れるようにマイページを作成
- マイページにはユーザーのプロフィールと自分が出品した商品とお気に入りにした商品、購入した商品を表示する
- 該当する商品が存在しない場合には、「⚪︎⚪︎の商品はありません」と表示する
- 自身のマイページを表示している時のみ、ユーザープロフィールの横に「プロフィールを編集」ボタンを表示し、プロフィール編集ページにリンクを設置

## プロフィール編集ページ

- プロフィールを編集できるようにページを作成、このページでプロフィールとパスワードを変更できる。
- 変更するには現在のパスワードを必須にし、セキュリティを考慮した。

2015年度夏学期　教養学部（前期課程） 0031606 計算機プログラミング　山口和紀

341004h 深澤雄太

https://github.com/yfuka86/venture-database
  こちらにあるrailsのリポジトリを概念表現システムとして提出します。
  内容は、ベンチャー企業・ファンド・人の関係となっています。

動かし方
config/database.ymlを編集して、任意のmysqlを設定してください。
```
bundle install
bundle exec rake db:build
bundle exec rails s
```
db/seeds.rbにてデータの読み込みを行っています。
  本来であればwebアプリケーションなのでデータの追加をGUIで出来ればよいのですが、労力が大変なので、データを追加する場合もスクリプトまたは
```
bundle exec rails c
```
で実行できるコンソールからの追加となります。

データベースのテーブルは5つ
  それぞれ、
1. 組織のノード
2. 人のノード
3. 買収関係の有向エッジ
4. 雇用関係（創業者含む）の有向エッジ
5. 投資関係の有向エッジ
となります。詳細は、app/models/以下にある実装を読んでください。

実際に描画を行っているのはjavascriptで、vis.jsというライブラリを用いています。
  app/assets/javascripts/graph.jsに実装があるので適宜参照ください。

提出にあたって、実際に動いている画像を添付します。
  また、動かない・質問等あれば、yuta@piersky.comまでご連絡ください。


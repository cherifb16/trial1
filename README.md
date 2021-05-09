# README

## テーブルスキーマ

### tasks model 
| type | column |
| ---- | ---- |
| string | title | 
| text | content | 
| bigint | user_id |

### users model
| type | column |
| ---- | ---- |
| string | name | 
| string | email |
| string | password_digest |

## Herokuへのデプロイ手順

1. ログイン
>heroku login
2. Assetプリコンパイル
>rails assets:precompile RAILS_ENV=production
3. git add & git commit
>git add -A
>git commit -m "init"
4. heroku create
>heroku create
5. heroku stackを18に変更
>heroku stack:set heroku-18
6. デプロイ出来ない場合、下記をbuildpackを入れる
>heroku buildpacks:set heroku/ruby ※デプロイ出来ない場合
>heroku buildpacks:add --index 1 heroku/nodejs ※デプロイ出来ない場合
7. まだデプロイ出来ない場合、下記をplatformを入れる
>bundle lock --add-platform x86_64-linux ※デプロイ出来ない場合
8. Heroku master (or main)にpush
>git push heroku master( or main)
9. heroku内でマイグレーション
>heroku run rails db:migrate
10. herokuサーバーを再起動
>heroku restart
11. アクセスして動作確認  
>heroku config 

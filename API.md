# API
ネットギフトのリクエストまとめ

## (ネットギフト) QRコード表示ページ
ものすごくシンプルな仕様、ユニークID2つを渡してページにアクセスするだけで
必要なものがHTMLファイル1つに詰まって返される。

| Key | Value |
| ------------- | ------------- |
| URL  | https://toshocard.jp/customer/tcn/netgift  |
| クエリ  | ?ua={ユニークID1}&us={ユニークID2}  |

### QRコード画像
画像はURLやJSでなく、サーバー側で生成されたbase64が入っている

| Key | Value |
| ------------- | ------------- |
| Xpath  | /html/body/div[1]/p[1]/img[1]  |
| 形式  | png(base64) |

### ID
残高や利用履歴の確認に使うやつ

| Key | Value |
| ------------- | ------------- |
| Xpath  | /html/body/div[2]/div[2]/div/p[1]/span[2]  |
| 形式  | 数字16桁 |

### PIN
残高や利用履歴の確認に使うやつ

| Key | Value |
| ------------- | ------------- |
| Xpath  | /html/body/div[2]/div[2]/div/p[2]/span[2]  |
| 形式  | 数字4桁 |

### 有効期限
カードで支払いできる期限

| Key | Value |
| ------------- | ------------- |
| Xpath  | /html/body/div[2]/div[2]/p/span[2] |
| 形式  | 2021年12月04日 |

## (ネット専用) 残高確認ページ
ものすごくシンプルな仕様、ユニークID2つを渡してページにアクセスするだけで
必要なものがHTMLファイル1つに詰まって返される。

| Key | Value |
| ------------- | ------------- |
| URL  | https://toshocard.jp/customer/card/getCardInfo  |
| クエリ  | ?cardNo={カード番号16桁}&pin={PIN4桁}  |

### 残高
リクエストした時点のカード残高

| Key | Value |
| ------------- | ------------- |
| Xpath  | /html/body/table/tbody/tr[2]/td/div/p |
| 形式  | 文字列(￥1,000) |


## (カード/ネット共通) 残高確認ページ
POSTが必要、PINコード等変更できる機能があるらしい。(こちらは実装予定無し)

| Key | Value |
| ------------- | ------------- |
| URL  | https://www.toshocardnext.ne.jp/tosho/sp/CardUserLoginPage/login.do  |
| クエリ  | ?  |

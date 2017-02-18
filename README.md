# NetTester examples
[物理ネットワークのための受け入れテストツール: NetTester](https://github.com/net-tester/net-tester)
によって、実際どのようなテストが実現可能なのかを、架空の企業ネットワークをターゲットにして検証しています。

## テスト対象のネットワーク
タジマックス通信工業社 (長いので以降 "タジマックス社") は、
ヨーヨーダイン社と共同でソフトウェア開発を行っており、
タジマックス社からVPNでヨーヨーダイン社内の開発環境へアクセスします。

今回、ヨーヨーダイン社のネットワークを新規に構築し直すことになりました。
ヨーヨーダイン社のネットワークの構築もタジマックス社が請け負います。
タジマックス社は以下の図のようなネットワークを構築することにしました。
![Testee network](./img/logical-network.png)

ネットワークの構築にあたり、ヨーヨーダイン社の要件（ネットワーク上で行いたい業務）をもとに、
構築したネットワーク上で求められた業務ができるかどうかをテストします。
テスト対象はヨーヨーダイン社のネットワークです。

## テスト

### 静的なテスト
このプロジェクトでは、ネットワークが一定の状態にある(ネットワークの状態が変化しない)ときに、
end-to-end の通信ができるかどうかをテストすることを「静的なテスト」と呼んでいます。

今回、ヨーヨーダイン社のネットワークでは、
以下のように、セグメント内・セグメント間をつなぐ、様々なアプリケーション通信が発生します。

![Static Test](./img/static-test-pattern.png)

これらのアプリケーション通信（アプリケーションを使う業務）が構築したネットワークで
問題なくおこなえるかどうかをテストします。

静的なテストの例:
* [NTP で時刻を同期](https://github.com/net-tester/examples/blob/develop/features/ntp.feature)
* [NTP でDMZのサーバの時刻を同期](https://github.com/net-tester/examples/blob/develop/features/ntp_internet_from_dmz.feature)
* [社内 Git サービス](https://github.com/net-tester/examples/blob/develop/features/git.feature)
* [DMZのVPNアドレスプールから社内 Git サービスの利用](https://github.com/net-tester/examples/blob/develop/features/git_internal_from_dmz_vpn.feature)
* [Google 検索](https://github.com/net-tester/examples/blob/develop/features/google.feature)
* [Google 検索(実インターネット接続なし版)](https://github.com/net-tester/examples/blob/develop/features/google_no_internet.feature)
* [社内 DNS サーバで名前解決](https://github.com/net-tester/examples/blob/develop/features/dns_dmz_from_internal_network.feature)
* [上位 DNS サーバで名前解決](https://github.com/net-tester/examples/blob/develop/features/dns_internet_from_dmz.feature)
* [DMZ内のサーバからDMZ内のDNSサーバでインターネット上のサーバの名前解決](https://github.com/net-tester/examples/blob/develop/features/dns_dmz.feature)
* [pingで社内からDMZ内のDNSサーバへ疎通確認](https://github.com/net-tester/examples/blob/develop/features/ping_dmz_dns_from_internal_network.feature)
* [pingで社内からDMZへ疎通確認](https://github.com/net-tester/examples/blob/develop/features/ping_dmz_from_internal_network.feature)
* [pingでDMZから社内へ疎通確認](https://github.com/net-tester/examples/blob/develop/features/ping_internal_network_from_dmz.feature)
* [pingでDMZからインターネットへ疎通確認](https://github.com/net-tester/examples/blob/develop/features/ping_internet_from_dmz.feature)
* [pingでインターネットからVPNサーバへ疎通確認](https://github.com/net-tester/examples/blob/develop/features/ping_vpn_server_from_internet.feature)
* [pingでタジマックス社からVPNサーバへ疎通確認](https://github.com/net-tester/examples/blob/develop/features/ping_vpn_server_from_tajimax_pc.feature)
* [pingでインターネットからルータへの疎通確認](https://github.com/net-tester/examples/blob/develop/features/ping_router_from_internet.feature)
* [pingでインターネットからファイアウォールへの疎通確認](https://github.com/net-tester/examples/blob/develop/features/ping_firewall_from_internet.feature)
* [pingで社内からインターネットへの疎通確認](https://github.com/net-tester/examples/blob/develop/features/ping_internet_from_internal_network.feature)
* [sshで社内から資産管理サーバへログイン](https://github.com/net-tester/examples/blob/develop/features/ssh_asset_management_server_from_internal_network.feature)
* [sshで社内からテスト環境サーバへログイン](https://github.com/net-tester/examples/blob/develop/features/ssh_test_environment_server_from_internal_network.feature)
* [sshで社内からDMZ内のDNSサーバへログイン](https://github.com/net-tester/examples/blob/develop/features/ssh_dmz_dns_from_internal_network.feature)
* [sshクライアントとWebブラウザで社内からDMZのVPNサーバへログイン](https://github.com/net-tester/examples/blob/develop/features/ssh_web_dmz_vpn_from_internal_network.feature)
* [sshクライアントとWebブラウザで社内からDMZのサーバへログイン](https://github.com/net-tester/examples/blob/develop/features/ssh_web_dmz_from_internal_network.feature)
* [telnetで社内からテスト環境サーバへログイン](https://github.com/net-tester/examples/blob/develop/features/telnet_internal_network.feature)
* [telnetでDMZのVPNアドレスプールからテスト環境サーバへログイン](https://github.com/net-tester/examples/blob/develop/features/telnet_internal_network_from_dmz.feature)
* [Webブラウザで社内テスト環境Webコンソールへアクセス](https://github.com/net-tester/examples/blob/develop/features/jenkins_internal_network.feature)
* [DMZのVPNアドレスプールからWebブラウザで社内テスト環境Webコンソールへアクセス](https://github.com/net-tester/examples/blob/develop/features/jenkins_internal_network_from_dmz.feature)
* [DMZ内サーバのパッケージ更新](https://github.com/net-tester/examples/blob/develop/features/web_internet_from_dmz.feature)
* [タジマックス社からVPNサーバへログイン](https://github.com/net-tester/examples/blob/develop/features/https_vpn_server_from_tajimax_pc.feature)

### 動的なテスト
このプロジェクトでは、ネットワークの状態が変化するとき
(トポロジが変わる、Active/Standbyが変化して通信経路が変わる、など) に
end-to-end の通信にどのような影響があるか・コネクションが維持されるかどうかをテストすることを、
「動的なテスト」と呼んでいます。

ヨーヨーダイン社のネットワークでは、社内の Firewall として、
Active/Passive(standby)で HA (High Availability) 構成をとれる機材を使うことにしました。

![Dynamic Test](./img/dynamic-test-pattern.png)

通常、FW1 が Active となるようにしていますが、
FW1 にリンク障害が発生して Active/Passive が交代するときに、
FW を経由する通信を伴う業務が継続可能かどうかテストします。

動的なテストの例:
* [内部ネットワーク向けリンク障害と回復時におけるpingの通信継続確認](https://github.com/net-tester/examples/blob/develop/features/icmp_fw1_l2sw1_linkdown.feature)
* [外部ネットワーク向けリンク障害と回復時におけるpingの通信継続確認](https://github.com/net-tester/examples/blob/develop/features/icmp_fw1_l2swex_linkdown.feature)
* [外部ネットワーク向けリンク障害と回復時におけるTCPの接続維持確認](https://github.com/net-tester/examples/blob/develop/features/tcp_fw1_l2sw1_linkdown.feature)
* [リモートワーク作業中のリンク障害、回復における接続維持確認](https://github.com/net-tester/examples/blob/feature/develop/features/remotework_linkdown.feature)

## テストの実行

### インストール

必要な ruby gem は bundle install で自動的にインストールされます。
``` shellsession
$ git clone https://github.com/net-tester/examples.git
$ cd examples
$ bundle install
```

この他に、テストシナリオ中ではテスト用のツールをいくつか使っています。
別途インストールしておく必要があります。

* `ping`
* `dnsmasq`
* `nc` (netcat)
* `curl`
* openssl/openssh

### テストの実行

Rakeで回帰テスト実行できます。
``` shellsession
$ rake DEVICE=ens5 DPID=0x1 cucumber
```
この例では、環境変数`DEVICE`でNetTesterサーバ側の物理OFS接続インタフェース名、
`DPID`で物理OFSのDatapath IDを指定しています。

## 実際のテストの様子
実際にテストを実行している様子を、以下のリンク先から見ることができます。

### 解説付きデモ動画
[![NetTesterでテスト自動化！ ~Network Test System Project~ - YouTube](http://img.youtube.com/vi/C7z3aaWgsf4/0.jpg)](http://www.youtube.com/watch?v=C7z3aaWgsf4)

静的なテスト・動的なテストの連続実行、要求変更に対するヨーヨーダイン社ネットワークの設定変更+テストの再実行（回帰テスト）、という一連の作業プロセスを実行しています。
(デモ中、回帰テスト実行では、デモ用に一部のシナリオに限定して実行しています。)

### Screen Cast
[Asciinema](https://asciinema.org/) によるテスト実行の様子の録画です。
* [デモ動画(リアルタイム・解説なし)](https://asciinema.org/a/c9n8xrwxfofpoxvb306ucmb94)
: Youtube の解説付きデモ動画の元素材です。
解説付きデモ動画では terminal の様子は早送りした状態になっていますが、こちらはリアルタイム + 編集なしです。
* [静的なテスト実行部分の抜粋](https://asciinema.org/a/8wyyvxyxkxv37snfucqw84ngr)
: 静的なテストの連続実行の様子です。

## 参考資料
カンファレンス・勉強会等で発表した資料 :
* [ネットワーク受け入れテスト自動化システムの開発と運用プロセス改善の展望](http://www.okinawaopenlabs.org/ood/2016/pdf/1208/OOD2016_1208_hagiwara.pdf) [pdf],
  [Okinawa Open Days 2016](http://www.okinawaopenlabs.org/ood/2016/program_day4/),
  2016/12/08.
* [NetTester 物理ネットワークのテストツール // Speaker Deck](https://speakerdeck.com/yasuhito/nettester),
  [Trema Day \#10 in Okinawa Powered by APC \- connpass](https://trema.connpass.com/event/40434/),
  2016/12/09.
* [NetTesterでad\-hocなテスト作業を拡張する \- Qiita](http://qiita.com/corestate55/items/d6a8cdc03de09a46877c),
  [Trema Day \#10 in Okinawa Powered by APC \- connpass](https://trema.connpass.com/event/40434/),
  2016/12/09.
* [物理ネットワーク受け入れテストの自動化を考える](https://www.slideshare.net/qb0C80aE/ss-72220528),
  [ネットワークプログラマビリティ勉強会 \#11 \- connpass](https://network-programmability.connpass.com/event/49248/),
  2017/02/15.

@IT記事 :
* [SDNで始めるネットワークの運用改善（1）：SDNの理想と現実――ネットワーク運用でのSDNの現実的な活用法を考える \(1/4\) \- ＠IT](http://www.atmarkit.co.jp/ait/articles/1610/31/news006.html)
* [SDNで始めるネットワークの運用改善（2）：SDNで物理ネットワークのテストを楽にする方法 \(1/4\) \- ＠IT](http://www.atmarkit.co.jp/ait/articles/1612/27/news014.html)

ITpro/日経NETWORK :
* [ニュース解説 \- テストツール「NetTester」はSDN普及の突破口になるか、Okinawa Open Days報告：ITpro](http://itpro.nikkeibp.co.jp/atcl/column/14/346926/122000745/)

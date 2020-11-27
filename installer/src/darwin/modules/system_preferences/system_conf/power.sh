#!/bin/bash
###############################################################################
# Power                                                                       #
###############################################################################


## All ## 電源全体の設定
# スタンバイモードの設定
sudo pmset -a standby 1

# セーフスリープ有効
sudo pmset -a hibernatemode 3

# スリープ前にディスプレイ輝度を半分に下げる
sudo pmset -a halfdim 1

# モニターを開いた時に復帰
sudo pmset -a lidwake 1

# ハイバネーションイメージを書き込み、より低消費電力のチップセットスリープに入る
sudo pmset -a autopoweroff 1

# リモートログイン中はスリープしない
sudo pmset -a ttyskeepawake 1

# 同じiCloud IDを使用するデバイスの近接性に基づいて、システムのスリープ解除を制御する
sudo pmset -a proximitywake 0

# 可能な場合はハードディスクをスリープさせる
sudo pmset -a  disksleep 10

# ACとBatteryが切り替わったら復帰するか
sudo pmset -a  acwake 0

# GPU を複数搭載しているMacに有効。グラフィックの自動切り替え(常に)
sudo pmset -a  gpuswitch 2

# TCPのキープアライブを設定
sudo pmset -a tcpkeepalive 1


## Battery Power ## バッテリー駆動時の設定
# standbydelayのHighとLowのしきい値
sudo pmset -b  highstandbythreshold 70

# バッテリーが少ないとき15分でスタンバイモードへ移行
sudo pmset -b standbydelaylow 900 #(s)

# バッテリーが多いとき15分でスタンバイモードへ移行
sudo pmset -b standbydelayhigh 900 #(s)

# autopoweroffの時間
sudo pmset -b autopoweroffdelay 10800

# ディスプレイオフまでの時間
sudo pmset -b displaysleep 1 #(m)

# スリープまでの時間
sudo pmset -b sleep 5 #(m)
# パワースナップの設定
sudo pmset -b powernap 0

# リモートからスリープ解除できるようにするか
sudo pmset -b womp 0

# 電源を切り替えたときディスプレイの輝度を下げる
sudo pmset -b lessbright 1


## AC Power ## バッテリー駆動時の設定
# standbydelayのHighとLowのしきい値
sudo pmset -c  highstandbythreshold 50

# バッテリーが少ないとき30分でスタンバイモードへ移行
sudo pmset -c standbydelaylow 1800 #(s)

# バッテリーが多いとき3時間でスタンバイモードへ移行
sudo pmset -c standbydelayhigh 10800 #(s)

# autopoweroffの時間
sudo pmset -c autopoweroffdelay 259200

# ディスプレイオフまでの時間
sudo pmset -c displaysleep 15 #(m)

# スリープまでの時間
sudo pmset -c sleep 0 #(m)

# パワースナップの設定
sudo pmset -c powernap 1

# リモートからスリープ解除できるかどうか
sudo pmset -c womp 1

# 電源を切り替えたときディスプレイの輝度を下げる
sudo pmset -c lessbright 0

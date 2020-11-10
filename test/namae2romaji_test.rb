require "test_helper"

class Namae2romajiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Namae2Romaji::VERSION
  end

  def test_convert
    assert_equal "TANAKA Ichiro",
                 Namae2Romaji.convert("たなか　いちろう")
    assert_equal "TANAKA Ichiroh",
                 Namae2Romaji.convert("たなか　いちろう", oh: true)
    assert_equal "Ichiro Tanaka",
                 Namae2Romaji.convert("たなか　いちろう", family_name_first: false)
    assert_equal "Ichiroh Tanaka",
                 Namae2Romaji.convert("たなか　いちろう", family_name_first: false, oh: true)
  end

  def test_kana_to_romaji
    # https://www.ezairyu.mofa.go.jp/passport/hebon.html の例より

    assert_equal "namba" , Namae2Romaji.kana_to_romaji("なんば")   # 難波
    assert_equal "homma" , Namae2Romaji.kana_to_romaji("ほんま")   # 本間
    assert_equal "sampei", Namae2Romaji.kana_to_romaji("さんぺい") # 三瓶

    assert_equal "hattori", Namae2Romaji.kana_to_romaji("はっとり") # 服部
    assert_equal "kikkawa", Namae2Romaji.kana_to_romaji("きっかわ") # 吉川

    assert_equal "hotchi", Namae2Romaji.kana_to_romaji("ほっち")     # 発地
    assert_equal "hatcho", Namae2Romaji.kana_to_romaji("はっちょう") # 八丁

    assert_equal "nina"  , Namae2Romaji.kana_to_romaji("ニーナ") # ニーナ
    assert_equal "niina" , Namae2Romaji.kana_to_romaji("にいな") # 新菜

    assert_equal "hyuga" , Namae2Romaji.kana_to_romaji("ひゅうが") # 日向
    assert_equal "yuki"  , Namae2Romaji.kana_to_romaji("ユウキ")   # 裕貴
    assert_equal "yuko"  , Namae2Romaji.kana_to_romaji("ユウコ")   # 優子

    assert_equal "kota"  , Namae2Romaji.kana_to_romaji("コウタ")   # 幸太
    assert_equal "yoko"  , Namae2Romaji.kana_to_romaji("ヨウコ")   # 洋子
    assert_equal "ryoko" , Namae2Romaji.kana_to_romaji("リョウコ") # 亮子

    assert_equal "ono"    , Namae2Romaji.kana_to_romaji("おおの")     # 大野
    assert_equal "okochi" , Namae2Romaji.kana_to_romaji("おおこうち") # 大河内
    assert_equal "onishi" , Namae2Romaji.kana_to_romaji("おおにし")   # 大西

    assert_equal "senoo"  , Namae2Romaji.kana_to_romaji("せのお")   # 妹尾
    assert_equal "takatoo", Namae2Romaji.kana_to_romaji("たかとお") # 高遠
    assert_equal "yokoo"  , Namae2Romaji.kana_to_romaji("よこお")   # 横尾

    assert_equal "ito"   , Namae2Romaji.kana_to_romaji("いとう")   # 伊藤
    assert_equal "takato", Namae2Romaji.kana_to_romaji("たかとう") # 高藤
    assert_equal "misono", Namae2Romaji.kana_to_romaji("みそのう") # 御園生

    assert_equal "bibian", Namae2Romaji.kana_to_romaji("ヴィヴィアン")

    assert_equal "ohno", Namae2Romaji.kana_to_romaji("おおの", oh: true)
    assert_equal "itoh", Namae2Romaji.kana_to_romaji("いとう", oh: true)

    # 長音ではない「oお」「oう」「uう」には基本的に対応できていないので、とりあえずハイフンで対応
    assert_equal "matsuura", Namae2Romaji.kana_to_romaji("まつ-うら") # 松浦
    # ただし、「oお」については「おお」「とお」以外は長音ではないと判断する
    assert_equal "hirooka", Namae2Romaji.kana_to_romaji("ひろおか") # 広岡
  end
end

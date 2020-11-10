module Namae2Romaji
  ConversionTable = {
    "ア" => "a",
    "イ" => "i",
    "ウ" => "u",
    "エ" => "e",
    "オ" => "o",
    
    "カ" => "ka",
    "キ" => "ki",
    "ク" => "ku",
    "ケ" => "ke",
    "コ" => "ko",
    
    "サ" => "sa",
    "シ" => "shi",
    "ス" => "su",
    "セ" => "se",
    "ソ" => "so",
    
    "タ" => "ta",
    "チ" => "chi",
    "ツ" => "tsu",
    "テ" => "te",
    "ト" => "to",
    
    "ナ" => "na",
    "ニ" => "ni",
    "ヌ" => "nu",
    "ネ" => "ne",
    "ノ" => "no",
    
    "ハ" => "ha",
    "ヒ" => "hi",
    "フ" => "fu",
    "ヘ" => "he",
    "ホ" => "ho",
    
    "マ" => "ma",
    "ミ" => "mi",
    "ム" => "mu",
    "メ" => "me",
    "モ" => "mo",
    
    "ヤ" => "ya",
    "ユ" => "yu",
    "ヨ" => "yo",
    
    "ラ" => "ra",
    "リ" => "ri",
    "ル" => "ru",
    "レ" => "re",
    "ロ" => "ro",
    
    "ワ" => "wa",
    "ヰ" => "i",
    "ヱ" => "e",
    "ヲ" => "o",
    "ン" => "n",
    
    "ガ" => "ga",
    "ギ" => "gi",
    "グ" => "gu",
    "ゲ" => "ge",
    "ゴ" => "go",
    
    "ザ" => "za",
    "ジ" => "ji",
    "ズ" => "zu",
    "ゼ" => "ze",
    "ゾ" => "zo",
    
    "ダ" => "da",
    "ヂ" => "ji",
    "ヅ" => "zu",
    "デ" => "de",
    "ド" => "do",
    
    "バ" => "ba",
    "ビ" => "bi",
    "ブ" => "bu",
    "ベ" => "be",
    "ボ" => "bo",
    
    "パ" => "pa",
    "ピ" => "pi",
    "プ" => "pu",
    "ペ" => "pe",
    "ポ" => "po",
    
    "キャ" => "kya",
    "キュ" => "kyu",
    "キョ" => "kyo",
    
    "シャ" => "sha",
    "シュ" => "shu",
    "ショ" => "sho",
    
    "チャ" => "cha",
    "チュ" => "chu",
    "チョ" => "cho",
    
    "ニャ" => "nya",
    "ニュ" => "nyu",
    "ニョ" => "nyo",
    
    "ヒャ" => "hya",
    "ヒュ" => "hyu",
    "ヒョ" => "hyo",
    
    "ミャ" => "mya",
    "ミュ" => "myu",
    "ミョ" => "myo",
    
    "リャ" => "rya",
    "リュ" => "ryu",
    "リョ" => "ryo",
    
    "ギャ" => "gya",
    "ギュ" => "gyu",
    "ギョ" => "gyo",
    
    "ジャ" => "ja",
    "ジュ" => "ju",
    "ジョ" => "jo",
    
    "ビャ" => "bya",
    "ビュ" => "byu",
    "ビョ" => "byo",
    
    "ピャ" => "pya",
    "ピュ" => "pyu",
    "ピョ" => "pyo",
    
    "シェ" => "shie",
    "チェ" => "chie",
    "ティ" => "tei",
    "ニィ" => "nii",
    "ニェ" => "nie",
    
    "ファ" => "fua",
    "フィ" => "fui",
    "フェ" => "fue",
    "フォ" => "fuo",
    "ジェ" => "jie",
    
    "ディ" => "dei",
    "デュ" => "deyu",
    "ウィ" => "ui",
    "ウェ" => "ue",
    "ウォ" => "uo",
    
    "ヴァ" => "ba",
    "ヴィ" => "bi",
    "ヴ"   => "bu",
    "ヴェ" => "be",
    "ヴォ" => "bo",

    "ー" => "",
    "－" => "",
    "-" => "",

    "ッ" => "ッ"
  }

  def self.kana_to_romaji(kana, oh: false)
    kana = kana.encode(Encoding::UTF_8)
               .tr('ぁ-ゔ','ァ-ヴ')
               .gsub(/(?<=[オコソトノホモヨロヲゴゾドボポョォ])オ\z/, "o")
               .gsub(/(?<=[オト])オ/, oh ? "h" : "")
               .gsub(/(?<=[オコソトノホモヨロヲゴゾドボポョォ])ウ/, oh ? "h" : "")
               .gsub(/(?<=[ウクスツヌフムユルヴグズヅブプュゥ])ウ/, "")
               .gsub(/[ァ-ヴー－\-][ァィゥェォャュョ]?/, ConversionTable)
               .gsub(/ッ(.)/){ ($1 == "c" ? "t" : $1) + $1 }
               .gsub(/n(?=[bmp])/, "m")
  end
end
# Namae2Romaji

Convert Japanese Kana Name to Romaji based on passport regulations.

（どうせ日本人以外は使わないので以下日本語で書きます。）

ひらがな・カタカナで与えられた氏名文字列を[パスポートにおけるローマ字つづり](https://www.ezairyu.mofa.go.jp/passport/hebon.html)にできるだけ従ってローマ字に変換します。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'namae2romaji'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install namae2romaji

## Usage

以下のように ```Namae2Romaji.convert(namae)``` メソッドで、ひらがな・カタカナの氏名をローマ字に変換します。最初のスペース（半角・全角どちらでも可）の前・後を名字・名前として、デフォルトでは「名字（すべて大文字） 名前（先頭のみ大文字）」という形でローマ字にします。

```ruby
require "namae2romaji"

# 通常の使い方
Namae2Romaji.convert("たなか　いちろう") # => "TANAKA Ichiro"

# 「oう」と（末尾以外の）「oお」を「oh」に変換する
Namae2Romaji.convert("たなか　いちろう", oh: true) # => "TANAKA Ichiroh"

# 「名前 名字」の順にする
Namae2Romaji.convert("たなか　いちろう", family_name_first: false) # => "Ichiro Tanaka"
```

パスポートにおけるローマ字規則に従い、以下のように変換します。

- 「ん」は通常は『n』に変換しますが、b,m,p の前では『m』に変換します。
  - 「なんば」=>『namba』
- 「っ」は通常は後ろの子音を重ねますが、c の前では『t』に変換します。
  - 「はっとり」=>『hattori』、「ほっち」=>『hotchi』
- 「oお」「oう」「uう」といった長音の「お・う」は、『o,u』には変換しません。
  - 「おおの」=>『ono』、「こうた」=>『kota』、「ひゅうが」=>『hyuga』
- ただし末尾の「oお」については、「お」を『o』に変換します。
  - 「たかとお」=>『takatoo』

ただし、以下のような名前には現状対応していません。

- 長音ではない「oお」「oう」「uう」
  - 「こうちわ（小団扇）」「まつうら（松浦）」は、正しくは『kouchiwa』『matsuura』になるべきですが、『kochiwa』『matsura』になってしまいます。
    - 「oお」についてはある程度は対応できています。（例：「ひろおか（広岡）」→『hirooka』）
    - 対処療法としては、「まつ-うら」のようにハイフンを入れておくことで『matsuura』に変換できます。

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/namae2romaji. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/namae2romaji/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Namae2romaji project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/namae2romaji/blob/master/CODE_OF_CONDUCT.md).

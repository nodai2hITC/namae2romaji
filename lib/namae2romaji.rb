require_relative "namae2romaji/to_romaji" 
require_relative "namae2romaji/version"

module Namae2Romaji
  def self.convert(namae, oh: false, family_name_first: true)
    romaji = kana_to_romaji(namae.tr("　", " "), oh: oh)
    fn, gn = romaji.split(" ", 2)

    return fn.upcase unless gn
    family_name_first ? "#{fn.upcase} #{gn.capitalize}" : "#{gn.capitalize} #{fn.capitalize}"
  end
end

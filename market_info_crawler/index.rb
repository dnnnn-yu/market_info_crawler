require 'nokogiri'
require 'open-uri'
require_relative '../common'

markets = {
  t1: '0010',
  t2: '0011',
  mothers: '0012',
  jasdaq: '0102'
}

#KabutanのURL
def target_url(i)
  "https://kabutan.jp/stock/chart?code=#{i}"
end


markets.each do |market, i|
  sleep(10)
  puts "現在のアクセス先" + target_url(i)
  html = open(target_url(i)).read
  doc = Nokogiri::HTML.parse(html)
  Index.create(
    market: market,
    name: doc.at_css('h2').text.gsub(/[0-9]{4}/,""),
    price: doc.at_css('.kabuka').text.gsub(/,/,'').to_f,
    ratio: doc.css('.si_i1_dl1 > dd')[1].text,
    date: TODAY
  )
end
require 'nokogiri'
require 'open-uri'
require_relative '../common'

def target_url(i, p)
  #Yahoo!ファイナンス売買代金ランキングのURL
  "https://info.finance.yahoo.co.jp/ranking/?kd=31&mk=#{i}&tm=d&vl=a&p=#{p}"
end

def parse_ranking_table(html, column)
  doc = Nokogiri::HTML.parse(html)
  stock_datas = []
  doc.css('.rankingTabledata').each do |stock_data|
    stock_datas << {
      name: stock_data.css('td')[column[:name]].text.gsub(/\(株\)/,''),
      code: stock_data.css('td')[column[:code]].text.to_i,
      rank: stock_data.css('td')[column[:rank]].text.to_i,
      price: stock_data.css('td')[column[:price]].text.gsub(/,/,'').to_i,
      ratio: stock_data.css('td')[column[:ratio]].text,
      volume: stock_data.css('td')[column[:volume]].text.gsub(/,/,'').to_i
    }
  end
  stock_datas
end

MARKETS.each do |market, i|
  (1..$page_number).each do |p|
    sleep(10)
    p target_url(i, p)
    html = open(target_url(i, p)).read 
    stock_datas = parse_ranking_table(html, $column_positions)
    stock_datas.each do |stock_data|
        Volume.create(
          market: market,
          code: stock_data[:code],
          name: stock_data[:name],
          rank: stock_data[:rank],
          price: stock_data[:price],
          ratio: stock_data[:ratio],
          volume: stock_data[:volume],
          date: TODAY
        )
    end
  end
end
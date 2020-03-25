require 'nokogiri'
require 'open-uri'
require_relative '../common'

def target_url(i, p)
  #Yahoo!ファイナンス値上がりランキングのURL
  "https://info.finance.yahoo.co.jp/ranking/?kd=1&mk=#{i}&tm=d&vl=a&p=#{p}"
end

def parse_ranking_table(html, column)
  doc = Nokogiri::HTML.parse(html)
  stock_datas = []
  doc.css('.rankingTabledata').each do |stock_data|
    stock_datas << {
      name: stock_data.css('td')[column[:name]].text.gsub(/\(株\)/,''),
      code: stock_data.css('td')[column[:code]].text.to_i,
      price: stock_data.css('td')[column[:price]].text.gsub(/,/,'').to_i,
      ratio: stock_data.css('td')[column[:ratio]].text,
      volume: stock_data.css('td')[column[:volume]].text.gsub(/,/,'').to_i
    }
  end
  stock_datas
end

#売買代金でその銘柄が活況かを判断
def stock_booming?(stock_data, market, border)
  if market == :t1
    stock_data[:price] * stock_data[:volume] >= border * 3 #東証一部は他の市場の基準の3倍
  else 
    stock_data[:price] * stock_data[:volume] >= border
  end
end

def calcurate_diff(stock_data, market)
  stock_ratio = stock_data[:ratio].gsub(/%/,"").to_f
  index_ratio = Index.find_by(date: TODAY, market: market).ratio.gsub(/%/,"").to_f
  answer = (stock_ratio - index_ratio).round(2)
  relative_ratio = sprintf("%10.2f", answer).gsub(" ","")
  relative_ratio = "+" + relative_ratio if answer > 0
  relative_ratio
end

def create_record(stock_datas, market, border)
  stock_datas.each do |stock_data|
    if stock_booming?(stock_data, market, border)
     Decrease.create(
       market: market,
       code: stock_data[:code],
       name: stock_data[:name],
       price: stock_data[:price],
       ratio: stock_data[:ratio],
       volume: stock_data[:volume],
       relative_ratio:  calcurate_diff(stock_data, market) + "%",
       date: TODAY
     )
    end
 end
end

MARKETS.each do |market, i|
  (1..$page_number).each do |p|
    sleep(10)
    puts "現在のアクセス先" + target_url(i, p)
    html = open(target_url(i, p)).read 
    stock_datas = parse_ranking_table(html, $column_positions)
    create_record(stock_datas, market, $money_volume_border)
  end
end
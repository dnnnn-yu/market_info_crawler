require_relative '../common'

#過去１週間で売買代金100位以内に入ったことがあるか判断
def pick_up(code)
  one_week_ago = TODAY - 7
  yesterday = TODAY - 1
  Volume.where(code: code, date: one_week_ago..yesterday,rank: 1..100).count == 0
end

Volume.where(date: TODAY,rank: 1..100).each do |stock|
  if pick_up(stock.code)
    Pickup.create(  
      market: stock.market,
      name: stock.name,
      code: stock.code,
      date: TODAY
    )
  end
end
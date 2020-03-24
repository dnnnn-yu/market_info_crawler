require 'active_record'
require 'mysql2'
require 'date'


# DB接続処理
ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     "localhost",
  username: "root",
  password: "",
  database: "market_info",
  charset: 'utf8mb4',
  encoding: 'utf8mb4',
  collation: 'utf8mb4_general_ci'
)
# ActiveRecord::Base.logger = Logger.new(STDERR)

# DBのタイムゾーン設定
Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

class Increase < ActiveRecord::Base
end

class Decrease < ActiveRecord::Base
end

class Volume < ActiveRecord::Base
end

class Index < ActiveRecord::Base
end

TODAY = Date.today

#URL生成用(Yahoo!ファイナンス)
MARKETS = {
  t1: 3,
  t2: 4,
  mothers: 5,
  jasdaq: 9
}

# クロールするページ数を指定
$page_number = 3

$column_positions = {
  code: 1,
  name: 3,
  price: 5,
  ratio: 6,
  volume: 8
}

#売買代金の基準を10億に設定
$money_volume_border = "1,000,000,000".gsub(/,/,'').to_i
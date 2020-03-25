#!/usr/bin/bash
bundle=/root/.rbenv/shims/bundle
$bundle exec ruby ./market_info_crawler/index.rb
sleep 10s
$bundle exec ruby ./market_info_crawler/volume_ranking.rb
sleep 10s
$bundle exec ruby ./market_info_crawler/increase_ranking.rb
sleep 10s
$bundle exec ruby ./market_info_crawler/decrease_ranking.rb
sleep 10s
$bundle exec ruby ./market_info_crawler/pickup.rb


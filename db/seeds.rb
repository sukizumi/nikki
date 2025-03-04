# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始"

Admin.create!(
  email: 'admin@example.com',
  password: 'poipoi'
)

tsuyoshi = User.find_or_create_by!(email: "tsuyoshi@gmail.com") do |user|
  user.name = "草薙"
  user.gender = "male"
  user.height = "200"
  user.weight = "100"
  user.password = "poipoi"
  user.goal = "目標はブランドン・カリー！"
  user.introduction = "元々アイドルをしていましたが、今はユーチーバーです！"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")
end

takuya = User.find_or_create_by!(email: "takuya@gmail.com") do |user|
  user.name = "木村"
  user.gender = "male"
  user.height = "190"
  user.weight = "95"
  user.password = "poipoi"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
end

goro = User.find_or_create_by!(email: "goro@gmail.com") do |user|
  user.name = "吾郎"
  user.gender = "male"
  user.height = "230"
  user.weight = "144"
  user.password = "poipoi"
  user.goal = "特に目標はないですが、健康のためにやっています。"
  user.introduction = "元アイドル。今は特に何もやってないです。"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")
end

shingo = User.find_or_create_by!(email: "shingo@gmail.com") do |user|
  user.name = "香取"
  user.gender = "male"
  user.height = "221"
  user.weight = "113"
  user.password = "poipoi"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.png"), filename:"sample-user4.png")
end

 akiko = User.find_or_create_by!(email: "akiko@gmail.com") do |user|
  user.name = "和田"
  user.gender = "blank"
  user.height = "174"
  user.weight = "68"
  user.password = "poipoi"
end

Post.find_or_create_by!(text: "朝：ヨーグルトとバナナ　昼：1本満足バー　夜：焼きそば") do |post|
  post.date = "2025-02-12"
  post.weight = "115"
  post.step = "23000"
  post.food = "normal"
  post.text = "朝：ヨーグルトとバナナ　昼：1本満足バー　夜：焼きそば"
  post.user = tsuyoshi
end

Post.find_or_create_by!(text: "朝：ヨーグルトとバナナ　昼：１本満足バー　夜：ステーキとサラダ") do |post|
  post.date = "2025-02-13"
  post.weight = "113"
  post.step = "12000"
  post.food = "good"
  post.text = "朝：ヨーグルトとバナナ　昼：１本満足バー　夜：ステーキとサラダ"
  post.user = tsuyoshi
end

Post.find_or_create_by!(text: "朝：抜き　昼：ラーメンとチャーハンのセット　夜：焼肉　食べた分体を動かした。") do |post|
  post.date = "2025-02-14"
  post.weight = "110"
  post.step = "26000"
  post.food = "bad"
  post.text = "朝：抜き　昼：ラーメンとチャーハンのセット　夜：焼肉　食べた分体を動かした。"
  post.user = tsuyoshi
end

Post.find_or_create_by!(text: "久しぶりの投稿。かなり太ってしまった。") do |post|
  post.date = "2025-02-23"
  post.weight = "120"
  post.step = "5000"
  post.food = "bad"
  post.text = "久しぶりの投稿。かなり太ってしまった。"
  post.user = tsuyoshi
end

Post.find_or_create_by!(text: "今日は昼食しか摂りませんでした。ちなみに内容としては、玄米と味噌汁と冷奴と1本満足バーです。") do |post|
  post.date = "2025-02-15"
  post.weight = "92"
  post.step = "12000"
  post.food = "good"
  post.text = "今日は昼食しか摂りませんでした。ちなみに内容としては、玄米と味噌汁と冷奴と1本満足バーです。"
  post.user = takuya
end

Post.find_or_create_by!(text: "朝食：プロテイン　昼食：鶏胸肉200g＋ブロッコリー＋アスパラガス　夕食：ステーキ300g＋マッシュポテト。") do |post|
  post.date = "2025-02-01"
  post.weight = "147"
  post.step = "5000"
  post.food = "good"
  post.text = "朝食：プロテイン　昼食：鶏胸肉200g＋ブロッコリー＋アスパラガス　夕食：ステーキ300g＋マッシュポテト。"
  post.user = goro
end

Post.find_or_create_by!(text: "朝食：プロテイン　昼食：鶏胸肉200g＋ブロッコリー＋アスパラガス　夕食：おにぎり２個＋プロテイン。") do |post|
  post.date = "2025-02-02"
  post.weight = "145"
  post.step = "7000"
  post.food = "good"
  post.text = "朝食：プロテイン　昼食：鶏胸肉200g＋ブロッコリー＋アスパラガス　夕食：おにぎり２個＋プロテイン。"
  post.user = goro
end

Post.find_or_create_by!(text: "朝食：プロテイン　昼食：鶏胸肉200g＋ブロッコリー＋アスパラガス　夕食：納得＋全卵２個＋ご飯1杯＋照り焼きチキン250g。") do |post|
  post.date = "2025-02-03"
  post.weight = "143"
  post.step = "7500"
  post.food = "good"
  post.text = "朝食：プロテイン　昼食：鶏胸肉200g＋ブロッコリー＋アスパラガス　夕食：納得＋全卵２個＋ご飯1杯＋照り焼きチキン250g。"
  post.user = goro
end

Post.find_or_create_by!(text: "朝食：プロテイン　昼食：鶏胸肉200g＋ブロッコリー＋アスパラガス　夕食：納得＋全卵２個＋ご飯1杯＋照り焼きチキン250g。") do |post|
  post.date = "2025-02-04"
  post.weight = "140"
  post.step = "12000"
  post.food = "good"
  post.text = "朝食：プロテイン　昼食：鶏胸肉200g＋ブロッコリー＋アスパラガス　夕食：納得＋全卵２個＋ご飯1杯＋野菜炒め。"
  post.user = goro
end



puts "seedの実行が完了しました"
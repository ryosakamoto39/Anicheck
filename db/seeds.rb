admin = User.create!(name: '管理者',
             email: 'admin@gmail.com',
             password: '11111111',
             password_confirmation: '11111111',
             admin: true)

test_user = User.create!(name: 'テストユーザー',
             email: 'user00@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '合田美桜',
             email: 'user01@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/1.png"),
             admin: false)
#
User.create!(name: '市原由奈',
             email: 'user02@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/2.png"),
             admin: false)
#
User.create!(name: '天野のぞみ',
             email: 'user03@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/3.png"),
             admin: false)
#
User.create!(name: '綾音',
             email: 'user04@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/4.png"),
             admin: false)
#
User.create!(name: '藤原千花',
             email: 'user05@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/5.png"),
             admin: false)
#
User.create!(name: 'あおい',
             email: 'user06@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/6.png"),
             admin: false)
#
User.create!(name: 'もなか',
             email: 'user07@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/7.png"),
             admin: false)
#
User.create!(name: 'エリカ',
             email: 'user08@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/8.png"),
             admin: false)
#
User.create!(name: 'サヤ',
             email: 'user09@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/9.png"),
             admin: false)
#
User.create!(name: '神尾ひびき',
             email: 'user10@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/10.png"),
             admin: false)
#
User.create!(name: '綾時ハヤテ',
             email: 'user11@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/11.png"),
             admin: false)
#
User.create!(name: '東条秀明',
             email: 'user12@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/12.png"),
             admin: false)
#
User.create!(name: 'りょうま',
             email: 'user13@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/13.png"),
             admin: false)
#
User.create!(name: '走一郎',
             email: 'user14@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/14.png"),
             admin: false)
#
User.create!(name: 'ジン',
             email: 'user15@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/15.png"),
             admin: false)
#
User.create!(name: '泉鏡花',
             email: 'user16@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/16.png"),
             admin: false)
#
User.create!(name: '水原光太',
             email: 'user17@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/17.png"),
             admin: false)
#
User.create!(name: 'あゆむ',
             email: 'user18@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             image: File.open("./public/default/users/18.png"),
             admin: false)
#
User.create!(name: 'スバル',
             email: 'user19@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#
User.create!(name: '葵ゆうた',
             email: 'user20@gmail.com',
             password: '00000000',
             password_confirmation: '00000000',
             admin: false)
#

Item.create!(
  title: 'Steins;Gate',
  story: '舞台は2010年夏の秋葉原。厨二病から抜け出せない大学生である岡部倫太郎は、｢未来ガジェット研究所｣を立ち上げ、用途不明の発明品を日々生み出していた。だが、ある日、偶然にも過去へとメールが送れる｢タイムマシン｣を作り出す。世紀の発明と興奮を抑えきれずに、興味本位で過去への干渉を繰り返す。その結果、世界を巻き込む大きな悲劇が、岡部たちに訪れることになるのだが・・・悲劇を回避するために、岡部の孤独な戦いが始まる。果たして彼は、運命を乗り越えることができるのか!?',
  image: File.open("./public/default/items/1.png"),
)

Item.create!(
  title: 'ソードアート・オンライン',
  story: '2022年。人類はついに完全なる仮想空間を実現した。 VRMMORPG「ソードアート・オンライン」のプレイヤーの一人であるキリト。 SAOの世界を満喫していた彼は、ログインした他の1万人のプレイヤーと共にゲームマスターから恐るべき託宣を聞かされる。 それは、ゲームをクリアすることだけが、この世界から脱出する唯一の方法であること。 そして、このゲーム内でゲームオーバーは、現実世界での"死"を意味すること。 それが、このゲームの恐るべき全貌であった。 キリトは、いち早くこのMMOの"真実"を受け入れ、パーティを組まないソロプレイヤーとして、終わりの見えない死闘に身を投じていく・・・。',
  image: File.open("./public/default/items/2.jpg"),
)

Item.create!(
  title: 'コードギアス 反逆のルルーシュ',
  story: '皇暦2010年8月10日、世界唯一の超大国神聖ブリタニア帝国は日本と地下資源サクラダイトを巡って対立し宣戦布告、日本に侵攻した。日本は占領され、ブリタニアによって「エリア11」と呼称される。日本人は「イレヴン」と蔑まれ、自由を奪われブリタニアの総督により支配された。ブリタニアは「ナイトメアフレーム」と呼ばれる人型兵器により世界の3分の1を支配下に収めた。しかし、その圧倒的な支配にも亀裂が生まれようとしていた。',
  image: File.open("./public/default/items/3.jpg"),
)

Item.create!(
  title: '君の名は。',
  story: '千年ぶりとなる彗星の来訪を一か月後に控えた日本。山深い田舎町に暮らす女子高校生・三葉は憂鬱な毎日を過ごしていた。町長である父の選挙運動に、家系の神社の古き風習。小さく狭い町で、周囲の目が余計に気になる年頃だけに、都会への憧れを強くするばかり。「来世は東京のイケメン男子にしてくださーーーい！！！」そんなある日、自分が男の子になる夢を見る。見慣れない部屋、見知らぬ友人、戸惑いながらも、念願だった都会での生活を思いっきり満喫する三葉。「不思議な夢……。」一方、東京で暮らす男子高校生、瀧も、奇妙な夢を見た。行ったこともない山奥の町で、自分が女子高校生になっているのだー。彼らが体験した夢の秘密とは？',
  image: File.open("./public/default/items/4.png"),
)

Item.create!(
  title: 'ONE PIECE',
  story: '時は大海賊時代。かつて、この世の全てを手に入れた男がいた。その名は海賊王ゴールド・ロジャー。遥かな大海原グランドラインには、彼が遺した“ひとつなぎの大秘宝(ワンピース)”が隠されているという・・・。伝説の秘宝を求め、人々は競うように海へと漕ぎ出してゆく。そして、ここにもグランドラインを目指す者が一人。悪魔の実と呼ばれる不思議な実の一つ｢ゴムゴムの実｣を食べ、全身がゴムのように伸びるゴム人間になったモンキー・D・ルフィだ。幼い頃に赤髪のシャンクスから麦わら帽子を託された彼は、海賊王になるという壮大な野望を抱いていた。海へと乗り出したルフィは、航海の中で大冒険を繰り返し、様々な人々と出会ってゆく。',
  image: File.open("./public/default/items/5.jpg"),
)

Item.create!(
  title: '進撃の巨人',
  story: '巨人がすべてを支配する世界。巨人の餌と化した人類は高さ50メートルの巨大な壁を築き、壁外への自由と引き換えに侵略を防いでいた…。まだ見ぬ壁外の世界を夢見る10歳の少年、エレン・イェーガー。エレンは仮初めの平和に満足し外の世界へ出ることを諦めた人々に違和感を覚える。彼らを｢家畜｣と呼ぶエレン。エレンを｢異物｣と感じる人々。だが、壁をも越える超大型巨人の出現により、エレンの｢夢｣も人々の｢平和｣も突如として崩れ去ってしまう……。',
  image: File.open("./public/default/items/6.png"),
)

Item.create!(
  title: '魔法少女まどか☆マギカ',
  story: '大好きな家族がいて、親友がいて、時には笑い、時には泣く、そんなどこにでもある日常。市立見滝原中学校に通う、普通の中学二年生・鹿目まどかも、そんな日常の中で暮らす一人。ある日、彼女に不思議な出会いが訪れる。この出会いは偶然なのか、必然なのか、彼女はまだ知らない。それは、彼女の運命を変えてしまうような出会い――それは、新たなる魔法少女物語の始まり――。',
  image: File.open("./public/default/items/7.png"),
)

Item.create!(
  title: '鬼滅の刃',
  story: '時は大正、日本。炭を売る心優しき少年・炭治郎は、ある日鬼に家族を皆殺しにされてしまう。
  さらに唯一生き残った妹の襧豆子は鬼に変貌してしまった。
  絶望的な現実に打ちのめされる炭治郎だったが、妹を人間に戻し、家族を殺した鬼を討つため、“鬼狩り”の道を進む決意をする。
  人と鬼とが織りなす哀しき兄妹の物語が、今、始まる――！',
  image: File.open("./public/default/items/8.jpg"),
)

Item.create!(
  title: '風の谷のナウシカ',
  story: '極限まで発達した人類文明が「火の七日間」と呼ばれる最終戦争を引き起こし、瘴気（有毒ガス）が充満する「腐海」と呼ばれる菌類の森や獰猛な蟲（むし）が発生した。それから千年余り、拡大を続ける腐海に脅かされながら、わずかに残った人類は、古の文明の遺物を発掘して利用しつつ、細々と生きていた。腐海のほとりにある辺境の小国「風の谷」は、大国トルメキアの戦乱に巻き込まれる。風の谷の族長ジルの娘であるナウシカは、運命に翻弄されながらさまざまな人々と出会い、自分自身と世界の運命、太古より繰り返されて来た人の営みに向き合い、大国と小国、そして腐海と人類との共生の道を探っていく。',
  image: File.open("./public/default/items/9.jpg"),
)

Item.create!(
  title: '新世紀エヴァンゲリオン',
  story: '時は西暦2015年。南極の氷雪溶解による世界的危機（セカンドインパクト）から復興しつつある時代。箱根に建設中の計画都市、第3新東京市に突如襲来する“使徒”。彼らはその正体も目的も不明だが、さまざまな形態・特殊能力で人類に戦いを挑んできた。この謎の敵“使徒”に人類が対抗する唯一の手段が 「汎用人型決戦兵器エヴァンゲリオン」である。国際連合直属の特務機関「ネルフ」によって主人公・碇シンジを含む3人の少年少女がその操縦者に抜擢された。今、人類の命運を掛けた戦いの火蓋が切って落とされる。果たして“使徒”の正体とは？少年たちの、そして人類の運命は？',
  image: File.open("./public/default/items/10.jpg"),
)

Item.create!(
  title: '鋼の錬金術師',
  story: '錬金術、それは「等価交換」の原則のもと、物質を理解、分解、そして再構築する、この世界で最先端の学術である。
この錬金術において、最大の“禁忌”とされるもの「人体錬成」。亡き母親を想うがゆえ、禁忌を侵し、全てを失った幼き兄弟。巨大な鎧に魂を定着された弟、アルフォンス・エルリック。機械鎧（オートメイル）をまとい、「鋼の錬金術師」の名を背負った兄、エドワード・エルリック。
二人は失ったものを取り戻すため、「賢者の石」を探す旅に出る。兄弟は「賢者の石」の真実に近づくにつれ、大きな陰謀の渦中へと突き進んでいく…。',
  image: File.open("./public/default/items/11.png"),
)

Item.create!(
  title: '化物語',
  story: '高校3年生の少年 阿良々木暦は、文化祭の準備をしていた5月のある日、3年間ろくに話したことのないクラスメイト・戦場ヶ原ひたぎの秘密を知ってしまう。ひたぎは体育の時間には全く参加せず、病院通いを続けているのだが、実は彼女には体重と呼べるものが殆ど無かったのである。暦は秘密を知った日の放課後、ひたぎから秘密をばらさないようにと執拗な脅しを受けるが、それにもめげず彼女の秘密に対する協力を申し出る。彼女によると、2年前に1匹の不思議な蟹に出会い、重さをそっくり持っていかれたのだと言う。',
  image: File.open("./public/default/items/12.png"),
)

Item.create!(
  title: '宇宙よりも遠い場所',
  story: 'そこは、宇宙よりも遠い場所──。何かを始めたいと思いながら、中々一歩を踏み出すことのできないまま高校2年生になってしまった少女・玉木マリ(たまき・まり)ことキマリは、とあることをきっかけに南極を目指す少女・小淵沢報瀬(こぶちざわ・しらせ)と出会う。高校生が南極になんて行けるわけがないと言われても、絶対にあきらめようとしない報瀬の姿に心を動かされたキマリは、報瀬と共に南極を目指すことを誓うのだが……。',
  image: File.open("./public/default/items/13.jpg"),
)

Item.create!(
  title: '凪のあすから',
  story: 'その昔、人間は皆、海に住んでいた。でも、陸に憧れた人たちは海を捨てた。海で暮らせるように海神様がくれた、特別な羽衣を脱ぎ捨てて……。海で暮らす人、陸で暮らす人、住む場所が分かれ、考え方は相容れずとも、元は同じ人間同士、わずかながらも交流は続き時は流れた。海底にある海村で暮らす先島 光、向井戸まなか、比良平ちさき、伊佐木 要と地上に暮らす木原 紡。海と陸。中学二年生という同じ年代を過ごしながら今まで出会うことのなかった彼らが出会った時、潮の満ち引きのように彼らの心も揺れ動く。ちょっと不思議な世界で繰り広げられる少年少女たちの青の御伽話。',
  image: File.open("./public/default/items/14.jpg"),
)

Review.create!(
  user_id: 3,
  item_id: 1,
  content: 'TVシリーズアニメでこのレベルで面白かったのは久しぶり。
当然それなりに突っ込みどころはあるがそれをとりあえず脇に置いといても物語の先へ先へと視させる力はかなりのもの。',
  score: 4,
  tag_list: %w[イッキ観 厨二病 感動],
)

Review.create!(
  user_id: 4,
  item_id: 1,
  content: '面白さの要素としては現実で起きたタイムトラベルに関する都市伝説的な事件までも物語の重要なネタにしてたり（その辺を予備知識として頭に入れておくとさらに面白く感じるかもしれない）、更にはネットで使われるスラングや慣用句等の小ネタ・声優ネタとも取れるようなニヤリと笑えるような面白いところもあったりと、とにかくマニアックな人達に受ける。
なかなかに凝った作りをしている。ある意味セカイ系のように比較的少ない登場人物とそれ故の閉じた人間関係だけで物語を展開させていく単純さも、物語を分かりやすく面白くするのに一役買っているのではないでしょうか。',
  score: 4,
  tag_list: %w[],
)

Review.create!(
  user_id: 5,
  item_id: 1,
  content: '・主人公の岡部倫太郎は某理系私立大に通う中二病患者。
・秋葉原に研究所を構えて活動するとか、なんともオタ充。
・ラボメン（研究所メンバー）は、一曲あるやつばかり。
・商品や組織はもちろん、地域すら文字ったりするのがアニメの基本だが、本作品は秋葉原はもちろんのこと、大学やお店名など、実物のものを使っている。
　タイムリープ系ということで、どう作品に集中させるかが重要ポイントだと思うが、SF理論の設定（実在（？）するジョンタイターの理論を昇華させたものではあるが）だけでなく、こういった細かい設定のリアル感を増した原因と思われる。
★自分としては、今までにない作品。',
  score: 5,
  tag_list: %w[厨二病 オタク タイムリープ],
)

#Review.create!(
#  user_id: ,
#  item_id: ,
#  content: '',
#  score: ,
#  tag_list: %w[],
#)

# *70ほど


Review.all.sample(Review.count).each_with_index do |review, i|
  time = Time.zone.now - (12 * i).hours
  review.update_attribute(:created_at, time)
end

User.where.not(id: [admin.id]).each do |user|
  Review.all.sample(3).each do |review|
    ReviewLike.create!(user_id: user.id, review_id: review.id)
  end
end

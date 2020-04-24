namespace :yys do
  def init_shi_shen
    YysShiShen.delete_all

    # SSR
    shi_shens = []
    shi_shens << {name: '缘结神', sid: '347', cartoon: false}
    shi_shens << {name: '鬼童丸', sid: '345', cartoon: false}
    shi_shens << {name: '云外镜', sid: '344', cartoon: false}
    shi_shens << {name: '泷夜叉姬', sid: '338', cartoon: true}
    shi_shens << {name: '大岳丸', sid: '333', cartoon: true}
    shi_shens << {name: '不知火', sid: '330', cartoon: true}
    shi_shens << {name: '八岐大蛇', sid: '325', cartoon: true}
    shi_shens << {name: '白藏主', sid: '316', cartoon: true}
    shi_shens << {name: '鬼切', sid: '312', cartoon: true}
    shi_shens << {name: '面灵气', sid: '311', cartoon: true}
    shi_shens << {name: '御馔津', name_sp: '青竹', sid: '304', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '玉藻前', name_sp: '白堇', sid: '300', cartoon: true}
    shi_shens << {name: '山风', name_sp: '青竹', sid: '296', cartoon: true}
    shi_shens << {name: '雪童子', name_sp: '京紫', sid: '292', cartoon: true}
    shi_shens << {name: '彼岸花', name_sp: '白堇', sid: '288', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '荒', name_sp: '山吹', sid: '283', cartoon: true}
    shi_shens << {name: '辉夜姬', name_sp: '绀色', sid: '280', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '花鸟卷', name_sp: '绀色', sid: '279', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '一目连', name_sp: '京紫', sid: '272', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '妖刀姬', name_sp: '真红', sid: '269', cartoon: true}
    shi_shens << {name: '青行灯', name_sp: '浅葱', sid: '266', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '茨木童子', name_sp: '薄香', sid: '265', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '小鹿男', name_sp: '白堇', sid: '259', cartoon: true}
    shi_shens << {name: '阎魔', name_sp: '京紫', sid: '255', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '荒川之主', name_sp: '薄香', sid: '248', cartoon: true}
    shi_shens << {name: '酒吞童子', name_sp: '山吹', sid: '219', cartoon: true}
    shi_shens << {name: '大天狗', name_sp: '青竹', sid: '217', cartoon: true, cartoon_sp: true}

    # SP
    shi_shens << {name: '浮世青行灯', kind: 'SP', sid: '348', cartoon: false}
    shi_shens << {name: '聆海金鱼姬', kind: 'SP', sid: '346', cartoon: false}
    shi_shens << {name: '天剑韧心鬼切', kind: 'SP', sid: '343', cartoon: true}
    shi_shens << {name: '鬼王酒吞童子', kind: 'SP', sid: '341', cartoon: true}
    shi_shens << {name: '烬天玉藻前', kind: 'SP', sid: '339', cartoon: true}
    shi_shens << {name: '骁浪荒川之主', kind: 'SP', sid: '334', cartoon: true}
    shi_shens << {name: '御怨般若', kind: 'SP', sid: '331', cartoon: true}
    shi_shens << {name: '赤影妖刀姬', kind: 'SP', sid: '328', cartoon: true}
    shi_shens << {name: '苍风一目连', kind: 'SP', sid: '327', cartoon: true}
    shi_shens << {name: '稻荷神御馔津', kind: 'SP', sid: '326', cartoon: true}
    shi_shens << {name: '炼狱茨木童子', kind: 'SP', sid: '322', cartoon: true}
    shi_shens << {name: '少羽大天狗', kind: 'SP', sid: '315', cartoon: true}

    # linkage
    shi_shens << {name: '黑崎一护', sid: '337', form: 'linkage'}
    shi_shens << {name: '桔梗', sid: '319', form: 'linkage'}
    shi_shens << {name: '杀生丸', sid: '314', form: 'linkage'}
    shi_shens << {name: '犬夜叉', sid: '313', form: 'linkage'}
    shi_shens << {name: '鬼灯', sid: '308', form: 'linkage'}
    shi_shens << {name: '卖药郎', sid: '305', form: 'linkage'}
    shi_shens << {name: '奴良陆生', sid: '294', form: 'linkage'}


    shi_shens.each do |ss|
      YysShiShen.create!(ss)
      puts "...创建式神：#{ss[:name]}, sid: #{ss[:sid]}"
    end

  end

  def init_region

    YysRegion.delete_all
    regions = []

    # 中国区-iOS
    regions << {name: '春之樱', mode: 'IOS', key: 'chunzhiying'}
    regions << {name: '夏之蝉', mode: 'IOS', key: 'xiazhichan'}
    regions << {name: '夜之月', mode: 'IOS', key: 'yezhiyue'}
    regions << {name: '竹之幽', mode: 'IOS', key: 'zhuzhiyou'}
    regions << {name: '松之苍', mode: 'IOS', key: 'songzhicang'}
    regions << {name: '兰之雅', mode: 'IOS', key: 'langzhiya'}
    regions << {name: '雀之羽', mode: 'IOS', key: 'quezhiyu'}
    regions << {name: '云之遏', mode: 'IOS', key: 'yunzhijie'}
    regions << {name: '莲之净', mode: 'IOS', key: 'lianzhijing'}
    regions << {name: '桂之馥', mode: 'IOS', key: 'guizhimi'}

    # 中国区-Android
    regions << {name: '菊之逸', mode: 'ANDROID', key: 'juzhiyi'}
    regions << {name: '雀之灵', mode: 'ANDROID', key: 'quezhiling'}
    regions << {name: '暮之霞', mode: 'ANDROID', key: 'muzhixia'}
    regions << {name: '冬之雪', mode: 'ANDROID', key: 'dongzhixue'}
    regions << {name: '秋之枫', mode: 'ANDROID', key: 'qiuzhifeng'}
    regions << {name: '雨之霁', mode: 'ANDROID', key: 'yuzhiji'}
    regions << {name: '桃之华', mode: 'ANDROID', key: 'taozhihua'}
    regions << {name: '风之清', mode: 'ANDROID', key: 'fengzhiqing'}
    regions << {name: '梅之寒', mode: 'ANDROID', key: 'meizhihan'}
    regions << {name: '樱之华', mode: 'ANDROID', key: 'yingzhihua'}

    # 网易-双平台
    regions << {name: '携手同心', mode: 'NET', key: 'xieshoutongxin'}
    regions << {name: '结伴同游', mode: 'NET', key: 'jiebantongyou'}
    regions << {name: '相伴相随', mode: 'NET', key: 'xiangbanxiangsui'}
    regions << {name: '情比金坚', mode: 'NET', key: 'qingbijinjian'}
    regions << {name: '形影不离', mode: 'NET', key: 'xingyingbuli'}
    regions << {name: '同心一意', mode: 'NET', key: 'tongxinyiyi'}
    regions << {name: '相知相依', mode: 'NET', key: 'xianzhixianyi'}
    regions << {name: '心意相通', mode: 'NET', key: 'xinyixiangtong'}
    regions << {name: '永生之谜', mode: 'NET', key: 'yongshnegzhipi'}
    regions << {name: '缥缈之旅', mode: 'NET', key: 'piaomiaozhilve'}
    regions << {name: '遥远之忆', mode: 'NET', key: 'yaoyuanzhiyi'}
    regions << {name: '孤高之心', mode: 'NET', key: 'gugaozhixin'}
    regions << {name: '风雨同行', mode: 'NET', key: 'fenyutongxing'}
    regions << {name: '两情相悦', mode: 'NET', key: 'liangqingxiangyue'}
    regions << {name: '春樱共赏', mode: 'NET', key: 'chunyinggongshang'}
    regions << {name: '谜之暗影', mode: 'NET', key: 'mizhianying'}

    # 联运-双平台
    regions << {name: 'B站~两心无间', mode: 'UNION', key: 'liangxinwujian'}
    regions << {name: 'B站~亲密无间', mode: 'UNION', key: 'qinmiwujian'}
    regions << {name: 'B站~情深谊长', mode: 'UNION', key: 'qingshenyichang'}
    regions << {name: 'B站~情意相投', mode: 'UNION', key: 'qingyixiangtou'}

    # 国际区
    regions << {name: '海外加速区', mode: 'INT', key: 'haiwaijiasuqu'}

    # 全平台互通新区
    regions << {name: '相伴同行', mode: 'ALL', key: 'xiangbantongxing'}
    regions << {name: '旧友新朋', mode: 'ALL', key: 'jiuyouxinpeng'}
    regions << {name: '深情厚谊', mode: 'ALL', key: 'shenqinghouyi'}
    regions << {name: '相伴长情', mode: 'ALL', key: 'xiangbanchangqing'}
    regions << {name: '朝夕相伴', mode: 'ALL', key: 'zhaoxixiangban'}
    regions << {name: '携手共度', mode: 'ALL', key: 'xieshougongdu'}
    regions << {name: '举手相庆', mode: 'ALL', key: 'jushouxiangqing'}
    regions << {name: '欢庆鼓舞', mode: 'ALL', key: 'huanqingguwu'}
    regions << {name: '追月逐兔', mode: 'ALL', key: 'zhuiyuezhutu'}
    regions << {name: '依偎相守', mode: 'ALL', key: 'yiweixiangshou'}
    regions << {name: '暖风春穗', mode: 'ALL', key: 'nuanfengchunhui'}
    regions << {name: '樱之忆', mode: 'ALL', key: 'yingzhiyi'}
    regions << {name: '鬼灯的冷彻', mode: 'ALL', key: 'guidengdelengche'}
    regions << {name: '初心未改', mode: 'ALL', key: 'chuxinweigai'}
    regions << {name: '狐之宴', mode: 'ALL', key: 'huzhiyan'}
    regions << {name: '犬夜叉', mode: 'ALL', key: 'quanyecha'}
    regions << {name: '立秋夕烛', mode: 'ALL', key: 'liqiuxizhu'}
    regions << {name: '全球国际区', mode: 'ALL', key: 'quanqiuguojiqu'}
    regions << {name: '枫之舞', mode: 'ALL', key: 'fengzhiwu'}
    regions << {name: '雪之萤', mode: 'ALL', key: 'xuezhiying'}
    regions << {name: '游梦迷蝶', mode: 'ALL', key: 'youmengmidie'}
    regions << {name: '桃映春馨', mode: 'ALL', key: 'taoyingchunxin'}
    regions << {name: '竹风夏意', mode: 'ALL', key: 'zhufengxiayi'}
    regions << {name: '一叶禅心', mode: 'ALL', key: 'yiyechanxin'}
    regions << {name: '夜火离歌', mode: 'ALL', key: 'yehuolige'}
    regions << {name: '晴空日和', mode: 'ALL', key: 'qingkongrihe'}
    regions << {name: '瀞灵廷', mode: 'ALL', key: 'jinglingting'}
    regions << {name: '少时之约', mode: 'ALL', key: 'shaoshizhiyue'}
    regions << {name: '鸣麓逐浪', mode: 'ALL', key: 'mingluzhulang'}
    regions << {name: '八岐魅影', mode: 'ALL', key: 'baqimeiying'}
    regions << {name: '稚羽萌心', mode: 'ALL', key: 'zhiyumengxin'}
    regions << {name: '愿予必成', mode: 'ALL', key: 'yuanyubicheng'}
    regions << {name: '渡世之风', mode: 'ALL', key: 'dushizhifeng'}
    regions << {name: '百鬼夜行', mode: 'ALL', key: 'baiguiyexing'}
    regions.each do |region|
      puts "...创建大区：#{region[:name]}"
      YysRegion.create!(region)
    end
  end

  def init_patches
    patches = []
    patches << {version: "v0.2.8", content: "添加了未收录+神眷的召唤模拟"}
    patches << {version: "v0.2.9", content: "修复了伪全图神眷概率不正确的问题"}
    patches << {version: "v0.3.0", content: "修复了未收录时，未计算神眷的bug，合并了神眷的显示"}
    patches << {version: "v0.3.1", content: "添加活动：丑时之女·椿裳生花"}
    patches << {version: "v0.3.2", content: "添加缘结神召唤活动<br>由于召唤活动通常会伴随三次up，所以将三次up和概率up合并了"}
    patches << {version: "v0.3.3", content: "添加浮世青行灯召唤活动", title: "召唤：浮世青行灯"}

    patches.each do |attrs|
      puts "...模拟器补丁: #{attrs[:version]}: #{attrs[:content]}"
      YysPatch.find_or_create_by!(attrs)
    end
  end

  desc "init yys base data"
  task init: :environment do
    init_shi_shen
    init_region
    init_patches
  end


end

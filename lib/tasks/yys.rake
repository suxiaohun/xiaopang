namespace :yys do
  def init_shi_shen
    YysShiShen.delete_all


    # todo 包含以下信息
    # 战斗还是辅助
    # 1技能系数（1技能特殊效果：次数、效果）
    # 2技能效果（被动、extra效果）
    # 3技能系数（如果是战斗）
    # ai（技能选择、目标选择）
    #

    combat_info = []
    #combat_info << {sid: 350, skill_1: 1.25, skill_1_extra: nil,  }

    # SSR
    shi_shens = []
    shi_shens << {name: '铃鹿御前', kind: 'SSR', sid: '351', cartoon: false}
    shi_shens << {name: '缘结神', kind: 'SSR', sid: '347', cartoon: false}
    shi_shens << {name: '鬼童丸', kind: 'SSR', sid: '345', cartoon: false}
    shi_shens << {name: '云外镜', kind: 'SSR', sid: '344', cartoon: false}
    shi_shens << {name: '泷夜叉姬', kind: 'SSR', sid: '338', cartoon: true}
    shi_shens << {name: '大岳丸', kind: 'SSR', sid: '333', cartoon: true}
    shi_shens << {name: '不知火', kind: 'SSR', sid: '330', cartoon: true}
    shi_shens << {name: '八岐大蛇', kind: 'SSR', sid: '325', cartoon: true}
    shi_shens << {name: '白藏主', kind: 'SSR', sid: '316', cartoon: true}
    shi_shens << {name: '鬼切', kind: 'SSR', sid: '312', cartoon: true}
    shi_shens << {name: '面灵气', kind: 'SSR', sid: '311', cartoon: true}
    shi_shens << {name: '御馔津', name_sp: '青竹', kind: 'SSR', sid: '304', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '玉藻前', name_sp: '白堇', kind: 'SSR', sid: '300', cartoon: true}
    shi_shens << {name: '山风', name_sp: '青竹', kind: 'SSR', sid: '296', cartoon: true}
    shi_shens << {name: '雪童子', name_sp: '京紫', kind: 'SSR', sid: '292', cartoon: true}
    shi_shens << {name: '彼岸花', name_sp: '白堇', kind: 'SSR', sid: '288', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '荒', name_sp: '山吹', kind: 'SSR', sid: '283', cartoon: true}
    shi_shens << {name: '辉夜姬', name_sp: '绀色', kind: 'SSR', sid: '280', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '花鸟卷', name_sp: '绀色', kind: 'SSR', sid: '279', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '一目连', name_sp: '京紫', kind: 'SSR', sid: '272', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '妖刀姬', name_sp: '真红', kind: 'SSR', sid: '269', cartoon: true}
    shi_shens << {name: '青行灯', name_sp: '浅葱', kind: 'SSR', sid: '266', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '茨木童子', name_sp: '薄香', kind: 'SSR', sid: '265', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '小鹿男', name_sp: '白堇', kind: 'SSR', sid: '259', cartoon: true}
    shi_shens << {name: '阎魔', name_sp: '京紫', kind: 'SSR', sid: '255', cartoon: true, cartoon_sp: true}
    shi_shens << {name: '荒川之主', name_sp: '薄香', kind: 'SSR', sid: '248', cartoon: true}
    shi_shens << {name: '酒吞童子', name_sp: '山吹', kind: 'SSR', sid: '219', cartoon: true}
    shi_shens << {name: '大天狗', name_sp: '青竹', kind: 'SSR', sid: '217', cartoon: true, cartoon_sp: true}

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

    # linkage-SSR
    shi_shens << {name: '黑崎一护', kind: 'SSR', sid: '337', form: 'linkage'}
    shi_shens << {name: '桔梗', kind: 'SSR', sid: '319', form: 'linkage'}
    shi_shens << {name: '杀生丸', kind: 'SSR', sid: '314', form: 'linkage'}
    shi_shens << {name: '犬夜叉', kind: 'SSR', sid: '313', form: 'linkage'}
    shi_shens << {name: '鬼灯', kind: 'SSR', sid: '308', form: 'linkage'}
    shi_shens << {name: '卖药郎', kind: 'SSR', sid: '305', form: 'linkage'}
    shi_shens << {name: '奴良陆生', kind: 'SSR', sid: '294', form: 'linkage'}

    #linkage-SR
    shi_shens << {name: '露琪亚', kind: 'SR', sid: '336', form: 'linkage'}
    shi_shens << {name: '阿香', kind: 'SR', sid: '309', form: 'linkage'}

    # linkage-R

    shi_shens << {name: '蜜桃&芥子', kind: 'R', sid: '310', form: 'linkage'}

    # SR

    shi_shens << {kind: 'SR', sid: 200, name: '桃花妖'}
    shi_shens << {kind: 'SR', sid: 201, name: '雪女'}
    shi_shens << {kind: 'SR', sid: 210, name: '鬼使白'}
    shi_shens << {kind: 'SR', sid: 211, name: '鬼使黑'}
    shi_shens << {kind: 'SR', sid: 215, name: '孟婆'}
    shi_shens << {kind: 'SR', sid: 220, name: '犬神'}
    shi_shens << {kind: 'SR', sid: 223, name: '骨女'}
    shi_shens << {kind: 'SR', sid: 231, name: '鬼女红叶'}
    shi_shens << {kind: 'SR', sid: 233, name: '跳跳哥哥'}
    shi_shens << {kind: 'SR', sid: 242, name: '傀儡师'}
    shi_shens << {kind: 'SR', sid: 247, name: '海坊主'}
    shi_shens << {kind: 'SR', sid: 251, name: '判官'}
    shi_shens << {kind: 'SR', sid: 252, name: '凤凰火'}
    shi_shens << {kind: 'SR', sid: 253, name: '吸血姬'}
    shi_shens << {kind: 'SR', sid: 254, name: '妖狐'}
    shi_shens << {kind: 'SR', sid: 256, name: '妖琴师'}
    shi_shens << {kind: 'SR', sid: 257, name: '食梦貘'}
    shi_shens << {kind: 'SR', sid: 260, name: '清姬'}
    shi_shens << {kind: 'SR', sid: 261, name: '镰鼬'}
    shi_shens << {kind: 'SR', sid: 262, name: '姑获鸟'}
    shi_shens << {kind: 'SR', sid: 263, name: '二口女'}
    shi_shens << {kind: 'SR', sid: 264, name: '白狼'}
    shi_shens << {kind: 'SR', sid: 267, name: '樱花妖'}
    shi_shens << {kind: 'SR', sid: 268, name: '惠比寿'}
    shi_shens << {kind: 'SR', sid: 270, name: '络新妇'}
    shi_shens << {kind: 'SR', sid: 271, name: '般若'}
    shi_shens << {kind: 'SR', sid: 273, name: '青坊主'}
    shi_shens << {kind: 'SR', sid: 275, name: '万年竹'}
    shi_shens << {kind: 'SR', sid: 276, name: '夜叉'}
    shi_shens << {kind: 'SR', sid: 277, name: '黑童子'}
    shi_shens << {kind: 'SR', sid: 278, name: '白童子'}
    shi_shens << {kind: 'SR', sid: 281, name: '烟烟罗'}
    shi_shens << {kind: 'SR', sid: 282, name: '金鱼姬'}
    shi_shens << {kind: 'SR', sid: 285, name: '鸩'}
    shi_shens << {kind: 'SR', sid: 286, name: '以津真天'}
    shi_shens << {kind: 'SR', sid: 287, name: '匣中少女'}
    shi_shens << {kind: 'SR', sid: 290, name: '小松丸'}
    shi_shens << {kind: 'SR', sid: 291, name: '书翁'}
    shi_shens << {kind: 'SR', sid: 293, name: '百目鬼'}
    shi_shens << {kind: 'SR', sid: 295, name: '追月神'}
    shi_shens << {kind: 'SR', sid: 297, name: '日和坊'}
    shi_shens << {kind: 'SR', sid: 298, name: '薰'}
    shi_shens << {kind: 'SR', sid: 303, name: '弈'}
    shi_shens << {kind: 'SR', sid: 307, name: '猫掌柜'}
    shi_shens << {kind: 'SR', sid: 317, name: '人面树'}
    shi_shens << {kind: 'SR', sid: 318, name: '於菊虫'}
    shi_shens << {kind: 'SR', sid: 320, name: '一反木绵'}
    shi_shens << {kind: 'SR', sid: 321, name: '入殓师'}
    shi_shens << {kind: 'SR', sid: 324, name: '化鲸'}
    shi_shens << {kind: 'SR', sid: 329, name: '海忍'}
    shi_shens << {kind: 'SR', sid: 332, name: '久次良'}
    shi_shens << {kind: 'SR', sid: 335, name: '蟹姬'}
    shi_shens << {kind: 'SR', sid: 340, name: '纸舞'}
    shi_shens << {kind: 'SR', sid: 342, name: '星熊童子'}
    shi_shens << {kind: 'SR', sid: 349, name: '风狸'}

    # R
    shi_shens << {kind: 'R', sid: 202, name: "三尾狐"}
    shi_shens << {kind: 'R', sid: 205, name: "座敷童子"}
    shi_shens << {kind: 'R', sid: 206, name: "鲤鱼精"}
    shi_shens << {kind: 'R', sid: 207, name: "九命猫"}
    shi_shens << {kind: 'R', sid: 208, name: "狸猫"}
    shi_shens << {kind: 'R', sid: 209, name: "河童"}
    shi_shens << {kind: 'R', sid: 212, name: "童男"}
    shi_shens << {kind: 'R', sid: 213, name: "童女"}
    shi_shens << {kind: 'R', sid: 214, name: "饿鬼"}
    shi_shens << {kind: 'R', sid: 216, name: "巫蛊师"}
    shi_shens << {kind: 'R', sid: 218, name: "鸦天狗"}
    shi_shens << {kind: 'R', sid: 221, name: "食发鬼"}
    shi_shens << {kind: 'R', sid: 222, name: "武士之灵"}
    shi_shens << {kind: 'R', sid: 224, name: "雨女"}
    shi_shens << {kind: 'R', sid: 225, name: "跳跳弟弟"}
    shi_shens << {kind: 'R', sid: 226, name: "跳跳妹妹"}
    shi_shens << {kind: 'R', sid: 227, name: "兵俑"}
    shi_shens << {kind: 'R', sid: 228, name: "丑时之女"}
    shi_shens << {kind: 'R', sid: 230, name: "独眼小僧"}
    shi_shens << {kind: 'R', sid: 232, name: "铁鼠"}
    shi_shens << {kind: 'R', sid: 234, name: "椒图"}
    shi_shens << {kind: 'R', sid: 236, name: "管狐"}
    shi_shens << {kind: 'R', sid: 237, name: "山兔"}
    shi_shens << {kind: 'R', sid: 238, name: "萤草"}
    shi_shens << {kind: 'R', sid: 241, name: "蝴蝶精"}
    shi_shens << {kind: 'R', sid: 243, name: "山童"}
    shi_shens << {kind: 'R', sid: 244, name: "首无"}
    shi_shens << {kind: 'R', sid: 249, name: "觉"}
    shi_shens << {kind: 'R', sid: 250, name: "青蛙瓷器"}
    shi_shens << {kind: 'R', sid: 274, name: "古笼火"}
    shi_shens << {kind: 'R', sid: 289, name: "兔丸"}
    shi_shens << {kind: 'R', sid: 301, name: "数珠"}
    shi_shens << {kind: 'R', sid: 302, name: "小袖之手"}
    shi_shens << {kind: 'R', sid: 306, name: "虫师"}
    shi_shens << {kind: 'R', sid: 323, name: "天井下"}


    shi_shens.each do |ss|
      YysShiShen.create!(ss)
      puts "...创建式神：#{ss[:name]}, sid: #{ss[:sid]}"
    end

  end


  def init_shi_shen_skills
    YysSkill.delete_all

    skills = []
    skills << {sid: 200, skill_id: 1, skill_name: '花舞', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.25]}
    skills << {sid: 200, skill_id: 2, skill_name: '花之馨香', skill_kind: 'heal', skill_mode: 'unit'}
    skills << {sid: 200, skill_id: 3, skill_name: '桃华灼灼', skill_kind: 're-spawn', skill_mode: 'unit'}

    skills << {sid: 201, skill_id: 1, skill_name: '雪球', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 201, skill_id: 2, skill_name: '冰甲术', skill_kind: 'passive', extra: true}
    skills << {sid: 201, skill_id: 3, skill_name: '暴风雪', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 202, skill_id: 1, skill_name: '尾袭', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 202, skill_id: 2, skill_name: '诱惑', skill_kind: 'passive', extra: true}
    skills << {sid: 202, skill_id: 3, skill_name: '红颜怒发', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 203, skill_id: 1, skill_name: '舔', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 203, skill_id: 2, skill_name: '笼中火', skill_kind: 'passive', extra: true}
    skills << {sid: 203, skill_id: 3, skill_name: '大鬼笼', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    # 204缺失

    skills << {sid: 205, skill_id: 1, skill_name: '魂之火', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 205, skill_id: 2, skill_name: '福运昌隆', skill_kind: 'passive', extra: true}
    skills << {sid: 205, skill_id: 3, skill_name: '祸福相生', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 206, skill_id: 1, skill_name: '尾鞭', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 206, skill_id: 2, skill_name: '泡泡之盾', skill_kind: 'passive', extra: true}
    skills << {sid: 206, skill_id: 3, skill_name: '泡泡之牢', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 207, skill_id: 1, skill_name: '猫爪', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 207, skill_id: 2, skill_name: '九命', skill_kind: 'passive', extra: true}
    skills << {sid: 207, skill_id: 3, skill_name: '报复', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 208, skill_id: 1, skill_name: '妖酒壶', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 208, skill_id: 2, skill_name: '醉倒', skill_kind: 'passive', extra: true}
    skills << {sid: 208, skill_id: 3, skill_name: '烈焰之酒', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 209, skill_id: 1, skill_name: '水流弹', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 209, skill_id: 2, skill_name: '清流', skill_kind: 'passive', extra: true}
    skills << {sid: 209, skill_id: 3, skill_name: '大河之歌', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 210, skill_id: 1, skill_name: '活死人', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 210, skill_id: 2, skill_name: '魂狩', skill_kind: 'passive', extra: true}
    skills << {sid: 210, skill_id: 3, skill_name: '无常夺命', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 211, skill_id: 1, skill_name: '惩戒', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 211, skill_id: 2, skill_name: '索命', skill_kind: 'passive', extra: true}
    skills << {sid: 211, skill_id: 3, skill_name: '死亡宣判', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 212, skill_id: 1, skill_name: '羽刃', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 212, skill_id: 2, skill_name: '羽衣', skill_kind: 'passive', extra: true}
    skills << {sid: 212, skill_id: 3, skill_name: '魂之献祭', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 213, skill_id: 1, skill_name: '羽刺', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 213, skill_id: 2, skill_name: '羽衣', skill_kind: 'passive', extra: true}
    skills << {sid: 213, skill_id: 3, skill_name: '命之献祭', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 214, skill_id: 1, skill_name: '臭馒头', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 214, skill_id: 2, skill_name: '盗窃', skill_kind: 'passive', extra: true}
    skills << {sid: 214, skill_id: 3, skill_name: '饥不择食', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 215, skill_id: 1, skill_name: '药汤', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 215, skill_id: 2, skill_name: '汤盆冲撞', skill_kind: 'passive', extra: true}
    skills << {sid: 215, skill_id: 3, skill_name: '天降之物', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 216, skill_id: 1, skill_name: '施蛊', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: true}
    skills << {sid: 216, skill_id: 2, skill_name: '迷魂蛊', skill_kind: 'passive', extra: true}
    skills << {sid: 216, skill_id: 3, skill_name: '魔蛊毒爆', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: true}

    skills << {sid: 217, skill_id: 1, skill_name: '风袭', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 217, skill_id: 2, skill_name: '钢铁之羽', skill_kind: 'passive', extra: true}
    skills << {sid: 217, skill_id: 3, skill_name: '羽刃暴风', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 218, skill_id: 1, skill_name: '正义之刺', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 218, skill_id: 2, skill_name: '羽清', skill_kind: 'passive', extra: true}
    skills << {sid: 218, skill_id: 3, skill_name: '群鸦乱舞', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 219, skill_id: 1, skill_name: '鬼葫芦', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 219, skill_id: 2, skill_name: '狂气', skill_kind: 'passive', extra: true}
    skills << {sid: 219, skill_id: 3, skill_name: '狂啸', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 220, skill_id: 1, skill_name: '心斩', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 220, skill_id: 2, skill_name: '守护', skill_kind: 'passive', extra: true}
    skills << {sid: 220, skill_id: 3, skill_name: '心剑乱舞', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 221, skill_id: 1, skill_name: '发鞭', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 221, skill_id: 2, skill_name: '迷烟', skill_kind: 'passive', extra: true}
    skills << {sid: 221, skill_id: 3, skill_name: '真实之颜', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 222, skill_id: 1, skill_name: '武士之心', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 222, skill_id: 2, skill_name: '灭魂', skill_kind: 'passive', extra: true}
    skills << {sid: 222, skill_id: 3, skill_name: '不甘之怒', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 223, skill_id: 1, skill_name: '骨刃', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 223, skill_id: 2, skill_name: '怨生', skill_kind: 'passive', extra: true}
    skills << {sid: 223, skill_id: 3, skill_name: '一步一息', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 224, skill_id: 1, skill_name: '泪珠', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 224, skill_id: 2, skill_name: '净化之雨', skill_kind: 'passive', extra: true}
    skills << {sid: 224, skill_id: 3, skill_name: '天之泪', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 225, skill_id: 1, skill_name: '直拳', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 225, skill_id: 2, skill_name: '驱逐', skill_kind: 'passive', extra: true}
    skills << {sid: 225, skill_id: 3, skill_name: '毒气喷泉', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 226, skill_id: 1, skill_name: '坏人走开', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 226, skill_id: 2, skill_name: '不玩了啦', skill_kind: 'passive', extra: true}
    skills << {sid: 226, skill_id: 3, skill_name: '汪汪出击', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 227, skill_id: 1, skill_name: '挥斩', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 227, skill_id: 2, skill_name: '坚甲', skill_kind: 'passive', extra: true}
    skills << {sid: 227, skill_id: 3, skill_name: '坚不可破', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 228, skill_id: 1, skill_name: '咒锥', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 228, skill_id: 2, skill_name: '咒火', skill_kind: 'passive', extra: true}
    skills << {sid: 228, skill_id: 3, skill_name: '草人替身', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    # 229缺失

    skills << {sid: 230, skill_id: 1, skill_name: '投石', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 230, skill_id: 2, skill_name: '金刚经', skill_kind: 'passive', extra: true}
    skills << {sid: 230, skill_id: 3, skill_name: '石像冲击', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 231, skill_id: 1, skill_name: '红枫', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 231, skill_id: 2, skill_name: '爆炸之咒', skill_kind: 'passive', extra: true}
    skills << {sid: 231, skill_id: 3, skill_name: '死亡之舞', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 232, skill_id: 1, skill_name: '钱响叮当', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 232, skill_id: 2, skill_name: '横财护身', skill_kind: 'passive', extra: true}
    skills << {sid: 232, skill_id: 3, skill_name: '钱即正义', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 233, skill_id: 1, skill_name: '棺击', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 233, skill_id: 2, skill_name: '不弃', skill_kind: 'passive', extra: true}
    skills << {sid: 233, skill_id: 3, skill_name: '死而复生', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 234, skill_id: 1, skill_name: '水花弹', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 234, skill_id: 2, skill_name: '润物无声', skill_kind: 'passive', extra: true}
    skills << {sid: 234, skill_id: 3, skill_name: '涓流', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    # 235 缺失

    skills << {sid: 236, skill_id: 1, skill_name: '竹管投掷', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 236, skill_id: 2, skill_name: '竹之护', skill_kind: 'passive', extra: true}
    skills << {sid: 236, skill_id: 3, skill_name: '爆轰炮', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 237, skill_id: 1, skill_name: '谁还不听话', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 237, skill_id: 2, skill_name: '兔子舞', skill_kind: 'passive', extra: true}
    skills << {sid: 237, skill_id: 3, skill_name: '幸运套环', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 238, skill_id: 1, skill_name: '吸取', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 238, skill_id: 2, skill_name: '生花', skill_kind: 'passive', extra: true}
    skills << {sid: 238, skill_id: 3, skill_name: '治愈之光', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    # 239缺失
    # 240缺失

    skills << {sid: 241, skill_id: 1, skill_name: '香气袭人', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 241, skill_id: 2, skill_name: '轻盈', skill_kind: 'passive', extra: true}
    skills << {sid: 241, skill_id: 3, skill_name: '祈愿之舞', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 242, skill_id: 1, skill_name: '傀儡·出击', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 242, skill_id: 2, skill_name: '傀儡·追击', skill_kind: 'passive', extra: true}
    skills << {sid: 242, skill_id: 3, skill_name: '傀儡·爆发', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 243, skill_id: 1, skill_name: '碎岩', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 243, skill_id: 2, skill_name: '怪力', skill_kind: 'passive', extra: true}
    skills << {sid: 243, skill_id: 3, skill_name: '崩山', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 244, skill_id: 1, skill_name: '重击', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 244, skill_id: 2, skill_name: '冥火', skill_kind: 'passive', extra: true}
    skills << {sid: 244, skill_id: 3, skill_name: '虚无', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 245, skill_id: 1, skill_name: '头槌', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 245, skill_id: 3, skill_name: '鬼火球', skill_kind: 'damage', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 246, skill_id: 1, skill_name: '海扁', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 246, skill_id: 2, skill_name: '鼓舞', skill_kind: 'passive', extra: true}
    skills << {sid: 246, skill_id: 3, skill_name: '风鼓雷', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 247, skill_id: 1, skill_name: '水龙卷', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 247, skill_id: 2, skill_name: '祝福之水', skill_kind: 'passive', extra: true}
    skills << {sid: 247, skill_id: 3, skill_name: '巨浪', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 248, skill_id: 1, skill_name: '游鱼', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 248, skill_id: 2, skill_name: '逐流', skill_kind: 'passive', extra: true}
    skills << {sid: 248, skill_id: 3, skill_name: '吞噬', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 249, skill_id: 1, skill_name: '棒打', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 249, skill_id: 2, skill_name: '记仇', skill_kind: 'passive', extra: true}
    skills << {sid: 249, skill_id: 3, skill_name: '棒球炸弹', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 250, skill_id: 1, skill_name: '出千', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 250, skill_id: 2, skill_name: '转运', skill_kind: 'passive', extra: true}
    skills << {sid: 250, skill_id: 3, skill_name: '岭上开花', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 251, skill_id: 1, skill_name: '墨笔夺魂', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 251, skill_id: 2, skill_name: '无情', skill_kind: 'passive', extra: true}
    skills << {sid: 251, skill_id: 3, skill_name: '死亡宣告', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 252, skill_id: 1, skill_name: '凤火', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 252, skill_id: 2, skill_name: '烈焰', skill_kind: 'passive', extra: true}
    skills << {sid: 252, skill_id: 3, skill_name: '凤凰业火', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 253, skill_id: 1, skill_name: '血袭', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 253, skill_id: 2, skill_name: '血怒', skill_kind: 'passive', extra: true}
    skills << {sid: 253, skill_id: 3, skill_name: '鲜血之拥', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 254, skill_id: 1, skill_name: '风刃', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 254, skill_id: 2, skill_name: '聚气', skill_kind: 'passive', extra: true}
    skills << {sid: 254, skill_id: 3, skill_name: '狂风刃卷', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 255, skill_id: 1, skill_name: '鬼面', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 255, skill_id: 2, skill_name: '夺魂', skill_kind: 'passive', extra: true}
    skills << {sid: 255, skill_id: 3, skill_name: '冤魂重压', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 256, skill_id: 1, skill_name: '惊弦', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 256, skill_id: 2, skill_name: '余音', skill_kind: 'passive', extra: true}
    skills << {sid: 256, skill_id: 3, skill_name: '疯魔琴心', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 257, skill_id: 1, skill_name: '入眠', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 257, skill_id: 2, skill_name: '沉睡', skill_kind: 'passive', extra: true}
    skills << {sid: 257, skill_id: 3, skill_name: '食梦者', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 258, skill_id: 1, skill_name: '风雷两生', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 258, skill_id: 2, skill_name: '怒目', skill_kind: 'passive', extra: true}
    skills << {sid: 258, skill_id: 3, skill_name: '神罪连击', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 259, skill_id: 1, skill_name: '森之力', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 259, skill_id: 2, skill_name: '生生不息', skill_kind: 'passive', extra: true}
    skills << {sid: 259, skill_id: 3, skill_name: '鹿角冲撞', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 260, skill_id: 1, skill_name: '蛇行击', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 260, skill_id: 2, skill_name: '淬毒', skill_kind: 'passive', extra: true}
    skills << {sid: 260, skill_id: 3, skill_name: '焚身之火', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 261, skill_id: 1, skill_name: '胖揍', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 261, skill_id: 2, skill_name: '人多势众', skill_kind: 'passive', extra: true}
    skills << {sid: 261, skill_id: 3, skill_name: '兄弟之绊', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 262, skill_id: 1, skill_name: '伞剑', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 262, skill_id: 2, skill_name: '协战', skill_kind: 'passive', extra: true}
    skills << {sid: 262, skill_id: 3, skill_name: '天翔鹤斩', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 263, skill_id: 1, skill_name: '意外袭击', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 263, skill_id: 2, skill_name: '恐惧', skill_kind: 'passive', extra: true}
    skills << {sid: 263, skill_id: 3, skill_name: '歉意', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 264, skill_id: 1, skill_name: '文射', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 264, skill_id: 2, skill_name: '冥想', skill_kind: 'passive', extra: true}
    skills << {sid: 264, skill_id: 3, skill_name: '无我', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 265, skill_id: 1, skill_name: '黑焰', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 265, skill_id: 2, skill_name: '迁怒', skill_kind: 'passive', extra: true}
    skills << {sid: 265, skill_id: 3, skill_name: '地狱之手', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 266, skill_id: 1, skill_name: '幽光', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 266, skill_id: 2, skill_name: '明灯', skill_kind: 'passive', extra: true}
    skills << {sid: 266, skill_id: 3, skill_name: '吸魂灯', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 267, skill_id: 1, skill_name: '樱落', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 267, skill_id: 2, skill_name: '复苏', skill_kind: 'passive', extra: true}
    skills << {sid: 267, skill_id: 3, skill_name: '樱吹雪', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 268, skill_id: 1, skill_name: '赐福', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 268, skill_id: 2, skill_name: '转祸为福', skill_kind: 'passive', extra: true}
    skills << {sid: 268, skill_id: 3, skill_name: '鲤鱼旗', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 269, skill_id: 1, skill_name: '不详之刃', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 269, skill_id: 2, skill_name: '幽锋', skill_kind: 'passive', extra: true}
    skills << {sid: 269, skill_id: 3, skill_name: '杀戮之刃', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 270, skill_id: 1, skill_name: '毒针', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 270, skill_id: 2, skill_name: '蜘蛛印记', skill_kind: 'passive', extra: true}
    skills << {sid: 270, skill_id: 3, skill_name: '噬心食髓', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 271, skill_id: 1, skill_name: '鬼之假面', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 271, skill_id: 2, skill_name: '嫉恨之心', skill_kind: 'passive', extra: true}
    skills << {sid: 271, skill_id: 3, skill_name: '鬼袭', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 272, skill_id: 1, skill_name: '风符·破', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 272, skill_id: 2, skill_name: '风符·护', skill_kind: 'passive', extra: true}
    skills << {sid: 272, skill_id: 3, skill_name: '风神之佑', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 273, skill_id: 1, skill_name: '摩诃', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 273, skill_id: 2, skill_name: '无量', skill_kind: 'passive', extra: true}
    skills << {sid: 273, skill_id: 3, skill_name: '禅心', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 274, skill_id: 1, skill_name: '火风车', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 274, skill_id: 2, skill_name: '灵运', skill_kind: 'passive', extra: true}
    skills << {sid: 274, skill_id: 3, skill_name: '恶戏之火', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 275, skill_id: 1, skill_name: '笛中剑', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 275, skill_id: 2, skill_name: '竹叶守护', skill_kind: 'passive', extra: true}
    skills << {sid: 275, skill_id: 3, skill_name: '竹语', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 276, skill_id: 1, skill_name: '屠戮', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 276, skill_id: 2, skill_name: '鬼魅', skill_kind: 'passive', extra: true}
    skills << {sid: 276, skill_id: 3, skill_name: '黄泉之海', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 277, skill_id: 1, skill_name: '罪罚·黑', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 277, skill_id: 2, skill_name: '魂之怒火', skill_kind: 'passive', extra: true}
    skills << {sid: 277, skill_id: 3, skill_name: '连斩', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 278, skill_id: 1, skill_name: '罪罚·白', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 278, skill_id: 2, skill_name: '不灭', skill_kind: 'passive', extra: true}
    skills << {sid: 278, skill_id: 3, skill_name: '招魂', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 279, skill_id: 1, skill_name: '归鸟', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 279, skill_id: 2, skill_name: '画境', skill_kind: 'passive', extra: true}
    skills << {sid: 279, skill_id: 3, skill_name: '花鸟相闻', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 280, skill_id: 1, skill_name: '蓬莱玉枝', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 280, skill_id: 2, skill_name: '火鼠裘', skill_kind: 'passive', extra: true}
    skills << {sid: 280, skill_id: 3, skill_name: '龙首之玉', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 281, skill_id: 1, skill_name: '蹂躏', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 281, skill_id: 2, skill_name: '扑朔迷离', skill_kind: 'passive', extra: true}
    skills << {sid: 281, skill_id: 3, skill_name: '烟之鬼', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 282, skill_id: 1, skill_name: '扇舞', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 282, skill_id: 2, skill_name: '金鱼·反击', skill_kind: 'passive', extra: true}
    skills << {sid: 282, skill_id: 3, skill_name: '金鱼·助阵', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 283, skill_id: 1, skill_name: '星轨', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 283, skill_id: 2, skill_name: '星辰之境', skill_kind: 'passive', extra: true}
    skills << {sid: 283, skill_id: 3, skill_name: '天罚·星', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 283, skill_id: 4, skill_name: '天罚·月', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    # 284缺失

    skills << {sid: 285, skill_id: 1, skill_name: '鸩羽', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 285, skill_id: 2, skill_name: '毒之华', skill_kind: 'passive', extra: true}
    skills << {sid: 285, skill_id: 3, skill_name: '毒蚀', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 286, skill_id: 1, skill_name: '风之舞', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 286, skill_id: 2, skill_name: '黄金羽', skill_kind: 'passive', extra: true}
    skills << {sid: 286, skill_id: 3, skill_name: '千羽风之舞', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 287, skill_id: 1, skill_name: '流光', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 287, skill_id: 2, skill_name: '溢彩', skill_kind: 'passive', extra: true}
    skills << {sid: 287, skill_id: 3, skill_name: '回梦', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 288, skill_id: 1, skill_name: '死亡之花', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 288, skill_id: 2, skill_name: '赤团华', skill_kind: 'passive', extra: true}
    skills << {sid: 288, skill_id: 3, skill_name: '血之花海', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 289, skill_id: 1, skill_name: '萌动', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 289, skill_id: 2, skill_name: '治愈', skill_kind: 'passive', extra: true}
    skills << {sid: 289, skill_id: 3, skill_name: '守护之心', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 290, skill_id: 1, skill_name: '松果一击', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 290, skill_id: 2, skill_name: '胆怯', skill_kind: 'passive', extra: true}
    skills << {sid: 290, skill_id: 3, skill_name: '怒气', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 291, skill_id: 1, skill_name: '墨染', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 291, skill_id: 2, skill_name: '云游', skill_kind: 'passive', extra: true}
    skills << {sid: 291, skill_id: 3, skill_name: '万象之书', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 292, skill_id: 1, skill_name: '雪走', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 292, skill_id: 2, skill_name: '霜天之织', skill_kind: 'passive', extra: true}
    skills << {sid: 292, skill_id: 3, skill_name: '胧月雪华斩', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 293, skill_id: 1, skill_name: '瞳炎', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 293, skill_id: 2, skill_name: '鬼眸', skill_kind: 'passive', extra: true}
    skills << {sid: 293, skill_id: 3, skill_name: '诅咒之眼', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 294, skill_id: 1, skill_name: '弥弥切丸', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 294, skill_id: 2, skill_name: '镜花水月', skill_kind: 'passive', extra: true}
    skills << {sid: 294, skill_id: 3, skill_name: '百鬼夜行', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 295, skill_id: 1, skill_name: '邀月', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 295, skill_id: 2, skill_name: '明月潮生', skill_kind: 'passive', extra: true}
    skills << {sid: 295, skill_id: 3, skill_name: '清辉月华', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 296, skill_id: 1, skill_name: '风', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 296, skill_id: 2, skill_name: '烈', skill_kind: 'passive', extra: true}
    skills << {sid: 296, skill_id: 3, skill_name: '斩', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 297, skill_id: 1, skill_name: '阳炎', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 297, skill_id: 2, skill_name: '晴雨', skill_kind: 'passive', extra: true}
    skills << {sid: 297, skill_id: 3, skill_name: '滋养', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 298, skill_id: 1, skill_name: '干扰投掷', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 298, skill_id: 2, skill_name: '鸮之警惕', skill_kind: 'passive', extra: true}
    skills << {sid: 298, skill_id: 3, skill_name: '温柔的守护', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    # 299缺失

    skills << {sid: 300, skill_id: 1, skill_name: '灵击', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 300, skill_id: 2, skill_name: '狐火', skill_kind: 'passive', extra: true}
    skills << {sid: 300, skill_id: 3, skill_name: '堕天', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 301, skill_id: 1, skill_name: '降魔杖', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 301, skill_id: 2, skill_name: '轮回', skill_kind: 'passive', extra: true}
    skills << {sid: 301, skill_id: 3, skill_name: '禅意', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 302, skill_id: 1, skill_name: '绵里藏针', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 302, skill_id: 2, skill_name: '丝缕相连', skill_kind: 'passive', extra: true}
    skills << {sid: 302, skill_id: 3, skill_name: '穿针引线', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 303, skill_id: 1, skill_name: '征子', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 303, skill_id: 2, skill_name: '气合', skill_kind: 'passive', extra: true}
    skills << {sid: 303, skill_id: 3, skill_name: '神之一手', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 304, skill_id: 1, skill_name: '一矢', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 304, skill_id: 2, skill_name: '狐守界', skill_kind: 'passive', extra: true}
    skills << {sid: 304, skill_id: 3, skill_name: '燃爆·破魔箭', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 305, skill_id: 1, skill_name: '释物之形', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 305, skill_id: 2, skill_name: '道物之真理', skill_kind: 'passive', extra: true}
    skills << {sid: 305, skill_id: 3, skill_name: '退魔', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 306, skill_id: 1, skill_name: '虫之舞', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 306, skill_id: 2, skill_name: '虫之痕', skill_kind: 'passive', extra: true}
    skills << {sid: 306, skill_id: 3, skill_name: '虫之护', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 307, skill_id: 1, skill_name: '猫猫召来', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 307, skill_id: 2, skill_name: '猫合战', skill_kind: 'passive', extra: true}
    skills << {sid: 307, skill_id: 3, skill_name: '猫猫乱斗', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 308, skill_id: 1, skill_name: '锤击', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 308, skill_id: 2, skill_name: '掌控', skill_kind: 'passive', extra: true}
    skills << {sid: 308, skill_id: 3, skill_name: '地狱之鬼', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 309, skill_id: 1, skill_name: '蛇卒·毒牙', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 309, skill_id: 2, skill_name: '蛇之影', skill_kind: 'passive', extra: true}
    skills << {sid: 309, skill_id: 3, skill_name: '蛇卒·狂暴', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 310, skill_id: 1, skill_name: '兔狱卒·叱责', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 310, skill_id: 2, skill_name: '兔狱卒·坚毅', skill_kind: 'passive', extra: true}
    skills << {sid: 310, skill_id: 3, skill_name: '蜜桃·地狱偶像', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 311, skill_id: 1, skill_name: '注灵', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 311, skill_id: 2, skill_name: '轮回之面', skill_kind: 'passive', extra: true}
    skills << {sid: 311, skill_id: 3, skill_name: '禁断之面', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 312, skill_id: 1, skill_name: '鬼斩', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 312, skill_id: 2, skill_name: '鬼刃·罗城门', skill_kind: 'passive', extra: true}
    skills << {sid: 312, skill_id: 3, skill_name: '鬼影闪', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 313, skill_id: 1, skill_name: '风之伤', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 313, skill_id: 2, skill_name: '爆流破', skill_kind: 'passive', extra: true}
    skills << {sid: 313, skill_id: 3, skill_name: '铁碎牙', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 314, skill_id: 1, skill_name: '毒华爪', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 314, skill_id: 2, skill_name: '天生牙结界', skill_kind: 'passive', extra: true}
    skills << {sid: 314, skill_id: 3, skill_name: '冥道残月破', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 315, skill_id: 1, skill_name: '风缠', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 315, skill_id: 2, skill_name: '幼羽', skill_kind: 'passive', extra: true}
    skills << {sid: 315, skill_id: 3, skill_name: '羽刃之风', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 316, skill_id: 1, skill_name: '炎影', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 316, skill_id: 2, skill_name: '守护誓约', skill_kind: 'passive', extra: true}
    skills << {sid: 316, skill_id: 3, skill_name: '梦山狐影', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 317, skill_id: 1, skill_name: '神木', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 317, skill_id: 2, skill_name: '灾厄花', skill_kind: 'passive', extra: true}
    skills << {sid: 317, skill_id: 3, skill_name: '祸根', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 318, skill_id: 1, skill_name: '吐丝', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 318, skill_id: 2, skill_name: '破茧', skill_kind: 'passive', extra: true}
    skills << {sid: 318, skill_id: 3, skill_name: '虫之毒', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 319, skill_id: 1, skill_name: '灵力迸发', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 319, skill_id: 2, skill_name: '灵魂结界', skill_kind: 'passive', extra: true}
    skills << {sid: 319, skill_id: 3, skill_name: '破魔之箭', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 320, skill_id: 1, skill_name: '缠击', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 320, skill_id: 2, skill_name: '雪织', skill_kind: 'passive', extra: true}
    skills << {sid: 320, skill_id: 3, skill_name: '绯夜散华', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 321, skill_id: 1, skill_name: '葬仪', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 321, skill_id: 2, skill_name: '离魂', skill_kind: 'passive', extra: true}
    skills << {sid: 321, skill_id: 3, skill_name: '荼蘼·盛放之棺', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 322, skill_id: 1, skill_name: '鬼爪', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 322, skill_id: 2, skill_name: '狂意', skill_kind: 'passive', extra: true}
    skills << {sid: 322, skill_id: 3, skill_name: '炼狱之门', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 323, skill_id: 1, skill_name: '扔石头', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 323, skill_id: 2, skill_name: '遮雨', skill_kind: 'passive', extra: true}
    skills << {sid: 323, skill_id: 3, skill_name: '再会之音', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 324, skill_id: 1, skill_name: '水袭', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 324, skill_id: 2, skill_name: '齿甲', skill_kind: 'passive', extra: true}
    skills << {sid: 324, skill_id: 3, skill_name: '体甲', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 325, skill_id: 1, skill_name: '魂魄碎裂', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 325, skill_id: 2, skill_name: '不洁之力', skill_kind: 'passive', extra: true}
    skills << {sid: 325, skill_id: 3, skill_name: '神念之影', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 325, skill_id: 4, skill_name: '神愤之炎', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 326, skill_id: 1, skill_name: '狐铃', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 326, skill_id: 2, skill_name: '狐狩·日耀界', skill_kind: 'passive', extra: true}
    skills << {sid: 326, skill_id: 3, skill_name: '狐狩·月影界', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 327, skill_id: 1, skill_name: '风符·灭', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 327, skill_id: 2, skill_name: '风符·守', skill_kind: 'passive', extra: true}
    skills << {sid: 327, skill_id: 3, skill_name: '风止·苍龙坠', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 328, skill_id: 1, skill_name: '炎刃', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 328, skill_id: 2, skill_name: '穷追不舍', skill_kind: 'passive', extra: true}
    skills << {sid: 328, skill_id: 3, skill_name: '赤影一瞬', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 329, skill_id: 1, skill_name: '影出', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 329, skill_id: 2, skill_name: '影回', skill_kind: 'passive', extra: true}
    skills << {sid: 329, skill_id: 3, skill_name: '潜影', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 330, skill_id: 1, skill_name: '初舞', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 330, skill_id: 2, skill_name: '离影', skill_kind: 'passive', extra: true}
    skills << {sid: 330, skill_id: 3, skill_name: '星火满天', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 330, skill_id: 4, skill_name: '终舞', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 330, skill_id: 5, skill_name: '离歌', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 330, skill_id: 6, skill_name: '烬染不夜', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 331, skill_id: 1, skill_name: '恨返', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 331, skill_id: 2, skill_name: '积重难返', skill_kind: 'passive', extra: true}
    skills << {sid: 331, skill_id: 3, skill_name: '予愿必还', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 332, skill_id: 1, skill_name: '鲸骨·驻', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 332, skill_id: 2, skill_name: '以守为攻', skill_kind: 'passive', extra: true}
    skills << {sid: 332, skill_id: 3, skill_name: '鱼鳞之备', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 332, skill_id: 4, skill_name: '鲸骨·开', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 332, skill_id: 5, skill_name: '协同作战', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 332, skill_id: 6, skill_name: '方圆之备', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 333, skill_id: 1, skill_name: '麓鸣·轰', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 333, skill_id: 2, skill_name: '覆土之术', skill_kind: 'passive', extra: true}
    skills << {sid: 333, skill_id: 3, skill_name: '无尽剑狱', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 333, skill_id: 4, skill_name: '麓鸣·斩', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 334, skill_id: 1, skill_name: '川息', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 334, skill_id: 2, skill_name: '川怒', skill_kind: 'passive', extra: true}
    skills << {sid: 334, skill_id: 3, skill_name: '骁浪海作斩', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 335, skill_id: 1, skill_name: '左钳接右拳', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 335, skill_id: 2, skill_name: '这下有劲了', skill_kind: 'passive', extra: true}
    skills << {sid: 335, skill_id: 3, skill_name: '螺螺锤', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 336, skill_id: 1, skill_name: '袖白雪', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 336, skill_id: 2, skill_name: '三舞·白刃', skill_kind: 'passive', extra: true}
    skills << {sid: 336, skill_id: 3, skill_name: '初舞·月白', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 337, skill_id: 1, skill_name: '斩月', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 337, skill_id: 2, skill_name: '虚化', skill_kind: 'passive', extra: true}
    skills << {sid: 337, skill_id: 3, skill_name: '月牙天冲', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 338, skill_id: 1, skill_name: '曜断', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 338, skill_id: 2, skill_name: '月之奥义', skill_kind: 'passive', extra: true}
    skills << {sid: 338, skill_id: 3, skill_name: '残阳无影', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 339, skill_id: 1, skill_name: '灵冲', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 339, skill_id: 2, skill_name: '噬魂', skill_kind: 'passive', extra: true}
    skills << {sid: 339, skill_id: 3, skill_name: '焚天九尾', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 340, skill_id: 1, skill_name: '纸舞', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 340, skill_id: 2, skill_name: '落纸', skill_kind: 'passive', extra: true}
    skills << {sid: 340, skill_id: 3, skill_name: '纸刃翩跹', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 341, skill_id: 1, skill_name: '焚天', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 341, skill_id: 2, skill_name: '红莲', skill_kind: 'passive', extra: true}
    skills << {sid: 341, skill_id: 3, skill_name: '天火怒焱', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 342, skill_id: 1, skill_name: '听咱一言', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 342, skill_id: 2, skill_name: '刀下留人', skill_kind: 'passive', extra: true}
    skills << {sid: 342, skill_id: 3, skill_name: '敌在酒碗处！', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 343, skill_id: 1, skill_name: '无剑', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 343, skill_id: 2, skill_name: '真剑·韧心', skill_kind: 'passive', extra: true}
    skills << {sid: 343, skill_id: 3, skill_name: '天剑·断恶斩', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 344, skill_id: 1, skill_name: '落影', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 344, skill_id: 2, skill_name: '斗转', skill_kind: 'passive', extra: true}
    skills << {sid: 344, skill_id: 3, skill_name: '云岸净空', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 344, skill_id: 4, skill_name: '昙无', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 344, skill_id: 5, skill_name: '昭回', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 344, skill_id: 6, skill_name: '苦海浮生', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 345, skill_id: 1, skill_name: '降诛', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 345, skill_id: 2, skill_name: '残月鬼衣', skill_kind: 'passive', extra: true}
    skills << {sid: 345, skill_id: 3, skill_name: '修罗骸锁', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}
    skills << {sid: 345, skill_id: 4, skill_name: '猎魂狂杀', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 346, skill_id: 1, skill_name: '清流', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 346, skill_id: 2, skill_name: '凌波', skill_kind: 'passive', extra: true}
    skills << {sid: 346, skill_id: 3, skill_name: '灵鱼抱蕊', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 347, skill_id: 1, skill_name: '月下花', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 347, skill_id: 2, skill_name: '绯色花月', skill_kind: 'passive', extra: true}
    skills << {sid: 347, skill_id: 3, skill_name: '神赐良缘', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 348, skill_id: 1, skill_name: '浮光', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 348, skill_id: 2, skill_name: '茕灯焕夜', skill_kind: 'passive', extra: true}
    skills << {sid: 348, skill_id: 3, skill_name: '告死瞑灯', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 349, skill_id: 1, skill_name: '龙卷·手里剑', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 349, skill_id: 2, skill_name: '残影·替身术', skill_kind: 'passive', extra: true}
    skills << {sid: 349, skill_id: 3, skill_name: '风车·雷火弹', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 350, skill_id: 1, skill_name: '蝎刺', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 350, skill_id: 2, skill_name: '以毒攻毒', skill_kind: 'passive', extra: true}
    skills << {sid: 350, skill_id: 3, skill_name: '百蝎之毒', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}

    skills << {sid: 351, skill_id: 1, skill_name: '逐影', skill_kind: 'damage', skill_mode: 'unit', skill_damage: [1.2], extra: false}
    skills << {sid: 351, skill_id: 2, skill_name: '麓魂·极', skill_kind: 'passive', extra: true}
    skills << {sid: 351, skill_id: 3, skill_name: '万羽浪行', skill_kind: 'hybrid', skill_mode: 'group', skill_damage: [0.36, 0.36, 0.36], extra: false}


    skills.each do |ss|
      YysSkill.create!(ss)
      puts "...更新式神技能：#{ss[:skill_name]}, sid: #{ss[:sid]}"
    end

  end

  def init_mitama

    YysMitama.delete_all

    mitamas = []

    mitamas << {mid: 101, name: '招财', remark: '回合开始时,50%几率获得2点鬼火'}
    mitamas << {mid: 102, name: '蚌精', remark: '战斗开始时获得10%生命的护盾（享受暴击、暴伤）'}
    mitamas << {mid: 103, name: '树妖', remark: '增加20%基础治疗效果（生命低于20%时,加成提高至50%）'}
    mitamas << {mid: 104, name: '阴摩罗', remark: '击杀获得3点鬼火'}
    mitamas << {mid: 105, name: '涅槃之火', remark: '回合结束时,生命低于30%,治疗15%生命'}
    mitamas << {mid: 106, name: '幽谷响', remark: '抵抗时,50%几率将效果反弹给来源目标'}
    mitamas << {mid: 107, name: '火灵', remark: '回目开始时：获得3点鬼火'}

    mitamas.each do |mitama|
      puts "...创建御魂：#{mitama[:name]}"
      YysMitama.create!(mitama)
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
    patches << {version: "v0.3.0", content: "修复了未收录时,未计算神眷的bug,合并了神眷的显示"}
    patches << {version: "v0.3.1", content: "添加活动：丑时之女·椿裳生花"}
    patches << {version: "v0.3.2", content: "添加缘结神召唤活动<br>由于召唤活动通常会伴随三次up,所以将三次up和概率up合并了"}
    patches << {version: "v0.3.3", content: "添加浮世青行灯召唤活动", title: "召唤：浮世青行灯"}
    patches << {version: "v0.3.4", content: "添加铃鹿御前召唤活动", title: "御浪之音·故鸣不绝"}

    patches.each do |attrs|
      puts "...模拟器补丁: #{attrs[:version]}: #{attrs[:content]}"
      YysPatch.find_or_create_by!(attrs)
    end
  end

  desc "init yys base data"
  task init: :environment do
    init_shi_shen
    init_shi_shen_skills
    init_mitama
    init_region
    init_patches
  end


end

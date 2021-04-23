class YysSummon < ApplicationRecord
  belongs_to :yys_summon_mode, foreign_key: :mode_id
  belongs_to :yys_shi_shen, foreign_key: :sid, primary_key: :sid
end

namespace :elasticsearch do
  def get_target_class(param_name)
    class_name = param_name
    raise '必须指定class参数' unless  class_name.present?
    class_name = class_name.singularize.camelize # 先变成单数型，再变成大写
    class_name.constantize # 再转换成常量
  end

  desc "创建索引"
  task create_index: :environment do
    target_class = get_target_class(ENV["class"])
    real_index_name = target_class.table_name

    target_class.__elasticsearch__.create_index! index: real_index_name, force: true
  end

  desc "删除索引"
  task delete_index: :environment do
    target_class = get_target_class(ENV["class"])
    target_class.__elasticsearch__.delete_index! index: target_class.table_name
  end

  desc "同步数据到es"
  task sync_data: :environment do
    target_class = get_target_class(ENV["class"])
    index_name = target_class.table_name
    client = target_class.__elasticsearch__.client
    batch_number = 1000

    records = target_class.limit(batch_number)

    total_count = 0
    loop do
      _start_at = Time.now
      request_body = []
      records.each do |record|
        request_body << {index: {_id: record.id, data: record.as_indexed_json}}
      end

      unless request_body.blank?
        client.bulk(index: index_name, body: request_body)
      end

      first = records.first
      last = records.last
      total_count += records.size
      _end_at = Time.now
      _cost_time = (_end_at - _start_at).round 2
      puts "No.#{total_count}, from: [#{first.id}, #{first.try(:updated_at).try(:to_s)}], to: [#{last.id}, #{last.try(:updated_at).try(:to_s)}]---#{_cost_time}" if first.present?

      break if records.size < batch_number
    end
  end
end

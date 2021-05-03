# frozen_string_literal: true

baseball_positions = BaseballPositionList.all.map do |position|
  BaseballPosition.new(id: position.id,
                       code: position.code,
                       en_name: position.en_name,
                       tw_name: position.tw_name)
end

columns = %i[code en_name tw_name]
BaseballPosition.import baseball_positions, on_duplicate_key_update: { conflict_target: [:id], columns: columns }

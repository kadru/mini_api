# frozen_string_literal: true

module AroundTranscation
  def around
    DB.transaction(rollback: :always, savepoint: true, auto_savepoint: true) do
      super
    end
  end
end

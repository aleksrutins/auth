# frozen_string_literal: true

module RubyUI
  class Card < Base
    def initialize(as: :div, **args)
      super(**args)
      @tag = as
    end

    def view_template(&)
      self.send(@tag, **attrs, &)
    end

    private

    def default_attrs
      {
        class: "rounded-xl border bg-background shadow"
      }
    end
  end
end

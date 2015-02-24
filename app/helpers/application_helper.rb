module ApplicationHelper
  def yield?(key, default = "")
    content_for?(key) ? yield(key) : default
  end
end

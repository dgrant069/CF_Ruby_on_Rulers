class Array
  def sum(start = 0)
    inject(start, &:+)
  end

  def questionize(text)
    if text.is_string?
      "#{text}?"
    else
      "Numbers won't questionize"
    end
  end
end

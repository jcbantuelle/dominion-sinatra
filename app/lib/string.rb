class String

  def constantize
    capitalize_words('')
  end

  def titleize
    capitalize_words(' ')
  end

  private

  def capitalize_words(separator)
    self.split('_').map(&:capitalize).join(separator)
  end

end

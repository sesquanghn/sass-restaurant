class BaseForm
  def submit
    raise NotImplementedError
  end

  def persisted?
    false
  end

  def save!
    false
  end
end

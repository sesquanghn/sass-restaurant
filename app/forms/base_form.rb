class BaseForm
  EMAIL_REGEX = /\A(^$|^.*@.*\..*\w$)\z/i

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

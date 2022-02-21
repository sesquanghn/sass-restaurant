class BaseForm
  EMAIL_REGEX = /\A(^$|^.*@.*\..*\w$)\z/i
  NUMBER_OPTION_REGEX = /\A(^$|\d+)\z/i

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

class NullUser
  def name
    'Anonymni uzivatel'
  end

  def admin?
    false
  end

  def anonymous?
    true
  end

  def id
    nil
  end
end

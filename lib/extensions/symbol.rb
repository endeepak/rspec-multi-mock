class Symbol
  def to_proc
    lambda { |a| a.send(self) }
  end
end
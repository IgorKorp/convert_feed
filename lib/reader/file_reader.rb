module FileReader
  def self.can_read?(source)
    File.exist?(source)
  end

  def self.read(file)
    File.read(file)
  rescue StandardError
    nil
  end
end

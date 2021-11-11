module Output
  def self.output(prepared_file, path, format)
    return output_file(prepared_file, path, format) if path

    output_display(prepared_file)
  end

  def self.output_file(result, path, format)
    File.open("#{path}.#{format}", "w") { |file| file.write(result) }
  end

  def self.output_display(result)
    $stdout.puts(result)
  end
end

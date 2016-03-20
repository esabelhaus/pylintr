require 'tempfile'
class Pylintr
  def self.lint content
    new.lint content
  end

  def self.file_lint file_path
    new.file_lint file_path
  end


  def initialize custom_config = nil
    @custom_config = custom_config
  end



  def lint content
    as_file content do |file|
      file_lint file.path
    end
  end

  def file_lint file_path
    if @custom_config
      as_file(@custom_config, 'rc') do |file|
        parse_lint file.path, file_path
      end
    else
      parse_lint pylint_config, file_path
    end
  end

  private

  def parse_lint config_path, file_path
    parse `#{pylint_venv} --output-format=parseable --reports=no --disable=invalid-name --rcfile=#{config_path} #{file_path}`
  end

  def as_file content, format = '.py'
    if format == 'rc'
      file = Tempfile.new('.pylintrc')
    else
      file = Tempfile.new(['temp', format])
    end
    begin
      file.puts content
      file.rewind
      file.close

      yield file
    ensure
      file.unlink
    end
  end

  # Accept python version argument, then link to the correct virtualenv
  def pylint_venv
    pylint = "pylint_2_7"
    File.join(File.dirname(__FILE__), '..', 'bin', pylint, 'bin', 'pylint')
  end

  def pylint_config
    File.join(File.dirname(__FILE__), '..', 'doc', '.pylintrc')
  end

  def parse output
    result = output.split("\n")
    # remove the first line of output from pylint
    result.shift
    result.map! do |msg|
      msgs = msg.split(":")
      [msgs.last.strip, msgs[1].to_i]
    end
  end
end

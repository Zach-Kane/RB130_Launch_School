FILE_PATH = "/Users/zachkane/launch_school/rb130/exercises/medium_1/sample_text.txt"

# when passed a block File::open will automatically close the file.

class TextAnalyzer
  def process
    File.open("sample_text.txt", "r") do |text|
      puts yield(text.read)
    end
  end
end


analyzer = TextAnalyzer.new
analyzer.process {|text| "#{text.split("\n\n").count} paragraphs"}
analyzer.process {|text| "#{text.split("\n").size} lines"}
analyzer.process {|text| "#{text.split.size} words"}


# LS Version: Uses sandwich code (pre and post processing) and file close to be sure the file closes.

# class TextAnalyzer
#   def process
#     file = File.open('sample_text.txt', 'r')
#     yield(file.read)
#     file.close
#   end
# end
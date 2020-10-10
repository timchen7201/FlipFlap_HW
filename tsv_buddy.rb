# Module that can be included (mixin) to take and output TSV data
require 'csv'

module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    parsed_file = CSV.parse(tsv, { col_sep: "\t" })
    key = parsed_file[0]
    tsv = parsed_file.drop(1)
    @data = []
    tsv.each do |x|
      @data << Hash[key.zip(x)]
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    headers = @data[0].keys.join("\t") + "\n"
    content = @data.map { |row| row.values.join("\t") }.join("\n") + "\n"
    headers + content
  end
end
